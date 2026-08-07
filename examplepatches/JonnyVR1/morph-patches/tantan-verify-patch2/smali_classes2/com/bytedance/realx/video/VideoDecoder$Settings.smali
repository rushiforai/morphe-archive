.class public Lcom/bytedance/realx/video/VideoDecoder$Settings;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/VideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Settings"
.end annotation


# instance fields
.field public final directRenderMode:I

.field public final enableAGFXSurfaceTextureHelper:Z

.field public final enableAsyncMode:Z

.field public final enableBFrameDecode:Z

.field public final enableRecreateByResolution:Z

.field public final enableSmoothOutput:Z

.field public final enableSurfaceTextureReuse:Z

.field public final enableYUVOutput:Z

.field public final height:I

.field public final latencyInsensitiveMode:Z

.field public final numberOfCores:I

.field public final outputByDts:Z

.field public final sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

.field public final texturePlayoutMode:I

.field public final width:I


# direct methods
.method public constructor <init>(IIIZZZZZZZZLcom/bytedance/realx/video/EglBase$Context;ZII)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "Settings"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->numberOfCores:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->width:I

    .line 7
    .line 8
    iput p3, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->height:I

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->outputByDts:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSmoothOutput:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableYUVOutput:Z

    .line 15
    .line 16
    iput-boolean p7, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->latencyInsensitiveMode:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableSurfaceTextureReuse:Z

    .line 19
    .line 20
    iput-boolean p9, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableRecreateByResolution:Z

    .line 21
    .line 22
    iput-boolean p10, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableBFrameDecode:Z

    .line 23
    .line 24
    iput-object p12, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->sharedContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 25
    .line 26
    iput-boolean p11, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAGFXSurfaceTextureHelper:Z

    .line 27
    .line 28
    iput-boolean p13, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->enableAsyncMode:Z

    .line 29
    .line 30
    iput p14, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->directRenderMode:I

    .line 31
    .line 32
    iput p15, p0, Lcom/bytedance/realx/video/VideoDecoder$Settings;->texturePlayoutMode:I

    .line 33
    .line 34
    return-void
.end method
