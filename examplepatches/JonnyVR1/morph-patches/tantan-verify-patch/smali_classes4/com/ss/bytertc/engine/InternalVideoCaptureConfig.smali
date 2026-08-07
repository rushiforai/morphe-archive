.class public Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public capturePreference:I

.field public frameRate:I

.field public height:I

.field public width:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->capturePreference:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->width:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->height:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->frameRate:I

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getCapturePreference()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->capturePreference:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalVideoCaptureConfig;->width:I

    .line 2
    .line 3
    return p0
.end method
