.class public Lcom/cmic/sso/sdk/d/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Lcom/cmic/sso/sdk/a;


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

.method public static synthetic a(Lcom/cmic/sso/sdk/d/b;)Lcom/cmic/sso/sdk/a;
    .locals 0

    .line 230
    iget-object p0, p0, Lcom/cmic/sso/sdk/d/b;->a:Lcom/cmic/sso/sdk/a;

    return-object p0
.end method

.method private static a(Lcom/cmic/sso/sdk/d/a;Lcom/cmic/sso/sdk/a;)V
    .locals 8

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :cond_0
    const-string v0, "appid"

    .line 8
    .line 9
    const-string v1, ""

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->b(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->a()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->e(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const-string v0, "interfaceType"

    .line 26
    .line 27
    invoke-virtual {p1, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->h(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v0, "interfaceCode"

    .line 35
    .line 36
    invoke-virtual {p1, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->g(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "interfaceElasped"

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->f(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string v0, "timeOut"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Lcom/cmic/sso/sdk/d/a;->k(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    const-string v0, "traceId"

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p0, v2}, Lcom/cmic/sso/sdk/d/a;->s(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    const-string v2, "simCardNum"

    .line 71
    .line 72
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0, v2}, Lcom/cmic/sso/sdk/d/a;->m(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    const-string v2, "operatortype"

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->n(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-string v3, "networkOperator"

    .line 89
    .line 90
    invoke-virtual {p1, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->o(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->b()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->p(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-static {}, Lcom/cmic/sso/sdk/e/m;->c()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->q(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    const-string v3, "networktype"

    .line 112
    .line 113
    const/4 v4, 0x0

    .line 114
    invoke-virtual {p1, v3, v4}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;I)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->x(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    const-string v3, "starttime"

    .line 126
    .line 127
    invoke-virtual {p1, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->t(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string v3, "endtime"

    .line 135
    .line 136
    invoke-virtual {p1, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->u(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    const-string v3, "systemEndTime"

    .line 144
    .line 145
    const-wide/16 v4, 0x0

    .line 146
    .line 147
    invoke-virtual {p1, v3, v4, v5}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;J)J

    .line 148
    .line 149
    .line 150
    move-result-wide v6

    .line 151
    const-string v3, "systemStartTime"

    .line 152
    .line 153
    invoke-virtual {p1, v3, v4, v5}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;J)J

    .line 154
    .line 155
    .line 156
    move-result-wide v3

    .line 157
    sub-long/2addr v6, v3

    .line 158
    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->l(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    const-string v3, "imsiState"

    .line 166
    .line 167
    invoke-virtual {p1, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {p0, v3}, Lcom/cmic/sso/sdk/d/a;->c(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    const-string v3, "AID"

    .line 175
    .line 176
    invoke-static {v3, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-virtual {p0, v1}, Lcom/cmic/sso/sdk/d/a;->y(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, v2}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {p0, v1}, Lcom/cmic/sso/sdk/d/a;->z(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    const-string v1, "scripType"

    .line 191
    .line 192
    invoke-virtual {p1, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-virtual {p0, v1}, Lcom/cmic/sso/sdk/d/a;->A(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    const-string v1, "networkTypeByAPI"

    .line 200
    .line 201
    invoke-virtual {p1, v1}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {p0, v1}, Lcom/cmic/sso/sdk/d/a;->B(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    new-instance p0, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p1, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const-string p1, "SendLog"

    .line 225
    .line 226
    invoke-static {p1, p0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    :cond_1
    :goto_0
    return-void
.end method

.method private a(Lorg/json/JSONObject;)V
    .locals 3

    .line 260
    invoke-static {}, Lcom/cmic/sso/sdk/c/c/a;->a()Lcom/cmic/sso/sdk/c/c/a;

    move-result-object v0

    iget-object v1, p0, Lcom/cmic/sso/sdk/d/b;->a:Lcom/cmic/sso/sdk/a;

    new-instance v2, Lcom/cmic/sso/sdk/d/b$1;

    invoke-direct {v2, p0}, Lcom/cmic/sso/sdk/d/b$1;-><init>(Lcom/cmic/sso/sdk/d/b;)V

    invoke-virtual {v0, p1, v1, v2}, Lcom/cmic/sso/sdk/c/c/a;->a(Lorg/json/JSONObject;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/c/d;)V

    return-void
.end method

.method private a(Lorg/json/JSONObject;Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 258
    iput-object p2, p0, Lcom/cmic/sso/sdk/d/b;->a:Lcom/cmic/sso/sdk/a;

    .line 259
    invoke-direct {p0, p1}, Lcom/cmic/sso/sdk/d/b;->a(Lorg/json/JSONObject;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;Ljava/lang/String;Lcom/cmic/sso/sdk/a;)V
    .locals 10

    .line 231
    const-string v0, ""

    :try_start_0
    invoke-virtual {p3}, Lcom/cmic/sso/sdk/a;->a()Lcom/cmic/sso/sdk/d/a;

    move-result-object v1

    .line 232
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/f;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 233
    invoke-virtual {v1, p2}, Lcom/cmic/sso/sdk/d/a;->d(Ljava/lang/String;)V

    .line 234
    const-string p2, "loginMethod"

    invoke-virtual {p3, p2, v0}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/cmic/sso/sdk/d/a;->w(Ljava/lang/String;)V

    .line 235
    const-string p2, "isCacheScrip"

    const/4 v3, 0x0

    invoke-virtual {p3, p2, v3}, Lcom/cmic/sso/sdk/a;->b(Ljava/lang/String;Z)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 236
    const-string p2, "scrip"

    invoke-virtual {v1, p2}, Lcom/cmic/sso/sdk/d/a;->r(Ljava/lang/String;)V

    goto :goto_0

    .line 237
    :cond_0
    const-string p2, "pgw"

    invoke-virtual {v1, p2}, Lcom/cmic/sso/sdk/d/a;->r(Ljava/lang/String;)V

    .line 238
    :goto_0
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/f;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/cmic/sso/sdk/d/a;->i(Ljava/lang/String;)V

    .line 239
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    move-object v0, v2

    :goto_1
    invoke-virtual {v1, v0}, Lcom/cmic/sso/sdk/d/a;->j(Ljava/lang/String;)V

    .line 240
    invoke-static {v1, p3}, Lcom/cmic/sso/sdk/d/b;->a(Lcom/cmic/sso/sdk/d/a;Lcom/cmic/sso/sdk/a;)V

    .line 241
    iget-object p1, v1, Lcom/cmic/sso/sdk/d/a;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    move-result p1

    if-lez p1, :cond_4

    .line 242
    new-instance p1, Lorg/json/JSONArray;

    invoke-direct {p1}, Lorg/json/JSONArray;-><init>()V

    .line 243
    iget-object p2, v1, Lcom/cmic/sso/sdk/d/a;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    .line 244
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 245
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 246
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    .line 247
    array-length v6, v5

    move v7, v3

    :goto_3
    if-ge v7, v6, :cond_2

    aget-object v8, v5, v7

    .line 248
    const-string v9, "\n"

    invoke-virtual {v2, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v8}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    .line 249
    :cond_2
    const-string v5, "message"

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 250
    const-string v0, "stack"

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 251
    invoke-virtual {p1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 252
    :cond_3
    iget-object p2, v1, Lcom/cmic/sso/sdk/d/a;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    goto :goto_4

    :cond_4
    const/4 p1, 0x0

    :goto_4
    if-eqz p1, :cond_5

    .line 253
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    if-lez p2, :cond_5

    .line 254
    invoke-virtual {v1, p1}, Lcom/cmic/sso/sdk/d/a;->a(Lorg/json/JSONArray;)V

    .line 255
    :cond_5
    const-string p1, "SendLog"

    const-string p2, "\u767b\u5f55\u65e5\u5fd7"

    invoke-static {p1, p2}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    invoke-virtual {v1}, Lcom/cmic/sso/sdk/d/a;->b()Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {p0, p1, p3}, Lcom/cmic/sso/sdk/d/b;->a(Lorg/json/JSONObject;Lcom/cmic/sso/sdk/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 257
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method
