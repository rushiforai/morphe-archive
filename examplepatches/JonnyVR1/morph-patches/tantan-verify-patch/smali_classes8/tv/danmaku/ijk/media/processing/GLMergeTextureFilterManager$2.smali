.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B2(JFFFFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:F

.field final synthetic c:F

.field final synthetic d:F

.field final synthetic e:F

.field final synthetic f:I

.field final synthetic g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JFFFFI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->a:J

    .line 4
    .line 5
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->b:F

    .line 6
    .line 7
    iput p5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->c:F

    .line 8
    .line 9
    iput p6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->d:F

    .line 10
    .line 11
    iput p7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->e:F

    .line 12
    .line 13
    iput p8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->f:I

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 10
    .line 11
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->a:J

    .line 16
    .line 17
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 28
    .line 29
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->a:J

    .line 34
    .line 35
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v1, v0

    .line 44
    check-cast v1, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->b:F

    .line 49
    .line 50
    const/high16 v2, 0x3f800000    # 1.0f

    .line 51
    .line 52
    cmpg-float v3, v0, v2

    .line 53
    .line 54
    if-lez v3, :cond_1

    .line 55
    .line 56
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->c:F

    .line 57
    .line 58
    cmpg-float v2, v3, v2

    .line 59
    .line 60
    if-gtz v2, :cond_0

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_0
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->d:F

    .line 64
    .line 65
    float-to-int v2, v2

    .line 66
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->e:F

    .line 67
    .line 68
    float-to-int v4, v4

    .line 69
    float-to-int v0, v0

    .line 70
    :goto_0
    float-to-int v3, v3

    .line 71
    move v5, v3

    .line 72
    move v3, v4

    .line 73
    move v4, v0

    .line 74
    goto :goto_2

    .line 75
    :cond_1
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 76
    .line 77
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    int-to-float v0, v0

    .line 82
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->d:F

    .line 83
    .line 84
    mul-float/2addr v0, v2

    .line 85
    float-to-int v2, v0

    .line 86
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 87
    .line 88
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    int-to-float v0, v0

    .line 93
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->e:F

    .line 94
    .line 95
    mul-float/2addr v0, v3

    .line 96
    float-to-int v4, v0

    .line 97
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 98
    .line 99
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    int-to-float v0, v0

    .line 104
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->b:F

    .line 105
    .line 106
    mul-float/2addr v0, v3

    .line 107
    float-to-int v0, v0

    .line 108
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 109
    .line 110
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    int-to-float v3, v3

    .line 115
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->c:F

    .line 116
    .line 117
    mul-float/2addr v3, v5

    .line 118
    goto :goto_0

    .line 119
    :goto_2
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->c2()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 124
    .line 125
    invoke-static {v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v6

    .line 129
    iget-wide v8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->a:J

    .line 130
    .line 131
    cmp-long v6, v6, v8

    .line 132
    .line 133
    const-string v7, "/"

    .line 134
    .line 135
    const-string v8, "], z="

    .line 136
    .line 137
    const-string v9, "mergeFilterManager"

    .line 138
    .line 139
    const-string v10, ","

    .line 140
    .line 141
    if-nez v6, :cond_2

    .line 142
    .line 143
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 144
    .line 145
    invoke-static {v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z

    .line 146
    .line 147
    .line 148
    move-result v6

    .line 149
    if-eqz v6, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 152
    .line 153
    invoke-static {v1, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 154
    .line 155
    .line 156
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 157
    .line 158
    invoke-static {v1, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 159
    .line 160
    .line 161
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 162
    .line 163
    invoke-static {v1, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 164
    .line 165
    .line 166
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 167
    .line 168
    invoke-static {v1, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 172
    .line 173
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->f:I

    .line 174
    .line 175
    invoke-static {v1, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 176
    .line 177
    .line 178
    new-instance v1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    const-string v6, "@@@ setSubViewPort: E id[anchor], view["

    .line 181
    .line 182
    invoke-direct {v1, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->f:I

    .line 210
    .line 211
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v0, "], sub size="

    .line 221
    .line 222
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 226
    .line 227
    invoke-static {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    invoke-static {v9, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    const-string v11, "@@@ setSubViewPort: E id["

    .line 249
    .line 250
    invoke-direct {v6, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    iget-wide v11, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->a:J

    .line 254
    .line 255
    invoke-virtual {v6, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    const-string v11, "]; view["

    .line 259
    .line 260
    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    iget v8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->f:I

    .line 288
    .line 289
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    const-string v0, ", sub size="

    .line 299
    .line 300
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->g:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 304
    .line 305
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 314
    .line 315
    .line 316
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    invoke-static {v9, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    .line 322
    .line 323
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;->f:I

    .line 324
    .line 325
    invoke-virtual/range {v1 .. v6}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->j2(IIIII)V

    .line 326
    .line 327
    .line 328
    :cond_3
    return-void
.end method
