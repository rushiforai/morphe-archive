.class public Ll/lh0;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private i:I

.field private j:I

.field private k:F

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private p:F

.field private q:F

.field private r:F

.field private s:F

.field private t:Z

.field private u:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/lh0;->k:F

    .line 7
    .line 8
    iput v0, p0, Ll/lh0;->l:F

    .line 9
    .line 10
    iput v0, p0, Ll/lh0;->m:F

    .line 11
    .line 12
    iput v0, p0, Ll/lh0;->n:F

    .line 13
    .line 14
    iput v0, p0, Ll/lh0;->o:F

    .line 15
    .line 16
    iput v0, p0, Ll/lh0;->p:F

    .line 17
    .line 18
    iput v0, p0, Ll/lh0;->q:F

    .line 19
    .line 20
    iput v0, p0, Ll/lh0;->r:F

    .line 21
    .line 22
    const/high16 v0, 0x3f000000    # 0.5f

    .line 23
    .line 24
    iput v0, p0, Ll/lh0;->s:F

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    iput-boolean v0, p0, Ll/lh0;->t:Z

    .line 28
    .line 29
    const/16 v0, 0x19

    .line 30
    .line 31
    iput v0, p0, Ll/lh0;->u:I

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public Q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/lh0;->t:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/lh0;->k:F

    .line 5
    .line 6
    iput p1, p0, Ll/lh0;->l:F

    .line 7
    .line 8
    iput p1, p0, Ll/lh0;->m:F

    .line 9
    .line 10
    iput p1, p0, Ll/lh0;->n:F

    .line 11
    .line 12
    iput p1, p0, Ll/lh0;->o:F

    .line 13
    .line 14
    iput p1, p0, Ll/lh0;->p:F

    .line 15
    .line 16
    iput p1, p0, Ll/lh0;->q:F

    .line 17
    .line 18
    iput p1, p0, Ll/lh0;->r:F

    .line 19
    .line 20
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float shiftBottom;\nuniform float shiftBottom2;\nuniform float shiftBottom3;\nuniform float shiftTop;\nuniform float shiftTop2;\nuniform float shiftTop3;\nuniform float shiftCenter;\nuniform float shiftCenter1;\nuniform float shift;\nconst vec3 W = vec3(0.2125,0.7154,0.0721);\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = textureCoordinate;\n    uv = scaleFromCenter(uv,shift);\n if (uv.y <= -0.2*uv.x + 0.4 ) {\n        if (uv.x < shiftBottom && uv.x > shiftBottom2) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        }else if (uv.x < shiftBottom2 && uv.x > shiftBottom3) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }else if (uv.x > shiftBottom){\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        } else {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }\n    }else if (uv.y >= -0.2*uv.x + 0.8) {\n        if (uv.x < shiftTop && uv.x > shiftTop2) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        }else if (uv.x < shiftTop2 && uv.x > shiftTop3) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }else if (uv.x > shiftTop){\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        } else {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }\n    } else {\n        if (uv.x > 1. - shiftCenter && uv.x < 1.0 -  shiftCenter1) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        } else if (uv.x > 1.0 - shiftCenter){\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }else {\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        }\n    }}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/hs10;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "shiftBottom"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/lh0;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "shiftBottom2"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/lh0;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "shiftBottom3"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/lh0;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "shiftTop"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/lh0;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "shiftTop2"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/lh0;->e:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "shiftTop3"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/lh0;->f:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "shiftCenter"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Ll/lh0;->g:I

    .line 73
    .line 74
    iget v0, p0, Ll/wej;->programHandle:I

    .line 75
    .line 76
    const-string v1, "shiftCenter1"

    .line 77
    .line 78
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    iput v0, p0, Ll/lh0;->i:I

    .line 83
    .line 84
    iget v0, p0, Ll/wej;->programHandle:I

    .line 85
    .line 86
    const-string v1, "shift"

    .line 87
    .line 88
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Ll/lh0;->j:I

    .line 93
    .line 94
    return-void
.end method

.method public passShaderValues()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/lh0;->t:Z

    .line 5
    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    iget v0, p0, Ll/lh0;->s:F

    .line 9
    .line 10
    iget v1, p0, Ll/lh0;->u:I

    .line 11
    .line 12
    int-to-float v2, v1

    .line 13
    const v3, 0x3e4ccccd    # 0.2f

    .line 14
    .line 15
    .line 16
    div-float/2addr v3, v2

    .line 17
    add-float/2addr v0, v3

    .line 18
    iput v0, p0, Ll/lh0;->s:F

    .line 19
    .line 20
    float-to-double v2, v0

    .line 21
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 22
    .line 23
    cmpl-double v0, v2, v4

    .line 24
    .line 25
    const/high16 v2, 0x3f800000    # 1.0f

    .line 26
    .line 27
    if-ltz v0, :cond_0

    .line 28
    .line 29
    iput v2, p0, Ll/lh0;->s:F

    .line 30
    .line 31
    :cond_0
    iget v0, p0, Ll/lh0;->k:F

    .line 32
    .line 33
    int-to-float v3, v1

    .line 34
    const/high16 v6, 0x40000000    # 2.0f

    .line 35
    .line 36
    div-float v3, v6, v3

    .line 37
    .line 38
    add-float/2addr v0, v3

    .line 39
    iput v0, p0, Ll/lh0;->k:F

    .line 40
    .line 41
    float-to-double v7, v0

    .line 42
    cmpl-double v0, v7, v4

    .line 43
    .line 44
    if-ltz v0, :cond_1

    .line 45
    .line 46
    iput v2, p0, Ll/lh0;->k:F

    .line 47
    .line 48
    :cond_1
    iget v0, p0, Ll/lh0;->k:F

    .line 49
    .line 50
    float-to-double v3, v0

    .line 51
    const-wide v7, 0x3fe999999999999aL    # 0.8

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    cmpl-double v0, v3, v7

    .line 57
    .line 58
    if-ltz v0, :cond_8

    .line 59
    .line 60
    iget v0, p0, Ll/lh0;->l:F

    .line 61
    .line 62
    int-to-float v3, v1

    .line 63
    div-float v3, v6, v3

    .line 64
    .line 65
    add-float/2addr v0, v3

    .line 66
    iput v0, p0, Ll/lh0;->l:F

    .line 67
    .line 68
    cmpl-float v0, v0, v2

    .line 69
    .line 70
    if-ltz v0, :cond_2

    .line 71
    .line 72
    iput v2, p0, Ll/lh0;->l:F

    .line 73
    .line 74
    :cond_2
    iget v0, p0, Ll/lh0;->l:F

    .line 75
    .line 76
    const v3, 0x3f4ccccd    # 0.8f

    .line 77
    .line 78
    .line 79
    cmpl-float v0, v0, v3

    .line 80
    .line 81
    const/high16 v3, 0x40800000    # 4.0f

    .line 82
    .line 83
    if-ltz v0, :cond_3

    .line 84
    .line 85
    iget v0, p0, Ll/lh0;->m:F

    .line 86
    .line 87
    int-to-float v4, v1

    .line 88
    div-float v4, v3, v4

    .line 89
    .line 90
    add-float/2addr v0, v4

    .line 91
    iput v0, p0, Ll/lh0;->m:F

    .line 92
    .line 93
    cmpl-float v0, v0, v2

    .line 94
    .line 95
    if-ltz v0, :cond_3

    .line 96
    .line 97
    iput v2, p0, Ll/lh0;->m:F

    .line 98
    .line 99
    :cond_3
    iget v0, p0, Ll/lh0;->q:F

    .line 100
    .line 101
    int-to-float v4, v1

    .line 102
    div-float v4, v6, v4

    .line 103
    .line 104
    add-float/2addr v0, v4

    .line 105
    iput v0, p0, Ll/lh0;->q:F

    .line 106
    .line 107
    cmpl-float v0, v0, v2

    .line 108
    .line 109
    if-ltz v0, :cond_4

    .line 110
    .line 111
    iput v2, p0, Ll/lh0;->q:F

    .line 112
    .line 113
    :cond_4
    iget v0, p0, Ll/lh0;->q:F

    .line 114
    .line 115
    const v4, 0x3f19999a    # 0.6f

    .line 116
    .line 117
    .line 118
    cmpl-float v0, v0, v4

    .line 119
    .line 120
    if-lez v0, :cond_5

    .line 121
    .line 122
    iget v0, p0, Ll/lh0;->r:F

    .line 123
    .line 124
    int-to-float v4, v1

    .line 125
    div-float v4, v6, v4

    .line 126
    .line 127
    add-float/2addr v0, v4

    .line 128
    iput v0, p0, Ll/lh0;->r:F

    .line 129
    .line 130
    cmpl-float v0, v0, v2

    .line 131
    .line 132
    if-ltz v0, :cond_5

    .line 133
    .line 134
    iput v2, p0, Ll/lh0;->r:F

    .line 135
    .line 136
    :cond_5
    iget v0, p0, Ll/lh0;->n:F

    .line 137
    .line 138
    int-to-float v4, v1

    .line 139
    div-float v4, v6, v4

    .line 140
    .line 141
    add-float/2addr v0, v4

    .line 142
    iput v0, p0, Ll/lh0;->n:F

    .line 143
    .line 144
    cmpl-float v0, v0, v2

    .line 145
    .line 146
    if-ltz v0, :cond_6

    .line 147
    .line 148
    iput v2, p0, Ll/lh0;->n:F

    .line 149
    .line 150
    :cond_6
    iget v0, p0, Ll/lh0;->n:F

    .line 151
    .line 152
    const v4, 0x3f666666    # 0.9f

    .line 153
    .line 154
    .line 155
    cmpl-float v0, v0, v4

    .line 156
    .line 157
    if-lez v0, :cond_7

    .line 158
    .line 159
    iget v0, p0, Ll/lh0;->o:F

    .line 160
    .line 161
    int-to-float v4, v1

    .line 162
    div-float/2addr v6, v4

    .line 163
    add-float/2addr v0, v6

    .line 164
    iput v0, p0, Ll/lh0;->o:F

    .line 165
    .line 166
    cmpl-float v0, v0, v2

    .line 167
    .line 168
    if-ltz v0, :cond_7

    .line 169
    .line 170
    iput v2, p0, Ll/lh0;->o:F

    .line 171
    .line 172
    :cond_7
    iget v0, p0, Ll/lh0;->o:F

    .line 173
    .line 174
    const v4, 0x3f333333    # 0.7f

    .line 175
    .line 176
    .line 177
    cmpl-float v0, v0, v4

    .line 178
    .line 179
    if-ltz v0, :cond_8

    .line 180
    .line 181
    iget v0, p0, Ll/lh0;->p:F

    .line 182
    .line 183
    int-to-float v1, v1

    .line 184
    div-float/2addr v3, v1

    .line 185
    add-float/2addr v0, v3

    .line 186
    iput v0, p0, Ll/lh0;->p:F

    .line 187
    .line 188
    cmpl-float v0, v0, v2

    .line 189
    .line 190
    if-ltz v0, :cond_8

    .line 191
    .line 192
    iput v2, p0, Ll/lh0;->p:F

    .line 193
    .line 194
    const/4 v0, 0x0

    .line 195
    iput-boolean v0, p0, Ll/lh0;->t:Z

    .line 196
    .line 197
    :cond_8
    iget v0, p0, Ll/lh0;->a:I

    .line 198
    .line 199
    iget v1, p0, Ll/lh0;->k:F

    .line 200
    .line 201
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 202
    .line 203
    .line 204
    iget v0, p0, Ll/lh0;->b:I

    .line 205
    .line 206
    iget v1, p0, Ll/lh0;->l:F

    .line 207
    .line 208
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 209
    .line 210
    .line 211
    iget v0, p0, Ll/lh0;->c:I

    .line 212
    .line 213
    iget v1, p0, Ll/lh0;->m:F

    .line 214
    .line 215
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 216
    .line 217
    .line 218
    iget v0, p0, Ll/lh0;->d:I

    .line 219
    .line 220
    iget v1, p0, Ll/lh0;->n:F

    .line 221
    .line 222
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 223
    .line 224
    .line 225
    iget v0, p0, Ll/lh0;->e:I

    .line 226
    .line 227
    iget v1, p0, Ll/lh0;->o:F

    .line 228
    .line 229
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 230
    .line 231
    .line 232
    iget v0, p0, Ll/lh0;->f:I

    .line 233
    .line 234
    iget v1, p0, Ll/lh0;->p:F

    .line 235
    .line 236
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 237
    .line 238
    .line 239
    iget v0, p0, Ll/lh0;->g:I

    .line 240
    .line 241
    iget v1, p0, Ll/lh0;->q:F

    .line 242
    .line 243
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 244
    .line 245
    .line 246
    iget v0, p0, Ll/lh0;->i:I

    .line 247
    .line 248
    iget v1, p0, Ll/lh0;->r:F

    .line 249
    .line 250
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 251
    .line 252
    .line 253
    iget v0, p0, Ll/lh0;->j:I

    .line 254
    .line 255
    iget p0, p0, Ll/lh0;->s:F

    .line 256
    .line 257
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 258
    .line 259
    .line 260
    return-void
.end method
