.class Ll/v0r0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/xiaomi/push/service/am$b;Ljava/lang/String;Ll/u1r0;)V
    .locals 8

    .line 1
    new-instance v0, Ll/hzq0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hzq0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->c:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/hzq0;->k(Ljava/lang/String;)Ll/hzq0;

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_1

    .line 26
    .line 27
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->e:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/hzq0;->u(Ljava/lang/String;)Ll/hzq0;

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->f:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-nez v1, :cond_2

    .line 39
    .line 40
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->f:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/hzq0;->x(Ljava/lang/String;)Ll/hzq0;

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-boolean v1, p0, Lcom/xiaomi/push/service/am$b;->a:Z

    .line 46
    .line 47
    const-string v2, "0"

    .line 48
    .line 49
    const-string v3, "1"

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    move-object v1, v3

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    move-object v1, v2

    .line 56
    :goto_0
    invoke-virtual {v0, v1}, Ll/hzq0;->o(Ljava/lang/String;)Ll/hzq0;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const-string v4, "XIAOMI-SASL"

    .line 66
    .line 67
    if-nez v1, :cond_4

    .line 68
    .line 69
    iget-object v1, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ll/hzq0;->r(Ljava/lang/String;)Ll/hzq0;

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_4
    invoke-virtual {v0, v4}, Ll/hzq0;->r(Ljava/lang/String;)Ll/hzq0;

    .line 76
    .line 77
    .line 78
    :goto_1
    new-instance v1, Ll/w0r0;

    .line 79
    .line 80
    invoke-direct {v1}, Ll/w0r0;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v5, p0, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1, v5}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iget-object v5, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    invoke-virtual {v1, v5}, Ll/w0r0;->h(I)V

    .line 95
    .line 96
    .line 97
    iget-object v5, p0, Lcom/xiaomi/push/service/am$b;->a:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v1, v5}, Ll/w0r0;->v(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-string v5, "BIND"

    .line 103
    .line 104
    const/4 v6, 0x0

    .line 105
    invoke-virtual {v1, v5, v6}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    invoke-virtual {v1, v5}, Ll/w0r0;->k(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    new-instance v5, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    const-string v7, "[Slim]: bind id="

    .line 118
    .line 119
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-static {v5}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    new-instance v5, Ljava/util/HashMap;

    .line 137
    .line 138
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 139
    .line 140
    .line 141
    const-string v7, "challenge"

    .line 142
    .line 143
    invoke-interface {v5, v7, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    const-string p1, "token"

    .line 147
    .line 148
    iget-object v7, p0, Lcom/xiaomi/push/service/am$b;->c:Ljava/lang/String;

    .line 149
    .line 150
    invoke-interface {v5, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    const-string p1, "chid"

    .line 154
    .line 155
    iget-object v7, p0, Lcom/xiaomi/push/service/am$b;->g:Ljava/lang/String;

    .line 156
    .line 157
    invoke-interface {v5, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    const-string p1, "from"

    .line 161
    .line 162
    iget-object v7, p0, Lcom/xiaomi/push/service/am$b;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-interface {v5, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    const-string p1, "id"

    .line 168
    .line 169
    invoke-virtual {v1}, Ll/w0r0;->D()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v7

    .line 173
    invoke-interface {v5, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    const-string p1, "to"

    .line 177
    .line 178
    const-string v7, "xiaomi.com"

    .line 179
    .line 180
    invoke-interface {v5, p1, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    iget-boolean p1, p0, Lcom/xiaomi/push/service/am$b;->a:Z

    .line 184
    .line 185
    const-string v7, "kick"

    .line 186
    .line 187
    if-eqz p1, :cond_5

    .line 188
    .line 189
    invoke-interface {v5, v7, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_5
    invoke-interface {v5, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    :goto_2
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->e:Ljava/lang/String;

    .line 197
    .line 198
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    const-string v2, ""

    .line 203
    .line 204
    const-string v3, "client_attrs"

    .line 205
    .line 206
    if-nez p1, :cond_6

    .line 207
    .line 208
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->e:Ljava/lang/String;

    .line 209
    .line 210
    invoke-interface {v5, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    goto :goto_3

    .line 214
    :cond_6
    invoke-interface {v5, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    :goto_3
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->f:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    const-string v3, "cloud_attrs"

    .line 224
    .line 225
    if-nez p1, :cond_7

    .line 226
    .line 227
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->f:Ljava/lang/String;

    .line 228
    .line 229
    invoke-interface {v5, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_7
    invoke-interface {v5, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    :goto_4
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 237
    .line 238
    const-string v2, "XIAOMI-PASS"

    .line 239
    .line 240
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result p1

    .line 244
    if-nez p1, :cond_9

    .line 245
    .line 246
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 247
    .line 248
    const-string v2, "XMPUSH-PASS"

    .line 249
    .line 250
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    if-eqz p1, :cond_8

    .line 255
    .line 256
    goto :goto_5

    .line 257
    :cond_8
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 258
    .line 259
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-object p0, v6

    .line 263
    goto :goto_6

    .line 264
    :cond_9
    :goto_5
    iget-object p1, p0, Lcom/xiaomi/push/service/am$b;->d:Ljava/lang/String;

    .line 265
    .line 266
    iget-object p0, p0, Lcom/xiaomi/push/service/am$b;->h:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p1, v6, v5, p0}, Ll/qtq0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p0

    .line 272
    :goto_6
    invoke-virtual {v0, p0}, Ll/hzq0;->A(Ljava/lang/String;)Ll/hzq0;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v0}, Ll/e0r0;->h()[B

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    invoke-virtual {v1, p0, v6}, Ll/w0r0;->n([BLjava/lang/String;)V

    .line 280
    .line 281
    .line 282
    invoke-virtual {p2, v1}, Ll/u1r0;->w(Ll/w0r0;)V

    .line 283
    .line 284
    .line 285
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ll/u1r0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/w0r0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0r0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/w0r0;->B(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Ll/w0r0;->h(I)V

    .line 14
    .line 15
    .line 16
    const-string p0, "UBND"

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {v0, p0, p1}, Ll/w0r0;->l(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ll/u1r0;->w(Ll/w0r0;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
