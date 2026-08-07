.class public Ll/wsf;
.super Ll/bs2;
.source "SourceFile"


# instance fields
.field private d:I

.field private e:I

.field private f:[F

.field private g:[F


# direct methods
.method public constructor <init>()V
    .locals 28

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-direct {v0}, Ll/bs2;-><init>()V

    .line 4
    .line 5
    .line 6
    const v1, -0xdf2d8

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    const/high16 v3, 0x437f0000    # 255.0f

    .line 15
    .line 16
    div-float/2addr v2, v3

    .line 17
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    int-to-float v4, v4

    .line 22
    div-float/2addr v4, v3

    .line 23
    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    int-to-float v1, v1

    .line 28
    div-float/2addr v1, v3

    .line 29
    const v5, -0x200df3

    .line 30
    .line 31
    .line 32
    invoke-static {v5}, Landroid/graphics/Color;->red(I)I

    .line 33
    .line 34
    .line 35
    move-result v6

    .line 36
    int-to-float v6, v6

    .line 37
    div-float/2addr v6, v3

    .line 38
    invoke-static {v5}, Landroid/graphics/Color;->green(I)I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    int-to-float v7, v7

    .line 43
    div-float/2addr v7, v3

    .line 44
    invoke-static {v5}, Landroid/graphics/Color;->blue(I)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    int-to-float v5, v5

    .line 49
    div-float/2addr v5, v3

    .line 50
    const v8, -0xcf2016

    .line 51
    .line 52
    .line 53
    invoke-static {v8}, Landroid/graphics/Color;->red(I)I

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    int-to-float v9, v9

    .line 58
    div-float/2addr v9, v3

    .line 59
    invoke-static {v8}, Landroid/graphics/Color;->green(I)I

    .line 60
    .line 61
    .line 62
    move-result v10

    .line 63
    int-to-float v10, v10

    .line 64
    div-float/2addr v10, v3

    .line 65
    invoke-static {v8}, Landroid/graphics/Color;->blue(I)I

    .line 66
    .line 67
    .line 68
    move-result v8

    .line 69
    int-to-float v8, v8

    .line 70
    div-float/2addr v8, v3

    .line 71
    const v11, -0x15bc27

    .line 72
    .line 73
    .line 74
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 75
    .line 76
    .line 77
    move-result v12

    .line 78
    int-to-float v12, v12

    .line 79
    div-float/2addr v12, v3

    .line 80
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 81
    .line 82
    .line 83
    move-result v13

    .line 84
    int-to-float v13, v13

    .line 85
    div-float/2addr v13, v3

    .line 86
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 87
    .line 88
    .line 89
    move-result v11

    .line 90
    int-to-float v11, v11

    .line 91
    div-float/2addr v11, v3

    .line 92
    const/16 v14, 0xc

    .line 93
    .line 94
    new-array v15, v14, [F

    .line 95
    .line 96
    const/16 v16, 0x0

    .line 97
    .line 98
    aput v2, v15, v16

    .line 99
    .line 100
    const/4 v2, 0x1

    .line 101
    aput v4, v15, v2

    .line 102
    .line 103
    const/4 v4, 0x2

    .line 104
    aput v1, v15, v4

    .line 105
    .line 106
    const/4 v1, 0x3

    .line 107
    aput v6, v15, v1

    .line 108
    .line 109
    const/4 v6, 0x4

    .line 110
    aput v7, v15, v6

    .line 111
    .line 112
    const/4 v7, 0x5

    .line 113
    aput v5, v15, v7

    .line 114
    .line 115
    const/4 v5, 0x6

    .line 116
    aput v9, v15, v5

    .line 117
    .line 118
    const/4 v9, 0x7

    .line 119
    aput v10, v15, v9

    .line 120
    .line 121
    const/16 v10, 0x8

    .line 122
    .line 123
    aput v8, v15, v10

    .line 124
    .line 125
    const/16 v8, 0x9

    .line 126
    .line 127
    aput v12, v15, v8

    .line 128
    .line 129
    const/16 v12, 0xa

    .line 130
    .line 131
    aput v13, v15, v12

    .line 132
    .line 133
    const/16 v13, 0xb

    .line 134
    .line 135
    aput v11, v15, v13

    .line 136
    .line 137
    invoke-virtual {v0, v15}, Ll/wsf;->R1([F)V

    .line 138
    .line 139
    .line 140
    const v11, -0xe4e4da

    .line 141
    .line 142
    .line 143
    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    .line 144
    .line 145
    .line 146
    move-result v15

    .line 147
    int-to-float v15, v15

    .line 148
    div-float/2addr v15, v3

    .line 149
    move/from16 v17, v1

    .line 150
    .line 151
    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    int-to-float v1, v1

    .line 156
    div-float/2addr v1, v3

    .line 157
    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    .line 158
    .line 159
    .line 160
    move-result v11

    .line 161
    int-to-float v11, v11

    .line 162
    div-float/2addr v11, v3

    .line 163
    const v18, -0xf4f4b9

    .line 164
    .line 165
    .line 166
    move/from16 v19, v2

    .line 167
    .line 168
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->red(I)I

    .line 169
    .line 170
    .line 171
    move-result v2

    .line 172
    int-to-float v2, v2

    .line 173
    div-float/2addr v2, v3

    .line 174
    move/from16 v20, v3

    .line 175
    .line 176
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->green(I)I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    int-to-float v3, v3

    .line 181
    div-float v3, v3, v20

    .line 182
    .line 183
    move/from16 v21, v4

    .line 184
    .line 185
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->blue(I)I

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    int-to-float v4, v4

    .line 190
    div-float v4, v4, v20

    .line 191
    .line 192
    const v18, -0xfeaeae

    .line 193
    .line 194
    .line 195
    move/from16 v22, v5

    .line 196
    .line 197
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->red(I)I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    int-to-float v5, v5

    .line 202
    div-float v5, v5, v20

    .line 203
    .line 204
    move/from16 v23, v6

    .line 205
    .line 206
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->green(I)I

    .line 207
    .line 208
    .line 209
    move-result v6

    .line 210
    int-to-float v6, v6

    .line 211
    div-float v6, v6, v20

    .line 212
    .line 213
    move/from16 v24, v7

    .line 214
    .line 215
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->blue(I)I

    .line 216
    .line 217
    .line 218
    move-result v7

    .line 219
    int-to-float v7, v7

    .line 220
    div-float v7, v7, v20

    .line 221
    .line 222
    const v18, -0xd6e0d5

    .line 223
    .line 224
    .line 225
    move/from16 v25, v8

    .line 226
    .line 227
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->red(I)I

    .line 228
    .line 229
    .line 230
    move-result v8

    .line 231
    int-to-float v8, v8

    .line 232
    div-float v8, v8, v20

    .line 233
    .line 234
    move/from16 v26, v9

    .line 235
    .line 236
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->green(I)I

    .line 237
    .line 238
    .line 239
    move-result v9

    .line 240
    int-to-float v9, v9

    .line 241
    div-float v9, v9, v20

    .line 242
    .line 243
    move/from16 v27, v10

    .line 244
    .line 245
    invoke-static/range {v18 .. v18}, Landroid/graphics/Color;->blue(I)I

    .line 246
    .line 247
    .line 248
    move-result v10

    .line 249
    int-to-float v10, v10

    .line 250
    div-float v10, v10, v20

    .line 251
    .line 252
    new-array v14, v14, [F

    .line 253
    .line 254
    aput v15, v14, v16

    .line 255
    .line 256
    aput v1, v14, v19

    .line 257
    .line 258
    aput v11, v14, v21

    .line 259
    .line 260
    aput v2, v14, v17

    .line 261
    .line 262
    aput v3, v14, v23

    .line 263
    .line 264
    aput v4, v14, v24

    .line 265
    .line 266
    aput v5, v14, v22

    .line 267
    .line 268
    aput v6, v14, v26

    .line 269
    .line 270
    aput v7, v14, v27

    .line 271
    .line 272
    aput v8, v14, v25

    .line 273
    .line 274
    aput v9, v14, v12

    .line 275
    .line 276
    aput v10, v14, v13

    .line 277
    .line 278
    invoke-virtual {v0, v14}, Ll/wsf;->Q1([F)V

    .line 279
    .line 280
    .line 281
    return-void
.end method


# virtual methods
.method public Q1([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wsf;->g:[F

    .line 2
    .line 3
    return-void
.end method

.method public R1([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wsf;->f:[F

    .line 2
    .line 3
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float lightColors[12];\n uniform highp float darkColors[12];\n highp vec4 colorMatch(highp vec2 uv, highp vec3 lightColor, highp vec3 darkColor) {\n     vec4 color = texture2D(inputImageTexture0,fract(uv));\n     float luma = dot(color.rgb,vec3(0.299,0.587,0.114));\n     vec3 col = clamp(color.rgb,0.0,1.0);\n     col = mix(darkColor, lightColor,luma);\n     return vec4(col,1.0);\n }\n void main() {\n     highp vec2 uv = textureCoordinate;\n     uv *= 2.0;\n     int i = int(floor(uv.x)) + int(floor(uv.y)) * 2;\n     vec3 lightColor = vec3(lightColors[0 + i * 3], lightColors[1+ i * 3], lightColors[2 + i * 3]);\n     vec3 darkColor = vec3(darkColors[0 + i * 3], darkColors[1 + i * 3], darkColors[2 + i * 3]);\n     gl_FragColor = colorMatch(fract(uv), lightColor, darkColor);\n }\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bs2;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "lightColors"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/wsf;->d:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "darkColors"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/wsf;->e:I

    .line 23
    .line 24
    return-void
.end method

.method public passShaderValues()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/bs2;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wsf;->d:I

    .line 5
    .line 6
    iget-object v1, p0, Ll/wsf;->f:[F

    .line 7
    .line 8
    const/16 v2, 0xc

    .line 9
    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {v0, v2, v1, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Ll/wsf;->e:I

    .line 15
    .line 16
    iget-object p0, p0, Ll/wsf;->g:[F

    .line 17
    .line 18
    invoke-static {v0, v2, p0, v3}, Landroid/opengl/GLES20;->glUniform1fv(II[FI)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
