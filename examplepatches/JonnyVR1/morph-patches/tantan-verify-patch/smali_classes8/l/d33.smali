.class public Ll/d33;
.super Ll/pt2;
.source "SourceFile"


# instance fields
.field private alphaHandler:I

.field private matrixHandler:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/pt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/d33;->matrixHandler:I

    .line 6
    .line 7
    iput v0, p0, Ll/d33;->alphaHandler:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pt2;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic drawFrame([I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/pt2;->drawFrame([I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getSubFrameShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nuniform float alpha;void main(){\n   vec4 color = texture2D(inputImageTexture0,textureCoordinate);\n   gl_FragColor = vec4(color.rgb, color.a * alpha);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform mat4 trsMatrix;void main() {\n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = trsMatrix * position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/pt2;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 5
    .line 6
    const-string v1, "trsMatrix"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/d33;->matrixHandler:I

    .line 13
    .line 14
    iget v0, p0, Ll/pt2;->programHandle:I

    .line 15
    .line 16
    const-string v1, "alpha"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/d33;->alphaHandler:I

    .line 23
    .line 24
    return-void
.end method

.method public declared-synchronized passShaderValues([I)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0, p1}, Ll/pt2;->passShaderValues([I)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/lim;->getMvpMatrix()[F

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget v0, p0, Ll/d33;->matrixHandler:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-static {v0, v1, v2, p1, v2}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    .line 16
    .line 17
    .line 18
    iget p1, p0, Ll/d33;->alphaHandler:I

    .line 19
    .line 20
    iget-object v0, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/lim;->getAlphaValue()F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p1
.end method

.method public bridge synthetic setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/pt2;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public updateGeomtryInfo(Ll/lim;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Ll/pt2;->geometryAttrInfo:Ll/lim;

    .line 4
    .line 5
    :cond_0
    return-void
.end method
