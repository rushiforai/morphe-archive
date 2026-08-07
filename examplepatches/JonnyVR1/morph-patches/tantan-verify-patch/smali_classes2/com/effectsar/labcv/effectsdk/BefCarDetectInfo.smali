.class public Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;,
        Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;
    }
.end annotation


# instance fields
.field private blurScore:D

.field private brandCount:I

.field private brandInfos:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;

.field private carCount:I

.field private carRects:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;

.field private grayScore:D


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->carCount:I

    .line 6
    .line 7
    iput v0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->brandCount:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getBlurScore()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->blurScore:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public getBrandCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->brandCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getBrandInfos()[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->brandInfos:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCarCount()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->carCount:I

    .line 2
    .line 3
    return p0
.end method

.method public getCarRects()[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->carRects:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGrayScore()D
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->grayScore:D

    .line 2
    .line 3
    return-wide v0
.end method

.method public setBrandCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->brandCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setBrandInfos([Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->brandInfos:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefBrandInfo;

    .line 2
    .line 3
    return-void
.end method

.method public setCarCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->carCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setCarRects([Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo;->carRects:[Lcom/effectsar/labcv/effectsdk/BefCarDetectInfo$BefCarRect;

    .line 2
    .line 3
    return-void
.end method
