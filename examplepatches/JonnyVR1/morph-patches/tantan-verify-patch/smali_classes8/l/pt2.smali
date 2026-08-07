.class abstract Ll/pt2;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ATTRIBUTE_POSITION:Ljava/lang/String; = "position"

.field public static final ATTRIBUTE_TEXCOORD:Ljava/lang/String; = "inputTextureCoordinate"

.field public static final UNIFORM_TEXTURE0:Ljava/lang/String; = "inputImageTexture0"

.field public static final UNIFORM_TEXTUREBASE:Ljava/lang/String; = "inputImageTexture"

.field public static final VARYING_TEXCOORD:Ljava/lang/String; = "textureCoordinate"


# instance fields
.field private curRotation:I

.field protected fragmentShaderHandle:I

.field protected geometryAttrInfo:Ll/lim;

.field protected initialized:Z

.field protected positionHandle:I

.field protected programHandle:I

.field protected renderHeight:I

.field protected renderWidth:I

.field protected texCoordHandle:I

.field protected textureHandle:I

.field protected vertexShaderHandle:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pt2;->initialized:Z

    .line 6
    .line 7
    iput v0, p0, Ll/pt2;->vertexShaderHandle:I

    .line 8
    .line 9
    iput v0, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 10
    .line 11
    iput v0, p0, Ll/pt2;->programHandle:I

    .line 12
    .line 13
    iput v0, p0, Ll/pt2;->positionHandle:I

    .line 14
    .line 15
    iput v0, p0, Ll/pt2;->curRotation:I

    .line 16
    .line 17
    new-instance v0, Ll/lim;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/lim;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public bindShaderAttributes()V
    .locals 3

    .line 1
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "position"

    .line 5
    .line 6
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Ll/pt2;->programHandle:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    const-string v1, "inputTextureCoordinate"

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Landroid/opengl/GLES20;->glBindAttribLocation(IILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 7
    .line 8
    .line 9
    iput v1, p0, Ll/pt2;->programHandle:I

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ll/pt2;->vertexShaderHandle:I

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 16
    .line 17
    .line 18
    iput v1, p0, Ll/pt2;->vertexShaderHandle:I

    .line 19
    .line 20
    :cond_1
    iget v0, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 25
    .line 26
    .line 27
    iput v1, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 28
    .line 29
    :cond_2
    iput-boolean v1, p0, Ll/pt2;->initialized:Z

    .line 30
    .line 31
    return-void
.end method

.method public disableDrawArray()V
    .locals 1

    .line 1
    iget v0, p0, Ll/pt2;->positionHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    iget p0, p0, Ll/pt2;->texCoordHandle:I

    .line 7
    .line 8
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 9
    .line 10
    .line 11
    const/16 p0, 0xde1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public drawFrame([I)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "EsProgram"

    .line 4
    .line 5
    const-string p1, "Input textures is null, invalid !!"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean v0, p0, Ll/pt2;->initialized:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pt2;->initWithGLContext()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/pt2;->initialized:Z

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p0, p1}, Ll/pt2;->subDrawSub([I)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public getSubFrameShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 2
    .line 3
    const-string v1, "inputImageTexture0"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/pt2;->textureHandle:I

    .line 10
    .line 11
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 12
    .line 13
    const-string v1, "position"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/pt2;->positionHandle:I

    .line 20
    .line 21
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 22
    .line 23
    const-string v1, "inputTextureCoordinate"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/pt2;->texCoordHandle:I

    .line 30
    .line 31
    return-void
.end method

.method public initWithGLContext()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/pt2;->getSubVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/pt2;->getSubFrameShader()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const v2, 0x8b31

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    iput v2, p0, Ll/pt2;->vertexShaderHandle:I

    .line 17
    .line 18
    const-string v3, "BasicProgram"

    .line 19
    .line 20
    const v4, 0x8b81

    .line 21
    .line 22
    .line 23
    const/4 v5, 0x1

    .line 24
    const/4 v6, 0x0

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget v0, p0, Ll/pt2;->vertexShaderHandle:I

    .line 31
    .line 32
    invoke-static {v0}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 33
    .line 34
    .line 35
    new-array v0, v5, [I

    .line 36
    .line 37
    iget v2, p0, Ll/pt2;->vertexShaderHandle:I

    .line 38
    .line 39
    invoke-static {v2, v4, v0, v6}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 40
    .line 41
    .line 42
    aget v0, v0, v6

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    iget v0, p0, Ll/pt2;->vertexShaderHandle:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v2, p0, Ll/pt2;->vertexShaderHandle:I

    .line 53
    .line 54
    invoke-static {v2}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 55
    .line 56
    .line 57
    iput v6, p0, Ll/pt2;->vertexShaderHandle:I

    .line 58
    .line 59
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const-string v0, "none"

    .line 64
    .line 65
    :goto_0
    iget v2, p0, Ll/pt2;->vertexShaderHandle:I

    .line 66
    .line 67
    if-eqz v2, :cond_5

    .line 68
    .line 69
    const v2, 0x8b30

    .line 70
    .line 71
    .line 72
    invoke-static {v2}, Landroid/opengl/GLES20;->glCreateShader(I)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    iput v2, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 77
    .line 78
    if-eqz v2, :cond_1

    .line 79
    .line 80
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glShaderSource(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget v1, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 84
    .line 85
    invoke-static {v1}, Landroid/opengl/GLES20;->glCompileShader(I)V

    .line 86
    .line 87
    .line 88
    new-array v1, v5, [I

    .line 89
    .line 90
    iget v2, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 91
    .line 92
    invoke-static {v2, v4, v1, v6}, Landroid/opengl/GLES20;->glGetShaderiv(II[II)V

    .line 93
    .line 94
    .line 95
    aget v1, v1, v6

    .line 96
    .line 97
    if-nez v1, :cond_1

    .line 98
    .line 99
    iget v0, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 100
    .line 101
    invoke-static {v0}, Landroid/opengl/GLES20;->glGetShaderInfoLog(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget v1, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 106
    .line 107
    invoke-static {v1}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 108
    .line 109
    .line 110
    iput v6, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 111
    .line 112
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    .line 114
    .line 115
    :cond_1
    iget v1, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 116
    .line 117
    if-eqz v1, :cond_4

    .line 118
    .line 119
    invoke-static {}, Landroid/opengl/GLES20;->glCreateProgram()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p0, Ll/pt2;->programHandle:I

    .line 124
    .line 125
    if-eqz v0, :cond_2

    .line 126
    .line 127
    iget v1, p0, Ll/pt2;->vertexShaderHandle:I

    .line 128
    .line 129
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 130
    .line 131
    .line 132
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 133
    .line 134
    iget v1, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 135
    .line 136
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glAttachShader(II)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ll/pt2;->bindShaderAttributes()V

    .line 140
    .line 141
    .line 142
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 143
    .line 144
    invoke-static {v0}, Landroid/opengl/GLES20;->glLinkProgram(I)V

    .line 145
    .line 146
    .line 147
    new-array v0, v5, [I

    .line 148
    .line 149
    iget v1, p0, Ll/pt2;->programHandle:I

    .line 150
    .line 151
    const v2, 0x8b82

    .line 152
    .line 153
    .line 154
    invoke-static {v1, v2, v0, v6}, Landroid/opengl/GLES20;->glGetProgramiv(II[II)V

    .line 155
    .line 156
    .line 157
    aget v0, v0, v6

    .line 158
    .line 159
    if-nez v0, :cond_2

    .line 160
    .line 161
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 162
    .line 163
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteProgram(I)V

    .line 164
    .line 165
    .line 166
    iput v6, p0, Ll/pt2;->programHandle:I

    .line 167
    .line 168
    :cond_2
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 169
    .line 170
    if-eqz v0, :cond_3

    .line 171
    .line 172
    iget v0, p0, Ll/pt2;->vertexShaderHandle:I

    .line 173
    .line 174
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 175
    .line 176
    .line 177
    iget v0, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 178
    .line 179
    invoke-static {v0}, Landroid/opengl/GLES20;->glDeleteShader(I)V

    .line 180
    .line 181
    .line 182
    iput v6, p0, Ll/pt2;->vertexShaderHandle:I

    .line 183
    .line 184
    iput v6, p0, Ll/pt2;->fragmentShaderHandle:I

    .line 185
    .line 186
    invoke-virtual {p0}, Ll/pt2;->initShaderHandles()V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_3
    const-string p0, "Could not create program."

    .line 191
    .line 192
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_4
    const-string v1, ": Could not create fragment shader. Reason: "

    .line 197
    .line 198
    invoke-static {p0, v1, v0}, Ll/rej;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :cond_5
    const-string v1, ": Could not create vertex shader. Reason: "

    .line 203
    .line 204
    invoke-static {p0, v1, v0}, Ll/rej;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    return-void
.end method

.method public passShaderValues([I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/lim;->getRenderVertices()Ljava/nio/FloatBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object v7

    .line 10
    invoke-virtual {v7, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    iget v2, p0, Ll/pt2;->positionHandle:I

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    const/16 v6, 0x8

    .line 17
    .line 18
    const/4 v3, 0x2

    .line 19
    const/16 v4, 0x1406

    .line 20
    .line 21
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 22
    .line 23
    .line 24
    iget v0, p0, Ll/pt2;->positionHandle:I

    .line 25
    .line 26
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 30
    .line 31
    iget v2, p0, Ll/pt2;->curRotation:I

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ll/lim;->getTextureVertices(I)Ljava/nio/FloatBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-virtual {v8, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    iget v3, p0, Ll/pt2;->texCoordHandle:I

    .line 41
    .line 42
    const/4 v6, 0x0

    .line 43
    const/16 v7, 0x8

    .line 44
    .line 45
    const/4 v4, 0x2

    .line 46
    const/16 v5, 0x1406

    .line 47
    .line 48
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Ll/pt2;->texCoordHandle:I

    .line 52
    .line 53
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 54
    .line 55
    .line 56
    :cond_0
    const v0, 0x84c0

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 60
    .line 61
    .line 62
    const/16 v0, 0xde1

    .line 63
    .line 64
    aget p1, p1, v1

    .line 65
    .line 66
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 67
    .line 68
    .line 69
    iget p0, p0, Ll/pt2;->textureHandle:I

    .line 70
    .line 71
    invoke-static {p0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public setCurRotation(I)V
    .locals 0

    .line 1
    div-int/lit8 p1, p1, 0x5a

    .line 2
    .line 3
    iput p1, p0, Ll/pt2;->curRotation:I

    .line 4
    .line 5
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/pt2;->renderWidth:I

    .line 2
    .line 3
    iput p2, p0, Ll/pt2;->renderHeight:I

    .line 4
    .line 5
    return-void
.end method

.method public subDrawSub([I)V
    .locals 2

    .line 1
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/pt2;->passShaderValues([I)V

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    const/4 v0, 0x4

    .line 11
    const/4 v1, 0x5

    .line 12
    invoke-static {v1, p1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/pt2;->disableDrawArray()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
