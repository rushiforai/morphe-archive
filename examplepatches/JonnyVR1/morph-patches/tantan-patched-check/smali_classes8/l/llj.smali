.class public Ll/llj;
.super Ll/tmj0;
.source "SourceFile"


# instance fields
.field protected a:F


# direct methods
.method public constructor <init>(F)V
    .locals 8

    .line 1
    invoke-direct {p0}, Ll/tmj0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/high16 v0, 0x4010000000000000L    # 4.0

    .line 5
    .line 6
    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    .line 7
    .line 8
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 9
    .line 10
    .line 11
    move-result-wide v4

    .line 12
    const-wide/high16 v6, -0x4000000000000000L    # -2.0

    .line 13
    .line 14
    mul-double/2addr v4, v6

    .line 15
    const-wide v6, 0x401921fb54442d18L    # 6.283185307179586

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->pow(DD)D

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    mul-double/2addr v0, v6

    .line 25
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    const-wide/high16 v2, 0x3f70000000000000L    # 0.00390625

    .line 30
    .line 31
    mul-double/2addr v2, v0

    .line 32
    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    mul-double/2addr v4, v0

    .line 37
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v0

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    double-to-int p1, v0

    .line 46
    int-to-float p1, p1

    .line 47
    const/high16 v0, 0x40000000    # 2.0f

    .line 48
    .line 49
    rem-float v0, p1, v0

    .line 50
    .line 51
    add-float/2addr p1, v0

    .line 52
    iput p1, p0, Ll/llj;->a:F

    .line 53
    .line 54
    return-void
.end method

.method public static final Q1(FF)Ljava/lang/String;
    .locals 13

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    add-float v1, p0, v0

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    new-array v1, v1, [D

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    :goto_0
    int-to-float v5, v4

    .line 12
    const/high16 v6, 0x3f800000    # 1.0f

    .line 13
    .line 14
    add-float/2addr v6, p0

    .line 15
    cmpg-float v5, v5, v6

    .line 16
    .line 17
    if-gez v5, :cond_1

    .line 18
    .line 19
    float-to-double v5, p1

    .line 20
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 21
    .line 22
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 23
    .line 24
    .line 25
    move-result-wide v9

    .line 26
    const-wide v11, 0x401921fb54442d18L    # 6.283185307179586

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    mul-double/2addr v9, v11

    .line 32
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    .line 37
    .line 38
    div-double/2addr v11, v9

    .line 39
    int-to-double v9, v4

    .line 40
    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 41
    .line 42
    .line 43
    move-result-wide v9

    .line 44
    neg-double v9, v9

    .line 45
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 46
    .line 47
    .line 48
    move-result-wide v5

    .line 49
    mul-double/2addr v5, v7

    .line 50
    div-double/2addr v9, v5

    .line 51
    invoke-static {v9, v10}, Ljava/lang/Math;->exp(D)D

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    mul-double/2addr v11, v5

    .line 56
    aput-wide v11, v1, v4

    .line 57
    .line 58
    if-nez v4, :cond_0

    .line 59
    .line 60
    float-to-double v5, v2

    .line 61
    :goto_1
    add-double/2addr v5, v11

    .line 62
    double-to-float v2, v5

    .line 63
    goto :goto_2

    .line 64
    :cond_0
    float-to-double v5, v2

    .line 65
    mul-double/2addr v11, v7

    .line 66
    goto :goto_1

    .line 67
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    move p1, v3

    .line 71
    :goto_3
    int-to-float v4, p1

    .line 72
    cmpg-float v4, v4, v6

    .line 73
    .line 74
    if-gez v4, :cond_2

    .line 75
    .line 76
    aget-wide v4, v1, p1

    .line 77
    .line 78
    float-to-double v7, v2

    .line 79
    div-double/2addr v4, v7

    .line 80
    aput-wide v4, v1, p1

    .line 81
    .line 82
    add-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_2
    div-float p1, p0, v0

    .line 86
    .line 87
    rem-float/2addr p0, v0

    .line 88
    add-float/2addr p1, p0

    .line 89
    const/high16 p0, 0x40e00000    # 7.0f

    .line 90
    .line 91
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    float-to-int p0, p0

    .line 96
    float-to-int p1, p1

    .line 97
    const/4 v0, 0x1

    .line 98
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    const v4, 0x8dfc

    .line 103
    .line 104
    .line 105
    invoke-static {v4, v2}, Landroid/opengl/GLES20;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    if-lez v4, :cond_3

    .line 113
    .line 114
    invoke-virtual {v2, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    add-int/lit8 v4, v4, -0x2

    .line 119
    .line 120
    div-int/lit8 v4, v4, 0x2

    .line 121
    .line 122
    if-le p0, v4, :cond_3

    .line 123
    .line 124
    invoke-virtual {v2, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    add-int/lit8 p0, p0, -0x2

    .line 129
    .line 130
    div-int/lit8 p0, p0, 0x2

    .line 131
    .line 132
    move p1, p0

    .line 133
    :cond_3
    new-instance v2, Ljava/lang/StringBuffer;

    .line 134
    .line 135
    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 136
    .line 137
    .line 138
    new-instance v4, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    const-string v5, "\n     precision mediump float;\n     uniform sampler2D inputImageTexture;\n     uniform float texelWidthOffset;\n     uniform float texelHeightOffset;\n     varying vec2 blurCoordinates["

    .line 141
    .line 142
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    mul-int/lit8 v5, p0, 0x2

    .line 146
    .line 147
    add-int/2addr v5, v0

    .line 148
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v0, "];\n     void main()     {        vec4 sum = vec4(0.0);\n"

    .line 152
    .line 153
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    .line 162
    .line 163
    new-instance v0, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    const-string v4, "sum += texture2D(inputImageTexture, blurCoordinates[0]) * "

    .line 166
    .line 167
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    aget-wide v4, v1, v3

    .line 171
    .line 172
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v4, ";\n"

    .line 176
    .line 177
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 185
    .line 186
    .line 187
    :goto_4
    if-ge v3, p0, :cond_4

    .line 188
    .line 189
    mul-int/lit8 v0, v3, 0x2

    .line 190
    .line 191
    add-int/lit8 v5, v0, 0x1

    .line 192
    .line 193
    aget-wide v6, v1, v5

    .line 194
    .line 195
    add-int/lit8 v0, v0, 0x2

    .line 196
    .line 197
    aget-wide v8, v1, v0

    .line 198
    .line 199
    add-double/2addr v6, v8

    .line 200
    new-instance v8, Ljava/lang/StringBuilder;

    .line 201
    .line 202
    const-string v9, "sum += texture2D(inputImageTexture, blurCoordinates["

    .line 203
    .line 204
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v5, "]) * ("

    .line 211
    .line 212
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    const-string v10, ");\n"

    .line 219
    .line 220
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v8

    .line 227
    invoke-virtual {v2, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 228
    .line 229
    .line 230
    new-instance v8, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    invoke-virtual {v8, v6, v7}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 252
    .line 253
    .line 254
    add-int/lit8 v3, v3, 0x1

    .line 255
    .line 256
    goto :goto_4

    .line 257
    :cond_4
    if-le p1, p0, :cond_5

    .line 258
    .line 259
    const-string v0, "highp vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);\n"

    .line 260
    .line 261
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 262
    .line 263
    .line 264
    :goto_5
    if-ge p0, p1, :cond_5

    .line 265
    .line 266
    mul-int/lit8 v0, p0, 0x2

    .line 267
    .line 268
    add-int/lit8 v3, v0, 0x1

    .line 269
    .line 270
    aget-wide v5, v1, v3

    .line 271
    .line 272
    add-int/lit8 v0, v0, 0x2

    .line 273
    .line 274
    aget-wide v7, v1, v0

    .line 275
    .line 276
    add-double v9, v5, v7

    .line 277
    .line 278
    int-to-double v11, v3

    .line 279
    mul-double/2addr v5, v11

    .line 280
    int-to-double v11, v0

    .line 281
    mul-double/2addr v7, v11

    .line 282
    add-double/2addr v5, v7

    .line 283
    div-double/2addr v5, v9

    .line 284
    new-instance v0, Ljava/lang/StringBuilder;

    .line 285
    .line 286
    const-string v3, "ssum += texture2D(inputImageTexture, blurCoordinates[0] + singleStepOffset *"

    .line 287
    .line 288
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    const-string v3, ")*"

    .line 295
    .line 296
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v0, v9, v10}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 310
    .line 311
    .line 312
    add-int/lit8 p0, p0, 0x1

    .line 313
    .line 314
    goto :goto_5

    .line 315
    :cond_5
    const-string p0, "gl_FragColor = sum;    }\n"

    .line 316
    .line 317
    invoke-virtual {v2, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 318
    .line 319
    .line 320
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    return-object p0
.end method

.method public static final R1(FF)Ljava/lang/String;
    .locals 13

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    add-float v1, p0, v0

    .line 4
    .line 5
    float-to-int v1, v1

    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x0

    .line 10
    move v4, v3

    .line 11
    :goto_0
    int-to-float v5, v4

    .line 12
    const/high16 v6, 0x3f800000    # 1.0f

    .line 13
    .line 14
    add-float/2addr v6, p0

    .line 15
    cmpg-float v5, v5, v6

    .line 16
    .line 17
    if-gez v5, :cond_1

    .line 18
    .line 19
    float-to-double v5, p1

    .line 20
    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    .line 21
    .line 22
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 23
    .line 24
    .line 25
    move-result-wide v9

    .line 26
    const-wide v11, 0x401921fb54442d18L    # 6.283185307179586

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    mul-double/2addr v9, v11

    .line 32
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 33
    .line 34
    .line 35
    move-result-wide v9

    .line 36
    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    .line 37
    .line 38
    div-double/2addr v11, v9

    .line 39
    int-to-double v9, v4

    .line 40
    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 41
    .line 42
    .line 43
    move-result-wide v9

    .line 44
    neg-double v9, v9

    .line 45
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->pow(DD)D

    .line 46
    .line 47
    .line 48
    move-result-wide v5

    .line 49
    mul-double/2addr v5, v7

    .line 50
    div-double/2addr v9, v5

    .line 51
    invoke-static {v9, v10}, Ljava/lang/Math;->exp(D)D

    .line 52
    .line 53
    .line 54
    move-result-wide v5

    .line 55
    mul-double/2addr v11, v5

    .line 56
    double-to-float v5, v11

    .line 57
    aput v5, v1, v4

    .line 58
    .line 59
    if-nez v4, :cond_0

    .line 60
    .line 61
    add-float/2addr v2, v5

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    float-to-double v9, v2

    .line 64
    float-to-double v5, v5

    .line 65
    mul-double/2addr v5, v7

    .line 66
    add-double/2addr v9, v5

    .line 67
    double-to-float v2, v9

    .line 68
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move p1, v3

    .line 72
    :goto_2
    int-to-float v4, p1

    .line 73
    cmpg-float v4, v4, v6

    .line 74
    .line 75
    if-gez v4, :cond_2

    .line 76
    .line 77
    aget v4, v1, p1

    .line 78
    .line 79
    div-float/2addr v4, v2

    .line 80
    aput v4, v1, p1

    .line 81
    .line 82
    add-int/lit8 p1, p1, 0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_2
    div-float p1, p0, v0

    .line 86
    .line 87
    rem-float/2addr p0, v0

    .line 88
    add-float/2addr p1, p0

    .line 89
    const/high16 p0, 0x40e00000    # 7.0f

    .line 90
    .line 91
    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    float-to-int p0, p0

    .line 96
    const/4 p1, 0x1

    .line 97
    invoke-static {p1}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const v2, 0x8dfc

    .line 102
    .line 103
    .line 104
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glGetIntegerv(ILjava/nio/IntBuffer;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-lez v2, :cond_3

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    add-int/lit8 v2, v2, -0x2

    .line 118
    .line 119
    div-int/lit8 v2, v2, 0x2

    .line 120
    .line 121
    if-le p0, v2, :cond_3

    .line 122
    .line 123
    invoke-virtual {v0, v3}, Ljava/nio/IntBuffer;->get(I)I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    add-int/lit8 p0, p0, -0x2

    .line 128
    .line 129
    div-int/lit8 p0, p0, 0x2

    .line 130
    .line 131
    :cond_3
    new-array v0, p0, [F

    .line 132
    .line 133
    move v2, v3

    .line 134
    :goto_3
    if-ge v2, p0, :cond_4

    .line 135
    .line 136
    mul-int/lit8 v4, v2, 0x2

    .line 137
    .line 138
    add-int/lit8 v5, v4, 0x1

    .line 139
    .line 140
    aget v6, v1, v5

    .line 141
    .line 142
    add-int/lit8 v4, v4, 0x2

    .line 143
    .line 144
    aget v7, v1, v4

    .line 145
    .line 146
    add-float v8, v6, v7

    .line 147
    .line 148
    int-to-float v5, v5

    .line 149
    mul-float/2addr v6, v5

    .line 150
    int-to-float v4, v4

    .line 151
    mul-float/2addr v7, v4

    .line 152
    add-float/2addr v6, v7

    .line 153
    div-float/2addr v6, v8

    .line 154
    aput v6, v0, v2

    .line 155
    .line 156
    add-int/lit8 v2, v2, 0x1

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_4
    new-instance v1, Ljava/lang/StringBuffer;

    .line 160
    .line 161
    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 162
    .line 163
    .line 164
    new-instance v2, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v4, "precision mediump float;\n      attribute vec4 position; \n      attribute vec4 inputTextureCoordinate; \n      uniform float texelWidthOffset; \n      uniform float texelHeightOffset; \n      varying vec2 blurCoordinates["

    .line 167
    .line 168
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    mul-int/lit8 v4, p0, 0x2

    .line 172
    .line 173
    add-int/2addr v4, p1

    .line 174
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    const-string p1, "];\n      void main() \n      {          gl_Position = position; \n                    vec2 singleStepOffset = vec2(texelWidthOffset, texelHeightOffset);\n"

    .line 178
    .line 179
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 187
    .line 188
    .line 189
    const-string p1, "blurCoordinates[0] = inputTextureCoordinate.xy;\n"

    .line 190
    .line 191
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 192
    .line 193
    .line 194
    :goto_4
    if-ge v3, p0, :cond_5

    .line 195
    .line 196
    new-instance p1, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v2, "blurCoordinates["

    .line 199
    .line 200
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    mul-int/lit8 v4, v3, 0x2

    .line 204
    .line 205
    add-int/lit8 v5, v4, 0x1

    .line 206
    .line 207
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v5, "] = inputTextureCoordinate.xy + singleStepOffset *"

    .line 211
    .line 212
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    aget v5, v0, v3

    .line 216
    .line 217
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    const-string v5, ";\n"

    .line 221
    .line 222
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 230
    .line 231
    .line 232
    new-instance p1, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    add-int/lit8 v4, v4, 0x2

    .line 238
    .line 239
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    const-string v2, "] = inputTextureCoordinate.xy - singleStepOffset *"

    .line 243
    .line 244
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    aget v2, v0, v3

    .line 248
    .line 249
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 260
    .line 261
    .line 262
    add-int/lit8 v3, v3, 0x1

    .line 263
    .line 264
    goto :goto_4

    .line 265
    :cond_5
    const-string p0, "}\n"

    .line 266
    .line 267
    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    return-object p0
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Ll/llj;->a:F

    .line 2
    .line 3
    invoke-static {p0, p0}, Ll/llj;->Q1(FF)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Ll/llj;->a:F

    .line 2
    .line 3
    invoke-static {p0, p0}, Ll/llj;->R1(FF)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/tmj0;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public passShaderValues()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/tmj0;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
