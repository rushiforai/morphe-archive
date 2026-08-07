.class Lcom/tencent/liteav/network/TXCStreamUploader$2;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/network/TXCStreamUploader;->startPushTask(Ljava/lang/String;ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Lcom/tencent/liteav/network/TXCStreamUploader;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/network/TXCStreamUploader;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 2
    .line 3
    iput-boolean p3, p0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->a:Z

    .line 4
    .line 5
    iput-object p4, p0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 24

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    :catch_0
    :goto_0
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v1, v1, v3

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    const-wide/16 v3, 0x64

    .line 17
    .line 18
    :try_start_0
    invoke-static {v3, v4, v2}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$500(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/j;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lcom/tencent/liteav/network/j;->b()V

    .line 29
    .line 30
    .line 31
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$500(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/j;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 38
    .line 39
    invoke-static {v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    iget-boolean v5, v5, Lcom/tencent/liteav/network/h;->j:Z

    .line 44
    .line 45
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/network/j;->a(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 49
    .line 50
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$500(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/j;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 55
    .line 56
    invoke-static {v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$700(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {v1, v5}, Lcom/tencent/liteav/network/j;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$500(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/j;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-boolean v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->a:Z

    .line 70
    .line 71
    iget-object v6, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 72
    .line 73
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->b:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v6, v7}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$800(Lcom/tencent/liteav/network/TXCStreamUploader;Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-virtual {v1, v5, v6}, Lcom/tencent/liteav/network/j;->a(ZLjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 83
    .line 84
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$900(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    monitor-enter v1

    .line 89
    :try_start_1
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 90
    .line 91
    iget-boolean v6, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->a:Z

    .line 92
    .line 93
    invoke-static {v5, v6}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1002(Lcom/tencent/liteav/network/TXCStreamUploader;Z)Z

    .line 94
    .line 95
    .line 96
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 97
    .line 98
    invoke-static {v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    iget-boolean v5, v5, Lcom/tencent/liteav/network/h;->j:Z

    .line 103
    .line 104
    if-eqz v5, :cond_2

    .line 105
    .line 106
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 107
    .line 108
    invoke-static {v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1000(Lcom/tencent/liteav/network/TXCStreamUploader;)Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-eqz v5, :cond_1

    .line 113
    .line 114
    const/4 v5, 0x3

    .line 115
    goto :goto_1

    .line 116
    :cond_1
    const/4 v5, 0x2

    .line 117
    goto :goto_1

    .line 118
    :catchall_0
    move-exception v0

    .line 119
    goto/16 :goto_6

    .line 120
    .line 121
    :cond_2
    const/4 v5, 0x1

    .line 122
    :goto_1
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 123
    .line 124
    invoke-static {v7}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1100(Lcom/tencent/liteav/network/TXCStreamUploader;)Z

    .line 125
    .line 126
    .line 127
    move-result v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    iget-object v8, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 129
    .line 130
    if-nez v7, :cond_4

    .line 131
    .line 132
    :try_start_2
    invoke-static {v8}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1200(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/util/ArrayList;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    if-eqz v7, :cond_3

    .line 137
    .line 138
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 139
    .line 140
    invoke-static {v7}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1200(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/util/ArrayList;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    .line 145
    .line 146
    .line 147
    move-result v7

    .line 148
    if-nez v7, :cond_5

    .line 149
    .line 150
    :cond_3
    const/4 v5, 0x1

    .line 151
    goto :goto_2

    .line 152
    :cond_4
    invoke-static {v8}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1300(Lcom/tencent/liteav/network/TXCStreamUploader;)Z

    .line 153
    .line 154
    .line 155
    move-result v7

    .line 156
    if-eqz v7, :cond_5

    .line 157
    .line 158
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 159
    .line 160
    invoke-static {v7}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 161
    .line 162
    .line 163
    move-result-object v7

    .line 164
    iput-boolean v2, v7, Lcom/tencent/liteav/network/h;->k:Z

    .line 165
    .line 166
    :cond_5
    :goto_2
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 167
    .line 168
    int-to-long v8, v5

    .line 169
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    const/16 v9, 0x1b6c

    .line 174
    .line 175
    invoke-virtual {v7, v9, v8}, Lcom/tencent/liteav/basic/module/a;->setStatusValue(ILjava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    iget-object v7, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 179
    .line 180
    invoke-static {v7}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$700(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v8

    .line 184
    iget-object v9, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->b:Ljava/lang/String;

    .line 185
    .line 186
    iget-boolean v10, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->a:Z

    .line 187
    .line 188
    iget-object v11, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 189
    .line 190
    invoke-static {v11}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 191
    .line 192
    .line 193
    move-result-object v11

    .line 194
    iget v11, v11, Lcom/tencent/liteav/network/h;->d:I

    .line 195
    .line 196
    iget-object v12, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 197
    .line 198
    invoke-static {v12}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 199
    .line 200
    .line 201
    move-result-object v12

    .line 202
    iget v12, v12, Lcom/tencent/liteav/network/h;->c:I

    .line 203
    .line 204
    iget-object v13, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 205
    .line 206
    invoke-static {v13}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 207
    .line 208
    .line 209
    move-result-object v13

    .line 210
    iget v13, v13, Lcom/tencent/liteav/network/h;->a:I

    .line 211
    .line 212
    iget-object v14, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 213
    .line 214
    invoke-static {v14}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 215
    .line 216
    .line 217
    move-result-object v14

    .line 218
    iget v14, v14, Lcom/tencent/liteav/network/h;->b:I

    .line 219
    .line 220
    iget-object v15, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 221
    .line 222
    invoke-static {v15}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 223
    .line 224
    .line 225
    move-result-object v15

    .line 226
    iget v15, v15, Lcom/tencent/liteav/network/h;->g:I

    .line 227
    .line 228
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 229
    .line 230
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget-boolean v2, v2, Lcom/tencent/liteav/network/h;->k:Z

    .line 235
    .line 236
    iget-object v6, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 237
    .line 238
    invoke-static {v6}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 239
    .line 240
    .line 241
    move-result-object v6

    .line 242
    iget v6, v6, Lcom/tencent/liteav/network/h;->l:I

    .line 243
    .line 244
    move-wide/from16 v22, v3

    .line 245
    .line 246
    iget-object v3, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 247
    .line 248
    iget-object v3, v3, Lcom/tencent/liteav/network/TXCStreamUploader;->mMetaData:Ljava/util/HashMap;

    .line 249
    .line 250
    const/16 v16, 0x10

    .line 251
    .line 252
    move/from16 v18, v2

    .line 253
    .line 254
    move-object/from16 v20, v3

    .line 255
    .line 256
    move/from16 v17, v5

    .line 257
    .line 258
    move/from16 v19, v6

    .line 259
    .line 260
    invoke-static/range {v7 .. v20}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1400(Lcom/tencent/liteav/network/TXCStreamUploader;Ljava/lang/String;Ljava/lang/String;ZIIIIIIIZILjava/util/HashMap;)J

    .line 261
    .line 262
    .line 263
    move-result-wide v2

    .line 264
    invoke-static {v7, v2, v3}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$402(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 265
    .line 266
    .line 267
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 268
    .line 269
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 270
    .line 271
    .line 272
    move-result-wide v2

    .line 273
    cmp-long v2, v2, v22

    .line 274
    .line 275
    if-eqz v2, :cond_9

    .line 276
    .line 277
    iget-object v3, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 278
    .line 279
    invoke-static {v3}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 280
    .line 281
    .line 282
    move-result-wide v4

    .line 283
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 284
    .line 285
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    iget-boolean v6, v2, Lcom/tencent/liteav/network/h;->i:Z

    .line 290
    .line 291
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 292
    .line 293
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    iget v7, v2, Lcom/tencent/liteav/network/h;->g:I

    .line 298
    .line 299
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 300
    .line 301
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$600(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/h;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    iget v8, v2, Lcom/tencent/liteav/network/h;->h:I

    .line 306
    .line 307
    invoke-static/range {v3 .. v8}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1500(Lcom/tencent/liteav/network/TXCStreamUploader;JZII)V

    .line 308
    .line 309
    .line 310
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 311
    .line 312
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1600(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/util/Vector;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    .line 317
    .line 318
    .line 319
    move-result-object v2

    .line 320
    const/16 v21, 0x0

    .line 321
    .line 322
    :cond_6
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-eqz v3, :cond_8

    .line 327
    .line 328
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v3

    .line 332
    check-cast v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;

    .line 333
    .line 334
    if-nez v21, :cond_7

    .line 335
    .line 336
    iget v4, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 337
    .line 338
    if-nez v4, :cond_7

    .line 339
    .line 340
    const/16 v21, 0x1

    .line 341
    .line 342
    :cond_7
    if-eqz v21, :cond_6

    .line 343
    .line 344
    iget-object v4, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 345
    .line 346
    invoke-static {v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 347
    .line 348
    .line 349
    move-result-wide v5

    .line 350
    iget-object v7, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 351
    .line 352
    iget v8, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalType:I

    .line 353
    .line 354
    iget-wide v9, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->frameIndex:J

    .line 355
    .line 356
    iget-wide v11, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->pts:J

    .line 357
    .line 358
    iget-wide v13, v3, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->dts:J

    .line 359
    .line 360
    invoke-static/range {v4 .. v14}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1700(Lcom/tencent/liteav/network/TXCStreamUploader;J[BIJJJ)V

    .line 361
    .line 362
    .line 363
    goto :goto_3

    .line 364
    :cond_8
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 365
    .line 366
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1600(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/util/Vector;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    invoke-virtual {v2}, Ljava/util/Vector;->removeAllElements()V

    .line 371
    .line 372
    .line 373
    :cond_9
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 374
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 375
    .line 376
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1100(Lcom/tencent/liteav/network/TXCStreamUploader;)Z

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    if-eqz v1, :cond_a

    .line 381
    .line 382
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 383
    .line 384
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1800(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    monitor-enter v1

    .line 389
    :try_start_3
    iget-object v3, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 390
    .line 391
    invoke-static {v3}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 392
    .line 393
    .line 394
    move-result-object v2

    .line 395
    iget-wide v4, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->a:J

    .line 396
    .line 397
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 398
    .line 399
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 400
    .line 401
    .line 402
    move-result-object v2

    .line 403
    iget-wide v6, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->b:J

    .line 404
    .line 405
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 406
    .line 407
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 408
    .line 409
    .line 410
    move-result-object v2

    .line 411
    iget-object v8, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->c:Ljava/lang/String;

    .line 412
    .line 413
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 414
    .line 415
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 416
    .line 417
    .line 418
    move-result-object v2

    .line 419
    iget-wide v9, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->d:J

    .line 420
    .line 421
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 422
    .line 423
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 424
    .line 425
    .line 426
    move-result-object v2

    .line 427
    iget-object v11, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->e:Ljava/lang/String;

    .line 428
    .line 429
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 430
    .line 431
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    iget-wide v12, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->f:J

    .line 436
    .line 437
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 438
    .line 439
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 440
    .line 441
    .line 442
    move-result-object v2

    .line 443
    iget-wide v14, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->g:J

    .line 444
    .line 445
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 446
    .line 447
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 448
    .line 449
    .line 450
    move-result-object v2

    .line 451
    iget-object v2, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->h:Ljava/lang/String;

    .line 452
    .line 453
    move-object/from16 v16, v2

    .line 454
    .line 455
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 456
    .line 457
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 458
    .line 459
    .line 460
    move-result-object v2

    .line 461
    iget-boolean v2, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->i:Z

    .line 462
    .line 463
    move/from16 v17, v2

    .line 464
    .line 465
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 466
    .line 467
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2000(Lcom/tencent/liteav/network/TXCStreamUploader;)Lcom/tencent/liteav/network/TXCStreamUploader$a;

    .line 468
    .line 469
    .line 470
    move-result-object v2

    .line 471
    iget-object v2, v2, Lcom/tencent/liteav/network/TXCStreamUploader$a;->j:Ljava/lang/String;

    .line 472
    .line 473
    move-object/from16 v18, v2

    .line 474
    .line 475
    invoke-static/range {v3 .. v18}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2100(Lcom/tencent/liteav/network/TXCStreamUploader;JJLjava/lang/String;JLjava/lang/String;JJLjava/lang/String;ZLjava/lang/String;)J

    .line 476
    .line 477
    .line 478
    move-result-wide v4

    .line 479
    invoke-static {v3, v4, v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1902(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 480
    .line 481
    .line 482
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 483
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 484
    .line 485
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2200(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 486
    .line 487
    .line 488
    move-result-object v2

    .line 489
    monitor-enter v2

    .line 490
    :try_start_4
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 491
    .line 492
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1900(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 493
    .line 494
    .line 495
    move-result-wide v3

    .line 496
    iget-object v5, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 497
    .line 498
    invoke-static {v5}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 499
    .line 500
    .line 501
    move-result-wide v5

    .line 502
    invoke-static {v1, v3, v4, v5, v6}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2400(Lcom/tencent/liteav/network/TXCStreamUploader;JJ)J

    .line 503
    .line 504
    .line 505
    move-result-wide v3

    .line 506
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2302(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 507
    .line 508
    .line 509
    monitor-exit v2

    .line 510
    goto :goto_4

    .line 511
    :catchall_1
    move-exception v0

    .line 512
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 513
    throw v0

    .line 514
    :catchall_2
    move-exception v0

    .line 515
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 516
    throw v0

    .line 517
    :cond_a
    :goto_4
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 518
    .line 519
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 520
    .line 521
    .line 522
    move-result-wide v2

    .line 523
    invoke-static {v1, v2, v3}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2500(Lcom/tencent/liteav/network/TXCStreamUploader;J)V

    .line 524
    .line 525
    .line 526
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 527
    .line 528
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1100(Lcom/tencent/liteav/network/TXCStreamUploader;)Z

    .line 529
    .line 530
    .line 531
    move-result v1

    .line 532
    if-eqz v1, :cond_b

    .line 533
    .line 534
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 535
    .line 536
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2200(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v1

    .line 540
    monitor-enter v1

    .line 541
    :try_start_6
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 542
    .line 543
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2300(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 544
    .line 545
    .line 546
    move-result-wide v3

    .line 547
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2600(Lcom/tencent/liteav/network/TXCStreamUploader;J)V

    .line 548
    .line 549
    .line 550
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 551
    .line 552
    invoke-static {v2}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2300(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 553
    .line 554
    .line 555
    move-result-wide v3

    .line 556
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2700(Lcom/tencent/liteav/network/TXCStreamUploader;J)V

    .line 557
    .line 558
    .line 559
    iget-object v2, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 560
    .line 561
    move-wide/from16 v3, v22

    .line 562
    .line 563
    invoke-static {v2, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2302(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 564
    .line 565
    .line 566
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 567
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 568
    .line 569
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1800(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 570
    .line 571
    .line 572
    move-result-object v2

    .line 573
    monitor-enter v2

    .line 574
    :try_start_7
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 575
    .line 576
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1900(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 577
    .line 578
    .line 579
    move-result-wide v3

    .line 580
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2800(Lcom/tencent/liteav/network/TXCStreamUploader;J)V

    .line 581
    .line 582
    .line 583
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 584
    .line 585
    const-wide/16 v3, 0x0

    .line 586
    .line 587
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$1902(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 588
    .line 589
    .line 590
    monitor-exit v2

    .line 591
    goto :goto_5

    .line 592
    :catchall_3
    move-exception v0

    .line 593
    monitor-exit v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 594
    throw v0

    .line 595
    :catchall_4
    move-exception v0

    .line 596
    :try_start_8
    monitor-exit v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 597
    throw v0

    .line 598
    :cond_b
    :goto_5
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 599
    .line 600
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$900(Lcom/tencent/liteav/network/TXCStreamUploader;)Ljava/lang/Object;

    .line 601
    .line 602
    .line 603
    move-result-object v2

    .line 604
    monitor-enter v2

    .line 605
    :try_start_9
    iget-object v1, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 606
    .line 607
    invoke-static {v1}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$400(Lcom/tencent/liteav/network/TXCStreamUploader;)J

    .line 608
    .line 609
    .line 610
    move-result-wide v3

    .line 611
    invoke-static {v1, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$2900(Lcom/tencent/liteav/network/TXCStreamUploader;J)V

    .line 612
    .line 613
    .line 614
    iget-object v0, v0, Lcom/tencent/liteav/network/TXCStreamUploader$2;->c:Lcom/tencent/liteav/network/TXCStreamUploader;

    .line 615
    .line 616
    const-wide/16 v3, 0x0

    .line 617
    .line 618
    invoke-static {v0, v3, v4}, Lcom/tencent/liteav/network/TXCStreamUploader;->access$402(Lcom/tencent/liteav/network/TXCStreamUploader;J)J

    .line 619
    .line 620
    .line 621
    monitor-exit v2

    .line 622
    return-void

    .line 623
    :catchall_5
    move-exception v0

    .line 624
    monitor-exit v2
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    .line 625
    throw v0

    .line 626
    :goto_6
    :try_start_a
    monitor-exit v1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 627
    throw v0
.end method
