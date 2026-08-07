.class public Ll/ih0;
.super Ll/jt2;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private i:F

.field private j:F

.field private k:F

.field private l:F

.field private m:F

.field private n:F

.field private o:F

.field private p:Z

.field private q:I

.field private r:I

.field private s:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ih0;->i:F

    .line 6
    .line 7
    iput v0, p0, Ll/ih0;->j:F

    .line 8
    .line 9
    iput v0, p0, Ll/ih0;->k:F

    .line 10
    .line 11
    iput v0, p0, Ll/ih0;->l:F

    .line 12
    .line 13
    const/high16 v1, 0x3f800000    # 1.0f

    .line 14
    .line 15
    iput v1, p0, Ll/ih0;->m:F

    .line 16
    .line 17
    iput v0, p0, Ll/ih0;->n:F

    .line 18
    .line 19
    iput v1, p0, Ll/ih0;->o:F

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    iput-boolean v0, p0, Ll/ih0;->p:Z

    .line 23
    .line 24
    const/16 v0, 0xf

    .line 25
    .line 26
    iput v0, p0, Ll/ih0;->q:I

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, p0, Ll/ih0;->r:I

    .line 30
    .line 31
    const-string v0, "    float scanLineNumber = floor(uv.y*340.0);\n    float scanLineBrightness = 0.8*sin(fract(uv.y*340.0)*3.14159265358979323);    gl_FragColor = texture2D(inputImageTexture0,uv)*scanLineBrightness;\n"

    .line 32
    .line 33
    iput-object v0, p0, Ll/ih0;->s:Ljava/lang/String;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public declared-synchronized Q1()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/ih0;->p:Z

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/ih0;->r:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/ih0;->n:F

    .line 10
    .line 11
    const/high16 v0, 0x3f800000    # 1.0f

    .line 12
    .line 13
    iput v0, p0, Ll/ih0;->m:F

    .line 14
    .line 15
    iput v0, p0, Ll/ih0;->o:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision highp float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float shiftX;\nuniform float shiftY;\nuniform float shiftW;\nuniform float shiftH;\nuniform float shift;\nuniform float judge;\nuniform float offset;\nvec2 scaleFromCenter(vec2 coord, float scale) {\n  if (scale < 0.0) { return coord; }\n  vec2 scaleCenter = vec2(0.5);\n  return (coord - scaleCenter) * scale + scaleCenter;\n}\nvoid main(){\n    vec2 uv = textureCoordinate;\n    if (judge == 1.0) {\n    uv = scaleFromCenter(uv,offset);\n    if (uv.x > shift) {       gl_FragColor = texture2D(inputImageTexture0,uv);\n    } else {\n"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/ih0;->s:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "    }\n    } else {\n    if (uv.x < shift) {       if (uv.x >= shiftX - shiftW/2.0 && uv.x <= shiftX + shiftW/2.0 && uv.y > shiftY - shiftH/2.0  && uv.y < shiftY + shiftH/2.0 ) {\n"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/ih0;->s:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "       } else {\n       uv = scaleFromCenter(uv,offset);\n       gl_FragColor = texture2D(inputImageTexture0,uv);\n       }    } else {\n       uv = scaleFromCenter(uv,offset);\n"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ih0;->s:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string p0, "    }\n  }\n}\n"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
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
    const-string v1, "shiftX"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/ih0;->a:I

    .line 13
    .line 14
    iget v0, p0, Ll/wej;->programHandle:I

    .line 15
    .line 16
    const-string v1, "shiftY"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/ih0;->b:I

    .line 23
    .line 24
    iget v0, p0, Ll/wej;->programHandle:I

    .line 25
    .line 26
    const-string v1, "shiftW"

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/ih0;->c:I

    .line 33
    .line 34
    iget v0, p0, Ll/wej;->programHandle:I

    .line 35
    .line 36
    const-string v1, "shiftH"

    .line 37
    .line 38
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/ih0;->d:I

    .line 43
    .line 44
    iget v0, p0, Ll/wej;->programHandle:I

    .line 45
    .line 46
    const-string v1, "shift"

    .line 47
    .line 48
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput v0, p0, Ll/ih0;->e:I

    .line 53
    .line 54
    iget v0, p0, Ll/wej;->programHandle:I

    .line 55
    .line 56
    const-string v1, "judge"

    .line 57
    .line 58
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iput v0, p0, Ll/ih0;->f:I

    .line 63
    .line 64
    iget v0, p0, Ll/wej;->programHandle:I

    .line 65
    .line 66
    const-string v1, "offset"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iput v0, p0, Ll/ih0;->g:I

    .line 73
    .line 74
    return-void
.end method

.method public passShaderValues()V
    .locals 6

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/ih0;->p:Z

    .line 5
    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    iget v0, p0, Ll/ih0;->r:I

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    const v2, 0x3f19999a    # 0.6f

    .line 13
    .line 14
    .line 15
    if-gt v0, v1, :cond_0

    .line 16
    .line 17
    iput v2, p0, Ll/ih0;->m:F

    .line 18
    .line 19
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    double-to-float v0, v0

    .line 24
    mul-float/2addr v0, v2

    .line 25
    iput v0, p0, Ll/ih0;->i:F

    .line 26
    .line 27
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 28
    .line 29
    .line 30
    move-result-wide v0

    .line 31
    double-to-float v0, v0

    .line 32
    iput v0, p0, Ll/ih0;->j:F

    .line 33
    .line 34
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 35
    .line 36
    .line 37
    move-result-wide v0

    .line 38
    double-to-float v0, v0

    .line 39
    const v1, 0x3e4ccccd    # 0.2f

    .line 40
    .line 41
    .line 42
    mul-float/2addr v0, v1

    .line 43
    iput v0, p0, Ll/ih0;->k:F

    .line 44
    .line 45
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    double-to-float v0, v0

    .line 50
    const/high16 v1, 0x3f000000    # 0.5f

    .line 51
    .line 52
    mul-float/2addr v0, v1

    .line 53
    iput v0, p0, Ll/ih0;->l:F

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    const v3, 0x3ba3d70a    # 0.005f

    .line 57
    .line 58
    .line 59
    const/16 v4, 0xc

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    if-ge v1, v0, :cond_1

    .line 63
    .line 64
    if-gt v0, v4, :cond_1

    .line 65
    .line 66
    iput v2, p0, Ll/ih0;->m:F

    .line 67
    .line 68
    iput v5, p0, Ll/ih0;->i:F

    .line 69
    .line 70
    iput v5, p0, Ll/ih0;->j:F

    .line 71
    .line 72
    iput v5, p0, Ll/ih0;->k:F

    .line 73
    .line 74
    iput v5, p0, Ll/ih0;->l:F

    .line 75
    .line 76
    iget v0, p0, Ll/ih0;->o:F

    .line 77
    .line 78
    sub-float/2addr v0, v3

    .line 79
    iput v0, p0, Ll/ih0;->o:F

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    if-ge v4, v0, :cond_2

    .line 83
    .line 84
    const/16 v1, 0x19

    .line 85
    .line 86
    if-gt v0, v1, :cond_2

    .line 87
    .line 88
    const/high16 v0, 0x3f800000    # 1.0f

    .line 89
    .line 90
    iput v0, p0, Ll/ih0;->n:F

    .line 91
    .line 92
    iget v0, p0, Ll/ih0;->o:F

    .line 93
    .line 94
    sub-float/2addr v0, v3

    .line 95
    iput v0, p0, Ll/ih0;->o:F

    .line 96
    .line 97
    float-to-double v0, v0

    .line 98
    const-wide v2, 0x3fe999999999999aL    # 0.8

    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    cmpg-double v0, v0, v2

    .line 104
    .line 105
    if-gtz v0, :cond_3

    .line 106
    .line 107
    const v0, 0x3f4ccccd    # 0.8f

    .line 108
    .line 109
    .line 110
    iput v0, p0, Ll/ih0;->o:F

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    iput v5, p0, Ll/ih0;->m:F

    .line 114
    .line 115
    const/4 v0, 0x0

    .line 116
    iput-boolean v0, p0, Ll/ih0;->p:Z

    .line 117
    .line 118
    :cond_3
    :goto_0
    iget v0, p0, Ll/ih0;->a:I

    .line 119
    .line 120
    iget v1, p0, Ll/ih0;->i:F

    .line 121
    .line 122
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 123
    .line 124
    .line 125
    iget v0, p0, Ll/ih0;->b:I

    .line 126
    .line 127
    iget v1, p0, Ll/ih0;->j:F

    .line 128
    .line 129
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 130
    .line 131
    .line 132
    iget v0, p0, Ll/ih0;->c:I

    .line 133
    .line 134
    iget v1, p0, Ll/ih0;->k:F

    .line 135
    .line 136
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 137
    .line 138
    .line 139
    iget v0, p0, Ll/ih0;->d:I

    .line 140
    .line 141
    iget v1, p0, Ll/ih0;->l:F

    .line 142
    .line 143
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 144
    .line 145
    .line 146
    iget v0, p0, Ll/ih0;->e:I

    .line 147
    .line 148
    iget v1, p0, Ll/ih0;->m:F

    .line 149
    .line 150
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 151
    .line 152
    .line 153
    iget v0, p0, Ll/ih0;->f:I

    .line 154
    .line 155
    iget v1, p0, Ll/ih0;->n:F

    .line 156
    .line 157
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 158
    .line 159
    .line 160
    iget v0, p0, Ll/ih0;->g:I

    .line 161
    .line 162
    iget v1, p0, Ll/ih0;->o:F

    .line 163
    .line 164
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 165
    .line 166
    .line 167
    iget v0, p0, Ll/ih0;->r:I

    .line 168
    .line 169
    add-int/lit8 v0, v0, 0x1

    .line 170
    .line 171
    iput v0, p0, Ll/ih0;->r:I

    .line 172
    .line 173
    return-void
.end method
