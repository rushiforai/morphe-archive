.class public Lcom/momo/mcamera/mask/LightningEngineFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# instance fields
.field private antialias:I

.field private cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

.field private cartoonProcess:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

.field private clearFaceInfo:Z

.field private cropHeight:I

.field private cropWidth:I

.field private delayInit:Z

.field private delayLoadForLive:Z

.field private enableBeautyFace:Z

.field private volatile enableRenderBeauty:Z

.field private engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

.field private engineRootPath:Ljava/lang/String;

.field private faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

.field private initCallback:Ljava/lang/Runnable;

.field private isCapture:Z

.field private isDrawBackGround:Z

.field private isHandSegMent:Z

.field private isHeartProgressDetector:Z

.field private volatile isSegment:Z

.field private lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

.field private mAdditionalInfos:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/momo/mcamera/mask/AdditionalInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

.field private mCaptureRect:Landroid/graphics/Rect;

.field private map:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field mmcvFrame:Ll/umw;

.field mmcvInfo:Ll/omw;

.field params:Ll/lnw;

.field private segmentType:Ljava/lang/String;

.field private threadID:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 155
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/mask/LightningEngineFilter;-><init>(Landroid/content/Context;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 154
    invoke-direct {p0, p1, p2, v0}, Lcom/momo/mcamera/mask/LightningEngineFilter;-><init>(Landroid/content/Context;ZZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZZ)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isCapture:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isDrawBackGround:Z

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 16
    .line 17
    new-instance v2, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mAdditionalInfos:Ljava/util/HashMap;

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 25
    .line 26
    const-string v2, "momo"

    .line 27
    .line 28
    iput-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->segmentType:Ljava/lang/String;

    .line 29
    .line 30
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableBeautyFace:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayInit:Z

    .line 33
    .line 34
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearFaceInfo:Z

    .line 35
    .line 36
    const-string v2, ""

    .line 37
    .line 38
    iput-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineRootPath:Ljava/lang/String;

    .line 39
    .line 40
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayLoadForLive:Z

    .line 41
    .line 42
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableRenderBeauty:Z

    .line 43
    .line 44
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->initCallback:Ljava/lang/Runnable;

    .line 45
    .line 46
    const-wide/16 v1, -0x1

    .line 47
    .line 48
    iput-wide v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->threadID:J

    .line 49
    .line 50
    new-instance v1, Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->map:Ljava/util/Map;

    .line 56
    .line 57
    new-instance v1, Ll/umw;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/umw;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 63
    .line 64
    new-instance v1, Ll/lnw;

    .line 65
    .line 66
    const/4 v2, 0x4

    .line 67
    invoke-direct {v1, v2}, Ll/lnw;-><init>(I)V

    .line 68
    .line 69
    .line 70
    iput-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->params:Ll/lnw;

    .line 71
    .line 72
    iput-boolean p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayLoadForLive:Z

    .line 73
    .line 74
    new-instance v1, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;

    .line 75
    .line 76
    invoke-direct {v1}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1, p3}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->setDelay(Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->build()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    iput-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 87
    .line 88
    new-instance p3, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 89
    .line 90
    invoke-direct {p3}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 94
    .line 95
    const/16 v1, 0x68

    .line 96
    .line 97
    invoke-virtual {p3, v1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setWarpType(I)V

    .line 98
    .line 99
    .line 100
    new-instance p3, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 101
    .line 102
    invoke-direct {p3}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonProcess:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 106
    .line 107
    iput-boolean p1, p0, Ll/gfj;->enableDepthBuffer:Z

    .line 108
    .line 109
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 110
    .line 111
    if-nez p2, :cond_1

    .line 112
    .line 113
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 114
    .line 115
    invoke-interface {p2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->init()V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->initCallback:Ljava/lang/Runnable;

    .line 119
    .line 120
    if-eqz p2, :cond_0

    .line 121
    .line 122
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 123
    .line 124
    .line 125
    :cond_0
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 126
    .line 127
    invoke-interface {p2}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-virtual {p2, p1}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 132
    .line 133
    .line 134
    new-instance p1, Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 135
    .line 136
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 137
    .line 138
    invoke-direct {p1, p2}, Lcom/momo/mcamera/mask/LightningEngineHelper;-><init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 139
    .line 140
    .line 141
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayInit:Z

    .line 145
    .line 146
    :goto_0
    new-instance p1, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 147
    .line 148
    invoke-direct {p1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;-><init>()V

    .line 149
    .line 150
    .line 151
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 152
    .line 153
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/LightningEngineFilter;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/momo/mcamera/mask/LightningEngineFilter;)Lcom/momo/mcamera/mask/Capture3DImageListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$600(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$700(Lcom/momo/mcamera/mask/LightningEngineFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wej;->height:I

    .line 2
    .line 3
    return p0
.end method

.method private get3DRenderImage()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCaptureRect:Landroid/graphics/Rect;

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
    iput v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropWidth:I

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
    iput v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropHeight:I

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
    iget v5, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropWidth:I

    .line 36
    .line 37
    iget v6, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cropHeight:I

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
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isCapture:Z

    .line 87
    .line 88
    new-instance v0, Lcom/momo/mcamera/mask/LightningEngineFilter$1;

    .line 89
    .line 90
    invoke-direct {v0, p0, v9}, Lcom/momo/mcamera/mask/LightningEngineFilter$1;-><init>(Lcom/momo/mcamera/mask/LightningEngineFilter;Ljava/nio/ByteBuffer;)V

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

.method private makeEngineModel(Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)Lcom/momo/xeengine/lightningrender/StickerModel;
    .locals 4

    .line 1
    new-instance p0, Lcom/momo/xeengine/lightningrender/StickerModel;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/xeengine/lightningrender/StickerModel;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    goto :goto_0

    .line 98
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    sget-object p2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    :goto_0
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setAssetPath(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p2}, Ll/j8g0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setStickerId(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p2

    .line 137
    invoke-virtual {p0, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setBusinessType(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 141
    .line 142
    .line 143
    move-result-wide v0

    .line 144
    const-wide/16 v2, 0x0

    .line 145
    .line 146
    cmp-long p2, v0, v2

    .line 147
    .line 148
    if-lez p2, :cond_2

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getDuration()J

    .line 151
    .line 152
    .line 153
    move-result-wide p1

    .line 154
    goto :goto_1

    .line 155
    :cond_2
    const-wide/16 p1, -0x1

    .line 156
    .line 157
    :goto_1
    invoke-virtual {p0, p1, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setDuration(J)V

    .line 158
    .line 159
    .line 160
    return-object p0
.end method

.method private processHandSegment()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 12
    .line 13
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHandSegMent:Z

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/core/glcore/util/HandSegmentHelper;->getCvSegmentInfo()Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getWarpMat()[F

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->getDatas()[B

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 40
    .line 41
    iget-boolean p0, p0, Ll/omw;->a:Z

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;->setFlipShowX(Z)V

    .line 44
    .line 45
    .line 46
    :cond_0
    invoke-interface {v0, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance p0, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;

    .line 51
    .line 52
    invoke-direct {p0}, Lcom/momo/xeengine/cv/bean/CVSegmentInfo;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0, p0}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method private processSegment()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->segmentType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "byteDance"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->processSegmentByByteDance()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->processSegmentByMomo()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private processSegmentByByteDance()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

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
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 15
    .line 16
    invoke-virtual {v2}, Ll/omw;->t()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 21
    .line 22
    iget v4, v3, Ll/omw;->d:I

    .line 23
    .line 24
    iget-boolean v3, v3, Ll/omw;->a:Z

    .line 25
    .line 26
    invoke-static {v1, v0, v2, v4, v3}, Lcom/momo/mcamera/mask/segment/ByteDanceSegmentHelper;->process([BIIIZ)Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getBuffer()[B

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0}, Lcom/effectsar/labcv/effectsdk/PortraitMatting$MattingMask;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0, v1, v2, v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setSegmentInfo([BII)V

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void

    .line 50
    :cond_2
    :goto_0
    const-string p0, "lclc"

    .line 51
    .line 52
    const-string v0, "mmcv is null or mmcv.frameInfo is null"

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private processSegmentByMomo()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Ll/omw;->g:[B

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance v0, Ll/lnw;

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 17
    .line 18
    const/16 v2, 0x11

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/umw;->h(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 26
    .line 27
    iget-object v2, v2, Ll/omw;->g:[B

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ll/umw;->g([B)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 33
    .line 34
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 35
    .line 36
    iget-object v2, v2, Ll/omw;->g:[B

    .line 37
    .line 38
    array-length v2, v2

    .line 39
    invoke-virtual {v1, v2}, Ll/umw;->f(I)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 45
    .line 46
    invoke-virtual {v2}, Ll/omw;->t()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {v1, v2}, Ll/umw;->m(I)V

    .line 51
    .line 52
    .line 53
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 54
    .line 55
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 56
    .line 57
    invoke-virtual {v2}, Ll/omw;->m()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v1, v2}, Ll/umw;->j(I)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 67
    .line 68
    invoke-virtual {v2}, Ll/omw;->t()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    invoke-virtual {v1, v2}, Ll/umw;->l(I)V

    .line 73
    .line 74
    .line 75
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->isFrontCamera()Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {v0, v1}, Ll/lnw;->p(Z)V

    .line 80
    .line 81
    .line 82
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRotateDegree()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {v0, v1}, Ll/lnw;->A(I)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->getRestoreDegree()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {v0, v1}, Ll/lnw;->z(I)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvFrame:Ll/umw;

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/core/glcore/util/SegmentHelper;->processInfo(Ll/umw;Ll/lnw;)Lcom/momocv/segmentation/SegmentationInfo;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setSegmentInfo(Lcom/momocv/segmentation/SegmentationInfo;)V

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :cond_1
    :goto_0
    const-string p0, "LightingRending"

    .line 109
    .line 110
    const-string v0, "mmcv is null or mmcv.frameInfo is null"

    .line 111
    .line 112
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method


# virtual methods
.method public add3DMaskModel(Lcom/momo/mcamera/mask/MaskModel;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineSearchPath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    goto :goto_0

    .line 45
    :cond_0
    if-eqz v0, :cond_1

    .line 46
    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_2
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v2, 0x0

    .line 78
    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_9

    .line 83
    .line 84
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, Lcom/momo/mcamera/mask/Sticker;

    .line 89
    .line 90
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getStickers()Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-interface {v4, v3}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    if-eqz v5, :cond_4

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getStickerType()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v5

    .line 108
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-eqz v5, :cond_5

    .line 113
    .line 114
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getModelType()I

    .line 120
    .line 121
    .line 122
    move-result v6

    .line 123
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v6, "_"

    .line 127
    .line 128
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v3, v4}, Lcom/momo/mcamera/mask/Sticker;->setStickerType(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_5
    if-eqz v1, :cond_6

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    if-nez v4, :cond_6

    .line 148
    .line 149
    new-instance v4, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getXengineEsPath()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v5

    .line 158
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    goto :goto_2

    .line 187
    :cond_6
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v4

    .line 191
    if-eqz v4, :cond_7

    .line 192
    .line 193
    new-instance v4, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getFolderPath()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v5

    .line 202
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getImagePreName()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    goto :goto_2

    .line 225
    :cond_7
    const/4 v4, 0x0

    .line 226
    :goto_2
    if-eqz v4, :cond_8

    .line 227
    .line 228
    invoke-virtual {p0, v4}, Lcom/momo/mcamera/mask/LightningEngineFilter;->addLibraryPath(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_8
    invoke-direct {p0, p1, v3}, Lcom/momo/mcamera/mask/LightningEngineFilter;->makeEngineModel(Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/mcamera/mask/Sticker;)Lcom/momo/xeengine/lightningrender/StickerModel;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    invoke-virtual {p0, v4}, Lcom/momo/mcamera/mask/LightningEngineFilter;->addEnginStickerModel(Lcom/momo/xeengine/lightningrender/StickerModel;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    if-eqz v4, :cond_3

    .line 243
    .line 244
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 245
    .line 246
    .line 247
    move-result-object v4

    .line 248
    invoke-virtual {v4}, Lcom/momo/mcamera/mask/Mask;->getType()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v4

    .line 252
    if-eqz v4, :cond_3

    .line 253
    .line 254
    sget-object v4, Lcom/momo/mcamera/mask/MaskModel;->faceWarpTypeSet:Ljava/util/HashSet;

    .line 255
    .line 256
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 257
    .line 258
    .line 259
    move-result-object v5

    .line 260
    invoke-virtual {v5}, Lcom/momo/mcamera/mask/Mask;->getType()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v5

    .line 264
    invoke-virtual {v4, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result v4

    .line 268
    if-nez v4, :cond_3

    .line 269
    .line 270
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Mask;->getType()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Mask;->getStrength()F

    .line 283
    .line 284
    .line 285
    move-result v3

    .line 286
    invoke-virtual {p0, v2, v3}, Lcom/momo/mcamera/mask/LightningEngineFilter;->setFaceWarpMapParams(Ljava/lang/String;F)V

    .line 287
    .line 288
    .line 289
    const/4 v2, 0x1

    .line 290
    goto/16 :goto_1

    .line 291
    .line 292
    :cond_9
    if-nez v2, :cond_a

    .line 293
    .line 294
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearFaceWarpMapParams()V

    .line 295
    .line 296
    .line 297
    :cond_a
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getName()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/LightningEngineFilter;->setAdditionalInfo(Ljava/lang/String;Lcom/momo/mcamera/mask/AdditionalInfo;)V

    .line 306
    .line 307
    .line 308
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/MaskModel;->getAdditionalInfo()Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/AdditionalInfo;->isCartoonFaceEnable()Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    if-eqz v0, :cond_b

    .line 317
    .line 318
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonProcess:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 319
    .line 320
    if-eqz v0, :cond_b

    .line 321
    .line 322
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->switchCartoon()V

    .line 323
    .line 324
    .line 325
    :cond_b
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 326
    .line 327
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 328
    .line 329
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 330
    .line 331
    invoke-virtual {v0, p1, v1, p0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->addMaskModel(Lcom/momo/mcamera/mask/MaskModel;Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 332
    .line 333
    .line 334
    return-void
.end method

.method public addEnginStickerModel(Lcom/momo/xeengine/lightningrender/StickerModel;)V
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    if-eqz p0, :cond_0

    .line 23
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->add(Lcom/momo/xeengine/lightningrender/StickerModel;)V

    :cond_0
    return-void
.end method

.method public addEnginStickerModel(Lcom/momo/xeengine/lightningrender/StickerModel;Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->add(Lcom/momo/xeengine/lightningrender/StickerModel;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->addListener(Lcom/momo/xeengine/lightningrender/ILightningRender$StickerListener;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public addLibraryPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMakeup(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptMakeupPath(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {v0, p1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->addEffect(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public changeOrigin(Z)V
    .locals 0

    return-void
.end method

.method public checkCurrentThread()Z
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->threadID:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    cmp-long p0, v0, v3

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v2
.end method

.method public clearAllEngineStickerModel()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->removeAll()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 15
    .line 16
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->revertMicroBodyMakeupValues(Lcom/momo/xeengine/lightningrender/ILightningRender;Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->clearFaceWarpMapParams()V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHandSegMent:Z

    .line 30
    .line 31
    return-void
.end method

.method public clearEngineStickerModelWidthId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->removeByID(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public clearEngineStickerModelWithBussineType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->removeByBusinessType(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public clearFaceWarpMapParams()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->clearFaceWarpMapParams()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearLookup0()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->clear(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public clearLookup1()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p0, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->clear(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public clearPoints()V
    .locals 0

    return-void
.end method

.method public containMakeup()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->isEffectActive()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public delayInit()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->init()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->initCallback:Ljava/lang/Runnable;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v1, 0x1

    .line 24
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/XELogger;->setLogEnable(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineRootPath:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineRootPath:Ljava/lang/String;

    .line 38
    .line 39
    invoke-interface {v0, v2}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    new-instance v0, Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 45
    .line 46
    invoke-direct {v0, v2}, Lcom/momo/mcamera/mask/LightningEngineHelper;-><init>(Lcom/momo/xeengine/lightningrender/ILightningRender;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 50
    .line 51
    return v1

    .line 52
    :cond_2
    const/4 p0, 0x0

    .line 53
    return p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->release()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->release()V

    .line 16
    .line 17
    .line 18
    :cond_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonProcess:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 19
    .line 20
    if-eqz p0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->release()V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public drawBgFrame()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->width:I

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    .locals 5

    .line 1
    invoke-static {}, Lcom/core/glcore/util/DetectDelayStopHelper;->getInstance()Lcom/core/glcore/util/DetectDelayStopHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/core/glcore/util/DetectDelayStopHelper;->onNewFrame()V

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isCapture:Z

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isDrawBackGround:Z

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isDrawBackGround:Z

    .line 18
    .line 19
    :goto_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isDrawBackGround:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->drawBgFrame()V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget v0, p0, Ll/wej;->width:I

    .line 27
    .line 28
    iget v3, p0, Ll/wej;->height:I

    .line 29
    .line 30
    invoke-static {v2, v2, v0, v3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0xc11

    .line 34
    .line 35
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

    .line 43
    .line 44
    mul-int/2addr v2, v3

    .line 45
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    iget v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

    .line 50
    .line 51
    mul-int/2addr v3, v4

    .line 52
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 53
    .line 54
    if-eqz v4, :cond_2

    .line 55
    .line 56
    invoke-direct {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->processSegment()V

    .line 57
    .line 58
    .line 59
    :cond_2
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHandSegMent:Z

    .line 60
    .line 61
    if-eqz v4, :cond_3

    .line 62
    .line 63
    invoke-direct {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->processHandSegment()V

    .line 64
    .line 65
    .line 66
    :cond_3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->initThreadID()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->checkCurrentThread()Z

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    if-eqz v4, :cond_4

    .line 74
    .line 75
    iget-boolean v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableRenderBeauty:Z

    .line 76
    .line 77
    if-eqz v4, :cond_4

    .line 78
    .line 79
    iget-object v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 80
    .line 81
    invoke-interface {v4, v2, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender;->renderTest(II)Z

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    if-eqz v4, :cond_4

    .line 86
    .line 87
    iget-object v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 88
    .line 89
    invoke-interface {v4, v2, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender;->render(II)V

    .line 90
    .line 91
    .line 92
    :cond_4
    const/16 v2, 0xb44

    .line 93
    .line 94
    invoke-static {v2}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 95
    .line 96
    .line 97
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 98
    .line 99
    .line 100
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isCapture:Z

    .line 101
    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isDrawBackGround:Z

    .line 105
    .line 106
    if-nez v0, :cond_5

    .line 107
    .line 108
    invoke-direct {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->get3DRenderImage()V

    .line 109
    .line 110
    .line 111
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 112
    .line 113
    if-nez v0, :cond_6

    .line 114
    .line 115
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearFaceInfo:Z

    .line 116
    .line 117
    if-nez v0, :cond_6

    .line 118
    .line 119
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearFaceInfo:Z

    .line 120
    .line 121
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->clearFaceInfos()V

    .line 124
    .line 125
    .line 126
    :cond_6
    const/4 v0, 0x0

    .line 127
    iput-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 128
    .line 129
    return-void
.end method

.method public enableAntialias(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x2

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p1, 0x1

    .line 6
    :goto_0
    iput p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

    .line 7
    .line 8
    return-void
.end method

.method public enableBeautyFace(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableBeautyFace:Z

    .line 6
    .line 7
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setEnable(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setEnable(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public enableBeautyFace1(Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableBeautyFace:Z

    .line 6
    .line 7
    const-string v1, "skin_whitening"

    .line 8
    .line 9
    const-string v2, "skin_smooth"

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->map:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Float;

    .line 21
    .line 22
    iget-object v4, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 23
    .line 24
    invoke-interface {v4}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    move v5, v3

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    :goto_0
    invoke-interface {v4, v2, v5}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 40
    .line 41
    invoke-interface {v2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    :goto_1
    invoke-interface {v2, v1, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 53
    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_2
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-interface {v0, v2, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 64
    .line 65
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0, v1, v3}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 70
    .line 71
    .line 72
    :goto_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 73
    .line 74
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setEnable(Z)V

    .line 79
    .line 80
    .line 81
    :cond_3
    return-void
.end method

.method public enableRenderBeauty(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableRenderBeauty:Z

    .line 2
    .line 3
    return-void
.end method

.method public getEngineDispather()Lcom/momo/mcamera/mask/LightningEngineHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLightningRender()Lcom/momo/xeengine/lightningrender/ILightningRender;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getXEDirector()Lcom/momo/xeengine/lightningrender/ILightningRender;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    return-object p0
.end method

.method public handEvent(Landroid/view/MotionEvent;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/LightningEngineHelper;->handEvent(Landroid/view/MotionEvent;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
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
    iget v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    iget v3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

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
    if-ne v0, v1, :cond_4

    .line 110
    .line 111
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayInit:Z

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayInit()Z

    .line 116
    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->delayInit:Z

    .line 120
    .line 121
    :cond_3
    return-void

    .line 122
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public initThreadID()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->threadID:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->threadID:J

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public loadWrapConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->loadWrapConfig(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->antialias:I

    .line 9
    .line 10
    return-void
.end method

.method public removeMakeupAll()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptRemoveAllMakeup()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->removeAll()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public removeMakeupWithType(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptRemoveMakeup(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->removeWithType(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 0

    return-void
.end method

.method public sendEvent(Lcom/momo/xeengine/event/DataEvent;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->sendEvent(Lcom/momo/xeengine/event/XEvent;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setAdditionalInfo(Ljava/lang/String;Lcom/momo/mcamera/mask/AdditionalInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mAdditionalInfos:Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez p2, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 p1, 0x0

    .line 23
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/AdditionalInfo;->isHandSegmentDetector()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHandSegMent:Z

    .line 30
    .line 31
    :goto_0
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/AdditionalInfo;->isHeartProgressDetector()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHeartProgressDetector:Z

    .line 36
    .line 37
    :goto_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mAdditionalInfos:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_3

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Ljava/util/Map$Entry;

    .line 58
    .line 59
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    check-cast p2, Lcom/momo/mcamera/mask/AdditionalInfo;

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/momo/mcamera/mask/AdditionalInfo;->isBodySegmentDetectEnable()Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_2

    .line 76
    .line 77
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isSegment:Z

    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public setBodyBeautyEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->setBeautyBodyEnable(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setCapture(ZLandroid/graphics/Rect;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isCapture:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCaptureRect:Landroid/graphics/Rect;

    .line 4
    .line 5
    return-void
.end method

.method public setCapture3DImageListener(Lcom/momo/mcamera/mask/Capture3DImageListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mCapture3DImageListener:Lcom/momo/mcamera/mask/Capture3DImageListener;

    .line 2
    .line 3
    return-void
.end method

.method public setCartoonFaceEnable(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->setCartoonFaceEnable(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->setCartoonFaceEnable(Z)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public setDeblurEnable(Z)V
    .locals 0

    return-void
.end method

.method public setDeblurParams(FFF)V
    .locals 0

    return-void
.end method

.method public setEngineRootPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineRootPath:Ljava/lang/String;

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setFaceBeautyValue(Ljava/lang/String;F)V
    .locals 2

    .line 1
    const-string v0, "skin_smooth"

    .line 2
    .line 3
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "skin_whitening"

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "skin_ruddy"

    .line 18
    .line 19
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const-string v0, "eye_brighten"

    .line 26
    .line 27
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    const-string v0, "teeth_whiten"

    .line 34
    .line 35
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    const-string v0, "skin_sharpen"

    .line 42
    .line 43
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_1

    .line 48
    .line 49
    const-string v0, "remove_nasolabial_floads"

    .line 50
    .line 51
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_1

    .line 56
    .line 57
    const-string v0, "remove_pouch"

    .line 58
    .line 59
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 67
    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 71
    .line 72
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptMicro(Ljava/lang/String;F)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 79
    .line 80
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 85
    .line 86
    if-eqz v0, :cond_2

    .line 87
    .line 88
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->map:Ljava/util/Map;

    .line 89
    .line 90
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 98
    .line 99
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 104
    .line 105
    .line 106
    :cond_2
    return-void
.end method

.method public setFaceWarpMapParams(Ljava/lang/String;F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setMapParams(Ljava/lang/String;F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFaceWarpType(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setWarpType(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setFullSmoothEnable(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFullSmoothEnable(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setInitCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->initCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method public setLookup0Intensity(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, v0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setIntensity(IF)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setLookup0Path(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string v0, "/"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    add-int/lit8 v0, v0, 0x1

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 49
    .line 50
    invoke-interface {p1, v1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 54
    .line 55
    invoke-interface {p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1, v2, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setPath(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 63
    .line 64
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const/high16 p1, 0x3f800000    # 1.0f

    .line 69
    .line 70
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setIntensity(F)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearLookup0()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method

.method public setLookup1Intensity(F)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-interface {p0, v0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setIntensity(IF)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setLookup1Path(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string v0, "/"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x1

    .line 27
    add-int/2addr v0, v2

    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 38
    .line 39
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {v0, v2, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setPath(ILjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 47
    .line 48
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    const/high16 p1, 0x3f800000    # 1.0f

    .line 53
    .line 54
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setIntensity(F)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public setLookupIntensity(F)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setIntensity(F)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setLookupPath(Ljava/lang/String;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/LightningEngineFilter;->setLookup0Path(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    const/16 v0, 0x11

    const/4 v1, 0x0

    .line 164
    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/mcamera/mask/LightningEngineFilter;->setMMCVInfo(Ll/omw;IZ)V

    return-void
.end method

.method public setMMCVInfo(Ll/omw;IZ)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->enableBeautyFace:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptMicroProcess()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->process(Ll/omw;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_7

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setFaceInfo(Ll/omw;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p1, Ll/omw;->B:Z

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->intercept()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 37
    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    invoke-virtual {v2, p1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setBodyWarpInfo(Ll/omw;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    invoke-virtual {v2, v1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setBodyWarpInfo(Ll/omw;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->doProcess()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonProcess:Lcom/momo/mcamera/mask/cartoon/CartoonProcess;

    .line 54
    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    invoke-virtual {v2, p1, p2, p3}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->process(Ll/omw;IZ)Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    iget-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 62
    .line 63
    invoke-virtual {p3, p1, p2}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setCartoonFaceInfo(Ll/omw;Lcom/momocv/cartoonface/CartoonfaceInfo;)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/cartoon/CartoonProcess;->delayRelease()V

    .line 68
    .line 69
    .line 70
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 71
    .line 72
    invoke-virtual {p2, p1, v1}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setCartoonFaceInfo(Ll/omw;Lcom/momocv/cartoonface/CartoonfaceInfo;)V

    .line 73
    .line 74
    .line 75
    :goto_1
    iget-object p2, p1, Ll/omw;->H:Lcom/momocv/cartoonface/CartoonfaceInfo;

    .line 76
    .line 77
    if-eqz p2, :cond_4

    .line 78
    .line 79
    iget-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 80
    .line 81
    iget-boolean v0, p1, Ll/omw;->a:Z

    .line 82
    .line 83
    invoke-virtual {p3, p2, v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setCryingFaceInfo(Lcom/momocv/cartoonface/CartoonfaceInfo;Z)V

    .line 84
    .line 85
    .line 86
    :cond_4
    iget-object p2, p1, Ll/omw;->I:Lcom/momocv/stylizeface/StylizefaceInfo;

    .line 87
    .line 88
    if-eqz p2, :cond_5

    .line 89
    .line 90
    iget-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 91
    .line 92
    iget-boolean v0, p1, Ll/omw;->a:Z

    .line 93
    .line 94
    invoke-virtual {p3, p2, v0}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setStylizeFaceInfo(Lcom/momocv/stylizeface/StylizefaceInfo;Z)V

    .line 95
    .line 96
    .line 97
    :cond_5
    const-string p2, "default"

    .line 98
    .line 99
    iget-object p3, p1, Ll/omw;->K:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-nez p2, :cond_6

    .line 106
    .line 107
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 108
    .line 109
    iget-object p3, p1, Ll/omw;->K:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p2, p3}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setQRCodeInfo(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p2, p1, Ll/omw;->J:Lcom/momocv/ardetect/ArDetectInfo;

    .line 115
    .line 116
    if-eqz p2, :cond_7

    .line 117
    .line 118
    iget-object p3, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 119
    .line 120
    invoke-virtual {p3, p2}, Lcom/momo/mcamera/mask/LightningEngineHelper;->setARGift(Lcom/momocv/ardetect/ArDetectInfo;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 124
    .line 125
    if-eqz p2, :cond_9

    .line 126
    .line 127
    invoke-interface {p2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    if-eqz p2, :cond_9

    .line 132
    .line 133
    iget-object p2, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 134
    .line 135
    invoke-interface {p2}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    invoke-static {}, Lcom/core/glcore/util/TietieHeartHelper;->getInstance()Lcom/core/glcore/util/TietieHeartHelper;

    .line 140
    .line 141
    .line 142
    move-result-object p3

    .line 143
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->isHeartProgressDetector:Z

    .line 144
    .line 145
    if-eqz v0, :cond_8

    .line 146
    .line 147
    invoke-virtual {p3}, Lcom/core/glcore/util/TietieHeartHelper;->getXeTTHeart()Lcom/momo/xeengine/cv/bean/XETTHeartInfo;

    .line 148
    .line 149
    .line 150
    move-result-object p3

    .line 151
    invoke-interface {p2, p3}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchTTHeartInfo(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_8
    invoke-interface {p2, v1}, Lcom/momo/xeengine/event/IXEventDispatcher;->dispatchTTHeartInfo(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V

    .line 156
    .line 157
    .line 158
    :cond_9
    :goto_2
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->mmcvInfo:Ll/omw;

    .line 159
    .line 160
    const/4 p1, 0x0

    .line 161
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->clearFaceInfo:Z

    .line 162
    .line 163
    return-void
.end method

.method public setMakeupIntensity(Ljava/lang/String;F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->cartoonMutex:Lcom/momo/mcamera/mask/cartoon/CartoonMutex;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2}, Lcom/momo/mcamera/mask/cartoon/CartoonMutex;->interceptMakeup(Ljava/lang/String;F)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 14
    .line 15
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEffectIntensity(Ljava/lang/String;F)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setSegmentType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->segmentType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSkinSmoothVersion(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p1, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v1, 0x0

    .line 14
    :goto_0
    invoke-interface {v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setFullSmoothEnable(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 18
    .line 19
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setSkinSmoothVersion(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public setSkinWhiteVersion(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setSkinWhiteningVersion(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setTextureData(Ljava/lang/String;[BII)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->setTextureData(Ljava/lang/String;[BII)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setWarpScaleFactor(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->faceWarpProcessor:Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setScaleFactor(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setWhitenV3SubVersion(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setWhitenV3SubVersion(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public switchDoki(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setSkinSmoothVersion(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public touchHitTest(FFII)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/LightningEngineFilter;->engineHelper:Lcom/momo/mcamera/mask/LightningEngineHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/momo/mcamera/mask/LightningEngineHelper;->touchHitTest(FFII)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method
