.class final Ll/hm3$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hm3;->I(Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "run"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Ll/hm3;

.field final synthetic b:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>(Ll/hm3;Lorg/json/JSONObject;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hm3$h;->b:Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .line 1
    const-string v0, "MKWebCaptureHelper"

    .line 2
    .line 3
    const-string v1, "saveCanvasCapture = "

    .line 4
    .line 5
    iget-object v2, p0, Ll/hm3$h;->b:Lorg/json/JSONObject;

    .line 6
    .line 7
    const-string v3, ""

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    const-string v4, "callback"

    .line 12
    .line 13
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move-object v2, v3

    .line 21
    :goto_0
    const/4 v4, 0x0

    .line 22
    const/4 v5, 0x1

    .line 23
    :try_start_0
    iget-object v6, p0, Ll/hm3$h;->b:Lorg/json/JSONObject;

    .line 24
    .line 25
    if-eqz v6, :cond_1

    .line 26
    .line 27
    const-string v7, "url"

    .line 28
    .line 29
    invoke-virtual {v6, v7, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    if-eqz v6, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catchall_0
    move-exception v1

    .line 37
    goto/16 :goto_5

    .line 38
    .line 39
    :cond_1
    move-object v6, v3

    .line 40
    :goto_1
    iget-object v7, p0, Ll/hm3$h;->b:Lorg/json/JSONObject;

    .line 41
    .line 42
    const/4 v8, 0x0

    .line 43
    if-eqz v7, :cond_2

    .line 44
    .line 45
    const-string v9, "type"

    .line 46
    .line 47
    invoke-virtual {v7, v9, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    move v7, v8

    .line 53
    :goto_2
    invoke-static {v6}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    iget-object v10, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 58
    .line 59
    if-eqz v9, :cond_3

    .line 60
    .line 61
    :try_start_1
    const-string v1, "url\u4e0d\u80fd\u4e3a\u7a7a"

    .line 62
    .line 63
    invoke-static {v10, v5, v1}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v10, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-static {v10}, Ll/hm3;->w(Ll/hm3;)Ll/hul;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    if-eqz v9, :cond_4

    .line 76
    .line 77
    invoke-interface {v9}, Ll/hul;->getView()Landroid/webkit/WebView;

    .line 78
    .line 79
    .line 80
    move-result-object v9

    .line 81
    if-eqz v9, :cond_4

    .line 82
    .line 83
    iget-object v10, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 84
    .line 85
    invoke-static {v10, v9}, Ll/hm3;->t(Ll/hm3;Landroid/view/View;)Landroid/graphics/Bitmap;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    :cond_4
    new-instance v9, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v9, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v1, "   type="

    .line 98
    .line 99
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-static {v0, v1}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    .line 111
    .line 112
    const-string v1, "\u622a\u56fe\u5931\u8d25"

    .line 113
    .line 114
    if-nez v4, :cond_5

    .line 115
    .line 116
    :try_start_2
    iget-object v6, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 117
    .line 118
    invoke-static {v6, v5, v1}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-static {v6, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :cond_5
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 127
    .line 128
    .line 129
    move-result v9

    .line 130
    if-eqz v9, :cond_6

    .line 131
    .line 132
    iget-object v6, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 133
    .line 134
    invoke-static {v6, v5, v1}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-static {v6, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    .line 140
    .line 141
    :try_start_3
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-nez p0, :cond_b

    .line 146
    .line 147
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :catchall_1
    move-exception p0

    .line 152
    invoke-static {v0, v3, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 153
    .line 154
    .line 155
    return-void

    .line 156
    :cond_6
    :try_start_4
    invoke-static {}, Ll/ckw;->h()Ljava/io/File;

    .line 157
    .line 158
    .line 159
    move-result-object v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 160
    iget-object v9, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 161
    .line 162
    const-string v10, "\u5b58\u50a8\u622a\u56fe\u5931\u8d25"

    .line 163
    .line 164
    if-nez v1, :cond_7

    .line 165
    .line 166
    :try_start_5
    invoke-static {v9, v5, v10}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-static {v9, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 171
    .line 172
    .line 173
    :try_start_6
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-nez p0, :cond_b

    .line 178
    .line 179
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :catchall_2
    move-exception p0

    .line 184
    invoke-static {v0, v3, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_7
    :try_start_7
    invoke-static {v9, v6, v7}, Ll/hm3;->v(Ll/hm3;Ljava/lang/String;I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v6

    .line 192
    new-instance v7, Ljava/io/File;

    .line 193
    .line 194
    invoke-direct {v7, v1, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_8

    .line 202
    .line 203
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 204
    .line 205
    .line 206
    :cond_8
    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    iget-object v6, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 213
    .line 214
    .line 215
    invoke-static {v6, v1, v4}, Ll/hm3;->y(Ll/hm3;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    .line 216
    .line 217
    .line 218
    move-result v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 219
    iget-object v6, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 220
    .line 221
    if-eqz v1, :cond_9

    .line 222
    .line 223
    :try_start_8
    const-string v1, "\u6210\u529f"

    .line 224
    .line 225
    invoke-static {v6, v8, v1}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-static {v6, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 230
    .line 231
    .line 232
    goto :goto_3

    .line 233
    :cond_9
    invoke-static {v6, v5, v10}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-static {v6, v2, v1}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    :goto_3
    iget-object v1, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 241
    .line 242
    invoke-static {v1}, Ll/hm3;->s(Ll/hm3;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 243
    .line 244
    .line 245
    :try_start_9
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    if-nez p0, :cond_b

    .line 250
    .line 251
    :goto_4
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 252
    .line 253
    .line 254
    goto :goto_7

    .line 255
    :catchall_3
    move-exception p0

    .line 256
    invoke-static {v0, v3, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 257
    .line 258
    .line 259
    goto :goto_7

    .line 260
    :goto_5
    :try_start_a
    iget-object p0, p0, Ll/hm3$h;->a:Ll/hm3;

    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v6

    .line 266
    if-eqz v6, :cond_a

    .line 267
    .line 268
    goto :goto_6

    .line 269
    :cond_a
    move-object v6, v3

    .line 270
    :goto_6
    invoke-static {p0, v5, v6}, Ll/hm3;->u(Ll/hm3;ILjava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    invoke-static {p0, v2, v5}, Ll/hm3;->x(Ll/hm3;Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    invoke-static {v0, v3, v1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_4

    .line 278
    .line 279
    .line 280
    if-eqz v4, :cond_b

    .line 281
    .line 282
    :try_start_b
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 283
    .line 284
    .line 285
    move-result p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 286
    if-nez p0, :cond_b

    .line 287
    .line 288
    goto :goto_4

    .line 289
    :cond_b
    :goto_7
    return-void

    .line 290
    :catchall_4
    move-exception p0

    .line 291
    if-eqz v4, :cond_c

    .line 292
    .line 293
    :try_start_c
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    if-nez v1, :cond_c

    .line 298
    .line 299
    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    .line 300
    .line 301
    .line 302
    goto :goto_8

    .line 303
    :catchall_5
    move-exception v1

    .line 304
    invoke-static {v0, v3, v1}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 305
    .line 306
    .line 307
    :cond_c
    :goto_8
    throw p0
.end method
