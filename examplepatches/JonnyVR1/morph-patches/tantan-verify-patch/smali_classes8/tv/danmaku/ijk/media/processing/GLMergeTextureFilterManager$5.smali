.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E2(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "@@@ switchFullScreen: id["

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-wide v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 11
    .line 12
    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v3, "], full="

    .line 16
    .line 17
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->b:Z

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v3, "mergeFilterManager"

    .line 30
    .line 31
    invoke-static {v3, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 35
    .line 36
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 43
    .line 44
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 49
    .line 50
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_3

    .line 59
    .line 60
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 61
    .line 62
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 67
    .line 68
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    move-object v4, v1

    .line 77
    check-cast v4, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 78
    .line 79
    if-eqz v4, :cond_3

    .line 80
    .line 81
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->a2()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->b2()I

    .line 86
    .line 87
    .line 88
    move-result v10

    .line 89
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Z1()I

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Y1()I

    .line 94
    .line 95
    .line 96
    move-result v12

    .line 97
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->c2()I

    .line 98
    .line 99
    .line 100
    move-result v13

    .line 101
    new-instance v5, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-wide v6, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 107
    .line 108
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v2, "], view["

    .line 112
    .line 113
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v14, ","

    .line 120
    .line 121
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v5, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v15, "]; z="

    .line 140
    .line 141
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string v6, "], sub size="

    .line 148
    .line 149
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 153
    .line 154
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    invoke-interface {v7}, Ljava/util/Map;->size()I

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-static {v3, v5}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    new-instance v5, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string v7, "@@@ switchFullScreen: anchor view["

    .line 175
    .line 176
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 180
    .line 181
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 182
    .line 183
    .line 184
    move-result v7

    .line 185
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 192
    .line 193
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 204
    .line 205
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 206
    .line 207
    .line 208
    move-result v7

    .line 209
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 216
    .line 217
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 218
    .line 219
    .line 220
    move-result v7

    .line 221
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 228
    .line 229
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 230
    .line 231
    .line 232
    move-result v7

    .line 233
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-static {v3, v5}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    iget-boolean v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->b:Z

    .line 244
    .line 245
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 246
    .line 247
    if-eqz v5, :cond_1

    .line 248
    .line 249
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J

    .line 250
    .line 251
    .line 252
    move-result-wide v7

    .line 253
    move-object v9, v4

    .line 254
    iget-wide v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 255
    .line 256
    cmp-long v4, v7, v4

    .line 257
    .line 258
    if-nez v4, :cond_0

    .line 259
    .line 260
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 261
    .line 262
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z

    .line 263
    .line 264
    .line 265
    move-result v4

    .line 266
    if-eqz v4, :cond_0

    .line 267
    .line 268
    move-object/from16 v17, v3

    .line 269
    .line 270
    move-object v3, v6

    .line 271
    goto/16 :goto_0

    .line 272
    .line 273
    :cond_0
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 274
    .line 275
    iget-wide v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 276
    .line 277
    invoke-static {v4, v7, v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)J

    .line 278
    .line 279
    .line 280
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 281
    .line 282
    const/4 v5, 0x1

    .line 283
    invoke-static {v4, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;Z)Z

    .line 284
    .line 285
    .line 286
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 287
    .line 288
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 289
    .line 290
    .line 291
    move-result v5

    .line 292
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 293
    .line 294
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 295
    .line 296
    .line 297
    move-result v4

    .line 298
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 299
    .line 300
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 301
    .line 302
    .line 303
    move-result v7

    .line 304
    iget-object v8, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 305
    .line 306
    invoke-static {v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 307
    .line 308
    .line 309
    move-result v8

    .line 310
    move/from16 v16, v4

    .line 311
    .line 312
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 313
    .line 314
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 315
    .line 316
    .line 317
    move-result v4

    .line 318
    move-object/from16 v17, v9

    .line 319
    .line 320
    move v9, v4

    .line 321
    move-object/from16 v4, v17

    .line 322
    .line 323
    move-object/from16 v17, v3

    .line 324
    .line 325
    move-object v3, v6

    .line 326
    move/from16 v6, v16

    .line 327
    .line 328
    invoke-virtual/range {v4 .. v9}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->j2(IIIII)V

    .line 329
    .line 330
    .line 331
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 332
    .line 333
    invoke-static {v4, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 334
    .line 335
    .line 336
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 337
    .line 338
    invoke-static {v4, v10}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 339
    .line 340
    .line 341
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 342
    .line 343
    invoke-static {v4, v11}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 344
    .line 345
    .line 346
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 347
    .line 348
    invoke-static {v4, v12}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 349
    .line 350
    .line 351
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 352
    .line 353
    invoke-static {v4, v13}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 354
    .line 355
    .line 356
    goto :goto_0

    .line 357
    :cond_1
    move-object/from16 v17, v3

    .line 358
    .line 359
    move-object v3, v6

    .line 360
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J

    .line 361
    .line 362
    .line 363
    move-result-wide v5

    .line 364
    iget-wide v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 365
    .line 366
    cmp-long v5, v5, v7

    .line 367
    .line 368
    if-nez v5, :cond_2

    .line 369
    .line 370
    iget-object v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 371
    .line 372
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z

    .line 373
    .line 374
    .line 375
    move-result v5

    .line 376
    if-eqz v5, :cond_2

    .line 377
    .line 378
    iget-object v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 379
    .line 380
    const-wide/16 v6, 0x0

    .line 381
    .line 382
    invoke-static {v5, v6, v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)J

    .line 383
    .line 384
    .line 385
    iget-object v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 386
    .line 387
    const/4 v6, 0x0

    .line 388
    invoke-static {v5, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;Z)Z

    .line 389
    .line 390
    .line 391
    iget-object v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 392
    .line 393
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 394
    .line 395
    .line 396
    move-result v5

    .line 397
    iget-object v6, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 398
    .line 399
    invoke-static {v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 400
    .line 401
    .line 402
    move-result v6

    .line 403
    iget-object v7, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 404
    .line 405
    invoke-static {v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 406
    .line 407
    .line 408
    move-result v7

    .line 409
    iget-object v8, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 410
    .line 411
    invoke-static {v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 412
    .line 413
    .line 414
    move-result v8

    .line 415
    iget-object v9, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 416
    .line 417
    invoke-static {v9}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 418
    .line 419
    .line 420
    move-result v9

    .line 421
    invoke-virtual/range {v4 .. v9}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->j2(IIIII)V

    .line 422
    .line 423
    .line 424
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 425
    .line 426
    invoke-static {v4, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 427
    .line 428
    .line 429
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 430
    .line 431
    invoke-static {v4, v10}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 432
    .line 433
    .line 434
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 435
    .line 436
    invoke-static {v4, v11}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 437
    .line 438
    .line 439
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 440
    .line 441
    invoke-static {v4, v12}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 442
    .line 443
    .line 444
    iget-object v4, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 445
    .line 446
    invoke-static {v4, v13}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 447
    .line 448
    .line 449
    :cond_2
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 450
    .line 451
    const-string v5, "@@@ switchFullScreen: E id["

    .line 452
    .line 453
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    iget-wide v5, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->a:J

    .line 457
    .line 458
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 459
    .line 460
    .line 461
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 462
    .line 463
    .line 464
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .line 469
    .line 470
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 471
    .line 472
    .line 473
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 474
    .line 475
    .line 476
    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 477
    .line 478
    .line 479
    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 486
    .line 487
    .line 488
    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 492
    .line 493
    .line 494
    iget-object v1, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 495
    .line 496
    invoke-static {v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 501
    .line 502
    .line 503
    move-result v1

    .line 504
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object v1

    .line 511
    move-object/from16 v2, v17

    .line 512
    .line 513
    invoke-static {v2, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 514
    .line 515
    .line 516
    new-instance v1, Ljava/lang/StringBuilder;

    .line 517
    .line 518
    const-string v3, "@@@ switchFullScreen: E anchor view["

    .line 519
    .line 520
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 524
    .line 525
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 526
    .line 527
    .line 528
    move-result v3

    .line 529
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 530
    .line 531
    .line 532
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 533
    .line 534
    .line 535
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 536
    .line 537
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 538
    .line 539
    .line 540
    move-result v3

    .line 541
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 542
    .line 543
    .line 544
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 548
    .line 549
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 550
    .line 551
    .line 552
    move-result v3

    .line 553
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    .line 558
    .line 559
    iget-object v3, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 560
    .line 561
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 562
    .line 563
    .line 564
    move-result v3

    .line 565
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 566
    .line 567
    .line 568
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    iget-object v0, v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 572
    .line 573
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 574
    .line 575
    .line 576
    move-result v0

    .line 577
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 581
    .line 582
    .line 583
    move-result-object v0

    .line 584
    invoke-static {v2, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 585
    .line 586
    .line 587
    :cond_3
    return-void
.end method
