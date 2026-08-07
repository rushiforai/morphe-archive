.class Ll/xk80$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w84;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xk80;->g(ILjava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:I

.field final synthetic d:Ljava/lang/String;

.field final synthetic e:Ljava/lang/String;

.field final synthetic f:Ljava/lang/String;

.field final synthetic g:Ljava/util/Map;

.field final synthetic h:Ll/wk80;


# direct methods
.method public constructor <init>(JLjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-wide p1, p0, Ll/xk80$a;->a:J

    .line 2
    .line 3
    iput-object p3, p0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput p4, p0, Ll/xk80$a;->c:I

    .line 6
    .line 7
    iput-object p5, p0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p6, p0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 10
    .line 11
    iput-object p7, p0, Ll/xk80$a;->f:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p8, p0, Ll/xk80$a;->g:Ljava/util/Map;

    .line 14
    .line 15
    iput-object p9, p0, Ll/xk80$a;->h:Ll/wk80;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public onFailure(Ll/ry3;Ljava/io/IOException;)V
    .locals 13

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Ll/xk80$a;->a:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    long-to-double v0, v0

    .line 14
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    div-double/2addr v0, v2

    .line 20
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v0, "s"

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v12

    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v0, "Request failed: "

    .line 35
    .line 36
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v0, " errorMsg"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, "  (index + 1)="

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v0, p0, Ll/xk80$a;->c:I

    .line 62
    .line 63
    add-int/lit8 v0, v0, 0x1

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p1}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 80
    .line 81
    iget-object v4, p0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v6, p0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v8, p0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    const-string v11, "timeCost"

    .line 92
    .line 93
    const-string v1, "onFailure"

    .line 94
    .line 95
    const-string v2, "onResponseFailure"

    .line 96
    .line 97
    const-string v3, "action"

    .line 98
    .line 99
    const-string v5, "url"

    .line 100
    .line 101
    const-string v7, "host"

    .line 102
    .line 103
    const-string v9, "errorMsg"

    .line 104
    .line 105
    filled-new-array/range {v1 .. v12}, [Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    const-string v1, "ACTION_API_RESPONSE"

    .line 110
    .line 111
    invoke-virtual {p1, v0, v1, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget p1, p0, Ll/xk80$a;->c:I

    .line 115
    .line 116
    add-int/lit8 p1, p1, 0x1

    .line 117
    .line 118
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2}, Ll/afm;->B()Ll/g5g;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    if-eqz p2, :cond_0

    .line 127
    .line 128
    invoke-virtual {p2}, Ll/g5g;->c()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    if-eqz v0, :cond_0

    .line 133
    .line 134
    invoke-virtual {p2}, Ll/g5g;->d()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    if-eqz v0, :cond_0

    .line 139
    .line 140
    invoke-virtual {p2}, Ll/g5g;->b()V

    .line 141
    .line 142
    .line 143
    const/4 p1, 0x0

    .line 144
    :cond_0
    iget-object p2, p0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v0, p0, Ll/xk80$a;->f:Ljava/lang/String;

    .line 147
    .line 148
    iget-object v1, p0, Ll/xk80$a;->g:Ljava/util/Map;

    .line 149
    .line 150
    iget-object p0, p0, Ll/xk80$a;->h:Ll/wk80;

    .line 151
    .line 152
    invoke-static {p1, p2, v0, v1, p0}, Ll/xk80;->a(ILjava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public onResponse(Ll/ry3;Ll/i5d0;)V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    iget-wide v4, v0, Ll/xk80$a;->a:J

    .line 13
    .line 14
    sub-long/2addr v2, v4

    .line 15
    long-to-double v2, v2

    .line 16
    const-wide v4, 0x408f400000000000L    # 1000.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-double/2addr v2, v4

    .line 22
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "s"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v14

    .line 34
    iget-object v1, v0, Ll/xk80$a;->h:Ll/wk80;

    .line 35
    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    const-string v0, "http error: build callbackError "

    .line 39
    .line 40
    invoke-static {v0}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const-string v2, "ACTION_API_RESPONSE"

    .line 45
    .line 46
    if-nez p2, :cond_2

    .line 47
    .line 48
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 49
    .line 50
    .line 51
    move-result-object v15

    .line 52
    sget-object v3, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 53
    .line 54
    iget-object v6, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v8, v0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v10, v0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 59
    .line 60
    const-string v12, "http error: response is null "

    .line 61
    .line 62
    const-string v13, "timeCost"

    .line 63
    .line 64
    move-object v4, v3

    .line 65
    const-string v3, "onFailure"

    .line 66
    .line 67
    move-object v5, v4

    .line 68
    const-string v4, "onResponseNull"

    .line 69
    .line 70
    move-object v7, v5

    .line 71
    const-string v5, "action"

    .line 72
    .line 73
    move-object v9, v7

    .line 74
    const-string v7, "url"

    .line 75
    .line 76
    move-object v11, v9

    .line 77
    const-string v9, "host"

    .line 78
    .line 79
    move-object/from16 v16, v11

    .line 80
    .line 81
    const-string v11, "errorMsg"

    .line 82
    .line 83
    move-object/from16 v1, v16

    .line 84
    .line 85
    filled-new-array/range {v3 .. v14}, [Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-virtual {v15, v1, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget v1, v0, Ll/xk80$a;->c:I

    .line 93
    .line 94
    add-int/lit8 v1, v1, 0x1

    .line 95
    .line 96
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-virtual {v2}, Ll/afm;->B()Ll/g5g;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    if-eqz v2, :cond_1

    .line 105
    .line 106
    invoke-virtual {v2}, Ll/g5g;->c()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    if-eqz v3, :cond_1

    .line 111
    .line 112
    invoke-virtual {v2}, Ll/g5g;->d()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    if-eqz v3, :cond_1

    .line 117
    .line 118
    invoke-virtual {v2}, Ll/g5g;->b()V

    .line 119
    .line 120
    .line 121
    const/4 v1, 0x0

    .line 122
    :cond_1
    iget-object v2, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 123
    .line 124
    iget-object v3, v0, Ll/xk80$a;->f:Ljava/lang/String;

    .line 125
    .line 126
    iget-object v4, v0, Ll/xk80$a;->g:Ljava/util/Map;

    .line 127
    .line 128
    iget-object v0, v0, Ll/xk80$a;->h:Ll/wk80;

    .line 129
    .line 130
    invoke-static {v1, v2, v3, v4, v0}, Ll/xk80;->a(ILjava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_2
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->I()Z

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    const-string v3, ""

    .line 139
    .line 140
    if-eqz v1, :cond_8

    .line 141
    .line 142
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->k()Ll/k5d0;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    if-eqz v1, :cond_3

    .line 147
    .line 148
    invoke-virtual {v1}, Ll/k5d0;->string()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    goto :goto_0

    .line 153
    :cond_3
    move-object v1, v3

    .line 154
    :goto_0
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->F()Ll/e0l;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    if-eqz v4, :cond_4

    .line 159
    .line 160
    invoke-virtual {v4}, Ll/e0l;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v5, "http response body: "

    .line 167
    .line 168
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v5, " Header: "

    .line 175
    .line 176
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    invoke-static {v3}, Ll/o6r0;->a(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    const-string v3, "InvalidTimeStamp.Expired"

    .line 190
    .line 191
    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    if-eqz v4, :cond_5

    .line 196
    .line 197
    const/16 v4, 0x3f1

    .line 198
    .line 199
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    :cond_5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    invoke-virtual {v3}, Ll/afm;->B()Ll/g5g;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    if-eqz v3, :cond_6

    .line 216
    .line 217
    iget-object v4, v0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v5, v0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 220
    .line 221
    invoke-virtual {v3, v4, v5}, Ll/g5g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :cond_6
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 225
    .line 226
    .line 227
    move-result-object v13

    .line 228
    sget-object v15, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 229
    .line 230
    iget-object v6, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 231
    .line 232
    iget-object v8, v0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v10, v0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 235
    .line 236
    const-string v11, "timeCost"

    .line 237
    .line 238
    const-string v3, "onSuccess"

    .line 239
    .line 240
    const-string v4, "onResponseSuc:"

    .line 241
    .line 242
    const-string v5, "action"

    .line 243
    .line 244
    const-string v7, "url"

    .line 245
    .line 246
    const-string v9, "host"

    .line 247
    .line 248
    move-object v12, v14

    .line 249
    filled-new-array/range {v3 .. v12}, [Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v3

    .line 253
    invoke-virtual {v13, v15, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object v0, v0, Ll/xk80$a;->h:Ll/wk80;

    .line 257
    .line 258
    if-eqz v0, :cond_7

    .line 259
    .line 260
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->q()I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    invoke-interface {v0, v2, v1}, Ll/wk80;->onSuccess(ILjava/lang/String;)V

    .line 265
    .line 266
    .line 267
    :cond_7
    return-void

    .line 268
    :cond_8
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    sget-object v4, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 273
    .line 274
    iget-object v6, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 275
    .line 276
    iget-object v8, v0, Ll/xk80$a;->b:Ljava/lang/String;

    .line 277
    .line 278
    iget-object v10, v0, Ll/xk80$a;->e:Ljava/lang/String;

    .line 279
    .line 280
    new-instance v5, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .line 284
    .line 285
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->I()Z

    .line 286
    .line 287
    .line 288
    move-result v7

    .line 289
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v12

    .line 299
    move-object/from16 v16, v14

    .line 300
    .line 301
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v14

    .line 305
    const-string v15, "timeCost"

    .line 306
    .line 307
    const-string v3, "onFailure"

    .line 308
    .line 309
    move-object v5, v4

    .line 310
    const-string v4, "onResponseNotSuc"

    .line 311
    .line 312
    move-object v7, v5

    .line 313
    const-string v5, "action"

    .line 314
    .line 315
    move-object v9, v7

    .line 316
    const-string v7, "url"

    .line 317
    .line 318
    move-object v11, v9

    .line 319
    const-string v9, "host"

    .line 320
    .line 321
    move-object v13, v11

    .line 322
    const-string v11, "isSuccessful"

    .line 323
    .line 324
    move-object/from16 v17, v13

    .line 325
    .line 326
    const-string v13, "errorMsg"

    .line 327
    .line 328
    move-object/from16 v0, v17

    .line 329
    .line 330
    filled-new-array/range {v3 .. v16}, [Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    invoke-virtual {v1, v0, v2, v3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    move-object/from16 v0, p0

    .line 338
    .line 339
    iget v1, v0, Ll/xk80$a;->c:I

    .line 340
    .line 341
    add-int/lit8 v1, v1, 0x1

    .line 342
    .line 343
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    invoke-virtual {v2}, Ll/afm;->B()Ll/g5g;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    if-eqz v2, :cond_9

    .line 352
    .line 353
    invoke-virtual {v2}, Ll/g5g;->c()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v3

    .line 357
    if-eqz v3, :cond_9

    .line 358
    .line 359
    invoke-virtual {v2}, Ll/g5g;->d()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    if-eqz v3, :cond_9

    .line 364
    .line 365
    invoke-virtual {v2}, Ll/g5g;->b()V

    .line 366
    .line 367
    .line 368
    const/4 v1, 0x0

    .line 369
    :cond_9
    new-instance v2, Ljava/lang/StringBuilder;

    .line 370
    .line 371
    const-string v3, "Response not successful: fallback  action"

    .line 372
    .line 373
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    iget-object v3, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    invoke-virtual/range {p2 .. p2}, Ll/i5d0;->q()I

    .line 382
    .line 383
    .line 384
    move-result v3

    .line 385
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    invoke-static {v2}, Ll/o6r0;->c(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    iget-object v2, v0, Ll/xk80$a;->d:Ljava/lang/String;

    .line 396
    .line 397
    iget-object v3, v0, Ll/xk80$a;->f:Ljava/lang/String;

    .line 398
    .line 399
    iget-object v4, v0, Ll/xk80$a;->g:Ljava/util/Map;

    .line 400
    .line 401
    iget-object v0, v0, Ll/xk80$a;->h:Ll/wk80;

    .line 402
    .line 403
    invoke-static {v1, v2, v3, v4, v0}, Ll/xk80;->a(ILjava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/wk80;)V

    .line 404
    .line 405
    .line 406
    return-void
.end method
