.class public final Ll/esg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/nzg0;


# instance fields
.field public final synthetic a:Ll/rog0;


# direct methods
.method public constructor <init>(Ll/rog0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/esg0;->a:Ll/rog0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/esg0;->a:Ll/rog0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rog0;->a:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "onRecognizeSuccess:"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    const-string p0, "AiAgentImpl"

    .line 11
    .line 12
    invoke-static {p0, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final b()V
    .locals 2

    .line 1
    const-string v0, "AiAgentImpl"

    .line 2
    .line 3
    const-string v1, "db asr client onClosed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/esg0;->a:Ll/rog0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/rog0;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/esg0;->a:Ll/rog0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/rog0;->a()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final c(Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "db asr onFailure:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v2, "AiAgentImpl"

    .line 20
    .line 21
    invoke-static {v2, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/esg0;->a:Ll/rog0;

    .line 25
    .line 26
    iget-object v0, v0, Ll/rog0;->a:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {v0, p1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/esg0;->a:Ll/rog0;

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Ll/rog0;->k:Z

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/rog0;->a()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public final d(ZLjava/lang/String;Ljava/lang/String;JJ)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onText: definite:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " text:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, " audioStartTime:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, " audioEndTime:"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p6, p7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "AiAgentImpl"

    .line 40
    .line 41
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Ll/esg0;->a:Ll/rog0;

    .line 45
    .line 46
    iget-object v2, v2, Ll/rog0;->a:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v2, v0}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Ll/esg0;->a:Ll/rog0;

    .line 52
    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    goto/16 :goto_6

    .line 56
    .line 57
    :cond_0
    const/4 p1, 0x0

    .line 58
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 59
    .line 60
    invoke-direct {v0, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v2, "result"

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-nez v0, :cond_1

    .line 70
    .line 71
    :goto_0
    move-object v2, p1

    .line 72
    goto :goto_3

    .line 73
    :cond_1
    new-instance v2, Ll/xsg0;

    .line 74
    .line 75
    invoke-direct {v2}, Ll/xsg0;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v3, "additions"

    .line 79
    .line 80
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    if-eqz v3, :cond_2

    .line 85
    .line 86
    const-string v4, "log_id"

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iput-object v3, v2, Ll/xsg0;->c:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :catch_0
    move-exception p4

    .line 96
    goto :goto_2

    .line 97
    :cond_2
    :goto_1
    const-string v3, "utterances"

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-lez v3, :cond_3

    .line 110
    .line 111
    const/4 v3, 0x0

    .line 112
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v3, "end_time"

    .line 117
    .line 118
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 119
    .line 120
    .line 121
    move-result-wide v3

    .line 122
    iput-wide v3, v2, Ll/xsg0;->b:J

    .line 123
    .line 124
    const-string v3, "start_time"

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    iput-wide v3, v2, Ll/xsg0;->d:J

    .line 131
    .line 132
    iget-wide v5, v2, Ll/xsg0;->b:J

    .line 133
    .line 134
    sub-long/2addr v5, v3

    .line 135
    iput-wide v5, v2, Ll/xsg0;->a:J

    .line 136
    .line 137
    :cond_3
    iput-wide p4, v2, Ll/xsg0;->e:J

    .line 138
    .line 139
    iput-wide p6, v2, Ll/xsg0;->f:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :goto_2
    new-instance p5, Ljava/lang/StringBuilder;

    .line 143
    .line 144
    const-string p6, "parserResponse json:"

    .line 145
    .line 146
    invoke-direct {p5, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string p3, " error:"

    .line 153
    .line 154
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-static {p4}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p3

    .line 161
    invoke-virtual {p5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p3

    .line 168
    invoke-static {v1, p3}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    goto :goto_0

    .line 172
    :goto_3
    iget-boolean p3, p0, Ll/rog0;->n:Z

    .line 173
    .line 174
    if-nez p3, :cond_4

    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_4
    iget-wide p3, p0, Ll/rog0;->b:J

    .line 178
    .line 179
    iget-object p5, p0, Ll/rog0;->c:Ljava/lang/String;

    .line 180
    .line 181
    iget-object p6, p0, Ll/rog0;->d:Ljava/lang/String;

    .line 182
    .line 183
    iget-object p7, p0, Ll/rog0;->e:Ljava/lang/String;

    .line 184
    .line 185
    sget-object v0, Ll/utg0;->a:Ljava/lang/String;

    .line 186
    .line 187
    new-instance v0, Ll/dpg0;

    .line 188
    .line 189
    invoke-direct {v0}, Ll/dpg0;-><init>()V

    .line 190
    .line 191
    .line 192
    iput-wide p3, v0, Ll/dpg0;->a:J

    .line 193
    .line 194
    iput-object p5, v0, Ll/dpg0;->b:Ljava/lang/String;

    .line 195
    .line 196
    iput-object p6, v0, Ll/dpg0;->c:Ljava/lang/String;

    .line 197
    .line 198
    iput-object p7, v0, Ll/dpg0;->d:Ljava/lang/String;

    .line 199
    .line 200
    iput-object p2, v0, Ll/dpg0;->e:Ljava/lang/String;

    .line 201
    .line 202
    iput-object v2, v0, Ll/dpg0;->f:Ll/xsg0;

    .line 203
    .line 204
    sget-object p3, Ll/utg0;->b:Ll/uyg0;

    .line 205
    .line 206
    new-instance p4, Ll/cog0;

    .line 207
    .line 208
    invoke-direct {p4}, Ll/cog0;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p3, v0, p4}, Ll/uyg0;->u(Ll/dpg0;Ll/cog0;)V

    .line 212
    .line 213
    .line 214
    :goto_4
    iget-object p0, p0, Ll/rog0;->o:Ll/hkg0;

    .line 215
    .line 216
    if-eqz p0, :cond_5

    .line 217
    .line 218
    new-instance p3, Lorg/json/JSONObject;

    .line 219
    .line 220
    invoke-direct {p3}, Lorg/json/JSONObject;-><init>()V

    .line 221
    .line 222
    .line 223
    :try_start_1
    const-string p4, "content"

    .line 224
    .line 225
    invoke-virtual {p3, p4, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 226
    .line 227
    .line 228
    goto :goto_5

    .line 229
    :catch_1
    move-exception p2

    .line 230
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 231
    .line 232
    .line 233
    :goto_5
    iget-object p0, p0, Ll/hkg0;->a:Ll/dhg0;

    .line 234
    .line 235
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    const-string p3, "app_common_game_llm_asr_content"

    .line 240
    .line 241
    invoke-virtual {p0, p3, p2, p1}, Ll/dhg0;->notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V

    .line 242
    .line 243
    .line 244
    :cond_5
    :goto_6
    return-void
.end method
