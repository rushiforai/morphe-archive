.class public Lcom/ss/bytertc/engine/SubscribeVideoBaseline;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public acceptableBadVideoFpsBaseline:I

.field public acceptableBadVideoPixelBaseline:I

.field public acceptableGoodVideoFpsBaseline:I

.field public acceptableGoodVideoPixelBaseline:I

.field public acceptableMinVideoResolutionHeight:I

.field public acceptableMinVideoResolutionWidth:I

.field public streamPriority:I


# direct methods
.method public constructor <init>(IIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableGoodVideoPixelBaseline:I

    .line 5
    .line 6
    iput p2, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableGoodVideoFpsBaseline:I

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableBadVideoPixelBaseline:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableBadVideoFpsBaseline:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableMinVideoResolutionWidth:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableMinVideoResolutionHeight:I

    .line 15
    .line 16
    iput p7, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->streamPriority:I

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public getAcceptableBadVideoFpsBaseline()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableBadVideoFpsBaseline:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptableBadVideoPixelBaseline()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableBadVideoPixelBaseline:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptableGoodVideoFpsBaseline()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableGoodVideoFpsBaseline:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptableGoodVideoPixelBaseline()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableGoodVideoPixelBaseline:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptableMinVideoResolutionHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableMinVideoResolutionHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getAcceptableMinVideoResolutionWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->acceptableMinVideoResolutionWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getStreamPriority()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/SubscribeVideoBaseline;->streamPriority:I

    .line 2
    .line 3
    return p0
.end method
