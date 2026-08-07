.class Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field protected curTimeStamp:J

.field protected firstTimestamp:J

.field normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

.field protected totalDuration:J

.field protected totalFrameCount:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 7
    .line 8
    const-wide/16 v0, -0x1

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->firstTimestamp:J

    .line 11
    .line 12
    new-instance v0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 7
    .line 8
    const-wide/16 v2, -0x1

    .line 9
    .line 10
    iput-wide v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->firstTimestamp:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->totalFrameCount:J

    .line 13
    .line 14
    iput-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->totalDuration:J

    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/d33;->destroy()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->normal:Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/MMFramRenderProgram;

    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public drawSub()V
    .locals 4

    .line 1
    const/16 v0, 0xbe2

    .line 2
    .line 3
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x303

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/16 v3, 0x302

    .line 10
    .line 11
    invoke-static {v3, v1, v2, v1}, Landroid/opengl/GLES20;->glBlendFuncSeparate(IIII)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->onDrawPrograms()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    invoke-virtual {v1, v2, p0}, Ll/lej;->m(II)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public drawTexture(Ll/d33;Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p2}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameTexture()[I

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ll/d33;->updateGeomtryInfo(Ll/lim;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/d33;->drawFrame([I)V

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void

    .line 19
    :cond_2
    :goto_0
    const-string p0, "FilterProcess"

    .line 20
    .line 21
    const-string p1, "Input Parameter is invalid !"

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public drawTexture(Ll/d33;Ll/lim;I)V
    .locals 0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    if-nez p3, :cond_0

    goto :goto_0

    .line 27
    :cond_0
    filled-new-array {p3}, [I

    move-result-object p0

    .line 28
    invoke-virtual {p1, p2}, Ll/d33;->updateGeomtryInfo(Ll/lim;)V

    .line 29
    invoke-virtual {p1, p0}, Ll/d33;->drawFrame([I)V

    return-void

    .line 30
    :cond_1
    :goto_0
    const-string p0, "FilterProcess"

    const-string p1, "Input Parameter is invalid !"

    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/lej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Ll/lej;->d(II)V

    .line 32
    .line 33
    .line 34
    const v0, 0x8d40

    .line 35
    .line 36
    .line 37
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const v1, 0x8cd5

    .line 42
    .line 43
    .line 44
    if-ne v0, v1, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public onDrawPrograms()V
    .locals 0

    return-void
.end method

.method public setTimeStamp(J)V
    .locals 4

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->curTimeStamp:J

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->firstTimestamp:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-gez v0, :cond_0

    .line 10
    .line 11
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->firstTimestamp:J

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setTotalFrameCount(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->totalFrameCount:J

    .line 2
    .line 3
    const-wide/16 v0, 0x28

    .line 4
    .line 5
    mul-long/2addr p1, v0

    .line 6
    iput-wide p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/filter/PottMVFilter;->totalDuration:J

    .line 7
    .line 8
    return-void
.end method

.method public snapPicture(II)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    if-lez p1, :cond_0

    .line 4
    .line 5
    mul-int v0, p1, p2

    .line 6
    .line 7
    invoke-static {v0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 8
    .line 9
    .line 10
    move-result-object v6

    .line 11
    const/16 v4, 0x1908

    .line 12
    .line 13
    const/16 v5, 0x1401

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    const/4 v1, 0x0

    .line 17
    move v2, p1

    .line 18
    move v3, p2

    .line 19
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 23
    .line 24
    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v6}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    .line 29
    .line 30
    .line 31
    new-instance v5, Landroid/graphics/Matrix;

    .line 32
    .line 33
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 34
    .line 35
    .line 36
    const/high16 v1, 0x3f800000    # 1.0f

    .line 37
    .line 38
    const/high16 v4, -0x40800000    # -1.0f

    .line 39
    .line 40
    invoke-virtual {v5, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 41
    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    invoke-virtual {v5, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    const/4 v6, 0x1

    .line 49
    const/4 v1, 0x0

    .line 50
    move v3, p1

    .line 51
    move v4, p2

    .line 52
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    return-object v0

    .line 57
    :cond_0
    const/4 v0, 0x0

    .line 58
    return-object v0
.end method
