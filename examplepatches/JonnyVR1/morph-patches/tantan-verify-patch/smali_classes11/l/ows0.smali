.class public final Ll/ows0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:Ljava/util/List;

.field public final c:Ljava/util/List;

.field public final d:Ljava/util/List;

.field public final e:Ljava/util/List;

.field public final f:Ljava/util/List;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 9
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
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/dct0;->j(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "Mediation Response JSON: "

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    const-string v0, "ad_networks"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 41
    .line 42
    .line 43
    const/4 v2, -0x1

    .line 44
    const/4 v3, 0x0

    .line 45
    move v5, v2

    .line 46
    move v4, v3

    .line 47
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 48
    .line 49
    .line 50
    move-result v6

    .line 51
    if-ge v4, v6, :cond_3

    .line 52
    .line 53
    :try_start_0
    new-instance v6, Ll/nws0;

    .line 54
    .line 55
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    invoke-direct {v6, v7}, Ll/nws0;-><init>(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    iget-object v7, v6, Ll/nws0;->v:Ljava/lang/String;

    .line 63
    .line 64
    const-string v8, "banner"

    .line 65
    .line 66
    invoke-virtual {v8, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    if-gez v5, :cond_2

    .line 73
    .line 74
    iget-object v6, v6, Ll/nws0;->c:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    :cond_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    if-eqz v7, :cond_2

    .line 85
    .line 86
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v7

    .line 90
    check-cast v7, Ljava/lang/String;

    .line 91
    .line 92
    const-string v8, "com.google.ads.mediation.admob.AdMobAdapter"

    .line 93
    .line 94
    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v7

    .line 98
    if-eqz v7, :cond_1

    .line 99
    .line 100
    move v5, v4

    .line 101
    :catch_0
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_3
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 105
    .line 106
    .line 107
    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Ll/ows0;->a:Ljava/util/List;

    .line 112
    .line 113
    const-string v0, "qdata"

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Ll/ows0;->g:Ljava/lang/String;

    .line 120
    .line 121
    const-string v0, "fs_model_type"

    .line 122
    .line 123
    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 124
    .line 125
    .line 126
    const-string v0, "timeout_ms"

    .line 127
    .line 128
    const-wide/16 v1, -0x1

    .line 129
    .line 130
    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 131
    .line 132
    .line 133
    const-string v0, "settings"

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const/4 v0, 0x0

    .line 140
    if-eqz p1, :cond_5

    .line 141
    .line 142
    const-string v4, "ad_network_timeout_millis"

    .line 143
    .line 144
    invoke-virtual {p1, v4, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 145
    .line 146
    .line 147
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 148
    .line 149
    .line 150
    const-string v4, "click_urls"

    .line 151
    .line 152
    invoke-static {p1, v4}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    iput-object v4, p0, Ll/ows0;->b:Ljava/util/List;

    .line 157
    .line 158
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 159
    .line 160
    .line 161
    const-string v4, "imp_urls"

    .line 162
    .line 163
    invoke-static {p1, v4}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    iput-object v4, p0, Ll/ows0;->c:Ljava/util/List;

    .line 168
    .line 169
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 170
    .line 171
    .line 172
    const-string v4, "downloaded_imp_urls"

    .line 173
    .line 174
    invoke-static {p1, v4}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    iput-object v4, p0, Ll/ows0;->d:Ljava/util/List;

    .line 179
    .line 180
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 181
    .line 182
    .line 183
    const-string v4, "nofill_urls"

    .line 184
    .line 185
    invoke-static {p1, v4}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    iput-object v4, p0, Ll/ows0;->e:Ljava/util/List;

    .line 190
    .line 191
    invoke-static {}, Ll/bxy0;->i()Ll/pws0;

    .line 192
    .line 193
    .line 194
    const-string v4, "remote_ping_urls"

    .line 195
    .line 196
    invoke-static {p1, v4}, Ll/pws0;->a(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/util/List;

    .line 197
    .line 198
    .line 199
    move-result-object v4

    .line 200
    iput-object v4, p0, Ll/ows0;->f:Ljava/util/List;

    .line 201
    .line 202
    const-string v4, "render_in_browser"

    .line 203
    .line 204
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 205
    .line 206
    .line 207
    const-string v4, "refresh"

    .line 208
    .line 209
    invoke-virtual {p1, v4, v1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 210
    .line 211
    .line 212
    const-string v1, "rewards"

    .line 213
    .line 214
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    invoke-static {v1}, Lcom/google/android/gms/internal/ads/zzcag;->g(Lorg/json/JSONArray;)Lcom/google/android/gms/internal/ads/zzcag;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    if-nez v1, :cond_4

    .line 223
    .line 224
    iput-object v0, p0, Ll/ows0;->h:Ljava/lang/String;

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_4
    iget-object v0, v1, Lcom/google/android/gms/internal/ads/zzcag;->zza:Ljava/lang/String;

    .line 228
    .line 229
    iput-object v0, p0, Ll/ows0;->h:Ljava/lang/String;

    .line 230
    .line 231
    :goto_1
    const-string p0, "use_displayed_impression"

    .line 232
    .line 233
    invoke-virtual {p1, p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 234
    .line 235
    .line 236
    const-string p0, "allow_pub_rendered_attribution"

    .line 237
    .line 238
    invoke-virtual {p1, p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 239
    .line 240
    .line 241
    const-string p0, "allow_pub_owned_ad_view"

    .line 242
    .line 243
    invoke-virtual {p1, p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 244
    .line 245
    .line 246
    const-string p0, "allow_custom_click_gesture"

    .line 247
    .line 248
    invoke-virtual {p1, p0, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 249
    .line 250
    .line 251
    return-void

    .line 252
    :cond_5
    iput-object v0, p0, Ll/ows0;->b:Ljava/util/List;

    .line 253
    .line 254
    iput-object v0, p0, Ll/ows0;->c:Ljava/util/List;

    .line 255
    .line 256
    iput-object v0, p0, Ll/ows0;->d:Ljava/util/List;

    .line 257
    .line 258
    iput-object v0, p0, Ll/ows0;->e:Ljava/util/List;

    .line 259
    .line 260
    iput-object v0, p0, Ll/ows0;->f:Ljava/util/List;

    .line 261
    .line 262
    iput-object v0, p0, Ll/ows0;->h:Ljava/lang/String;

    .line 263
    .line 264
    return-void
.end method
