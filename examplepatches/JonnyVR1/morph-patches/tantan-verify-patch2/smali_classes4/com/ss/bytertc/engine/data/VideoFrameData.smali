.class public Lcom/ss/bytertc/engine/data/VideoFrameData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bufferType:Lcom/ss/bytertc/engine/data/VideoBufferType;

.field public contentType:Lcom/ss/bytertc/engine/data/VideoContentType;

.field public eglContext:Landroid/opengl/EGLContext;

.field public fovTileInfo:Lcom/ss/bytertc/engine/video/FovVideoFrameInfo;

.field public height:I

.field public numberOfPlanes:I

.field public pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

.field public planeData:[Ljava/nio/ByteBuffer;

.field public planeStride:[I

.field public roiData:Ljava/nio/ByteBuffer;

.field public rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

.field public seiData:Ljava/nio/ByteBuffer;

.field public textureId:I

.field public textureMatrix:[F

.field public timestampUs:J

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoBufferType;->RAW_MEMORY:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->bufferType:Lcom/ss/bytertc/engine/data/VideoBufferType;

    .line 7
    .line 8
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->UNKNOWN:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 11
    .line 12
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoContentType;->NORMAL_FRAME:Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->contentType:Lcom/ss/bytertc/engine/data/VideoContentType;

    .line 15
    .line 16
    sget-object v0, Lcom/ss/bytertc/engine/data/VideoRotation;->VIDEO_ROTATION_0:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/engine/data/VideoFrameData;->rotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 19
    .line 20
    return-void
.end method
