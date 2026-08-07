.class Ll/duv$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/duv;->A()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/duv;


# direct methods
.method public constructor <init>(Ll/duv;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/duv$b;->b:Ll/duv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/duv$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/duv$b;->b:Ll/duv;

    .line 2
    .line 3
    invoke-static {v0}, Ll/duv;->c(Ll/duv;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    :try_start_1
    iget-object v2, p0, Ll/duv$b;->b:Ll/duv;

    .line 14
    .line 15
    invoke-static {v2}, Ll/duv;->c(Ll/duv;)Lorg/json/JSONObject;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Ljava/lang/String;

    .line 34
    .line 35
    iget-object v4, p0, Ll/duv$b;->b:Ll/duv;

    .line 36
    .line 37
    invoke-static {v4}, Ll/duv;->c(Ll/duv;)Lorg/json/JSONObject;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    goto/16 :goto_4

    .line 51
    .line 52
    :catch_0
    move-exception v2

    .line 53
    :try_start_2
    iget-object v3, p0, Ll/duv$b;->b:Ll/duv;

    .line 54
    .line 55
    invoke-static {v3}, Ll/duv;->g(Ll/duv;)Lcom/clevertap/android/sdk/Logger;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iget-object v4, p0, Ll/duv$b;->b:Ll/duv;

    .line 60
    .line 61
    invoke-static {v4}, Ll/duv;->f(Ll/duv;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    const-string v5, "Failed to copy profile fields"

    .line 66
    .line 67
    invoke-virtual {v3, v4, v5, v2}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v2, p0, Ll/duv$b;->b:Ll/duv;

    .line 71
    .line 72
    invoke-static {v2}, Ll/duv;->h(Ll/duv;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getEncryptionLevel()I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    invoke-static {v2}, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->fromInt(I)Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget-object v3, Lcom/clevertap/android/sdk/cryption/EncryptionLevel;->MEDIUM:Lcom/clevertap/android/sdk/cryption/EncryptionLevel;

    .line 85
    .line 86
    const/4 v4, 0x1

    .line 87
    const/4 v5, 0x0

    .line 88
    if-ne v2, v3, :cond_1

    .line 89
    .line 90
    move v2, v4

    .line 91
    goto :goto_1

    .line 92
    :cond_1
    move v2, v5

    .line 93
    :goto_1
    sget-object v3, Lcom/clevertap/android/sdk/Constants;->piiDBKeys:Ljava/util/HashSet;

    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    move v6, v5

    .line 100
    :cond_2
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 101
    .line 102
    .line 103
    move-result v7

    .line 104
    if-eqz v7, :cond_4

    .line 105
    .line 106
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v7

    .line 110
    check-cast v7, Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 111
    .line 112
    :try_start_3
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 113
    .line 114
    .line 115
    move-result v8

    .line 116
    if-eqz v8, :cond_2

    .line 117
    .line 118
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v8

    .line 122
    instance-of v9, v8, Ljava/lang/String;

    .line 123
    .line 124
    if-eqz v9, :cond_2

    .line 125
    .line 126
    if-eqz v2, :cond_2

    .line 127
    .line 128
    iget-object v9, p0, Ll/duv$b;->b:Ll/duv;

    .line 129
    .line 130
    invoke-static {v9}, Ll/duv;->e(Ll/duv;)Lcom/clevertap/android/sdk/cryption/c;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    check-cast v8, Ljava/lang/String;

    .line 135
    .line 136
    invoke-interface {v9, v8}, Lcom/clevertap/android/sdk/cryption/c;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    if-nez v8, :cond_3

    .line 141
    .line 142
    :goto_3
    move v6, v4

    .line 143
    goto :goto_2

    .line 144
    :cond_3
    invoke-virtual {v1, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 145
    .line 146
    .line 147
    goto :goto_2

    .line 148
    :catch_1
    move-exception v6

    .line 149
    :try_start_4
    iget-object v8, p0, Ll/duv$b;->b:Ll/duv;

    .line 150
    .line 151
    invoke-static {v8}, Ll/duv;->g(Ll/duv;)Lcom/clevertap/android/sdk/Logger;

    .line 152
    .line 153
    .line 154
    move-result-object v8

    .line 155
    iget-object v9, p0, Ll/duv$b;->b:Ll/duv;

    .line 156
    .line 157
    invoke-static {v9}, Ll/duv;->f(Ll/duv;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v9

    .line 161
    new-instance v10, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 164
    .line 165
    .line 166
    const-string v11, "Failed to encrypt pii key: "

    .line 167
    .line 168
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    .line 170
    .line 171
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    invoke-virtual {v8, v9, v7, v6}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 179
    .line 180
    .line 181
    goto :goto_3

    .line 182
    :cond_4
    if-eqz v6, :cond_5

    .line 183
    .line 184
    iget-object v2, p0, Ll/duv$b;->b:Ll/duv;

    .line 185
    .line 186
    invoke-static {v2}, Ll/duv;->e(Ll/duv;)Lcom/clevertap/android/sdk/cryption/c;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    invoke-interface {v2, v5}, Lcom/clevertap/android/sdk/cryption/c;->b(Z)V

    .line 191
    .line 192
    .line 193
    :cond_5
    iget-object v2, p0, Ll/duv$b;->b:Ll/duv;

    .line 194
    .line 195
    invoke-static {v2}, Ll/duv;->b(Ll/duv;)Ll/bj2;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    iget-object v3, p0, Ll/duv$b;->b:Ll/duv;

    .line 200
    .line 201
    invoke-static {v3}, Ll/duv;->i(Ll/duv;)Landroid/content/Context;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-interface {v2, v3}, Ll/bj2;->c(Landroid/content/Context;)Ll/h1c;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    iget-object v3, p0, Ll/duv$b;->a:Ljava/lang/String;

    .line 210
    .line 211
    iget-object v4, p0, Ll/duv$b;->b:Ll/duv;

    .line 212
    .line 213
    invoke-static {v4}, Ll/duv;->d(Ll/duv;)Ll/uzd;

    .line 214
    .line 215
    .line 216
    move-result-object v4

    .line 217
    invoke-virtual {v4}, Ll/uzd;->E()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-virtual {v2, v3, v4, v1}, Ll/h1c;->Q(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)J

    .line 222
    .line 223
    .line 224
    move-result-wide v1

    .line 225
    iget-object v3, p0, Ll/duv$b;->b:Ll/duv;

    .line 226
    .line 227
    invoke-static {v3}, Ll/duv;->g(Ll/duv;)Lcom/clevertap/android/sdk/Logger;

    .line 228
    .line 229
    .line 230
    move-result-object v3

    .line 231
    iget-object v4, p0, Ll/duv$b;->b:Ll/duv;

    .line 232
    .line 233
    invoke-static {v4}, Ll/duv;->f(Ll/duv;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    new-instance v5, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v6, "Persist Local Profile complete with status "

    .line 243
    .line 244
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    const-string v1, " for id "

    .line 251
    .line 252
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Ll/duv$b;->a:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    invoke-virtual {v3, v4, p0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    monitor-exit v0

    .line 268
    return-void

    .line 269
    :goto_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 270
    throw p0
.end method
