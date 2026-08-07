.class public abstract Ll/bwq0;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bwq0$a;
    }
.end annotation


# instance fields
.field protected a:Lcom/apm/lite/CrashType;

.field protected b:Landroid/content/Context;

.field protected c:Ll/irl;

.field protected d:Ll/euq0;

.field protected e:Ll/byq0;


# direct methods
.method public constructor <init>(Lcom/apm/lite/CrashType;Landroid/content/Context;Ll/euq0;Ll/byq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bwq0;->d:Ll/euq0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bwq0;->e:Ll/byq0;

    .line 11
    .line 12
    invoke-static {}, Ll/n0r0;->b()Ll/ayq0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ll/ayq0;->e()Ll/irl;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/bwq0;->c:Ll/irl;

    .line 21
    .line 22
    return-void
.end method

.method private o(Ll/gsq0;)V
    .locals 12

    .line 1
    invoke-static {}, Ll/n0r0;->d()Ll/rrq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/rrq0;->a(Lcom/apm/lite/CrashType;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string v3, "custom"

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-nez v2, :cond_0

    .line 27
    .line 28
    new-instance v2, Lorg/json/JSONObject;

    .line 29
    .line 30
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v3, v2}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const-string v3, "_"

    .line 37
    .line 38
    const-string v4, "custom_cost_"

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    move v6, v5

    .line 44
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    if-ge v6, v7, :cond_1

    .line 49
    .line 50
    :try_start_0
    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    check-cast v7, Ll/r31;

    .line 55
    .line 56
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 57
    .line 58
    .line 59
    move-result-wide v8

    .line 60
    iget-object v10, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 61
    .line 62
    invoke-interface {v7, v10}, Ll/r31;->a(Lcom/apm/lite/CrashType;)Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v10

    .line 66
    invoke-static {v2, v10}, Ll/gsq0;->m(Lorg/json/JSONObject;Ljava/util/Map;)V

    .line 67
    .line 68
    .line 69
    new-instance v10, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v7

    .line 85
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v7

    .line 102
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 103
    .line 104
    .line 105
    move-result-wide v10

    .line 106
    sub-long/2addr v10, v8

    .line 107
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 108
    .line 109
    .line 110
    move-result-object v8

    .line 111
    invoke-virtual {v1, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :catchall_0
    move-exception v7

    .line 116
    invoke-static {v2, v7}, Ll/gsq0;->l(Lorg/json/JSONObject;Ljava/lang/Throwable;)V

    .line 117
    .line 118
    .line 119
    :goto_1
    add-int/lit8 v6, v6, 0x1

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    :try_start_1
    const-string v0, "fd_count"

    .line 123
    .line 124
    invoke-static {}, Ll/c3r0;->a()I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    invoke-virtual {v2, v0, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 129
    .line 130
    .line 131
    :catchall_1
    invoke-static {}, Ll/n0r0;->d()Ll/rrq0;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v6, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 136
    .line 137
    invoke-virtual {v0, v6}, Ll/rrq0;->c(Lcom/apm/lite/CrashType;)Ljava/util/List;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    if-eqz v0, :cond_3

    .line 142
    .line 143
    invoke-virtual {p1}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    move-result-object v6

    .line 147
    const-string v7, "custom_long"

    .line 148
    .line 149
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    if-nez v6, :cond_2

    .line 154
    .line 155
    new-instance v6, Lorg/json/JSONObject;

    .line 156
    .line 157
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v7, v6}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    :cond_2
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-ge v5, p1, :cond_3

    .line 168
    .line 169
    :try_start_2
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    check-cast p1, Ll/r31;

    .line 174
    .line 175
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 176
    .line 177
    .line 178
    move-result-wide v7

    .line 179
    iget-object v9, p0, Ll/bwq0;->a:Lcom/apm/lite/CrashType;

    .line 180
    .line 181
    invoke-interface {p1, v9}, Ll/r31;->a(Lcom/apm/lite/CrashType;)Ljava/util/Map;

    .line 182
    .line 183
    .line 184
    move-result-object v9

    .line 185
    invoke-static {v6, v9}, Ll/gsq0;->m(Lorg/json/JSONObject;Ljava/util/Map;)V

    .line 186
    .line 187
    .line 188
    new-instance v9, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/util/HashMap;->size()I

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 222
    .line 223
    .line 224
    move-result-wide v9

    .line 225
    sub-long/2addr v9, v7

    .line 226
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 227
    .line 228
    .line 229
    move-result-object v7

    .line 230
    invoke-virtual {v1, p1, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 231
    .line 232
    .line 233
    goto :goto_3

    .line 234
    :catchall_2
    move-exception p1

    .line 235
    invoke-static {v6, p1}, Ll/gsq0;->l(Lorg/json/JSONObject;Ljava/lang/Throwable;)V

    .line 236
    .line 237
    .line 238
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_3
    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 242
    .line 243
    .line 244
    move-result-object p0

    .line 245
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 246
    .line 247
    .line 248
    move-result-object p0

    .line 249
    :catchall_3
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 250
    .line 251
    .line 252
    move-result p1

    .line 253
    if-eqz p1, :cond_4

    .line 254
    .line 255
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Ljava/util/Map$Entry;

    .line 260
    .line 261
    :try_start_3
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    check-cast v0, Ljava/lang/String;

    .line 266
    .line 267
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-virtual {v2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 272
    .line 273
    .line 274
    goto :goto_4

    .line 275
    :cond_4
    return-void
.end method


# virtual methods
.method public a(ILl/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    new-instance p2, Ll/gsq0;

    .line 4
    .line 5
    invoke-direct {p2}, Ll/gsq0;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    if-eqz p1, :cond_5

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_4

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x4

    .line 17
    if-eq p1, v0, :cond_2

    .line 18
    .line 19
    const/4 v0, 0x5

    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    return-object p2

    .line 23
    :cond_1
    invoke-virtual {p0, p2}, Ll/bwq0;->i(Ll/gsq0;)Ll/gsq0;

    .line 24
    .line 25
    .line 26
    return-object p2

    .line 27
    :cond_2
    invoke-virtual {p0, p2}, Ll/bwq0;->l(Ll/gsq0;)Ll/gsq0;

    .line 28
    .line 29
    .line 30
    return-object p2

    .line 31
    :cond_3
    invoke-virtual {p0, p2}, Ll/bwq0;->k(Ll/gsq0;)Ll/gsq0;

    .line 32
    .line 33
    .line 34
    return-object p2

    .line 35
    :cond_4
    invoke-virtual {p0, p2}, Ll/bwq0;->g(Ll/gsq0;)Ll/gsq0;

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, p2}, Ll/bwq0;->o(Ll/gsq0;)V

    .line 39
    .line 40
    .line 41
    return-object p2

    .line 42
    :cond_5
    invoke-virtual {p0, p2}, Ll/bwq0;->f(Ll/gsq0;)Ll/gsq0;

    .line 43
    .line 44
    .line 45
    return-object p2
.end method

.method public b(Ll/gsq0;)Ll/gsq0;
    .locals 0

    .line 1
    return-object p1
.end method

.method public c(Ll/gsq0;Ll/bwq0$a;Z)Ll/gsq0;
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    new-instance p1, Ll/gsq0;

    .line 4
    .line 5
    invoke-direct {p1}, Ll/gsq0;-><init>()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    move-object v1, p1

    .line 10
    move v2, v0

    .line 11
    :goto_0
    invoke-virtual {p0}, Ll/bwq0;->e()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-ge v2, v3, :cond_6

    .line 16
    .line 17
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v3

    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    :try_start_0
    invoke-interface {p2, v2, v1}, Ll/bwq0$a;->a(ILl/gsq0;)Ll/gsq0;

    .line 24
    .line 25
    .line 26
    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    goto :goto_1

    .line 28
    :catchall_0
    move-exception v5

    .line 29
    invoke-interface {p2, v5}, Ll/bwq0$a;->a(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    :goto_1
    :try_start_1
    invoke-virtual {p0, v2, v1}, Ll/bwq0;->a(ILl/gsq0;)Ll/gsq0;

    .line 33
    .line 34
    .line 35
    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 36
    goto :goto_2

    .line 37
    :catchall_1
    move-exception v5

    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    invoke-interface {p2, v5}, Ll/bwq0$a;->a(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_2
    if-eqz p2, :cond_5

    .line 44
    .line 45
    :try_start_2
    invoke-virtual {p0}, Ll/bwq0;->e()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/4 v6, 0x1

    .line 50
    sub-int/2addr v5, v6

    .line 51
    if-ne v2, v5, :cond_3

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v6, v0

    .line 55
    :goto_3
    invoke-interface {p2, v2, v1, v6}, Ll/bwq0$a;->b(ILl/gsq0;Z)Ll/gsq0;

    .line 56
    .line 57
    .line 58
    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 59
    goto :goto_4

    .line 60
    :catchall_2
    move-exception v5

    .line 61
    invoke-interface {p2, v5}, Ll/bwq0$a;->a(Ljava/lang/Throwable;)V

    .line 62
    .line 63
    .line 64
    :goto_4
    if-eqz p3, :cond_5

    .line 65
    .line 66
    if-eqz v2, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Ll/gsq0;->G()Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p1, v1}, Ll/gsq0;->y(Lorg/json/JSONObject;)V

    .line 73
    .line 74
    .line 75
    goto :goto_5

    .line 76
    :cond_4
    move-object p1, v1

    .line 77
    :goto_5
    new-instance v1, Ll/gsq0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/gsq0;-><init>()V

    .line 80
    .line 81
    .line 82
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v6, "step_cost_"

    .line 85
    .line 86
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v5

    .line 96
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v6

    .line 100
    sub-long/2addr v6, v3

    .line 101
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {p1, v5, v3}, Ll/gsq0;->q(Ljava/lang/String;Ljava/lang/String;)Ll/gsq0;

    .line 106
    .line 107
    .line 108
    add-int/lit8 v2, v2, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_6
    invoke-virtual {p0, p1}, Ll/bwq0;->b(Ll/gsq0;)Ll/gsq0;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    const/4 p0, 0x6

    .line 2
    return p0
.end method

.method public f(Ll/gsq0;)Ll/gsq0;
    .locals 3

    .line 1
    const-string v0, "Fetch info failed:\n"

    .line 2
    .line 3
    invoke-static {}, Ll/n0r0;->r()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {}, Ll/n0r0;->s()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {p1, v1, v2}, Ll/gsq0;->a(ILjava/lang/String;)Ll/gsq0;

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/n0r0;->o()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "is_mp"

    .line 26
    .line 27
    invoke-virtual {p1, v2, v1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    :try_start_0
    iget-object p0, p0, Ll/bwq0;->c:Ll/irl;

    .line 31
    .line 32
    invoke-interface {p0}, Ll/irl;->c()Ljava/util/Map;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Ll/gsq0;->f(Ljava/util/Map;)Ll/gsq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p0

    .line 41
    :try_start_1
    new-instance v1, Ljava/util/HashMap;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p0}, Ll/d6r0;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/gsq0;->f(Ljava/util/Map;)Ll/gsq0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    .line 72
    .line 73
    :catchall_1
    :goto_0
    invoke-static {}, Ll/n0r0;->q()Ljava/util/concurrent/ConcurrentHashMap;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p1, p0}, Ll/gsq0;->r(Ljava/util/Map;)Ll/gsq0;

    .line 78
    .line 79
    .line 80
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const-string v0, "process_name"

    .line 89
    .line 90
    invoke-virtual {p1, v0, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-object p1
.end method

.method public g(Ll/gsq0;)Ll/gsq0;
    .locals 5

    .line 1
    const-string v0, "Fetch info failed:\n"

    .line 2
    .line 3
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v1}, Ll/lrq0;->j(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    const-string v1, "remote_process"

    .line 15
    .line 16
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {p1, v1, v3}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v3, "pid"

    .line 32
    .line 33
    invoke-virtual {p1, v3, v1}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/n0r0;->l()J

    .line 37
    .line 38
    .line 39
    move-result-wide v3

    .line 40
    invoke-virtual {p1, v3, v4}, Ll/gsq0;->b(J)Ll/gsq0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/bwq0;->h()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    iget-object v1, p0, Ll/bwq0;->d:Ll/euq0;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/gsq0;->g(Ll/euq0;)Ll/gsq0;

    .line 54
    .line 55
    .line 56
    :cond_1
    :try_start_0
    iget-object v1, p0, Ll/bwq0;->c:Ll/irl;

    .line 57
    .line 58
    invoke-interface {v1}, Ll/irl;->b()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v1}, Ll/gsq0;->e(Ljava/util/List;)Ll/gsq0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v1

    .line 67
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v1}, Ll/d6r0;->b(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {v0}, [Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p1, v0}, Ll/gsq0;->e(Ljava/util/List;)Ll/gsq0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 92
    .line 93
    .line 94
    :catchall_1
    :goto_0
    invoke-static {}, Ll/n0r0;->m()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    const-string v1, "business"

    .line 101
    .line 102
    invoke-virtual {p1, v1, v0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    iget-object p0, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 106
    .line 107
    invoke-static {p0}, Ll/lrq0;->g(Landroid/content/Context;)Z

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    xor-int/2addr p0, v2

    .line 112
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const-string v0, "is_background"

    .line 117
    .line 118
    invoke-virtual {p1, v0, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 119
    .line 120
    .line 121
    return-object p1
.end method

.method public h()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public i(Ll/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bwq0;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/bwq0;->b:Landroid/content/Context;

    .line 8
    .line 9
    invoke-static {p0}, Ll/l6r0;->b(Landroid/content/Context;)Lorg/json/JSONObject;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p1, p0}, Ll/gsq0;->s(Lorg/json/JSONObject;)Ll/gsq0;

    .line 14
    .line 15
    .line 16
    :cond_0
    return-object p1
.end method

.method public j()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public k(Ll/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bwq0;->e:Ll/byq0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/byq0;->a()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "battery"

    .line 16
    .line 17
    invoke-virtual {p1, v0, p0}, Ll/gsq0;->j(Ljava/lang/String;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/n0r0;->d()Ll/rrq0;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/rrq0;->b()Ljava/util/Map;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ll/gsq0;->w(Ljava/util/Map;)Ll/gsq0;

    .line 29
    .line 30
    .line 31
    return-object p1
.end method

.method public l(Ll/gsq0;)Ll/gsq0;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bwq0;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/bwq0;->n(Ll/gsq0;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-object p1
.end method

.method public m(Ll/gsq0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Ll/gsq0;)V
    .locals 0

    .line 1
    return-void
.end method
