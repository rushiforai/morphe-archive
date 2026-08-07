.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->h2(JII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->b:I

    .line 6
    .line 7
    iput p5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "@@@ addSubView: id["

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, "], sub size="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 27
    .line 28
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, ",source="

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->b:I

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, "; display="

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->c:I

    .line 55
    .line 56
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v3, "mergeFilterManager"

    .line 64
    .line 65
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 69
    .line 70
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 75
    .line 76
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_0

    .line 85
    .line 86
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 87
    .line 88
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 89
    .line 90
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 95
    .line 96
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 97
    .line 98
    .line 99
    move-result v5

    .line 100
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->b:I

    .line 101
    .line 102
    iget v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->c:I

    .line 103
    .line 104
    invoke-direct {v0, v4, v5, v6, v7}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;-><init>(IIII)V

    .line 105
    .line 106
    .line 107
    new-instance v4, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    const-string v5, "@@@ addSubView: add sub, userid="

    .line 110
    .line 111
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    iget-wide v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 115
    .line 116
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v5, "; sources:"

    .line 120
    .line 121
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->b:I

    .line 125
    .line 126
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->c:I

    .line 133
    .line 134
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-static {v3, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    .line 143
    .line 144
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 145
    .line 146
    invoke-virtual {v0, v4, v5}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->i2(J)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 150
    .line 151
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 156
    .line 157
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 167
    .line 168
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    if-eqz v0, :cond_1

    .line 173
    .line 174
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 175
    .line 176
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 181
    .line 182
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-interface {v0, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-eqz v0, :cond_1

    .line 191
    .line 192
    new-instance v0, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string v2, "@@@ addSubView: \u540c\u4e00\u4e2auserID("

    .line 195
    .line 196
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 200
    .line 201
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v2, ")\u672a\u91ca\u653e\u53c8\u521b\u5efa"

    .line 205
    .line 206
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 217
    .line 218
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 223
    .line 224
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    check-cast v0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 233
    .line 234
    if-eqz v0, :cond_1

    .line 235
    .line 236
    new-instance v2, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    const-string v4, "@@@ addSubView: source["

    .line 239
    .line 240
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->U1()I

    .line 244
    .line 245
    .line 246
    move-result v4

    .line 247
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    const-string v4, "->"

    .line 251
    .line 252
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->b:I

    .line 256
    .line 257
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    const-string v5, "]; display["

    .line 261
    .line 262
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q1()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->c:I

    .line 276
    .line 277
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    const-string v0, "]"

    .line 281
    .line 282
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    invoke-static {v3, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    .line 291
    .line 292
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    const-string v2, "@@@ addSubView: E id["

    .line 295
    .line 296
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->a:J

    .line 300
    .line 301
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 302
    .line 303
    .line 304
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;->d:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 308
    .line 309
    invoke-static {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    invoke-static {v3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    :cond_2
    return-void
.end method
