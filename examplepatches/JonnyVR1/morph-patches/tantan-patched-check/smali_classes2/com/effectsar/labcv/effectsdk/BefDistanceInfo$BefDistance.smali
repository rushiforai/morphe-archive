.class public Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/BefDistanceInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BefDistance"
.end annotation


# instance fields
.field private dis:F

.field private faceRect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;->faceRect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;->dis:F

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getDis()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;->dis:F

    .line 2
    .line 3
    return p0
.end method

.method public getFaceRect()Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefDistanceInfo$BefDistance;->faceRect:Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 2
    .line 3
    return-object p0
.end method
