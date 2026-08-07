.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r2(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

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
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 10
    .line 11
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

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
    if-eqz v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 28
    .line 29
    invoke-static {v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-wide v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

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
    check-cast v0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 44
    .line 45
    const-string v1, "], sub size="

    .line 46
    .line 47
    const-string v2, "mergeFilterManager"

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    new-instance v3, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v4, "@@@ removeSubView: id["

    .line 54
    .line 55
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

    .line 59
    .line 60
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v4, "]; switchID["

    .line 64
    .line 65
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 69
    .line 70
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J

    .line 71
    .line 72
    .line 73
    move-result-wide v4

    .line 74
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v4, "]; status["

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 83
    .line 84
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 95
    .line 96
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    invoke-interface {v4}, Ljava/util/Map;->size()I

    .line 101
    .line 102
    .line 103
    move-result v4

    .line 104
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-static {v2, v3}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

    .line 115
    .line 116
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 117
    .line 118
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J

    .line 119
    .line 120
    .line 121
    move-result-wide v5

    .line 122
    cmp-long v3, v3, v5

    .line 123
    .line 124
    if-nez v3, :cond_0

    .line 125
    .line 126
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 127
    .line 128
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_0

    .line 133
    .line 134
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 135
    .line 136
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->c2()I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 144
    .line 145
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->a2()I

    .line 146
    .line 147
    .line 148
    move-result v4

    .line 149
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 150
    .line 151
    .line 152
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 153
    .line 154
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->b2()I

    .line 155
    .line 156
    .line 157
    move-result v4

    .line 158
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 159
    .line 160
    .line 161
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 162
    .line 163
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Z1()I

    .line 164
    .line 165
    .line 166
    move-result v4

    .line 167
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 168
    .line 169
    .line 170
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 171
    .line 172
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Y1()I

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I

    .line 177
    .line 178
    .line 179
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 180
    .line 181
    const/4 v4, 0x0

    .line 182
    invoke-static {v3, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;Z)Z

    .line 183
    .line 184
    .line 185
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 186
    .line 187
    const-wide/16 v4, 0x0

    .line 188
    .line 189
    invoke-static {v3, v4, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)J

    .line 190
    .line 191
    .line 192
    new-instance v3, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    const-string v4, "@@@ removeSubView: anchor view["

    .line 195
    .line 196
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 200
    .line 201
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string v4, ","

    .line 209
    .line 210
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 214
    .line 215
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 226
    .line 227
    invoke-static {v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 238
    .line 239
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    const-string v4, "], z="

    .line 247
    .line 248
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 252
    .line 253
    invoke-static {v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 265
    .line 266
    .line 267
    :cond_0
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 268
    .line 269
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

    .line 274
    .line 275
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 276
    .line 277
    .line 278
    move-result-object v4

    .line 279
    invoke-interface {v3, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->release()V

    .line 283
    .line 284
    .line 285
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 286
    .line 287
    const-string v3, "@@@ removeSubView: E id["

    .line 288
    .line 289
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->a:J

    .line 293
    .line 294
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;->b:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;

    .line 301
    .line 302
    invoke-static {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-interface {p0}, Ljava/util/Map;->size()I

    .line 307
    .line 308
    .line 309
    move-result p0

    .line 310
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    invoke-static {v2, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    .line 319
    .line 320
    :cond_2
    return-void
.end method
