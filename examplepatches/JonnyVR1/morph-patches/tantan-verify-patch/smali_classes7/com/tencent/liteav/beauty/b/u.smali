.class public Lcom/tencent/liteav/beauty/b/u;
.super Lcom/tencent/liteav/basic/c/h;
.source "SourceFile"


# instance fields
.field private r:Ljava/nio/ByteBuffer;

.field public u:I

.field public v:I

.field public w:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 17
    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\nattribute vec4 inputTextureCoordinate2;\n \nvarying vec2 textureCoordinate;\nvarying vec2 textureCoordinate2;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n    textureCoordinate2 = inputTextureCoordinate2.xy;\n}"

    invoke-direct {p0, v0, p1}, Lcom/tencent/liteav/beauty/b/u;-><init>(Ljava/lang/String;Ljava/lang/String;)V

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
    iput p1, p0, Lcom/tencent/liteav/beauty/b/u;->u:I

    .line 6
    .line 7
    iput p1, p0, Lcom/tencent/liteav/beauty/b/u;->w:I

    .line 8
    .line 9
    sget-object p1, Lcom/tencent/liteav/basic/c/k;->a:Lcom/tencent/liteav/basic/c/k;

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    const/4 v0, 0x1

    .line 13
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/liteav/beauty/b/u;->a(Lcom/tencent/liteav/basic/c/k;ZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(IIII)I
    .locals 0

    .line 32
    iput p2, p0, Lcom/tencent/liteav/beauty/b/u;->w:I

    .line 33
    invoke-virtual {p0, p1, p3, p4}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    move-result p0

    return p0
.end method

.method public a(Lcom/tencent/liteav/basic/c/k;ZZ)V
    .locals 0

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
    move-result-object p2

    .line 11
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    invoke-virtual {p3, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p3}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 27
    .line 28
    .line 29
    iput-object p2, p0, Lcom/tencent/liteav/beauty/b/u;->r:Ljava/nio/ByteBuffer;

    .line 30
    .line 31
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
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "inputTextureCoordinate2"

    .line 12
    .line 13
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iput v1, p0, Lcom/tencent/liteav/beauty/b/u;->u:I

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/tencent/liteav/basic/c/h;->p()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const-string v2, "inputImageTexture2"

    .line 24
    .line 25
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iput v1, p0, Lcom/tencent/liteav/beauty/b/u;->v:I

    .line 30
    .line 31
    iget p0, p0, Lcom/tencent/liteav/beauty/b/u;->u:I

    .line 32
    .line 33
    invoke-static {p0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return v0
.end method

.method public c(II)I
    .locals 1

    .line 1
    iput p2, p0, Lcom/tencent/liteav/beauty/b/u;->w:I

    .line 2
    .line 3
    iget p2, p0, Lcom/tencent/liteav/basic/c/h;->m:I

    .line 4
    .line 5
    iget v0, p0, Lcom/tencent/liteav/basic/c/h;->n:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/liteav/basic/c/h;->a(III)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/basic/c/h;->e()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i()V
    .locals 8

    .line 1
    const v0, 0x84c3

    .line 2
    .line 3
    .line 4
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0xde1

    .line 8
    .line 9
    iget v1, p0, Lcom/tencent/liteav/beauty/b/u;->w:I

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 12
    .line 13
    .line 14
    iget v0, p0, Lcom/tencent/liteav/beauty/b/u;->v:I

    .line 15
    .line 16
    const/4 v1, 0x3

    .line 17
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Lcom/tencent/liteav/beauty/b/u;->u:I

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    if-eq v0, v1, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/u;->r:Ljava/nio/ByteBuffer;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Lcom/tencent/liteav/beauty/b/u;->u:I

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    iget-object v7, p0, Lcom/tencent/liteav/beauty/b/u;->r:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    const/4 v3, 0x2

    .line 40
    const/16 v4, 0x1406

    .line 41
    .line 42
    const/4 v5, 0x0

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method
