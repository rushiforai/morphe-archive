.class public Ll/ph0;
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
    iput v0, p0, Ll/ph0;->k:F

    .line 7
    .line 8
    iput v0, p0, Ll/ph0;->l:F

    .line 9
    .line 10
    iput v0, p0, Ll/ph0;->m:F

    .line 11
    .line 12
    iput v0, p0, Ll/ph0;->n:F

    .line 13
    .line 14
    iput v0, p0, Ll/ph0;->o:F

    .line 15
    .line 16
    iput v0, p0, Ll/ph0;->p:F

    .line 17
    .line 18
    iput v0, p0, Ll/ph0;->q:F

    .line 19
    .line 20
    iput v0, p0, Ll/ph0;->r:F

    .line 21
    .line 22
    const v0, 0x3f19999a    # 0.6f

    .line 23
    .line 24
    .line 25
    iput v0, p0, Ll/ph0;->s:F

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Ll/ph0;->t:Z

    .line 29
    .line 30
    const/16 v0, 0x19

    .line 31
    .line 32
    iput v0, p0, Ll/ph0;->u:I

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public Q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ph0;->t:Z

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput p1, p0, Ll/ph0;->k:F

    .line 5
    .line 6
    iput p1, p0, Ll/ph0;->l:F

    .line 7
    .line 8
    iput p1, p0, Ll/ph0;->m:F

    .line 9
    .line 10
    iput p1, p0, Ll/ph0;->n:F

    .line 11
    .line 12
    iput p1, p0, Ll/ph0;->o:F

    .line 13
    .line 14
    iput p1, p0, Ll/ph0;->p:F

    .line 15
    .line 16
    iput p1, p0, Ll/ph0;->q:F

    .line 17
    .line 18
    iput p1, p0, Ll/ph0;->r:F

    .line 19
    .line 20
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float shiftBottom;\nuniform float shiftBottom2;\nuniform float shiftBottom3;\nuniform float shiftTop;\nuniform float shiftTop2;\nuniform float shiftTop3;\nuniform float shiftCenter;\nuniform float shiftCenter1;\nuniform float shift;\nconst vec3 W = vec3(0.2125,0.7154,0.0721);\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = textureCoordinate;\n    uv = scaleFromCenter(uv,shift);\n if (uv.x <= -0.2*uv.y + 0.4 ) {\n        if (uv.y < shiftBottom && uv.y > shiftBottom2) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        }else if (uv.y < shiftBottom2 && uv.y > shiftBottom3) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }else if (uv.y > shiftBottom){\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        } else {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }\n    }else if (uv.x >= -0.2*uv.y + 0.8) {\n        if (uv.y < shiftTop && uv.y > shiftTop2) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        }else if (uv.y < shiftTop2 && uv.y > shiftTop3) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }else if (uv.y > shiftTop){\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        } else {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }\n    } else {\n        if (uv.y > 1. - shiftCenter && uv.y < 1.0 -  shiftCenter1) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        } else if (uv.y > 1.0 - shiftCenter){\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }else {\n          gl_FragColor = texture2D(inputImageTexture1,uv1);\n        }\n    }}\n"

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
    iput v0, p0, Ll/ph0;->a:I

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
    iput v0, p0, Ll/ph0;->b:I

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
    iput v0, p0, Ll/ph0;->c:I

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
    iput v0, p0, Ll/ph0;->d:I

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
    iput v0, p0, Ll/ph0;->e:I

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
    iput v0, p0, Ll/ph0;->f:I

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
    iput v0, p0, Ll/ph0;->g:I

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
    iput v0, p0, Ll/ph0;->i:I

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
    iput v0, p0, Ll/ph0;->j:I

    .line 93
    .line 94
    return-void
.end method

.method public passShaderValues()V
    .locals 8

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ph0;->t:Z

    .line 5
    .line 6
    if-eqz v0, :cond_8

    .line 7
    .line 8
    iget v0, p0, Ll/ph0;->s:F

    .line 9
    .line 10
    iget v1, p0, Ll/ph0;->u:I

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
    iput v0, p0, Ll/ph0;->s:F

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
    iput v2, p0, Ll/ph0;->s:F

    .line 30
    .line 31
    :cond_0
    iget v0, p0, Ll/ph0;->k:F

    .line 32
    .line 33
    int-to-float v3, v1

    .line 34
    div-float v3, v2, v3

    .line 35
    .line 36
    add-float/2addr v0, v3

    .line 37
    iput v0, p0, Ll/ph0;->k:F

    .line 38
    .line 39
    float-to-double v6, v0

    .line 40
    cmpl-double v0, v6, v4

    .line 41
    .line 42
    if-ltz v0, :cond_1

    .line 43
    .line 44
    iput v2, p0, Ll/ph0;->k:F

    .line 45
    .line 46
    :cond_1
    iget v0, p0, Ll/ph0;->k:F

    .line 47
    .line 48
    float-to-double v3, v0

    .line 49
    const-wide v5, 0x3fe999999999999aL    # 0.8

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    cmpl-double v0, v3, v5

    .line 55
    .line 56
    if-ltz v0, :cond_8

    .line 57
    .line 58
    iget v0, p0, Ll/ph0;->l:F

    .line 59
    .line 60
    int-to-float v3, v1

    .line 61
    const/high16 v4, 0x40000000    # 2.0f

    .line 62
    .line 63
    div-float v3, v4, v3

    .line 64
    .line 65
    add-float/2addr v0, v3

    .line 66
    iput v0, p0, Ll/ph0;->l:F

    .line 67
    .line 68
    cmpl-float v0, v0, v2

    .line 69
    .line 70
    if-ltz v0, :cond_2

    .line 71
    .line 72
    iput v2, p0, Ll/ph0;->l:F

    .line 73
    .line 74
    :cond_2
    iget v0, p0, Ll/ph0;->l:F

    .line 75
    .line 76
    const v3, 0x3f4ccccd    # 0.8f

    .line 77
    .line 78
    .line 79
    cmpl-float v0, v0, v3

    .line 80
    .line 81
    if-ltz v0, :cond_3

    .line 82
    .line 83
    iget v0, p0, Ll/ph0;->m:F

    .line 84
    .line 85
    int-to-float v3, v1

    .line 86
    div-float v3, v2, v3

    .line 87
    .line 88
    add-float/2addr v0, v3

    .line 89
    iput v0, p0, Ll/ph0;->m:F

    .line 90
    .line 91
    cmpl-float v0, v0, v2

    .line 92
    .line 93
    if-ltz v0, :cond_3

    .line 94
    .line 95
    iput v2, p0, Ll/ph0;->m:F

    .line 96
    .line 97
    :cond_3
    iget v0, p0, Ll/ph0;->q:F

    .line 98
    .line 99
    int-to-float v3, v1

    .line 100
    div-float v3, v2, v3

    .line 101
    .line 102
    add-float/2addr v0, v3

    .line 103
    iput v0, p0, Ll/ph0;->q:F

    .line 104
    .line 105
    cmpl-float v0, v0, v2

    .line 106
    .line 107
    if-ltz v0, :cond_4

    .line 108
    .line 109
    iput v2, p0, Ll/ph0;->q:F

    .line 110
    .line 111
    :cond_4
    iget v0, p0, Ll/ph0;->q:F

    .line 112
    .line 113
    const v3, 0x3f19999a    # 0.6f

    .line 114
    .line 115
    .line 116
    cmpl-float v0, v0, v3

    .line 117
    .line 118
    if-lez v0, :cond_5

    .line 119
    .line 120
    iget v0, p0, Ll/ph0;->r:F

    .line 121
    .line 122
    int-to-float v3, v1

    .line 123
    div-float v3, v4, v3

    .line 124
    .line 125
    add-float/2addr v0, v3

    .line 126
    iput v0, p0, Ll/ph0;->r:F

    .line 127
    .line 128
    cmpl-float v0, v0, v2

    .line 129
    .line 130
    if-ltz v0, :cond_5

    .line 131
    .line 132
    iput v2, p0, Ll/ph0;->r:F

    .line 133
    .line 134
    :cond_5
    iget v0, p0, Ll/ph0;->n:F

    .line 135
    .line 136
    int-to-float v3, v1

    .line 137
    div-float v3, v2, v3

    .line 138
    .line 139
    add-float/2addr v0, v3

    .line 140
    iput v0, p0, Ll/ph0;->n:F

    .line 141
    .line 142
    cmpl-float v0, v0, v2

    .line 143
    .line 144
    if-ltz v0, :cond_6

    .line 145
    .line 146
    iput v2, p0, Ll/ph0;->n:F

    .line 147
    .line 148
    :cond_6
    iget v0, p0, Ll/ph0;->n:F

    .line 149
    .line 150
    const v3, 0x3f666666    # 0.9f

    .line 151
    .line 152
    .line 153
    cmpl-float v0, v0, v3

    .line 154
    .line 155
    if-lez v0, :cond_7

    .line 156
    .line 157
    iget v0, p0, Ll/ph0;->o:F

    .line 158
    .line 159
    int-to-float v3, v1

    .line 160
    div-float/2addr v4, v3

    .line 161
    add-float/2addr v0, v4

    .line 162
    iput v0, p0, Ll/ph0;->o:F

    .line 163
    .line 164
    cmpl-float v0, v0, v2

    .line 165
    .line 166
    if-ltz v0, :cond_7

    .line 167
    .line 168
    iput v2, p0, Ll/ph0;->o:F

    .line 169
    .line 170
    :cond_7
    iget v0, p0, Ll/ph0;->o:F

    .line 171
    .line 172
    const v3, 0x3f333333    # 0.7f

    .line 173
    .line 174
    .line 175
    cmpl-float v0, v0, v3

    .line 176
    .line 177
    if-ltz v0, :cond_8

    .line 178
    .line 179
    iget v0, p0, Ll/ph0;->p:F

    .line 180
    .line 181
    int-to-float v1, v1

    .line 182
    div-float v1, v2, v1

    .line 183
    .line 184
    add-float/2addr v0, v1

    .line 185
    iput v0, p0, Ll/ph0;->p:F

    .line 186
    .line 187
    cmpl-float v0, v0, v2

    .line 188
    .line 189
    if-ltz v0, :cond_8

    .line 190
    .line 191
    iput v2, p0, Ll/ph0;->p:F

    .line 192
    .line 193
    const/4 v0, 0x0

    .line 194
    iput-boolean v0, p0, Ll/ph0;->t:Z

    .line 195
    .line 196
    :cond_8
    iget v0, p0, Ll/ph0;->a:I

    .line 197
    .line 198
    iget v1, p0, Ll/ph0;->k:F

    .line 199
    .line 200
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 201
    .line 202
    .line 203
    iget v0, p0, Ll/ph0;->b:I

    .line 204
    .line 205
    iget v1, p0, Ll/ph0;->l:F

    .line 206
    .line 207
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 208
    .line 209
    .line 210
    iget v0, p0, Ll/ph0;->c:I

    .line 211
    .line 212
    iget v1, p0, Ll/ph0;->m:F

    .line 213
    .line 214
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 215
    .line 216
    .line 217
    iget v0, p0, Ll/ph0;->d:I

    .line 218
    .line 219
    iget v1, p0, Ll/ph0;->n:F

    .line 220
    .line 221
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 222
    .line 223
    .line 224
    iget v0, p0, Ll/ph0;->e:I

    .line 225
    .line 226
    iget v1, p0, Ll/ph0;->o:F

    .line 227
    .line 228
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 229
    .line 230
    .line 231
    iget v0, p0, Ll/ph0;->f:I

    .line 232
    .line 233
    iget v1, p0, Ll/ph0;->p:F

    .line 234
    .line 235
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 236
    .line 237
    .line 238
    iget v0, p0, Ll/ph0;->g:I

    .line 239
    .line 240
    iget v1, p0, Ll/ph0;->q:F

    .line 241
    .line 242
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 243
    .line 244
    .line 245
    iget v0, p0, Ll/ph0;->i:I

    .line 246
    .line 247
    iget v1, p0, Ll/ph0;->r:F

    .line 248
    .line 249
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 250
    .line 251
    .line 252
    iget v0, p0, Ll/ph0;->j:I

    .line 253
    .line 254
    iget p0, p0, Ll/ph0;->s:F

    .line 255
    .line 256
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 257
    .line 258
    .line 259
    return-void
.end method
