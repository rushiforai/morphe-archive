.class public final Ll/nws0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/util/List;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/util/List;

.field public final g:Ljava/util/List;

.field public final h:Ljava/util/List;

.field public final i:Ljava/util/List;

.field public final j:Ljava/util/List;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/util/List;

.field public final m:Ljava/util/List;

.field public final n:Ljava/util/List;

.field public final o:Ljava/lang/String;

.field public final p:Ljava/lang/String;

.field public final q:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final r:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final s:Ljava/lang/String;

.field public final t:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final u:Ljava/lang/String;

.field public final v:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "id"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/nws0;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "adapters"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ge v2, v3, :cond_0

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/nws0;->c:Ljava/util/List;

    .line 49
    .line 50
    const-string v0, "allocation_id"

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ll/nws0;->d:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 60
    .line 61
    .line 62
    const-string v0, "clickurl"

    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Ll/nws0;->f:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 71
    .line 72
    .line 73
    const-string v0, "imp_urls"

    .line 74
    .line 75
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/nws0;->g:Ljava/util/List;

    .line 80
    .line 81
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 82
    .line 83
    .line 84
    const-string v0, "downloaded_imp_urls"

    .line 85
    .line 86
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/nws0;->h:Ljava/util/List;

    .line 91
    .line 92
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 93
    .line 94
    .line 95
    const-string v0, "fill_urls"

    .line 96
    .line 97
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Ll/nws0;->j:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 104
    .line 105
    .line 106
    const-string v0, "video_start_urls"

    .line 107
    .line 108
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iput-object v0, p0, Ll/nws0;->l:Ljava/util/List;

    .line 113
    .line 114
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 115
    .line 116
    .line 117
    const-string v0, "video_complete_urls"

    .line 118
    .line 119
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Ll/nws0;->n:Ljava/util/List;

    .line 124
    .line 125
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 126
    .line 127
    .line 128
    const-string v0, "video_reward_urls"

    .line 129
    .line 130
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iput-object v0, p0, Ll/nws0;->m:Ljava/util/List;

    .line 135
    .line 136
    const-string v0, "transaction_id"

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Ll/nws0;->o:Ljava/lang/String;

    .line 143
    .line 144
    const-string v0, "valid_from_timestamp"

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Ll/nws0;->p:Ljava/lang/String;

    .line 151
    .line 152
    const-string v0, "ad"

    .line 153
    .line 154
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    if-eqz v0, :cond_1

    .line 159
    .line 160
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 161
    .line 162
    .line 163
    const-string v2, "manual_impression_urls"

    .line 164
    .line 165
    invoke-static {v0, v2}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    goto :goto_1

    .line 170
    :cond_1
    move-object v2, v1

    .line 171
    :goto_1
    iput-object v2, p0, Ll/nws0;->i:Ljava/util/List;

    .line 172
    .line 173
    if-eqz v0, :cond_2

    .line 174
    .line 175
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    goto :goto_2

    .line 180
    :cond_2
    move-object v0, v1

    .line 181
    :goto_2
    iput-object v0, p0, Ll/nws0;->a:Ljava/lang/String;

    .line 182
    .line 183
    const-string v0, "data"

    .line 184
    .line 185
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    if-eqz v0, :cond_3

    .line 190
    .line 191
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    goto :goto_3

    .line 196
    :cond_3
    move-object v2, v1

    .line 197
    :goto_3
    iput-object v2, p0, Ll/nws0;->k:Ljava/lang/String;

    .line 198
    .line 199
    if-eqz v0, :cond_4

    .line 200
    .line 201
    const-string v2, "class_name"

    .line 202
    .line 203
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    goto :goto_4

    .line 208
    :cond_4
    move-object v0, v1

    .line 209
    :goto_4
    iput-object v0, p0, Ll/nws0;->e:Ljava/lang/String;

    .line 210
    .line 211
    const-string v0, "html_template"

    .line 212
    .line 213
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iput-object v0, p0, Ll/nws0;->q:Ljava/lang/String;

    .line 218
    .line 219
    const-string v0, "ad_base_url"

    .line 220
    .line 221
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iput-object v0, p0, Ll/nws0;->r:Ljava/lang/String;

    .line 226
    .line 227
    const-string v0, "assets"

    .line 228
    .line 229
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    if-eqz v0, :cond_5

    .line 234
    .line 235
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    goto :goto_5

    .line 240
    :cond_5
    move-object v0, v1

    .line 241
    :goto_5
    iput-object v0, p0, Ll/nws0;->s:Ljava/lang/String;

    .line 242
    .line 243
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 244
    .line 245
    .line 246
    const-string v0, "template_ids"

    .line 247
    .line 248
    invoke-static {p1, v0}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    iput-object v0, p0, Ll/nws0;->t:Ljava/util/List;

    .line 253
    .line 254
    const-string v0, "ad_loader_options"

    .line 255
    .line 256
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    if-eqz v0, :cond_6

    .line 261
    .line 262
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    goto :goto_6

    .line 267
    :cond_6
    move-object v0, v1

    .line 268
    :goto_6
    iput-object v0, p0, Ll/nws0;->u:Ljava/lang/String;

    .line 269
    .line 270
    const-string v0, "response_type"

    .line 271
    .line 272
    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    iput-object v0, p0, Ll/nws0;->v:Ljava/lang/String;

    .line 277
    .line 278
    const-string p0, "ad_network_timeout_millis"

    .line 279
    .line 280
    const-wide/16 v0, -0x1

    .line 281
    .line 282
    invoke-virtual {p1, p0, v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 283
    .line 284
    .line 285
    return-void
.end method
