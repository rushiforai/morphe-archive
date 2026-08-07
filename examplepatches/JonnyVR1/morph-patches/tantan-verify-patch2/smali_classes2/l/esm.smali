.class public Ll/esm;
.super Ll/p95;
.source "SourceFile"


# instance fields
.field private final b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field private final c:Ll/w36;

.field private final d:Z

.field private final e:Lcom/clevertap/android/sdk/Logger;

.field private final f:Ll/h6g0;

.field private final g:Ll/cqi0;

.field private final h:Ll/wjj0;

.field private final i:Ll/bu9;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ll/w36;ZLl/h6g0;Ll/wjj0;Ll/cqi0;Ll/bu9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p95;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 11
    .line 12
    iput-object p2, p0, Ll/esm;->c:Ll/w36;

    .line 13
    .line 14
    iput-boolean p3, p0, Ll/esm;->d:Z

    .line 15
    .line 16
    iput-object p4, p0, Ll/esm;->f:Ll/h6g0;

    .line 17
    .line 18
    iput-object p5, p0, Ll/esm;->h:Ll/wjj0;

    .line 19
    .line 20
    iput-object p7, p0, Ll/esm;->i:Ll/bu9;

    .line 21
    .line 22
    iput-object p6, p0, Ll/esm;->g:Ll/cqi0;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic b(Ll/esm;Ljava/util/List;)Ljava/lang/Void;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/esm;->c:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->u(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method private c(Lorg/json/JSONArray;Ll/xpm;Ll/wjj0;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-ge p0, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p2, v0}, Ll/xpm;->b(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, v0}, Ll/wjj0;->e(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    add-int/lit8 p0, p0, 0x1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return-void
.end method

.method private d(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ru3;->c(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)Ll/su3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "TAG_FEATURE_IN_APPS"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/dsm;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/dsm;-><init>(Ll/esm;Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "InAppResponse#processResponse"

    .line 19
    .line 20
    invoke-virtual {v0, p0, v1}, Lcom/clevertap/android/sdk/task/Task;->g(Ljava/lang/String;Ljava/util/concurrent/Callable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private f(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lorg/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/esm;->c:Ll/w36;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, p1, v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->Z(Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 12
    .line 13
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "InApp: scheduling "

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p1, " delayed in-apps. Active delays: "

    .line 34
    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->G()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v1, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method


# virtual methods
.method public a(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/esm;->e(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public e(Lorg/json/JSONObject;Ljava/lang/String;Landroid/content/Context;Z)V
    .locals 5

    .line 1
    :try_start_0
    iget-object p2, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->isAnalyticsOnly()Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 10
    .line 11
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p2, "CleverTap instance is configured to analytics only, not processing inapp messages"

    .line 18
    .line 19
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    if-eqz p1, :cond_14

    .line 24
    .line 25
    invoke-virtual {p1}, Lorg/json/JSONObject;->length()I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_1

    .line 30
    .line 31
    goto/16 :goto_2

    .line 32
    .line 33
    :cond_1
    new-instance p2, Ll/fsm;

    .line 34
    .line 35
    iget-object v0, p0, Ll/esm;->g:Ll/cqi0;

    .line 36
    .line 37
    invoke-direct {p2, p1, v0}, Ll/fsm;-><init>(Lorg/json/JSONObject;Ll/cqi0;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/esm;->f:Ll/h6g0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/h6g0;->b()Ll/xpm;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v1, p0, Ll/esm;->f:Ll/h6g0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/h6g0;->d()Ll/ksm;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v2, p0, Ll/esm;->f:Ll/h6g0;

    .line 53
    .line 54
    invoke-virtual {v2}, Ll/h6g0;->c()Ll/cqm;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v3, p0, Ll/esm;->f:Ll/h6g0;

    .line 59
    .line 60
    invoke-virtual {v3}, Ll/h6g0;->a()Ll/aki;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    iget-object v4, p0, Ll/esm;->f:Ll/h6g0;

    .line 65
    .line 66
    invoke-virtual {v4}, Ll/h6g0;->e()Ll/ncr;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    if-eqz v0, :cond_13

    .line 71
    .line 72
    if-eqz v1, :cond_13

    .line 73
    .line 74
    if-eqz v2, :cond_13

    .line 75
    .line 76
    if-eqz v4, :cond_13

    .line 77
    .line 78
    if-nez v3, :cond_2

    .line 79
    .line 80
    goto/16 :goto_1

    .line 81
    .line 82
    :cond_2
    iget-object v2, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 83
    .line 84
    iget-object v3, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 85
    .line 86
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    const-string v4, "InApp: Processing response"

    .line 91
    .line 92
    invoke-virtual {v2, v3, v4}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p2}, Ll/fsm;->e()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    invoke-virtual {p2}, Ll/fsm;->d()I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    iget-boolean v4, p0, Ll/esm;->d:Z

    .line 104
    .line 105
    if-nez v4, :cond_3

    .line 106
    .line 107
    iget-object v4, p0, Ll/esm;->c:Ll/w36;

    .line 108
    .line 109
    invoke-virtual {v4}, Ll/w36;->i()Ll/vqm;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    if-eqz v4, :cond_3

    .line 114
    .line 115
    const-string v4, "Updating InAppFC Limits"

    .line 116
    .line 117
    invoke-static {v4}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v4, p0, Ll/esm;->c:Ll/w36;

    .line 121
    .line 122
    invoke-virtual {v4}, Ll/w36;->i()Ll/vqm;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {v4, p3, v3, v2}, Ll/vqm;->x(Landroid/content/Context;II)V

    .line 127
    .line 128
    .line 129
    iget-object v2, p0, Ll/esm;->c:Ll/w36;

    .line 130
    .line 131
    invoke-virtual {v2}, Ll/w36;->i()Ll/vqm;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2, p3, p1}, Ll/vqm;->v(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_3
    iget-object p1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 140
    .line 141
    iget-object v2, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 142
    .line 143
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    const-string v3, "controllerManager.getInAppFCManager() is NULL, not Updating InAppFC Limits"

    .line 148
    .line 149
    invoke-virtual {p1, v2, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :goto_0
    invoke-virtual {p2}, Ll/fsm;->n()Lkotlin/Pair;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Lkotlin/Pair;->getFirst()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v2

    .line 160
    check-cast v2, Ljava/lang/Boolean;

    .line 161
    .line 162
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-eqz v2, :cond_4

    .line 167
    .line 168
    invoke-virtual {p1}, Lkotlin/Pair;->getSecond()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lorg/json/JSONArray;

    .line 173
    .line 174
    iget-object v2, p0, Ll/esm;->h:Ll/wjj0;

    .line 175
    .line 176
    invoke-direct {p0, p1, v0, v2}, Ll/esm;->c(Lorg/json/JSONArray;Ll/xpm;Ll/wjj0;)V

    .line 177
    .line 178
    .line 179
    :cond_4
    invoke-virtual {p2}, Ll/fsm;->c()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_5

    .line 188
    .line 189
    invoke-virtual {v1, p1}, Ll/ksm;->o(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_5
    if-eqz p4, :cond_6

    .line 193
    .line 194
    return-void

    .line 195
    :cond_6
    invoke-virtual {p2}, Ll/fsm;->i()Ll/ufe$a;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1}, Ll/ufe$a;->d()Z

    .line 200
    .line 201
    .line 202
    move-result p4

    .line 203
    if-eqz p4, :cond_7

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/ufe$a;->b()Ljava/util/List;

    .line 206
    .line 207
    .line 208
    move-result-object p4

    .line 209
    invoke-direct {p0, p4}, Ll/esm;->d(Ljava/util/List;)V

    .line 210
    .line 211
    .line 212
    :cond_7
    invoke-virtual {p1}, Ll/ufe$a;->c()Z

    .line 213
    .line 214
    .line 215
    move-result p4

    .line 216
    if-eqz p4, :cond_8

    .line 217
    .line 218
    invoke-virtual {p1}, Ll/ufe$a;->a()Ljava/util/List;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-direct {p0, p1}, Ll/esm;->f(Ljava/util/List;)V

    .line 223
    .line 224
    .line 225
    :cond_8
    invoke-virtual {p2}, Ll/fsm;->j()Ll/ufe$b;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p1}, Ll/ufe$b;->b()Z

    .line 230
    .line 231
    .line 232
    move-result p4

    .line 233
    if-eqz p4, :cond_9

    .line 234
    .line 235
    iget-object p4, p0, Ll/esm;->c:Ll/w36;

    .line 236
    .line 237
    invoke-virtual {p4}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 238
    .line 239
    .line 240
    move-result-object p4

    .line 241
    invoke-virtual {p1}, Ll/ufe$b;->a()Ljava/util/List;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-virtual {p4, p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->b0(Ljava/util/List;)V

    .line 246
    .line 247
    .line 248
    :cond_9
    invoke-virtual {p2}, Ll/fsm;->f()Ll/ufe$a;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    invoke-virtual {p1}, Ll/ufe$a;->d()Z

    .line 253
    .line 254
    .line 255
    move-result p4

    .line 256
    if-eqz p4, :cond_a

    .line 257
    .line 258
    iget-object p4, p0, Ll/esm;->c:Ll/w36;

    .line 259
    .line 260
    invoke-virtual {p4}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 261
    .line 262
    .line 263
    move-result-object p4

    .line 264
    invoke-virtual {p1}, Ll/ufe$a;->b()Ljava/util/List;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    iget-object v2, p0, Ll/esm;->i:Ll/bu9;

    .line 269
    .line 270
    invoke-virtual {v2}, Ll/bu9;->p()Landroid/location/Location;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    invoke-virtual {p4, v0, v2}, Lcom/clevertap/android/sdk/inapp/InAppController;->P(Ljava/util/List;Landroid/location/Location;)V

    .line 275
    .line 276
    .line 277
    :cond_a
    invoke-virtual {p1}, Ll/ufe$a;->c()Z

    .line 278
    .line 279
    .line 280
    move-result p4

    .line 281
    if-eqz p4, :cond_b

    .line 282
    .line 283
    iget-object p4, p0, Ll/esm;->c:Ll/w36;

    .line 284
    .line 285
    invoke-virtual {p4}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 286
    .line 287
    .line 288
    move-result-object p4

    .line 289
    invoke-virtual {p1}, Ll/ufe$a;->a()Ljava/util/List;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iget-object v0, p0, Ll/esm;->i:Ll/bu9;

    .line 294
    .line 295
    invoke-virtual {v0}, Ll/bu9;->p()Landroid/location/Location;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    invoke-virtual {p4, p1, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->O(Ljava/util/List;Landroid/location/Location;)V

    .line 300
    .line 301
    .line 302
    :cond_b
    invoke-virtual {p2}, Ll/fsm;->g()Ll/ufe$b;

    .line 303
    .line 304
    .line 305
    move-result-object p1

    .line 306
    invoke-virtual {p1}, Ll/ufe$b;->b()Z

    .line 307
    .line 308
    .line 309
    move-result p4

    .line 310
    if-eqz p4, :cond_c

    .line 311
    .line 312
    iget-object p4, p0, Ll/esm;->c:Ll/w36;

    .line 313
    .line 314
    invoke-virtual {p4}, Ll/w36;->h()Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 315
    .line 316
    .line 317
    move-result-object p4

    .line 318
    invoke-virtual {p1}, Ll/ufe$b;->a()Ljava/util/List;

    .line 319
    .line 320
    .line 321
    move-result-object p1

    .line 322
    iget-object v0, p0, Ll/esm;->i:Ll/bu9;

    .line 323
    .line 324
    invoke-virtual {v0}, Ll/bu9;->p()Landroid/location/Location;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p4, p1, v0}, Lcom/clevertap/android/sdk/inapp/InAppController;->Q(Ljava/util/List;Landroid/location/Location;)V

    .line 329
    .line 330
    .line 331
    :cond_c
    invoke-virtual {p2}, Ll/fsm;->h()Ll/ufe$a;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-virtual {p1}, Ll/ufe$a;->d()Z

    .line 336
    .line 337
    .line 338
    move-result p4

    .line 339
    if-eqz p4, :cond_d

    .line 340
    .line 341
    invoke-virtual {p1}, Ll/ufe$a;->b()Ljava/util/List;

    .line 342
    .line 343
    .line 344
    move-result-object p4

    .line 345
    invoke-virtual {v1, p4}, Ll/ksm;->q(Ljava/util/List;)V

    .line 346
    .line 347
    .line 348
    :cond_d
    invoke-virtual {p1}, Ll/ufe$a;->c()Z

    .line 349
    .line 350
    .line 351
    move-result p4

    .line 352
    if-eqz p4, :cond_e

    .line 353
    .line 354
    invoke-virtual {p1}, Ll/ufe$a;->a()Ljava/util/List;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    invoke-virtual {v1, p1}, Ll/ksm;->p(Ljava/util/List;)V

    .line 359
    .line 360
    .line 361
    :cond_e
    invoke-virtual {p2}, Ll/fsm;->k()Ll/ufe$c;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {p1}, Ll/ufe$c;->d()Z

    .line 366
    .line 367
    .line 368
    move-result p4

    .line 369
    if-eqz p4, :cond_f

    .line 370
    .line 371
    invoke-virtual {p1}, Ll/ufe$c;->b()Ljava/util/List;

    .line 372
    .line 373
    .line 374
    move-result-object p4

    .line 375
    invoke-virtual {v1, p4}, Ll/ksm;->u(Ljava/util/List;)V

    .line 376
    .line 377
    .line 378
    :cond_f
    invoke-virtual {p1}, Ll/ufe$c;->c()Z

    .line 379
    .line 380
    .line 381
    move-result p4

    .line 382
    if-eqz p4, :cond_10

    .line 383
    .line 384
    invoke-virtual {p1}, Ll/ufe$c;->a()Ljava/util/List;

    .line 385
    .line 386
    .line 387
    move-result-object p1

    .line 388
    invoke-virtual {v1, p1}, Ll/ksm;->s(Ljava/util/List;)V

    .line 389
    .line 390
    .line 391
    :cond_10
    invoke-virtual {p2}, Ll/fsm;->m()Ljava/util/List;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    iget-object p4, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 396
    .line 397
    iget-object v0, p0, Ll/esm;->f:Ll/h6g0;

    .line 398
    .line 399
    invoke-static {p3, p4, v0}, Ll/pji;->a(Landroid/content/Context;Lcom/clevertap/android/sdk/Logger;Ll/h6g0;)Ll/vji;

    .line 400
    .line 401
    .line 402
    move-result-object p3

    .line 403
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 404
    .line 405
    .line 406
    move-result p4

    .line 407
    if-nez p4, :cond_11

    .line 408
    .line 409
    invoke-virtual {p3, p1}, Ll/vji;->n(Ljava/util/List;)V

    .line 410
    .line 411
    .line 412
    :cond_11
    iget-boolean p1, p0, Ll/o95;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 413
    .line 414
    iget-object p4, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 415
    .line 416
    if-eqz p1, :cond_12

    .line 417
    .line 418
    :try_start_1
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 419
    .line 420
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    const-string p1, "Handling cache eviction"

    .line 425
    .line 426
    invoke-virtual {p4, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {p2}, Ll/fsm;->l()Ljava/util/List;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-virtual {p3, p0}, Ll/vji;->i(Ljava/util/List;)V

    .line 434
    .line 435
    .line 436
    return-void

    .line 437
    :cond_12
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 438
    .line 439
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object p0

    .line 443
    const-string p1, "Ignoring cache eviction"

    .line 444
    .line 445
    invoke-virtual {p4, p0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    return-void

    .line 449
    :cond_13
    :goto_1
    iget-object p1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 450
    .line 451
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 452
    .line 453
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    const-string p2, "Stores are not initialised, ignoring inapps!!!!"

    .line 458
    .line 459
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    return-void

    .line 463
    :cond_14
    :goto_2
    iget-object p1, p0, Ll/esm;->e:Lcom/clevertap/android/sdk/Logger;

    .line 464
    .line 465
    iget-object p0, p0, Ll/esm;->b:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 466
    .line 467
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 468
    .line 469
    .line 470
    move-result-object p0

    .line 471
    const-string p2, "There is no inapps data to handle"

    .line 472
    .line 473
    invoke-virtual {p1, p0, p2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 474
    .line 475
    .line 476
    return-void

    .line 477
    :catchall_0
    move-exception p0

    .line 478
    const-string p1, "InAppManager: Failed to parse response"

    .line 479
    .line 480
    invoke-static {p1, p0}, Lcom/clevertap/android/sdk/Logger;->v(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 481
    .line 482
    .line 483
    return-void
.end method
