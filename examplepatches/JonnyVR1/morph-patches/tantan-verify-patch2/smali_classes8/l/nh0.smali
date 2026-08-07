.class public Ll/nh0;
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

.field private k:I

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private p:F

.field private q:F

.field private r:F

.field private s:F

.field private t:F

.field private u:F

.field private v:Z

.field private x:I


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
    iput v0, p0, Ll/nh0;->l:F

    .line 7
    .line 8
    iput v0, p0, Ll/nh0;->m:F

    .line 9
    .line 10
    iput v0, p0, Ll/nh0;->n:F

    .line 11
    .line 12
    iput v0, p0, Ll/nh0;->o:F

    .line 13
    .line 14
    iput v0, p0, Ll/nh0;->p:F

    .line 15
    .line 16
    iput v0, p0, Ll/nh0;->q:F

    .line 17
    .line 18
    iput v0, p0, Ll/nh0;->r:F

    .line 19
    .line 20
    iput v0, p0, Ll/nh0;->s:F

    .line 21
    .line 22
    iput v0, p0, Ll/nh0;->t:F

    .line 23
    .line 24
    const/high16 v0, 0x3f000000    # 0.5f

    .line 25
    .line 26
    iput v0, p0, Ll/nh0;->u:F

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Ll/nh0;->v:Z

    .line 30
    .line 31
    const/16 v0, 0x19

    .line 32
    .line 33
    iput v0, p0, Ll/nh0;->x:I

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public Q1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/nh0;->v:Z

    .line 2
    .line 3
    const/high16 p1, 0x3f000000    # 0.5f

    .line 4
    .line 5
    iput p1, p0, Ll/nh0;->u:F

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Ll/nh0;->l:F

    .line 9
    .line 10
    iput p1, p0, Ll/nh0;->m:F

    .line 11
    .line 12
    iput p1, p0, Ll/nh0;->n:F

    .line 13
    .line 14
    iput p1, p0, Ll/nh0;->o:F

    .line 15
    .line 16
    iput p1, p0, Ll/nh0;->p:F

    .line 17
    .line 18
    iput p1, p0, Ll/nh0;->q:F

    .line 19
    .line 20
    iput p1, p0, Ll/nh0;->r:F

    .line 21
    .line 22
    iput p1, p0, Ll/nh0;->s:F

    .line 23
    .line 24
    iput p1, p0, Ll/nh0;->t:F

    .line 25
    .line 26
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nuniform float shiftBottom;\nuniform float shiftBottom2;\nuniform float shiftBottom3;\nuniform float shiftTop;\nuniform float shiftTop2;\nuniform float shiftTop3;\nuniform float shiftCenter;\nuniform float shiftCenter1;\nuniform float shiftCenter2;\nuniform float shift;\nconst vec3 W = vec3(0.2125,0.7154,0.0721);\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    vec2 uv1 = textureCoordinate;\n    gl_FragColor = texture2D(inputImageTexture1,uv1);\n    uv = scaleFromCenter(uv,shift);\n if (uv.y >= -5.*uv.x + 4. ) {\n        if (uv.y > 1.0 - shiftBottom ) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));\n        }         if (uv.y > 1.0 - shiftBottom2 ) {          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n        if (uv.y > 1.0 - shiftBottom3 ) {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }  }  if (uv.y > -5.*uv.x + 3.9 && uv.y <= -5.*uv.x + 4.0 ) {\n        if (uv.y > 1.0 - shiftBottom + 0.01 ) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv + vec2(0.1,0.01))*vec4( 1.0,0.,0.,1.0));\n        }\n        if (uv.y > 1.0 - shiftBottom2 - 0.01 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n        if (uv.y > 1.0 - shiftBottom3 ) {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }  }if (uv.y > -5.*uv.x + 3.8 && uv.y <= -5.*uv.x + 3.9 ) {\n        if (uv.y > 1.0 - shiftBottom + 0.02) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv + vec2(0.1,0.02))*vec4( 1.0,0.,0.,1.0));\n        }\n        if (uv.y > 1.0 - shiftBottom2 - 0.02 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n        if (uv.y > 1.0 - shiftBottom3 ) {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        }  }if (uv.y < -5.*uv.x + 4. && uv.y <= 5.0 * uv.x - 1.0) {        if (uv.y < shiftCenter) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));        }\n        if (uv.y < shiftCenter1 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n        if (uv.y < shiftCenter2 ) {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        } }if (uv.y > 5.0 * uv.x - 1.0 && uv.y < 5.0 * uv.x - 0.9) {        if (uv.y < shiftCenter - 0.01) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv + vec2(0.01,0.02))*vec4( 1.0,0.,0.,1.0));        }\n        if (uv.y < shiftCenter1 - 0.01 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n}if (uv.y > 5.0 * uv.x - 0.9 && uv.y < 5.0 * uv.x - 0.8) {        if (uv.y < shiftCenter - 0.02) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv + vec2(0.01,0.01))*vec4( 1.0,0.,0.,1.0));        }\n        if (uv.y < shiftCenter1 - 0.02 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n}if (uv.y > 5.0 * uv.x - 1.0){        if (uv.y >= 1.0 - shiftTop) {\n          gl_FragColor = (texture2D(inputImageTexture0,uv)*vec4( 1.0,0.,0.,1.0));        }\n        if (uv.y > 1.0 - shiftTop2 ) {\n          vec3 color = texture2D(inputImageTexture0,uv).rgb;\n          float luminace = dot(color,W);\n          gl_FragColor = vec4(luminace,luminace,luminace,1.0);\n        }\n        if (uv.y > 1.0 - shiftTop3 ) {\n          gl_FragColor = texture2D(inputImageTexture0,uv);\n        } }}\n"

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
    iput v0, p0, Ll/nh0;->a:I

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
    iput v0, p0, Ll/nh0;->b:I

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
    iput v0, p0, Ll/nh0;->c:I

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
    iput v0, p0, Ll/nh0;->d:I

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
    iput v0, p0, Ll/nh0;->e:I

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
    iput v0, p0, Ll/nh0;->f:I

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
    iput v0, p0, Ll/nh0;->g:I

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
    iput v0, p0, Ll/nh0;->i:I

    .line 83
    .line 84
    iget v0, p0, Ll/wej;->programHandle:I

    .line 85
    .line 86
    const-string v1, "shiftCenter2"

    .line 87
    .line 88
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput v0, p0, Ll/nh0;->j:I

    .line 93
    .line 94
    iget v0, p0, Ll/wej;->programHandle:I

    .line 95
    .line 96
    const-string v1, "shift"

    .line 97
    .line 98
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p0, Ll/nh0;->k:I

    .line 103
    .line 104
    return-void
.end method

.method public passShaderValues()V
    .locals 11

    .line 1
    invoke-super {p0}, Ll/hs10;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/nh0;->v:Z

    .line 5
    .line 6
    if-eqz v0, :cond_9

    .line 7
    .line 8
    iget v0, p0, Ll/nh0;->u:F

    .line 9
    .line 10
    iget v1, p0, Ll/nh0;->x:I

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
    iput v0, p0, Ll/nh0;->u:F

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
    iput v2, p0, Ll/nh0;->u:F

    .line 30
    .line 31
    :cond_0
    iget v0, p0, Ll/nh0;->l:F

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
    iput v0, p0, Ll/nh0;->l:F

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
    iput v2, p0, Ll/nh0;->l:F

    .line 47
    .line 48
    :cond_1
    iget v0, p0, Ll/nh0;->l:F

    .line 49
    .line 50
    float-to-double v3, v0

    .line 51
    const-wide v7, 0x3fe3333333333333L    # 0.6

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    cmpl-double v0, v3, v7

    .line 57
    .line 58
    if-ltz v0, :cond_9

    .line 59
    .line 60
    iget v0, p0, Ll/nh0;->m:F

    .line 61
    .line 62
    int-to-float v3, v1

    .line 63
    div-float v3, v6, v3

    .line 64
    .line 65
    add-float/2addr v0, v3

    .line 66
    iput v0, p0, Ll/nh0;->m:F

    .line 67
    .line 68
    cmpl-float v0, v0, v2

    .line 69
    .line 70
    if-ltz v0, :cond_2

    .line 71
    .line 72
    iput v2, p0, Ll/nh0;->m:F

    .line 73
    .line 74
    :cond_2
    iget v0, p0, Ll/nh0;->m:F

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
    iget v0, p0, Ll/nh0;->n:F

    .line 86
    .line 87
    int-to-float v4, v1

    .line 88
    div-float v4, v3, v4

    .line 89
    .line 90
    add-float/2addr v0, v4

    .line 91
    iput v0, p0, Ll/nh0;->n:F

    .line 92
    .line 93
    cmpl-float v0, v0, v2

    .line 94
    .line 95
    if-ltz v0, :cond_3

    .line 96
    .line 97
    iput v2, p0, Ll/nh0;->n:F

    .line 98
    .line 99
    :cond_3
    iget v0, p0, Ll/nh0;->r:F

    .line 100
    .line 101
    int-to-float v4, v1

    .line 102
    div-float v4, v6, v4

    .line 103
    .line 104
    add-float/2addr v0, v4

    .line 105
    iput v0, p0, Ll/nh0;->r:F

    .line 106
    .line 107
    cmpl-float v0, v0, v2

    .line 108
    .line 109
    if-ltz v0, :cond_4

    .line 110
    .line 111
    iput v2, p0, Ll/nh0;->r:F

    .line 112
    .line 113
    :cond_4
    iget v0, p0, Ll/nh0;->r:F

    .line 114
    .line 115
    const v4, 0x3f19999a    # 0.6f

    .line 116
    .line 117
    .line 118
    cmpl-float v0, v0, v4

    .line 119
    .line 120
    if-lez v0, :cond_9

    .line 121
    .line 122
    iget v0, p0, Ll/nh0;->s:F

    .line 123
    .line 124
    int-to-float v5, v1

    .line 125
    div-float v5, v6, v5

    .line 126
    .line 127
    add-float/2addr v0, v5

    .line 128
    iput v0, p0, Ll/nh0;->s:F

    .line 129
    .line 130
    cmpl-float v0, v0, v2

    .line 131
    .line 132
    if-ltz v0, :cond_5

    .line 133
    .line 134
    iput v2, p0, Ll/nh0;->s:F

    .line 135
    .line 136
    :cond_5
    iget v0, p0, Ll/nh0;->s:F

    .line 137
    .line 138
    float-to-double v9, v0

    .line 139
    cmpl-double v0, v9, v7

    .line 140
    .line 141
    if-lez v0, :cond_6

    .line 142
    .line 143
    iget v0, p0, Ll/nh0;->t:F

    .line 144
    .line 145
    int-to-float v5, v1

    .line 146
    div-float v5, v3, v5

    .line 147
    .line 148
    add-float/2addr v0, v5

    .line 149
    iput v0, p0, Ll/nh0;->t:F

    .line 150
    .line 151
    cmpl-float v0, v0, v2

    .line 152
    .line 153
    if-ltz v0, :cond_6

    .line 154
    .line 155
    iput v2, p0, Ll/nh0;->t:F

    .line 156
    .line 157
    :cond_6
    iget v0, p0, Ll/nh0;->o:F

    .line 158
    .line 159
    int-to-float v5, v1

    .line 160
    div-float v5, v6, v5

    .line 161
    .line 162
    add-float/2addr v0, v5

    .line 163
    iput v0, p0, Ll/nh0;->o:F

    .line 164
    .line 165
    cmpl-float v0, v0, v2

    .line 166
    .line 167
    if-ltz v0, :cond_7

    .line 168
    .line 169
    iput v2, p0, Ll/nh0;->o:F

    .line 170
    .line 171
    :cond_7
    iget v0, p0, Ll/nh0;->o:F

    .line 172
    .line 173
    cmpl-float v0, v0, v4

    .line 174
    .line 175
    if-lez v0, :cond_8

    .line 176
    .line 177
    iget v0, p0, Ll/nh0;->p:F

    .line 178
    .line 179
    int-to-float v4, v1

    .line 180
    div-float/2addr v6, v4

    .line 181
    add-float/2addr v0, v6

    .line 182
    iput v0, p0, Ll/nh0;->p:F

    .line 183
    .line 184
    cmpl-float v0, v0, v2

    .line 185
    .line 186
    if-ltz v0, :cond_8

    .line 187
    .line 188
    iput v2, p0, Ll/nh0;->p:F

    .line 189
    .line 190
    :cond_8
    iget v0, p0, Ll/nh0;->p:F

    .line 191
    .line 192
    const v4, 0x3f333333    # 0.7f

    .line 193
    .line 194
    .line 195
    cmpl-float v0, v0, v4

    .line 196
    .line 197
    if-ltz v0, :cond_9

    .line 198
    .line 199
    iget v0, p0, Ll/nh0;->q:F

    .line 200
    .line 201
    int-to-float v1, v1

    .line 202
    div-float/2addr v3, v1

    .line 203
    add-float/2addr v0, v3

    .line 204
    iput v0, p0, Ll/nh0;->q:F

    .line 205
    .line 206
    cmpl-float v0, v0, v2

    .line 207
    .line 208
    if-ltz v0, :cond_9

    .line 209
    .line 210
    iput v2, p0, Ll/nh0;->q:F

    .line 211
    .line 212
    const/4 v0, 0x0

    .line 213
    iput-boolean v0, p0, Ll/nh0;->v:Z

    .line 214
    .line 215
    :cond_9
    iget v0, p0, Ll/nh0;->a:I

    .line 216
    .line 217
    iget v1, p0, Ll/nh0;->l:F

    .line 218
    .line 219
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 220
    .line 221
    .line 222
    iget v0, p0, Ll/nh0;->b:I

    .line 223
    .line 224
    iget v1, p0, Ll/nh0;->m:F

    .line 225
    .line 226
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 227
    .line 228
    .line 229
    iget v0, p0, Ll/nh0;->c:I

    .line 230
    .line 231
    iget v1, p0, Ll/nh0;->n:F

    .line 232
    .line 233
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 234
    .line 235
    .line 236
    iget v0, p0, Ll/nh0;->d:I

    .line 237
    .line 238
    iget v1, p0, Ll/nh0;->o:F

    .line 239
    .line 240
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 241
    .line 242
    .line 243
    iget v0, p0, Ll/nh0;->e:I

    .line 244
    .line 245
    iget v1, p0, Ll/nh0;->p:F

    .line 246
    .line 247
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 248
    .line 249
    .line 250
    iget v0, p0, Ll/nh0;->f:I

    .line 251
    .line 252
    iget v1, p0, Ll/nh0;->q:F

    .line 253
    .line 254
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 255
    .line 256
    .line 257
    iget v0, p0, Ll/nh0;->g:I

    .line 258
    .line 259
    iget v1, p0, Ll/nh0;->r:F

    .line 260
    .line 261
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 262
    .line 263
    .line 264
    iget v0, p0, Ll/nh0;->i:I

    .line 265
    .line 266
    iget v1, p0, Ll/nh0;->s:F

    .line 267
    .line 268
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 269
    .line 270
    .line 271
    iget v0, p0, Ll/nh0;->j:I

    .line 272
    .line 273
    iget v1, p0, Ll/nh0;->t:F

    .line 274
    .line 275
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 276
    .line 277
    .line 278
    iget v0, p0, Ll/nh0;->k:I

    .line 279
    .line 280
    iget p0, p0, Ll/nh0;->u:F

    .line 281
    .line 282
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 283
    .line 284
    .line 285
    return-void
.end method
