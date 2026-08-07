.class public Lcom/momo/mcamera/mask/Face3DMaskFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# static fields
.field static autoRender:Z

.field private static forbiddenRender:Z


# instance fields
.field private antialias:I

.field private frameCounter:I

.field private h:I

.field private inited:Z

.field private isCameraFront:Z

.field private isCapture:Z

.field private isDrawBackGround:Z

.field private mAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

.field private mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

.field private mCaptureRect:Landroid/graphics/Rect;

.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mDisplay:Landroid/view/Display;

.field mmcvFrame:Ll/umw;

.field mmcvInfo:Ll/omw;

.field private needFaceDetect:Z

.field params:Ll/lnw;

.field private rendertaskName:Ljava/lang/String;

.field private sceneId:Ljava/lang/String;

.field private sticker:Lcom/momo/mcamera/mask/Sticker;

.field private w:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;ZLandroid/content/Context;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->inited:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->needFaceDetect:Z

    .line 9
    .line 10
    iput v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 11
    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->frameCounter:I

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCameraFront:Z

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mContext:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCapture:Z

    .line 20
    .line 21
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isDrawBackGround:Z

    .line 22
    .line 23
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 24
    .line 25
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 26
    .line 27
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 28
    .line 29
    new-instance v2, Ll/umw;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/umw;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 35
    .line 36
    new-instance v2, Ll/lnw;

    .line 37
    .line 38
    const/4 v3, 0x4

    .line 39
    invoke-direct {v2, v3}, Ll/lnw;-><init>(I)V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->params:Ll/lnw;

    .line 43
    .line 44
    iput-boolean p2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCameraFront:Z

    .line 45
    .line 46
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 47
    .line 48
    invoke-direct {p2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mContext:Ljava/lang/ref/WeakReference;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->loadScene(Lcom/momo/mcamera/mask/Sticker;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->rendertaskName:Ljava/lang/String;

    .line 63
    .line 64
    iput-boolean v1, p0, Ll/gfj;->enableDepthBuffer:Z

    .line 65
    .line 66
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 67
    .line 68
    return-void
.end method

.method public static SetAutoRender(Z)V
    .locals 0

    .line 1
    sput-boolean p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->autoRender:Z

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/Face3DMaskFilter;)Lcom/momo/mcamera/mask/Capture3DImageListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/mask/Face3DMaskFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->height:I

    .line 2
    .line 3
    return p0
.end method

.method private drawEngineFrame()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget v2, p0, Ll/wej;->height:I

    .line 7
    .line 8
    mul-int/2addr v2, v1

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x4100

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

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
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->passEngineFrameValues()V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 53
    .line 54
    .line 55
    iget p0, p0, Ll/wej;->texCoordHandle:I

    .line 56
    .line 57
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method private get3DRenderImage()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 7
    .line 8
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 9
    .line 10
    sub-int/2addr v2, v3

    .line 11
    iput v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->w:I

    .line 12
    .line 13
    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    .line 14
    .line 15
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    sub-int/2addr v4, v0

    .line 18
    iput v4, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->h:I

    .line 19
    .line 20
    iget v5, p0, Ll/wej;->height:I

    .line 21
    .line 22
    sub-int/2addr v5, v0

    .line 23
    sub-int/2addr v5, v4

    .line 24
    mul-int/2addr v2, v4

    .line 25
    mul-int/lit8 v2, v2, 0x4

    .line 26
    .line 27
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    .line 30
    move-result-object v9

    .line 31
    invoke-virtual {v9, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    move v4, v5

    .line 35
    iget v5, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->w:I

    .line 36
    .line 37
    iget v6, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->h:I

    .line 38
    .line 39
    const/16 v7, 0x1908

    .line 40
    .line 41
    const/16 v8, 0x1401

    .line 42
    .line 43
    invoke-static/range {v3 .. v9}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    mul-int/2addr v0, v2

    .line 56
    mul-int/lit8 v0, v0, 0x4

    .line 57
    .line 58
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    invoke-virtual {v8, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    const/16 v6, 0x1908

    .line 74
    .line 75
    const/16 v7, 0x1401

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    const/4 v3, 0x0

    .line 79
    invoke-static/range {v2 .. v8}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 80
    .line 81
    .line 82
    move-object v9, v8

    .line 83
    :goto_0
    invoke-virtual {v9, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 84
    .line 85
    .line 86
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCapture:Z

    .line 87
    .line 88
    new-instance v0, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;

    .line 89
    .line 90
    invoke-direct {v0, p0, v9}, Lcom/momo/mcamera/mask/Face3DMaskFilter$1;-><init>(Lcom/momo/mcamera/mask/Face3DMaskFilter;Ljava/nio/ByteBuffer;)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x2

    .line 94
    invoke-static {p0, v0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public static is3DRenderReady()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method private passEngineFrameValues()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 5
    .line 6
    .line 7
    iget v2, p0, Ll/wej;->positionHandle:I

    .line 8
    .line 9
    const/16 v6, 0x8

    .line 10
    .line 11
    iget-object v7, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 12
    .line 13
    const/4 v3, 0x2

    .line 14
    const/16 v4, 0x1406

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 21
    .line 22
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 26
    .line 27
    iget v2, p0, Ll/wej;->curRotation:I

    .line 28
    .line 29
    aget-object v0, v0, v2

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 32
    .line 33
    .line 34
    iget v2, p0, Ll/wej;->texCoordHandle:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/wej;->textureVertices:[Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iget v3, p0, Ll/wej;->curRotation:I

    .line 39
    .line 40
    aget-object v7, v0, v3

    .line 41
    .line 42
    const/4 v3, 0x2

    .line 43
    invoke-static/range {v2 .. v7}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 44
    .line 45
    .line 46
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 47
    .line 48
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 49
    .line 50
    .line 51
    const v0, 0x84c0

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 55
    .line 56
    .line 57
    const/16 v0, 0xde1

    .line 58
    .line 59
    iget v2, p0, Ll/wej;->texture_in:I

    .line 60
    .line 61
    invoke-static {v0, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 62
    .line 63
    .line 64
    iget v0, p0, Ll/wej;->textureHandle:I

    .line 65
    .line 66
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 70
    .line 71
    if-eqz v0, :cond_0

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_0

    .line 78
    .line 79
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->processSegment()V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method

.method private processSegment()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getSegmentType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "byteDance"

    .line 10
    .line 11
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->processSegmentByByteDance()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->processSegmentByMomo()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private processSegmentByByteDance()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, v0, Ll/omw;->g:[B

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {v0}, Ll/omw;->m()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iget-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/omw;->t()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 21
    .line 22
    iget v3, p0, Ll/omw;->d:I

    .line 23
    .line 24
    iget-boolean p0, p0, Ll/omw;->a:Z

    .line 25
    .line 26
    invoke-static {v1, v0, v2, v3, p0}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->process([BIIIZ)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    new-instance v0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 31
    .line 32
    invoke-direct {v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 33
    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    array-length p0, p0

    .line 69
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 70
    .line 71
    .line 72
    :cond_1
    invoke-static {v0}, Lcom/core/glcore/util/XEEngineHelper;->setSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    :goto_0
    const-string p0, "lclc"

    .line 77
    .line 78
    const-string v0, "mmcv is null or mmcv.frameInfo is null"

    .line 79
    .line 80
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private processSegmentByMomo()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Ll/omw;->g:[B

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 12
    .line 13
    const/16 v1, 0x11

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 21
    .line 22
    iget-object v1, v1, Ll/omw;->g:[B

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 30
    .line 31
    iget-object v1, v1, Ll/omw;->g:[B

    .line 32
    .line 33
    array-length v1, v1

    .line 34
    invoke-virtual {v0, v1}, Ll/umw;->f(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/omw;->t()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/omw;->m()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/omw;->t()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {v0, v1}, Ll/umw;->l(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->params:Ll/lnw;

    .line 71
    .line 72
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->isFrontCamera()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->params:Ll/lnw;

    .line 80
    .line 81
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRotateDegree()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->params:Ll/lnw;

    .line 89
    .line 90
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRestoreDegree()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Ll/lnw;->z(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->params:Ll/lnw;

    .line 100
    .line 101
    invoke-static {v0, v1}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;)[B

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 106
    .line 107
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 108
    .line 109
    .line 110
    if-eqz v0, :cond_1

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setDatas([B)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 116
    .line 117
    invoke-virtual {v2}, Ll/umw;->e()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    invoke-virtual {v1, v2}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setHeight(I)V

    .line 122
    .line 123
    .line 124
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvFrame:Ll/umw;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setWidth(I)V

    .line 131
    .line 132
    .line 133
    array-length p0, v0

    .line 134
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setLength(I)V

    .line 135
    .line 136
    .line 137
    :cond_1
    invoke-static {v1}, Lcom/core/glcore/util/XEEngineHelper;->setSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :cond_2
    :goto_0
    const-string p0, "lclc"

    .line 142
    .line 143
    const-string v0, "mmcv is null or mmcv.frameInfo is null"

    .line 144
    .line 145
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method


# virtual methods
.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/core/glcore/util/XEEngineHelper;->unloadScene(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public drawBgFrame()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget v2, p0, Ll/wej;->height:I

    .line 7
    .line 8
    mul-int/2addr v2, v1

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x4100

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

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
    invoke-virtual {p0}, Ll/wej;->passShaderValues()V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 53
    .line 54
    .line 55
    iget p0, p0, Ll/wej;->texCoordHandle:I

    .line 56
    .line 57
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public drawSub()V
    .locals 7

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCapture:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isDrawBackGround:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isDrawBackGround:Z

    .line 11
    .line 12
    :goto_0
    iget v0, p0, Ll/wej;->width:I

    .line 13
    .line 14
    iget v3, p0, Ll/wej;->height:I

    .line 15
    .line 16
    invoke-static {v2, v2, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0xc11

    .line 20
    .line 21
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    iget v5, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 36
    .line 37
    mul-int/2addr v4, v5

    .line 38
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    iget v6, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 43
    .line 44
    mul-int/2addr v5, v6

    .line 45
    iget-boolean v6, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->inited:Z

    .line 46
    .line 47
    if-nez v6, :cond_1

    .line 48
    .line 49
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->inited:Z

    .line 50
    .line 51
    invoke-static {v4, v5}, Lcom/core/glcore/util/XEEngineHelper;->runEngine(II)V

    .line 52
    .line 53
    .line 54
    sget-boolean v1, Lcom/momo/mcamera/mask/Face3DMaskFilter;->autoRender:Z

    .line 55
    .line 56
    if-nez v1, :cond_1

    .line 57
    .line 58
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getXengineResRelativePath()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object v6, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1, v6}, Lcom/core/glcore/util/XEEngineHelper;->loadScene(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isDrawBackGround:Z

    .line 70
    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->drawBgFrame()V

    .line 74
    .line 75
    .line 76
    :cond_2
    sget-boolean v1, Lcom/momo/mcamera/mask/Face3DMaskFilter;->autoRender:Z

    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    invoke-static {v4, v5}, Lcom/core/glcore/util/XEEngineHelper;->render(II)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    iget-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v4, v5, v1}, Lcom/core/glcore/util/XEEngineHelper;->render(IILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :goto_1
    const/16 v1, 0xb44

    .line 90
    .line 91
    invoke-static {v1}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 95
    .line 96
    .line 97
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCapture:Z

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isDrawBackGround:Z

    .line 102
    .line 103
    if-nez v0, :cond_4

    .line 104
    .line 105
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->get3DRenderImage()V

    .line 106
    .line 107
    .line 108
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v1, "draw : "

    .line 111
    .line 112
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 116
    .line 117
    .line 118
    move-result-wide v4

    .line 119
    sub-long/2addr v4, v2

    .line 120
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const-string v1, "FaceRig"

    .line 128
    .line 129
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 133
    .line 134
    if-eqz v0, :cond_5

    .line 135
    .line 136
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-eqz v0, :cond_5

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->processSegment()V

    .line 143
    .line 144
    .line 145
    :cond_5
    return-void
.end method

.method public flushPicture(I)Landroid/graphics/Bitmap;
    .locals 7

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ljava/nio/IntBuffer;->allocate(I)Ljava/nio/IntBuffer;

    .line 3
    .line 4
    .line 5
    move-result-object v6

    .line 6
    const/16 v4, 0x1908

    .line 7
    .line 8
    const/16 v5, 0x1401

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    const/4 v3, 0x1

    .line 14
    invoke-static/range {v0 .. v6}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public getSticker()Lcom/momo/mcamera/mask/Sticker;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    return-object p0
.end method

.method public getViewPortSize()Ll/erf0;
    .locals 3

    .line 1
    new-instance v0, Ll/erf0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iget v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 8
    .line 9
    mul-int/2addr v1, v2

    .line 10
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    iget p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 15
    .line 16
    mul-int/2addr v2, p0

    .line 17
    invoke-direct {v0, v1, v2}, Ll/erf0;-><init>(II)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public initFBO()V
    .locals 4

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
    iget-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 21
    .line 22
    mul-int/2addr v1, v2

    .line 23
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget v3, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 28
    .line 29
    mul-int/2addr v2, v3

    .line 30
    invoke-virtual {v0, v1, v2}, Ll/sej;->c(II)Ll/lej;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Ll/lej;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 44
    .line 45
    mul-int/2addr v1, v2

    .line 46
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget v3, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 51
    .line 52
    mul-int/2addr v2, v3

    .line 53
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 57
    .line 58
    :goto_0
    iget-boolean v0, p0, Ll/gfj;->enableDepthBuffer:Z

    .line 59
    .line 60
    iget-object v1, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 69
    .line 70
    mul-int/2addr v0, v2

    .line 71
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget v3, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 76
    .line 77
    mul-int/2addr v2, v3

    .line 78
    invoke-virtual {v1, v0, v2}, Ll/lej;->a(II)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget v2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 87
    .line 88
    mul-int/2addr v0, v2

    .line 89
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    iget v3, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 94
    .line 95
    mul-int/2addr v2, v3

    .line 96
    invoke-virtual {v1, v0, v2}, Ll/lej;->b(II)V

    .line 97
    .line 98
    .line 99
    :goto_1
    const v0, 0x8d40

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    const v1, 0x8cd5

    .line 107
    .line 108
    .line 109
    if-ne v0, v1, :cond_3

    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public loadScene(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isEnable3DAntialiasing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x1

    .line 10
    :goto_0
    iput v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getXengineResRelativePath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p1, "_"

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 34
    .line 35
    .line 36
    move-result-wide v1

    .line 37
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sceneId:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public needFaceDetect()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->needFaceDetect:Z

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->isUseFacerig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Ll/wej;->setWidth(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    invoke-virtual {p0, p2}, Ll/wej;->setHeight(I)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1, p0, p3}, Ll/jt2;->newTextureReady(ILl/gfj;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->inited:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCameraFront:Z

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-object v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput v1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->antialias:I

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->frameCounter:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->loadScene(Lcom/momo/mcamera/mask/Sticker;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public resetArInfo()V
    .locals 0

    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public setAdditionalInfo(Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mAdditionalInfo:Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setCamera(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCameraFront:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCameraFront:Z

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->frameCounter:I

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setCapture(ZLandroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->isCapture:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    return-void
.end method

.method public setCapture3DImageListener(Lcom/momo/mcamera/mask/Capture3DImageListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 2
    .line 3
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Face3DMaskFilter;->needFaceDetect()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Lcom/momo/mcamera/mask/Face3DMaskFilter;->mmcvInfo:Ll/omw;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/core/glcore/util/XEFaceInfoHelper;->setFaceInfo(Ll/omw;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
