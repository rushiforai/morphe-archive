.class public Lcom/tencent/liteav/basic/c/i;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field public r:Z

.field private s:[F

.field private t:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nuniform mat4 textureTransform;\nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = (textureTransform * inputTextureCoordinate).xy;\n}"

    .line 2
    .line 3
    const-string v1, "#extension GL_OES_EGL_image_external : require\n\nvarying lowp vec2 textureCoordinate;\n \nuniform samplerExternalOES inputImageTexture;\n \nvoid main()\n{\n     gl_FragColor = texture2D(inputImageTexture, textureCoordinate);\n}"

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    new-array v0, v0, [F

    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/basic/c/i;->s:[F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/i;->r:Z

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, Lcom/tencent/liteav/basic/c/h;->o:Z

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public a(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)V
    .locals 7

    .line 1
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->k()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/liteav/basic/c/i;->s:[F

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    const/4 v5, 0x0

    .line 28
    const/4 v2, 0x2

    .line 29
    const/16 v3, 0x1406

    .line 30
    .line 31
    move-object v6, p2

    .line 32
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 33
    .line 34
    .line 35
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 36
    .line 37
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p3, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 41
    .line 42
    .line 43
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 44
    .line 45
    move-object v6, p3

    .line 46
    invoke-static/range {v1 .. v6}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 47
    .line 48
    .line 49
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 50
    .line 51
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 52
    .line 53
    .line 54
    iget p2, p0, Lcom/tencent/liteav/basic/c/i;->t:I

    .line 55
    .line 56
    const/4 p3, 0x1

    .line 57
    iget-object v1, p0, Lcom/tencent/liteav/basic/c/i;->s:[F

    .line 58
    .line 59
    invoke-static {p2, p3, v0, v1, v0}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 60
    .line 61
    .line 62
    const/4 p2, -0x1

    .line 63
    const p3, 0x8d65

    .line 64
    .line 65
    .line 66
    if-eq p1, p2, :cond_1

    .line 67
    .line 68
    const p2, 0x84c0

    .line 69
    .line 70
    .line 71
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 72
    .line 73
    .line 74
    invoke-static {p3, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 75
    .line 76
    .line 77
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->c:I

    .line 78
    .line 79
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 80
    .line 81
    .line 82
    :cond_1
    const/4 p1, 0x5

    .line 83
    const/4 p2, 0x4

    .line 84
    invoke-static {p1, v0, p2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 85
    .line 86
    .line 87
    iget p1, p0, Lcom/tencent/liteav/basic/c/h;->b:I

    .line 88
    .line 89
    invoke-static {p1}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 90
    .line 91
    .line 92
    iget p0, p0, Lcom/tencent/liteav/basic/c/h;->d:I

    .line 93
    .line 94
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 95
    .line 96
    .line 97
    invoke-static {p3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    return-void
.end method

.method public a([F)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/tencent/liteav/basic/c/i;->s:[F

    return-void
.end method

.method public b()Z
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/tencent/liteav/basic/c/h;->a:I

    .line 6
    .line 7
    const-string v2, "textureTransform"

    .line 8
    .line 9
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iput v1, p0, Lcom/tencent/liteav/basic/c/i;->t:I

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method
