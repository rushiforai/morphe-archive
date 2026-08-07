.class public Ll/c6c;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/httpdns/model/DomainModel;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "data"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "records"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_3

    .line 27
    .line 28
    new-instance v0, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    const/4 v2, 0x0

    .line 34
    :goto_0
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-ge v2, v3, :cond_2

    .line 39
    .line 40
    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-static {v3}, Ll/c6c;->b(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/DomainModel;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    if-eqz v3, :cond_1

    .line 53
    .line 54
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 55
    .line 56
    .line 57
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    return-object v0

    .line 61
    :catch_0
    :cond_3
    return-object v1
.end method

.method public static b(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/DomainModel;
    .locals 13

    .line 1
    const-string v0, "addr"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 5
    .line 6
    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v3, "domain"

    .line 10
    .line 11
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const-string v4, "ttl"

    .line 16
    .line 17
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/16 v5, 0xa

    .line 22
    .line 23
    if-gt v4, v5, :cond_0

    .line 24
    .line 25
    const/16 v4, 0x1e

    .line 26
    .line 27
    :cond_0
    const-string v5, "type"

    .line 28
    .line 29
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    const-string v6, "healthcheck"

    .line 34
    .line 35
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    if-eqz v6, :cond_1

    .line 40
    .line 41
    new-instance v7, Ll/f0l;

    .line 42
    .line 43
    invoke-direct {v7}, Ll/f0l;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v8, "mode"

    .line 47
    .line 48
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    iput-object v8, v7, Ll/f0l;->a:Ljava/lang/String;

    .line 53
    .line 54
    const-string v8, "interval"

    .line 55
    .line 56
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v8

    .line 60
    const/4 v9, 0x1

    .line 61
    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    .line 62
    .line 63
    .line 64
    move-result v8

    .line 65
    iput v8, v7, Ll/f0l;->b:I

    .line 66
    .line 67
    const-string v8, "rise"

    .line 68
    .line 69
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    iput v8, v7, Ll/f0l;->c:I

    .line 74
    .line 75
    const-string v8, "fall"

    .line 76
    .line 77
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v8

    .line 81
    iput v8, v7, Ll/f0l;->d:I

    .line 82
    .line 83
    const-string v8, "timeout"

    .line 84
    .line 85
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result v8

    .line 89
    iput v8, v7, Ll/f0l;->f:I

    .line 90
    .line 91
    const-string v8, "port"

    .line 92
    .line 93
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    iput v6, v7, Ll/f0l;->e:I

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    move-object v7, v1

    .line 101
    :goto_0
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 102
    .line 103
    .line 104
    move-result-object v6

    .line 105
    const/4 v8, 0x0

    .line 106
    if-eqz v6, :cond_2

    .line 107
    .line 108
    new-instance v9, Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .line 112
    .line 113
    move v10, v8

    .line 114
    :goto_1
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    .line 115
    .line 116
    .line 117
    move-result v11

    .line 118
    if-ge v10, v11, :cond_3

    .line 119
    .line 120
    new-instance v11, Lcom/tantanapp/httpdns/model/IpModel;

    .line 121
    .line 122
    invoke-direct {v11}, Lcom/tantanapp/httpdns/model/IpModel;-><init>()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v6, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v12

    .line 129
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v12

    .line 133
    iput-object v12, v11, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 134
    .line 135
    iput v4, v11, Lcom/tantanapp/httpdns/model/IpModel;->ttl:I

    .line 136
    .line 137
    iput-object v3, v11, Lcom/tantanapp/httpdns/model/IpModel;->domain:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v9, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    add-int/lit8 v10, v10, 0x1

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    move-object v9, v1

    .line 146
    :cond_3
    const-string v6, "backup"

    .line 147
    .line 148
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    if-eqz v2, :cond_4

    .line 153
    .line 154
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    if-eqz v0, :cond_4

    .line 159
    .line 160
    new-instance v2, Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 163
    .line 164
    .line 165
    :goto_2
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 166
    .line 167
    .line 168
    move-result v6

    .line 169
    if-ge v8, v6, :cond_5

    .line 170
    .line 171
    new-instance v6, Lcom/tantanapp/httpdns/model/IpModel;

    .line 172
    .line 173
    invoke-direct {v6}, Lcom/tantanapp/httpdns/model/IpModel;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v10

    .line 184
    iput-object v10, v6, Lcom/tantanapp/httpdns/model/IpModel;->ip:Ljava/lang/String;

    .line 185
    .line 186
    iput v4, v6, Lcom/tantanapp/httpdns/model/IpModel;->ttl:I

    .line 187
    .line 188
    iput-object v3, v6, Lcom/tantanapp/httpdns/model/IpModel;->domain:Ljava/lang/String;

    .line 189
    .line 190
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    add-int/lit8 v8, v8, 0x1

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_4
    move-object v2, v1

    .line 197
    :cond_5
    new-instance v0, Lcom/tantanapp/httpdns/model/DomainModel;

    .line 198
    .line 199
    invoke-direct {v0}, Lcom/tantanapp/httpdns/model/DomainModel;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object v3, v0, Lcom/tantanapp/httpdns/model/DomainModel;->domain:Ljava/lang/String;

    .line 203
    .line 204
    iput-object v9, v0, Lcom/tantanapp/httpdns/model/DomainModel;->mainIpModelList:Ljava/util/ArrayList;

    .line 205
    .line 206
    iput v4, v0, Lcom/tantanapp/httpdns/model/DomainModel;->ttl:I

    .line 207
    .line 208
    iput-object v5, v0, Lcom/tantanapp/httpdns/model/DomainModel;->type:Ljava/lang/String;

    .line 209
    .line 210
    iput-object v2, v0, Lcom/tantanapp/httpdns/model/DomainModel;->backupIpModelList:Ljava/util/ArrayList;

    .line 211
    .line 212
    new-instance v3, Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 215
    .line 216
    .line 217
    if-eqz v9, :cond_6

    .line 218
    .line 219
    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 220
    .line 221
    .line 222
    :cond_6
    if-eqz v2, :cond_7

    .line 223
    .line 224
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 225
    .line 226
    .line 227
    :cond_7
    iput-object v3, v0, Lcom/tantanapp/httpdns/model/DomainModel;->totalIpModelList:Ljava/util/ArrayList;

    .line 228
    .line 229
    iput-object p0, v0, Lcom/tantanapp/httpdns/model/DomainModel;->json:Ljava/lang/String;

    .line 230
    .line 231
    iput-object v7, v0, Lcom/tantanapp/httpdns/model/DomainModel;->healthCheckModel:Ll/f0l;

    .line 232
    .line 233
    new-instance p0, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v2, "parseDomain:"

    .line 239
    .line 240
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/tantanapp/httpdns/model/DomainModel;->toString()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p0

    .line 254
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 255
    .line 256
    .line 257
    return-object v0

    .line 258
    :catch_0
    return-object v1
.end method

.method public static c(Ljava/lang/String;)Lcom/tantanapp/httpdns/model/MetaModel;
    .locals 4

    .line 1
    const-string v0, "parseMeta:"

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    return-object v2

    .line 11
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "meta"

    .line 17
    .line 18
    invoke-virtual {v1, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-nez p0, :cond_1

    .line 23
    .line 24
    return-object v2

    .line 25
    :cond_1
    new-instance v1, Lcom/tantanapp/httpdns/model/MetaModel;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/tantanapp/httpdns/model/MetaModel;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v3, "msg"

    .line 31
    .line 32
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iput-object v3, v1, Lcom/tantanapp/httpdns/model/MetaModel;->msg:Ljava/lang/String;

    .line 37
    .line 38
    const-string v3, "retcode"

    .line 39
    .line 40
    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    iput p0, v1, Lcom/tantanapp/httpdns/model/MetaModel;->retcode:I

    .line 45
    .line 46
    new-instance p0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/tantanapp/httpdns/model/MetaModel;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {p0}, Ll/r6e;->a(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :catch_0
    return-object v2
.end method
