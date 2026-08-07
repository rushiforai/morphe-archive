.class public Lcom/ss/bytertc/engine/InternalScreenSharingParams;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public bitrate:I

.field public frameRate:I

.field public maxHeight:I

.field public maxWidth:I

.field public minBitrate:I


# direct methods
.method public constructor <init>(IIIII)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput p2, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxHeight:I

    .line 43
    iput p1, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxWidth:I

    .line 44
    iput p3, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->frameRate:I

    .line 45
    iput p4, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->bitrate:I

    .line 46
    iput p5, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->minBitrate:I

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/video/ScreenSharingParameters;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxWidth:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxHeight:I

    .line 8
    .line 9
    const/16 v1, 0xf

    .line 10
    .line 11
    iput v1, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->frameRate:I

    .line 12
    .line 13
    const/4 v1, -0x1

    .line 14
    iput v1, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->bitrate:I

    .line 15
    .line 16
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->minBitrate:I

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget v0, p1, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxHeight:I

    .line 21
    .line 22
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxHeight:I

    .line 23
    .line 24
    iget v0, p1, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->maxWidth:I

    .line 25
    .line 26
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxWidth:I

    .line 27
    .line 28
    iget v0, p1, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->frameRate:I

    .line 29
    .line 30
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->frameRate:I

    .line 31
    .line 32
    iget v0, p1, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->bitrate:I

    .line 33
    .line 34
    iput v0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->bitrate:I

    .line 35
    .line 36
    iget p1, p1, Lcom/ss/bytertc/engine/video/ScreenSharingParameters;->minBitrate:I

    .line 37
    .line 38
    iput p1, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->minBitrate:I

    .line 39
    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method public getBitrate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->bitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameRate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->frameRate:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinBitrate()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->minBitrate:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalScreenSharingParams;->maxWidth:I

    .line 2
    .line 3
    return p0
.end method
