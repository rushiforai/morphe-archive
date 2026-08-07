.class public Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field protected colorHandle:I

.field protected data:[F

.field protected floatBuffer:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->colorHandle:I

    .line 9
    .line 10
    return-void
.end method

.method private putDataToFloatBuffer(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;
    .locals 1

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    if-gtz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 6
    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    if-nez p1, :cond_1

    .line 10
    .line 11
    array-length p0, p2

    .line 12
    mul-int/lit8 p0, p0, 0x4

    .line 13
    .line 14
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :cond_1
    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 34
    .line 35
    .line 36
    return-object p1
.end method


# virtual methods
.method public adjustCoordnate([F[F)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length p0, p1

    .line 4
    if-lez p0, :cond_1

    .line 5
    .line 6
    if-eqz p2, :cond_1

    .line 7
    .line 8
    array-length p0, p2

    .line 9
    if-lez p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    :goto_0
    array-length v0, p1

    .line 13
    if-ge p0, v0, :cond_0

    .line 14
    .line 15
    aget v0, p2, p0

    .line 16
    .line 17
    const/high16 v1, 0x3f000000    # 0.5f

    .line 18
    .line 19
    sub-float/2addr v0, v1

    .line 20
    const/high16 v1, 0x40000000    # 2.0f

    .line 21
    .line 22
    mul-float/2addr v0, v1

    .line 23
    aput v0, p1, p0

    .line 24
    .line 25
    add-int/lit8 p0, p0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void

    .line 29
    :cond_1
    const-string p0, "mediaRender"

    .line 30
    .line 31
    const-string p1, "No face Info or buffer is empty"

    .line 32
    .line 33
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public drawSub()V
    .locals 9

    .line 1
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    array-length v0, v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->colorHandle:I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 16
    .line 17
    .line 18
    const/high16 v0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-static {v0, v2, v2, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 27
    .line 28
    invoke-direct {p0, v0, v2}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->putDataToFloatBuffer(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    iput-object v8, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 33
    .line 34
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 35
    .line 36
    const/4 v6, 0x0

    .line 37
    const/16 v7, 0x8

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    const/16 v5, 0x1406

    .line 41
    .line 42
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 43
    .line 44
    .line 45
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 46
    .line 47
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v8}, Ljava/nio/Buffer;->capacity()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    div-int/lit8 v0, v0, 0x2

    .line 55
    .line 56
    invoke-static {v1, v1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    :goto_0
    const-string p0, "mediaRender"

    .line 64
    .line 65
    const-string v0, "Render no body!"

    .line 66
    .line 67
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "vec4(1.0, 0.0, 0.0, 1.0)"

    .line 2
    .line 3
    return-object p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform int color;\nvarying vec2 textureCoordinate;\nvoid main(){\n if(color == 1){   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n }else{   gl_FragColor = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->getColor()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ";\n }}\n"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getPointSize()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "5.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n gl_PointSize = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->getPointSize()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p0, ";   gl_Position = position;\n}\n"

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public handCoord(ILl/omw;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 2
    .line 3
    iget-object p2, p2, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 4
    .line 5
    iget-object p2, p2, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->adjustCoordnate([F[F)V

    .line 8
    .line 9
    .line 10
    return-void
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
    const-string v1, "color"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->colorHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->colorHandle:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->updateFaceInfo(Ll/omw;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public updateFaceInfo(Ll/omw;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "mediaRender"

    .line 8
    .line 9
    const-string p1, "No face"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    :goto_0
    if-ge v1, v0, :cond_4

    .line 17
    .line 18
    iget-object v2, p1, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 19
    .line 20
    if-eqz v2, :cond_3

    .line 21
    .line 22
    iget-object v2, v2, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 23
    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 27
    .line 28
    if-eqz v3, :cond_1

    .line 29
    .line 30
    array-length v3, v3

    .line 31
    array-length v4, v2

    .line 32
    if-eq v3, v4, :cond_2

    .line 33
    .line 34
    :cond_1
    array-length v2, v2

    .line 35
    new-array v2, v2, [F

    .line 36
    .line 37
    iput-object v2, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 38
    .line 39
    :cond_2
    invoke-virtual {p0, v1, p1}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->handCoord(ILl/omw;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_4
    return-void
.end method
