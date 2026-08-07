.class public Lcom/tencent/liteav/beauty/b/t;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field private x:Ljava/nio/ByteBuffer;

.field private y:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 17
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nattribute vec4 inputTextureCoordinate2;\nattribute vec4 inputTextureCoordinate3;\n \nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate2;\nvarying vec2 textureCoordinate3;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n    textureCoordinate2 = inputTextureCoordinate2.xy;\n    textureCoordinate3 = inputTextureCoordinate3.xy;\n}"

    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/beauty/b/t;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    sget-object p1, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/liteav/beauty/b/t;->a(Lcom/tencent/liteav/basic/c/k;ZZ)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/tencent/liteav/beauty/b/t;->t:I

    .line 6
    .line 7
    iput p1, p0, Lcom/tencent/liteav/beauty/b/t;->w:I

    .line 8
    .line 9
    sget-object p1, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/liteav/beauty/b/t;->a(Lcom/tencent/liteav/basic/c/k;ZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(III)I
    .locals 6

    .line 60
    iget v4, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    iget v5, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/liteav/beauty/b/t;->a(IIIII)I

    move-result p0

    return p0
.end method

.method public a(IIIII)I
    .locals 0

    .line 56
    iput p2, p0, Lcom/tencent/liteav/beauty/b/t;->t:I

    .line 57
    iput p3, p0, Lcom/tencent/liteav/beauty/b/t;->w:I

    .line 58
    invoke-super {p0, p1, p4, p5}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p0

    return p0
.end method

.method public a(II)V
    .locals 0

    .line 59
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/basic/c/h;->a(II)V

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/c/k;ZZ)V
    .locals 1

    .line 1
    invoke-static {p1, p2, p3}, Lcom/tencent/liteav/basic/c/l;->a(Lcom/tencent/liteav/basic/c/k;ZZ)[F

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/16 p2, 0x20

    .line 6
    .line 7
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p3, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p3

    .line 19
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 27
    .line 28
    .line 29
    iput-object p3, p0, Lcom/tencent/liteav/beauty/b/t;->x:Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p3}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 51
    .line 52
    .line 53
    iput-object p2, p0, Lcom/tencent/liteav/beauty/b/t;->y:Ljava/nio/ByteBuffer;

    .line 54
    .line 55
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
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v1}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const-string v2, "inputTextureCoordinate2"

    .line 17
    .line 18
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    iput v1, p0, Lcom/tencent/liteav/beauty/b/t;->r:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    const-string v2, "inputTextureCoordinate3"

    .line 29
    .line 30
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    iput v1, p0, Lcom/tencent/liteav/beauty/b/t;->u:I

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    const-string v2, "inputImageTexture2"

    .line 41
    .line 42
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iput v1, p0, Lcom/tencent/liteav/beauty/b/t;->s:I

    .line 47
    .line 48
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const-string v2, "inputImageTexture3"

    .line 53
    .line 54
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, p0, Lcom/tencent/liteav/beauty/b/t;->v:I

    .line 59
    .line 60
    iget v1, p0, Lcom/tencent/liteav/beauty/b/t;->r:I

    .line 61
    .line 62
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 63
    .line 64
    .line 65
    iget p0, p0, Lcom/tencent/liteav/beauty/b/t;->u:I

    .line 66
    .line 67
    invoke-static {p0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 68
    .line 69
    .line 70
    return v0
.end method

.method public i()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->r:I

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 4
    .line 5
    .line 6
    const v0, 0x84c3

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 10
    .line 11
    .line 12
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->t:I

    .line 13
    .line 14
    const/16 v1, 0xde1

    .line 15
    .line 16
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->s:I

    .line 20
    .line 21
    const/4 v2, 0x3

    .line 22
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/t;->x:Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    iget v3, p0, Lcom/tencent/liteav/beauty/b/t;->r:I

    .line 32
    .line 33
    const/4 v7, 0x0

    .line 34
    iget-object v8, p0, Lcom/tencent/liteav/beauty/b/t;->x:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    const/16 v5, 0x1406

    .line 38
    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->u:I

    .line 44
    .line 45
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 46
    .line 47
    .line 48
    const v0, 0x84c4

    .line 49
    .line 50
    .line 51
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 52
    .line 53
    .line 54
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->w:I

    .line 55
    .line 56
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Lcom/tencent/liteav/beauty/b/t;->v:I

    .line 60
    .line 61
    const/4 v1, 0x4

    .line 62
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/t;->y:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    iget v3, p0, Lcom/tencent/liteav/beauty/b/t;->u:I

    .line 71
    .line 72
    iget-object v8, p0, Lcom/tencent/liteav/beauty/b/t;->y:Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
