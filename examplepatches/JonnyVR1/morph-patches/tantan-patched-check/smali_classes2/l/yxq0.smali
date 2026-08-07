.class public Ll/yxq0;
.super Ljava/lang/Object;


# static fields
.field private static volatile b:Ll/yxq0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "StaticFieldLeak"
        }
    .end annotation
.end field


# instance fields
.field private volatile a:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yxq0;->a:Landroid/content/Context;

    .line 5
    .line 6
    return-void
.end method

.method public static a()Ll/yxq0;
    .locals 2

    .line 1
    sget-object v0, Ll/yxq0;->b:Ll/yxq0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/yxq0;

    .line 6
    .line 7
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Ll/yxq0;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Ll/yxq0;->b:Ll/yxq0;

    .line 15
    .line 16
    :cond_0
    sget-object v0, Ll/yxq0;->b:Ll/yxq0;

    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public b(Lorg/json/JSONObject;JZ)V
    .locals 8

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_1

    .line 10
    .line 11
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/apm/lite/j/e;->s()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/io/File;

    .line 16
    .line 17
    iget-object v2, p0, Ll/yxq0;->a:Landroid/content/Context;

    .line 18
    .line 19
    invoke-static {v2}, Ll/j5r0;->b(Landroid/content/Context;)Ljava/io/File;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget-object v3, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static {p2, p3, v3, v4, v4}, Ll/n0r0;->a(JLcom/apm/lite/CrashType;ZZ)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {}, Lcom/apm/lite/j/e;->q()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    invoke-static {v1, v2, v0, p1, v3}, Ll/r3r0;->d(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    if-eqz p4, :cond_6

    .line 45
    .line 46
    invoke-static {}, Ll/b350;->d()Z

    .line 47
    .line 48
    .line 49
    move-result p4

    .line 50
    if-eqz p4, :cond_1

    .line 51
    .line 52
    goto/16 :goto_1

    .line 53
    .line 54
    :cond_1
    const-string p4, "upload_scene"

    .line 55
    .line 56
    const-string v2, "direct"

    .line 57
    .line 58
    invoke-virtual {p1, p4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 59
    .line 60
    .line 61
    const-string p4, "crash_uuid"

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p1, p4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Ll/nrq0;->p()Z

    .line 71
    .line 72
    .line 73
    move-result p4

    .line 74
    const/4 v2, 0x2

    .line 75
    if-eqz p4, :cond_3

    .line 76
    .line 77
    const-string p4, "anr_trace"

    .line 78
    .line 79
    invoke-static {p2, p3, p4}, Ll/h5r0;->b(JLjava/lang/String;)Ljava/util/HashMap;

    .line 80
    .line 81
    .line 82
    move-result-object p4

    .line 83
    invoke-interface {p4}, Ljava/util/Map;->size()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    add-int/2addr v3, v2

    .line 88
    new-array v3, v3, [Ljava/io/File;

    .line 89
    .line 90
    invoke-interface {p4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 91
    .line 92
    .line 93
    move-result-object p4

    .line 94
    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 95
    .line 96
    .line 97
    move-result-object p4

    .line 98
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v5, :cond_4

    .line 103
    .line 104
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    check-cast v5, Ljava/util/Map$Entry;

    .line 109
    .line 110
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    check-cast v6, Ljava/lang/String;

    .line 115
    .line 116
    iget-object v7, p0, Ll/yxq0;->a:Landroid/content/Context;

    .line 117
    .line 118
    invoke-static {v7}, Ll/lrq0;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v7

    .line 122
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    if-eqz v6, :cond_2

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_2
    iget-object v6, p0, Ll/yxq0;->a:Landroid/content/Context;

    .line 130
    .line 131
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    check-cast v5, Ll/h5r0$b;

    .line 136
    .line 137
    iget-object v5, v5, Ll/h5r0$b;->b:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v6, v5}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 140
    .line 141
    .line 142
    move-result-object v5

    .line 143
    aput-object v5, v3, v4

    .line 144
    .line 145
    add-int/lit8 v4, v4, 0x1

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_3
    new-array v3, v2, [Ljava/io/File;

    .line 149
    .line 150
    :cond_4
    array-length p4, v3

    .line 151
    add-int/lit8 p4, p4, -0x1

    .line 152
    .line 153
    iget-object p0, p0, Ll/yxq0;->a:Landroid/content/Context;

    .line 154
    .line 155
    invoke-static {}, Ll/n0r0;->h()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-static {p0, v4}, Ll/j5r0;->c(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    aput-object p0, v3, p4

    .line 164
    .line 165
    array-length p0, v3

    .line 166
    sub-int/2addr p0, v2

    .line 167
    invoke-static {p2, p3}, Ll/h5r0;->a(J)Ljava/io/File;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    aput-object p2, v3, p0

    .line 172
    .line 173
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    invoke-static {v0, p0, v3}, Lcom/apm/lite/j/e;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p0}, Ll/r4r0;->a()Z

    .line 182
    .line 183
    .line 184
    move-result p0

    .line 185
    if-eqz p0, :cond_6

    .line 186
    .line 187
    invoke-static {v1}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 188
    .line 189
    .line 190
    invoke-static {}, Ll/b350;->b()Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    if-nez p0, :cond_5

    .line 195
    .line 196
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    invoke-static {p0}, Ll/j5r0;->r(Landroid/content/Context;)Ljava/io/File;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    invoke-static {p0}, Ll/r3r0;->r(Ljava/io/File;)Z

    .line 205
    .line 206
    .line 207
    :cond_5
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {p0}, Ll/j5r0;->F(Landroid/content/Context;)Ljava/io/File;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    sget-object p1, Lcom/apm/lite/CrashType;->ANR:Lcom/apm/lite/CrashType;

    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    invoke-static {p0, p1, p2}, Ll/s2r0;->a(Ljava/io/File;Lcom/apm/lite/CrashType;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 222
    .line 223
    .line 224
    :catchall_0
    :cond_6
    :goto_1
    return-void
.end method

.method public c(Lorg/json/JSONObject;Ljava/io/File;Ljava/io/File;)Z
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/apm/lite/j/e;->w()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/h5r0;->a(J)Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p2, p3, v0}, [Ljava/io/File;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    invoke-static {p0, p1, p2}, Lcom/apm/lite/j/e;->g(Ljava/lang/String;Ljava/lang/String;[Ljava/io/File;)Ll/r4r0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/r4r0;->a()Z

    .line 26
    .line 27
    .line 28
    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    invoke-static {p0}, Ll/q5r0;->g(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return p0
.end method
