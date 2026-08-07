.class public Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;
    }
.end annotation


# instance fields
.field faceCount:I

.field infos:[Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;


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
.method public getFaceCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo;->faceCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getInfos()[Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo;->infos:[Lcom/effectsar/labcv/effectsdk/BefGazeEstimationInfo$BefGazeEstimation;

    .line 2
    .line 3
    return-object p0
.end method
