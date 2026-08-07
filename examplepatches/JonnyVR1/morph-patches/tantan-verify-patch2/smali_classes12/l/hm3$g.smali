.class final Ll/hm3$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hm3;->G(Lorg/json/JSONObject;)V
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
    iput-object p1, p0, Ll/hm3$g;->a:Ll/hm3;

    .line 2
    .line 3
    iput-object p2, p0, Ll/hm3$g;->b:Lorg/json/JSONObject;

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
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "1"

    .line 4
    .line 5
    const-string v0, "saveCanvasCapture = "

    .line 6
    .line 7
    iget-object v3, v1, Ll/hm3$g;->b:Lorg/json/JSONObject;

    .line 8
    .line 9
    const-string v4, ""

    .line 10
    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    const-string v5, "callback"

    .line 14
    .line 15
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move-object v3, v4

    .line 23
    :goto_0
    :try_start_0
    iget-object v5, v1, Ll/hm3$g;->b:Lorg/json/JSONObject;

    .line 24
    .line 25
    if-eqz v5, :cond_1

    .line 26
    .line 27
    const-string v6, "url"

    .line 28
    .line 29
    invoke-virtual {v5, v6, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    if-eqz v5, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto/16 :goto_4

    .line 38
    .line 39
    :cond_1
    move-object v5, v4

    .line 40
    :goto_1
    iget-object v6, v1, Ll/hm3$g;->b:Lorg/json/JSONObject;

    .line 41
    .line 42
    const/4 v7, 0x0

    .line 43
    if-eqz v6, :cond_2

    .line 44
    .line 45
    const-string v8, "type"

    .line 46
    .line 47
    invoke-virtual {v6, v8, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    move v6, v7

    .line 53
    :goto_2
    const-string v8, "MKWebCaptureHelper"

    .line 54
    .line 55
    new-instance v9, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v0, "   type="

    .line 64
    .line 65
    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v8, v0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v5}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 85
    .line 86
    const-string v5, "url\u4e0d\u80fd\u4e3a\u7a7a"

    .line 87
    .line 88
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_3
    iget-object v0, v1, Ll/hm3$g;->b:Lorg/json/JSONObject;

    .line 93
    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    const-string v8, "data"

    .line 97
    .line 98
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    move-object v8, v0

    .line 105
    goto :goto_3

    .line 106
    :cond_4
    move-object v8, v4

    .line 107
    :goto_3
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_5

    .line 112
    .line 113
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 114
    .line 115
    const-string v5, "\u6587\u4ef6\u6570\u636e\u4e3a\u7a7a"

    .line 116
    .line 117
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    invoke-static {}, Ll/ckw;->h()Ljava/io/File;

    .line 122
    .line 123
    .line 124
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 125
    iget-object v9, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 126
    .line 127
    const-string v14, "\u4fdd\u5b58\u6587\u4ef6\u5931\u8d25"

    .line 128
    .line 129
    if-nez v0, :cond_6

    .line 130
    .line 131
    :try_start_1
    invoke-virtual {v9, v3, v4, v14, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_6
    invoke-static {v9, v5, v6}, Ll/hm3;->v(Ll/hm3;Ljava/lang/String;I)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v5

    .line 139
    invoke-static {v5}, Ll/i8g0;->b(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-eqz v6, :cond_7

    .line 144
    .line 145
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 146
    .line 147
    const-string v5, "\u4fdd\u5b58\u6587\u4ef6\u5931\u8d25,\u4e0d\u652f\u6301type\u7c7b\u578b"

    .line 148
    .line 149
    invoke-virtual {v0, v3, v4, v5, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_7
    new-instance v6, Ljava/io/File;

    .line 154
    .line 155
    invoke-direct {v6, v0, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-eqz v0, :cond_8

    .line 163
    .line 164
    invoke-virtual {v6}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 165
    .line 166
    .line 167
    :cond_8
    :try_start_2
    const-string v9, " "

    .line 168
    .line 169
    const-string v10, "+"

    .line 170
    .line 171
    const/4 v12, 0x4

    .line 172
    const/4 v13, 0x0

    .line 173
    const/4 v11, 0x0

    .line 174
    invoke-static/range {v8 .. v13}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v15

    .line 178
    const-string v0, ","

    .line 179
    .line 180
    filled-new-array {v0}, [Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v16

    .line 184
    const/16 v19, 0x6

    .line 185
    .line 186
    const/16 v20, 0x0

    .line 187
    .line 188
    const/16 v17, 0x0

    .line 189
    .line 190
    const/16 v18, 0x0

    .line 191
    .line 192
    invoke-static/range {v15 .. v20}, Lkotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[Ljava/lang/String;ZIILjava/lang/Object;)Ljava/util/List;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    const/4 v5, 0x1

    .line 197
    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    check-cast v0, Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v0, v7}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-static {v0, v6}, Lcom/hellogroup/common/file/FileUtil;->y([BLjava/io/File;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-eqz v0, :cond_9

    .line 212
    .line 213
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 214
    .line 215
    const-string v5, "\u6210\u529f"

    .line 216
    .line 217
    const-string v6, "0"

    .line 218
    .line 219
    invoke-virtual {v0, v3, v4, v5, v6}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 223
    .line 224
    invoke-static {v0}, Ll/hm3;->s(Ll/hm3;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :catch_0
    move-exception v0

    .line 229
    :try_start_3
    sget-object v5, Ll/qpl;->b:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v5, v4, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    :cond_9
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 235
    .line 236
    invoke-virtual {v0, v3, v4, v14, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    iget-object v0, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 240
    .line 241
    invoke-static {v0}, Ll/hm3;->s(Ll/hm3;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 242
    .line 243
    .line 244
    goto :goto_6

    .line 245
    :goto_4
    iget-object v1, v1, Ll/hm3$g;->a:Ll/hm3;

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    if-eqz v5, :cond_a

    .line 252
    .line 253
    goto :goto_5

    .line 254
    :cond_a
    move-object v5, v4

    .line 255
    :goto_5
    invoke-virtual {v1, v3, v4, v5, v2}, Ll/qpl;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    sget-object v1, Ll/qpl;->b:Ljava/lang/String;

    .line 259
    .line 260
    invoke-static {v1, v4, v0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 261
    .line 262
    .line 263
    :goto_6
    return-void
.end method
