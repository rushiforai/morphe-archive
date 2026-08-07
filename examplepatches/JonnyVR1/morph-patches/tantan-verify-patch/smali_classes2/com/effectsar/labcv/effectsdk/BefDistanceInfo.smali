.class public Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;
    }
.end annotation


# instance fields
.field private dists:[F

.field private faceCount:I

.field private faceRects:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getBefDistance()[Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;
    .locals 5

    .line 1
    iget v0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->faceCount:I

    .line 2
    .line 3
    new-array v0, v0, [Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    iget v2, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->faceCount:I

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;

    .line 11
    .line 12
    iget-object v3, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->faceRects:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 13
    .line 14
    aget-object v3, v3, v1

    .line 15
    .line 16
    iget-object v4, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->dists:[F

    .line 17
    .line 18
    aget v4, v4, v1

    .line 19
    .line 20
    invoke-direct {v2, v3, v4}, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;-><init>(Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;F)V

    .line 21
    .line 22
    .line 23
    aput-object v2, v0, v1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-object v0
.end method

.method public getDists()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->dists:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->faceCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceRects()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;->faceRects:[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method
