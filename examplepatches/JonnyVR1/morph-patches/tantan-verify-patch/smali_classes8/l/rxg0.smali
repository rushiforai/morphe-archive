.class public final Ll/rxg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vrg0;


# instance fields
.field public final synthetic a:Ll/wyg0;


# direct methods
.method public constructor <init>(Ll/wyg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rxg0;->a:Ll/wyg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/gfg0;)V
    .locals 2

    .line 1
    const-string p1, ""

    .line 2
    .line 3
    new-instance p2, Ll/bsg0;

    .line 4
    .line 5
    invoke-direct {p2}, Ll/bsg0;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string p3, "getSdkInfo"

    .line 9
    .line 10
    iput-object p3, p2, Ll/bsg0;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide p3

    .line 16
    iput-wide p3, p2, Ll/bsg0;->b:J

    .line 17
    .line 18
    iget-object p3, p0, Ll/rxg0;->a:Ll/wyg0;

    .line 19
    .line 20
    invoke-virtual {p3, p2}, Ll/wyg0;->b(Ll/bsg0;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/rxg0;->a:Ll/wyg0;

    .line 24
    .line 25
    :try_start_0
    new-instance p3, Lorg/json/JSONObject;

    .line 26
    .line 27
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string p4, "ret_code"

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string p4, "ret_msg"

    .line 37
    .line 38
    const-string v0, "success"

    .line 39
    .line 40
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    const-string p4, "env_type"

    .line 44
    .line 45
    sget v0, Ll/utg0;->f:I

    .line 46
    .line 47
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 48
    .line 49
    .line 50
    const-string p4, "language"

    .line 51
    .line 52
    sget-object v0, Ll/utg0;->d:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 55
    .line 56
    .line 57
    const-string p4, "wordLanguage"

    .line 58
    .line 59
    invoke-virtual {p3, p4, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 60
    .line 61
    .line 62
    const-string p4, "asr_text_language_list"

    .line 63
    .line 64
    invoke-static {}, Ll/mkg0;->c()Lorg/json/JSONArray;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 69
    .line 70
    .line 71
    const-string p4, "asr_number_language_list"

    .line 72
    .line 73
    invoke-static {}, Ll/mkg0;->a()Lorg/json/JSONArray;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    const-string p4, "sdk_version"

    .line 81
    .line 82
    const-string v0, "1.6.7.1286"

    .line 83
    .line 84
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    const-string p4, "app_id"

    .line 88
    .line 89
    sget-object v0, Ll/utg0;->g:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 92
    .line 93
    .line 94
    const-string p4, "platform"

    .line 95
    .line 96
    const/4 v0, 0x2

    .line 97
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 98
    .line 99
    .line 100
    const-string p4, "bundle_id"

    .line 101
    .line 102
    invoke-static {}, Ll/utg0;->d()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    const-string p4, "sud_sdk_trace_id"

    .line 110
    .line 111
    sget-object v0, Ll/utg0;->j:Ljava/lang/String;

    .line 112
    .line 113
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    const-string p4, "mg_id"

    .line 117
    .line 118
    iget-wide v0, p0, Ll/wyg0;->g:J

    .line 119
    .line 120
    invoke-virtual {p3, p4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 121
    .line 122
    .line 123
    const-string p4, "mg_id_str"

    .line 124
    .line 125
    iget-wide v0, p0, Ll/wyg0;->g:J

    .line 126
    .line 127
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 132
    .line 133
    .line 134
    const-string p4, "mg_api_cfg"

    .line 135
    .line 136
    new-instance v0, Lorg/json/JSONObject;

    .line 137
    .line 138
    sget-object v1, Ll/utg0;->e:Ll/i0h0;

    .line 139
    .line 140
    if-eqz v1, :cond_0

    .line 141
    .line 142
    iget-object v1, v1, Ll/i0h0;->c:Ll/gvg0;

    .line 143
    .line 144
    if-eqz v1, :cond_0

    .line 145
    .line 146
    iget-object v1, v1, Ll/gvg0;->h:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz v1, :cond_0

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_0
    move-object v1, p1

    .line 152
    :goto_0
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    const-string p4, "dynamic_config"

    .line 159
    .line 160
    new-instance v0, Lorg/json/JSONObject;

    .line 161
    .line 162
    iget-object v1, p0, Ll/wyg0;->h:Ljava/lang/String;

    .line 163
    .line 164
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    .line 169
    .line 170
    const-string p4, "app_auth"

    .line 171
    .line 172
    new-instance v0, Lorg/json/JSONObject;

    .line 173
    .line 174
    iget-object v1, p0, Ll/wyg0;->i:Ljava/lang/String;

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p3, p4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 180
    .line 181
    .line 182
    sget-object p4, Ll/utg0;->e:Ll/i0h0;

    .line 183
    .line 184
    if-eqz p4, :cond_1

    .line 185
    .line 186
    iget-object p4, p4, Ll/i0h0;->c:Ll/gvg0;

    .line 187
    .line 188
    if-eqz p4, :cond_1

    .line 189
    .line 190
    iget-object p4, p4, Ll/gvg0;->f:Ll/a0h0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_1
    const/4 p4, 0x0

    .line 194
    :goto_1
    const-string v0, "game_login_url"

    .line 195
    .line 196
    const-string v1, "app_server_info_url"

    .line 197
    .line 198
    if-eqz p4, :cond_2

    .line 199
    .line 200
    :try_start_1
    iget-object p1, p4, Ll/a0h0;->b:Ljava/lang/String;

    .line 201
    .line 202
    invoke-virtual {p3, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 203
    .line 204
    .line 205
    iget-object p1, p4, Ll/a0h0;->a:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    .line 209
    .line 210
    goto :goto_2

    .line 211
    :cond_2
    invoke-virtual {p3, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p3, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    :goto_2
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    invoke-virtual {p5, p1}, Ll/gfg0;->success(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 225
    .line 226
    .line 227
    move-result-wide p3

    .line 228
    iput-wide p3, p2, Ll/bsg0;->c:J

    .line 229
    .line 230
    iget-wide v0, p2, Ll/bsg0;->b:J

    .line 231
    .line 232
    sub-long/2addr p3, v0

    .line 233
    iput-wide p3, p2, Ll/bsg0;->d:J

    .line 234
    .line 235
    invoke-virtual {p0, p2}, Ll/wyg0;->b(Ll/bsg0;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :catch_0
    const-string p1, "{\"ret_code\":-1, \"ret_msg\":\"json serialize fail\"}"

    .line 240
    .line 241
    invoke-virtual {p5, p1}, Ll/gfg0;->failure(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 245
    .line 246
    .line 247
    move-result-wide p3

    .line 248
    iput-wide p3, p2, Ll/bsg0;->c:J

    .line 249
    .line 250
    iget-wide v0, p2, Ll/bsg0;->b:J

    .line 251
    .line 252
    sub-long/2addr p3, v0

    .line 253
    iput-wide p3, p2, Ll/bsg0;->d:J

    .line 254
    .line 255
    invoke-virtual {p0, p2}, Ll/wyg0;->b(Ll/bsg0;)V

    .line 256
    .line 257
    .line 258
    return-void
.end method
