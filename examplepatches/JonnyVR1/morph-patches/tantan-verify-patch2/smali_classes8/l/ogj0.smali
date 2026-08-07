.class public Ll/ogj0;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:Z

.field private c:I

.field private d:[F

.field private e:Ll/ymi;

.field private f:F

.field private g:F

.field private i:F

.field private j:F

.field private k:F

.field private l:F

.field private m:F

.field private n:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/ogj0;->b:Z

    .line 6
    .line 7
    const/16 v0, 0x19

    .line 8
    .line 9
    iput v0, p0, Ll/ogj0;->c:I

    .line 10
    .line 11
    const/4 v0, 0x6

    .line 12
    new-array v0, v0, [F

    .line 13
    .line 14
    iput-object v0, p0, Ll/ogj0;->d:[F

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Ll/ogj0;->f:F

    .line 18
    .line 19
    iput v0, p0, Ll/ogj0;->g:F

    .line 20
    .line 21
    iput v0, p0, Ll/ogj0;->i:F

    .line 22
    .line 23
    iput v0, p0, Ll/ogj0;->j:F

    .line 24
    .line 25
    iput v0, p0, Ll/ogj0;->k:F

    .line 26
    .line 27
    iput v0, p0, Ll/ogj0;->l:F

    .line 28
    .line 29
    iput v0, p0, Ll/ogj0;->m:F

    .line 30
    .line 31
    iput v0, p0, Ll/ogj0;->n:F

    .line 32
    .line 33
    new-instance v1, Ll/ymi;

    .line 34
    .line 35
    const/high16 v2, 0x3f800000    # 1.0f

    .line 36
    .line 37
    invoke-direct {v1, v0, v2, v2}, Ll/ymi;-><init>(FFF)V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/ogj0;->e:Ll/ymi;

    .line 41
    .line 42
    iget v0, p0, Ll/ogj0;->c:I

    .line 43
    .line 44
    int-to-float v0, v0

    .line 45
    div-float/2addr v2, v0

    .line 46
    iput v2, p0, Ll/ogj0;->f:F

    .line 47
    .line 48
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/ogj0;->b:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    iget-object v1, p0, Ll/ogj0;->d:[F

    .line 7
    .line 8
    array-length v2, v1

    .line 9
    if-ge v0, v2, :cond_0

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput v2, v1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception v0

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw v0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ogj0;->b:Z

    .line 6
    .line 7
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision lowp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\n\nconst float barWidth = 1.0 / 6.0;\n\nuniform float barLength[6];\n\nvoid main() {\n    int bar = int((1.0 - textureCoordinate.y) / barWidth);\n    \n    vec4 color;\n    if (textureCoordinate.x < barLength[bar]) {\n        color = vec4(1.0);\n    } else {\n        color = texture2D(inputImageTexture0, textureCoordinate);\n    }\n    gl_FragColor = color;\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "barLength"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/ogj0;->a:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ogj0;->b:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_11

    .line 8
    .line 9
    iget v0, p0, Ll/ogj0;->g:F

    .line 10
    .line 11
    iget v2, p0, Ll/ogj0;->f:F

    .line 12
    .line 13
    add-float/2addr v0, v2

    .line 14
    iput v0, p0, Ll/ogj0;->g:F

    .line 15
    .line 16
    const/high16 v2, 0x40200000    # 2.5f

    .line 17
    .line 18
    cmpl-float v3, v0, v2

    .line 19
    .line 20
    if-lez v3, :cond_11

    .line 21
    .line 22
    sub-float/2addr v0, v2

    .line 23
    iget v2, p0, Ll/ogj0;->i:F

    .line 24
    .line 25
    const/high16 v3, 0x3f800000    # 1.0f

    .line 26
    .line 27
    cmpg-float v2, v2, v3

    .line 28
    .line 29
    if-gez v2, :cond_2

    .line 30
    .line 31
    const v2, 0x3eb851ec    # 0.36f

    .line 32
    .line 33
    .line 34
    cmpl-float v4, v0, v2

    .line 35
    .line 36
    if-lez v4, :cond_0

    .line 37
    .line 38
    move v4, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    move v4, v0

    .line 41
    :goto_0
    iget-object v5, p0, Ll/ogj0;->e:Ll/ymi;

    .line 42
    .line 43
    invoke-virtual {v5, v2}, Ll/ymi;->c(F)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ll/ogj0;->e:Ll/ymi;

    .line 47
    .line 48
    invoke-virtual {v2, v4}, Ll/ymi;->b(F)F

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    iput v2, p0, Ll/ogj0;->i:F

    .line 53
    .line 54
    iget-object v4, p0, Ll/ogj0;->d:[F

    .line 55
    .line 56
    cmpg-float v5, v2, v3

    .line 57
    .line 58
    if-gtz v5, :cond_1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    move v2, v3

    .line 62
    :goto_1
    aput v2, v4, v1

    .line 63
    .line 64
    :cond_2
    const v2, 0x3df5c28f    # 0.12f

    .line 65
    .line 66
    .line 67
    cmpl-float v4, v0, v2

    .line 68
    .line 69
    if-lez v4, :cond_5

    .line 70
    .line 71
    iget v5, p0, Ll/ogj0;->j:F

    .line 72
    .line 73
    cmpg-float v5, v5, v3

    .line 74
    .line 75
    if-gez v5, :cond_5

    .line 76
    .line 77
    sub-float v5, v0, v2

    .line 78
    .line 79
    const v6, 0x3f0f5c29    # 0.56f

    .line 80
    .line 81
    .line 82
    cmpl-float v7, v5, v6

    .line 83
    .line 84
    if-lez v7, :cond_3

    .line 85
    .line 86
    move v5, v6

    .line 87
    :cond_3
    iget-object v7, p0, Ll/ogj0;->e:Ll/ymi;

    .line 88
    .line 89
    invoke-virtual {v7, v6}, Ll/ymi;->c(F)V

    .line 90
    .line 91
    .line 92
    iget-object v6, p0, Ll/ogj0;->e:Ll/ymi;

    .line 93
    .line 94
    invoke-virtual {v6, v5}, Ll/ymi;->b(F)F

    .line 95
    .line 96
    .line 97
    move-result v5

    .line 98
    iput v5, p0, Ll/ogj0;->j:F

    .line 99
    .line 100
    iget-object v6, p0, Ll/ogj0;->d:[F

    .line 101
    .line 102
    cmpg-float v7, v5, v3

    .line 103
    .line 104
    if-gtz v7, :cond_4

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_4
    move v5, v3

    .line 108
    :goto_2
    const/4 v7, 0x1

    .line 109
    aput v5, v6, v7

    .line 110
    .line 111
    :cond_5
    const v5, 0x3e99999a    # 0.3f

    .line 112
    .line 113
    .line 114
    cmpl-float v6, v0, v5

    .line 115
    .line 116
    if-lez v6, :cond_8

    .line 117
    .line 118
    iget v6, p0, Ll/ogj0;->k:F

    .line 119
    .line 120
    cmpg-float v6, v6, v3

    .line 121
    .line 122
    if-gez v6, :cond_8

    .line 123
    .line 124
    sub-float v6, v0, v5

    .line 125
    .line 126
    cmpl-float v7, v6, v5

    .line 127
    .line 128
    if-lez v7, :cond_6

    .line 129
    .line 130
    move v6, v5

    .line 131
    :cond_6
    iget-object v7, p0, Ll/ogj0;->e:Ll/ymi;

    .line 132
    .line 133
    invoke-virtual {v7, v5}, Ll/ymi;->c(F)V

    .line 134
    .line 135
    .line 136
    iget-object v5, p0, Ll/ogj0;->e:Ll/ymi;

    .line 137
    .line 138
    invoke-virtual {v5, v6}, Ll/ymi;->b(F)F

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    iput v5, p0, Ll/ogj0;->k:F

    .line 143
    .line 144
    iget-object v6, p0, Ll/ogj0;->d:[F

    .line 145
    .line 146
    cmpg-float v7, v5, v3

    .line 147
    .line 148
    if-gtz v7, :cond_7

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_7
    move v5, v3

    .line 152
    :goto_3
    const/4 v7, 0x2

    .line 153
    aput v5, v6, v7

    .line 154
    .line 155
    :cond_8
    const v5, 0x3e4ccccd    # 0.2f

    .line 156
    .line 157
    .line 158
    cmpl-float v6, v0, v5

    .line 159
    .line 160
    if-lez v6, :cond_b

    .line 161
    .line 162
    iget v6, p0, Ll/ogj0;->l:F

    .line 163
    .line 164
    cmpg-float v6, v6, v3

    .line 165
    .line 166
    if-gez v6, :cond_b

    .line 167
    .line 168
    sub-float v6, v0, v5

    .line 169
    .line 170
    const v7, 0x3ecccccd    # 0.4f

    .line 171
    .line 172
    .line 173
    cmpl-float v8, v6, v7

    .line 174
    .line 175
    if-lez v8, :cond_9

    .line 176
    .line 177
    move v6, v7

    .line 178
    :cond_9
    iget-object v8, p0, Ll/ogj0;->e:Ll/ymi;

    .line 179
    .line 180
    invoke-virtual {v8, v7}, Ll/ymi;->c(F)V

    .line 181
    .line 182
    .line 183
    iget-object v7, p0, Ll/ogj0;->e:Ll/ymi;

    .line 184
    .line 185
    invoke-virtual {v7, v6}, Ll/ymi;->b(F)F

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    iput v6, p0, Ll/ogj0;->l:F

    .line 190
    .line 191
    iget-object v7, p0, Ll/ogj0;->d:[F

    .line 192
    .line 193
    cmpg-float v8, v6, v3

    .line 194
    .line 195
    if-gtz v8, :cond_a

    .line 196
    .line 197
    goto :goto_4

    .line 198
    :cond_a
    move v6, v3

    .line 199
    :goto_4
    const/4 v8, 0x3

    .line 200
    aput v6, v7, v8

    .line 201
    .line 202
    :cond_b
    if-lez v4, :cond_e

    .line 203
    .line 204
    iget v4, p0, Ll/ogj0;->m:F

    .line 205
    .line 206
    cmpg-float v4, v4, v3

    .line 207
    .line 208
    if-gez v4, :cond_e

    .line 209
    .line 210
    sub-float v2, v0, v2

    .line 211
    .line 212
    const v4, 0x3e23d70a    # 0.16f

    .line 213
    .line 214
    .line 215
    cmpl-float v6, v2, v4

    .line 216
    .line 217
    if-lez v6, :cond_c

    .line 218
    .line 219
    move v2, v4

    .line 220
    :cond_c
    iget-object v6, p0, Ll/ogj0;->e:Ll/ymi;

    .line 221
    .line 222
    invoke-virtual {v6, v4}, Ll/ymi;->c(F)V

    .line 223
    .line 224
    .line 225
    iget-object v4, p0, Ll/ogj0;->e:Ll/ymi;

    .line 226
    .line 227
    invoke-virtual {v4, v2}, Ll/ymi;->b(F)F

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    iput v2, p0, Ll/ogj0;->m:F

    .line 232
    .line 233
    iget-object v4, p0, Ll/ogj0;->d:[F

    .line 234
    .line 235
    cmpg-float v6, v2, v3

    .line 236
    .line 237
    if-gtz v6, :cond_d

    .line 238
    .line 239
    goto :goto_5

    .line 240
    :cond_d
    move v2, v3

    .line 241
    :goto_5
    const/4 v6, 0x4

    .line 242
    aput v2, v4, v6

    .line 243
    .line 244
    :cond_e
    const v2, 0x3ed70a3d    # 0.42f

    .line 245
    .line 246
    .line 247
    cmpl-float v4, v0, v2

    .line 248
    .line 249
    if-lez v4, :cond_11

    .line 250
    .line 251
    iget v4, p0, Ll/ogj0;->n:F

    .line 252
    .line 253
    cmpg-float v4, v4, v3

    .line 254
    .line 255
    if-gez v4, :cond_11

    .line 256
    .line 257
    sub-float/2addr v0, v2

    .line 258
    cmpl-float v2, v0, v5

    .line 259
    .line 260
    if-lez v2, :cond_f

    .line 261
    .line 262
    move v0, v5

    .line 263
    :cond_f
    iget-object v2, p0, Ll/ogj0;->e:Ll/ymi;

    .line 264
    .line 265
    invoke-virtual {v2, v5}, Ll/ymi;->c(F)V

    .line 266
    .line 267
    .line 268
    iget-object v2, p0, Ll/ogj0;->e:Ll/ymi;

    .line 269
    .line 270
    invoke-virtual {v2, v0}, Ll/ymi;->b(F)F

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    iput v0, p0, Ll/ogj0;->n:F

    .line 275
    .line 276
    iget-object v2, p0, Ll/ogj0;->d:[F

    .line 277
    .line 278
    cmpg-float v4, v0, v3

    .line 279
    .line 280
    if-gtz v4, :cond_10

    .line 281
    .line 282
    move v3, v0

    .line 283
    :cond_10
    const/4 v0, 0x5

    .line 284
    aput v3, v2, v0

    .line 285
    .line 286
    :cond_11
    iget v0, p0, Ll/ogj0;->a:I

    .line 287
    .line 288
    const/4 v2, 0x6

    .line 289
    iget-object p0, p0, Ll/ogj0;->d:[F

    .line 290
    .line 291
    invoke-static {v0, v2, p0, v1}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 292
    .line 293
    .line 294
    return-void
.end method
