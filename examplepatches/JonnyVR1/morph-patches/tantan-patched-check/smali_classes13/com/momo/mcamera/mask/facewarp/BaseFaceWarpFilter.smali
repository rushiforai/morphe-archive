.class public abstract Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;
.implements Lcom/momo/mcamera/mask/facewarp/IFaceWarp;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;
    }
.end annotation


# instance fields
.field protected isWarpFailed:Z

.field private maxFaces:I

.field protected mmcvInfo:Ll/omw;

.field private texCoordBuffer:Ljava/nio/FloatBuffer;

.field private vertexBuffer:Ljava/nio/FloatBuffer;

.field private warpFrameBuffer:Ll/lej;

.field protected warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

.field protected warpParams:Lcom/momocv/beauty/BeautyWarpParams;

.field protected warpPoint:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

.field protected warpType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->maxFaces:I

    .line 8
    .line 9
    new-instance v0, Lcom/momocv/beauty/BeautyWarpParams;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/momocv/beauty/BeautyWarpParams;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 15
    .line 16
    new-instance v0, Lcom/momocv/beauty/BeautyWarpInfo;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/momocv/beauty/BeautyWarpInfo;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 22
    .line 23
    new-instance v0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpPoint:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->getDefaultWarpType()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 38
    .line 39
    return-void
.end method

.method private copyToFrameBuffer(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    aget v0, v0, v1

    .line 9
    .line 10
    const v2, 0x8d40

    .line 11
    .line 12
    .line 13
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    invoke-static {v1, v1, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 25
    .line 26
    .line 27
    const/16 v0, 0x4100

    .line 28
    .line 29
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-static {v0, v3, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 49
    .line 50
    .line 51
    iget v0, p0, Ll/wej;->programHandle:I

    .line 52
    .line 53
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 59
    .line 60
    .line 61
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 62
    .line 63
    const/16 v7, 0x8

    .line 64
    .line 65
    iget-object v8, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 66
    .line 67
    const/4 v4, 0x2

    .line 68
    const/16 v5, 0x1406

    .line 69
    .line 70
    const/4 v6, 0x0

    .line 71
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 72
    .line 73
    .line 74
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 75
    .line 76
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 80
    .line 81
    iget v3, p0, Ll/wej;->curRotation:I

    .line 82
    .line 83
    aget-object v0, v0, v3

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 86
    .line 87
    .line 88
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 89
    .line 90
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 91
    .line 92
    iget v4, p0, Ll/wej;->curRotation:I

    .line 93
    .line 94
    aget-object v8, v0, v4

    .line 95
    .line 96
    const/4 v4, 0x2

    .line 97
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 98
    .line 99
    .line 100
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 101
    .line 102
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 103
    .line 104
    .line 105
    const v0, 0x84c0

    .line 106
    .line 107
    .line 108
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 109
    .line 110
    .line 111
    const/16 v0, 0xde1

    .line 112
    .line 113
    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 114
    .line 115
    .line 116
    iget p1, p0, Ll/wej;->textureHandle:I

    .line 117
    .line 118
    invoke-static {p1, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 119
    .line 120
    .line 121
    const/4 p1, 0x5

    .line 122
    const/4 v0, 0x4

    .line 123
    invoke-static {p1, v1, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 127
    .line 128
    .line 129
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method private drawMultiFace()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/omw;->n()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    move v3, v2

    .line 15
    move v4, v3

    .line 16
    :goto_0
    if-ge v3, v0, :cond_2

    .line 17
    .line 18
    iget-object v5, v1, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 19
    .line 20
    aget-object v5, v5, v3

    .line 21
    .line 22
    iget-object v6, v1, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 23
    .line 24
    aget-object v6, v6, v3

    .line 25
    .line 26
    invoke-virtual {p0, v5}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->processSingleWarpPoint(Lcom/momocv/SingleFaceInfo;)Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    if-eqz v7, :cond_1

    .line 31
    .line 32
    iget-object v8, v7, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 33
    .line 34
    if-eqz v8, :cond_1

    .line 35
    .line 36
    iget-object v9, v7, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 37
    .line 38
    if-eqz v9, :cond_1

    .line 39
    .line 40
    array-length v8, v8

    .line 41
    if-lez v8, :cond_1

    .line 42
    .line 43
    array-length v8, v9

    .line 44
    if-lez v8, :cond_1

    .line 45
    .line 46
    if-nez v4, :cond_0

    .line 47
    .line 48
    iget v8, p0, Ll/wej;->texture_in:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 52
    .line 53
    .line 54
    move-result v8

    .line 55
    :goto_1
    invoke-direct {p0, v8, v7}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->drawWarpFrame(ILcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;)V

    .line 56
    .line 57
    .line 58
    iget-object v7, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 59
    .line 60
    invoke-virtual {v7}, Ll/lej;->i()[I

    .line 61
    .line 62
    .line 63
    move-result-object v7

    .line 64
    aget v7, v7, v2

    .line 65
    .line 66
    invoke-direct {p0, v7}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->copyToFrameBuffer(I)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 v4, v4, 0x1

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->clearPoints()V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0, v5, v6}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setLandmarks(Lcom/momocv/SingleFaceInfo;Lcom/momocv/videoprocessor/FaceAttribute;)V

    .line 75
    .line 76
    .line 77
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 78
    .line 79
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    if-nez v4, :cond_3

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 86
    .line 87
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method private drawSingleFace()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget-object v0, v0, v1

    .line 11
    .line 12
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iget-object v2, v2, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 19
    .line 20
    aget-object v2, v2, v1

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->processSingleWarpPoint(Lcom/momocv/SingleFaceInfo;)Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    iget-object v4, v3, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 29
    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    iget-object v5, v3, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    array-length v4, v4

    .line 37
    if-lez v4, :cond_0

    .line 38
    .line 39
    array-length v4, v5

    .line 40
    if-lez v4, :cond_0

    .line 41
    .line 42
    iget v4, p0, Ll/wej;->texture_in:I

    .line 43
    .line 44
    invoke-direct {p0, v4, v3}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->drawWarpSub(ILcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->clearPoints()V

    .line 48
    .line 49
    .line 50
    invoke-direct {p0, v0, v2}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->setLandmarks(Lcom/momocv/SingleFaceInfo;Lcom/momocv/videoprocessor/FaceAttribute;)V

    .line 51
    .line 52
    .line 53
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->isWarpFailed:Z

    .line 58
    .line 59
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method private drawWarpFrame(ILcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/lej;->g()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ne v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/lej;->f()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eq v0, v1, :cond_1

    .line 34
    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->initWarpFBO()V

    .line 48
    .line 49
    .line 50
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const/4 v1, 0x0

    .line 57
    aget v0, v0, v1

    .line 58
    .line 59
    const v2, 0x8d40

    .line 60
    .line 61
    .line 62
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->drawWarpSub(ILcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 69
    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method private drawWarpSub(ILcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    const/16 v0, 0x4100

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/wej;->programHandle:I

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p2, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 43
    .line 44
    iget-object p2, p2, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 45
    .line 46
    array-length v1, p2

    .line 47
    div-int/lit8 v1, v1, 0x2

    .line 48
    .line 49
    iget-object v3, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 50
    .line 51
    const/4 v4, 0x4

    .line 52
    if-eqz v3, :cond_0

    .line 53
    .line 54
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    array-length v5, p2

    .line 59
    mul-int/2addr v5, v4

    .line 60
    if-eq v3, v5, :cond_1

    .line 61
    .line 62
    :cond_0
    array-length v3, p2

    .line 63
    mul-int/2addr v3, v4

    .line 64
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-virtual {v3, p2}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    iput-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 85
    .line 86
    :cond_1
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 89
    .line 90
    .line 91
    iget v5, p0, Ll/wej;->positionHandle:I

    .line 92
    .line 93
    const/16 v9, 0x8

    .line 94
    .line 95
    iget-object v10, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->vertexBuffer:Ljava/nio/FloatBuffer;

    .line 96
    .line 97
    const/4 v6, 0x2

    .line 98
    const/16 v7, 0x1406

    .line 99
    .line 100
    const/4 v8, 0x0

    .line 101
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 102
    .line 103
    .line 104
    iget p2, p0, Ll/wej;->positionHandle:I

    .line 105
    .line 106
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 107
    .line 108
    .line 109
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 110
    .line 111
    if-eqz p2, :cond_2

    .line 112
    .line 113
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    array-length v3, v0

    .line 118
    mul-int/2addr v3, v4

    .line 119
    if-eq p2, v3, :cond_3

    .line 120
    .line 121
    :cond_2
    array-length p2, v0

    .line 122
    mul-int/2addr p2, v4

    .line 123
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-virtual {p2, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    iput-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    :cond_3
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 146
    .line 147
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 148
    .line 149
    .line 150
    iget v5, p0, Ll/wej;->texCoordHandle:I

    .line 151
    .line 152
    const/16 v9, 0x8

    .line 153
    .line 154
    iget-object v10, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->texCoordBuffer:Ljava/nio/FloatBuffer;

    .line 155
    .line 156
    const/4 v6, 0x2

    .line 157
    const/16 v7, 0x1406

    .line 158
    .line 159
    const/4 v8, 0x0

    .line 160
    invoke-static/range {v5 .. v10}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 161
    .line 162
    .line 163
    iget p2, p0, Ll/wej;->texCoordHandle:I

    .line 164
    .line 165
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 166
    .line 167
    .line 168
    const p2, 0x84c0

    .line 169
    .line 170
    .line 171
    invoke-static {p2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 172
    .line 173
    .line 174
    const/16 p2, 0xde1

    .line 175
    .line 176
    invoke-static {p2, p1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 177
    .line 178
    .line 179
    iget p1, p0, Ll/wej;->textureHandle:I

    .line 180
    .line 181
    invoke-static {p1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 182
    .line 183
    .line 184
    invoke-static {v4, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 188
    .line 189
    .line 190
    return-void
.end method

.method private initWarpFBO()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

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
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

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
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

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
    new-instance v1, Ljava/lang/RuntimeException;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    new-instance v3, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p0, ": Failed to set up render buffer with status "

    .line 66
    .line 67
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p0, " and error "

    .line 74
    .line 75
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    throw v1
.end method

.method private setLandmarks(Lcom/momocv/SingleFaceInfo;Lcom/momocv/videoprocessor/FaceAttribute;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks68_:[[F

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks96_:[[F

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks104_:[[F

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    aget-object v0, v0, v2

    .line 17
    .line 18
    iput-object v0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 19
    .line 20
    aget-object v1, v1, v2

    .line 21
    .line 22
    iput-object v1, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 23
    .line 24
    aget-object p0, p0, v2

    .line 25
    .line 26
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 27
    .line 28
    iput-object v0, p2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 29
    .line 30
    iput-object v1, p2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 31
    .line 32
    iput-object p0, p2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 33
    .line 34
    :cond_0
    return-void
.end method


# virtual methods
.method public abstract buildParams(Ll/omw;Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;
.end method

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpPoint:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/tuf;->a()Ll/tuf;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/tuf;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public drawSub()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->notWarp()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0}, Ll/gfj;->drawSub()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->maxFaces:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-le v0, v1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->drawMultiFace()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->drawSingleFace()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public abstract getDefaultWarpType()I
.end method

.method public abstract notWarp()Z
.end method

.method public processSingleWarpPoint(Lcom/momocv/SingleFaceInfo;)Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->buildParams(Ll/omw;Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Ll/tuf;->a()Ll/tuf;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 12
    .line 13
    invoke-virtual {v0, p1, v1}, Ll/tuf;->b(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpPoint:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 22
    .line 23
    iget-object v1, v0, Lcom/momocv/beauty/BeautyWarpInfo;->src_warp_points_:[F

    .line 24
    .line 25
    iput-object v1, p1, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 26
    .line 27
    iget-object v0, v0, Lcom/momocv/beauty/BeautyWarpInfo;->dst_warp_points_:[F

    .line 28
    .line 29
    iput-object v0, p1, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpPoint:Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 32
    .line 33
    return-object p0
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpFrameBuffer:Ll/lej;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxFaces(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->maxFaces:I

    .line 2
    .line 3
    return-void
.end method

.method public setScaleFactor(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 4
    .line 5
    return-void
.end method

.method public setWarpType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 2
    .line 3
    return-void
.end method
