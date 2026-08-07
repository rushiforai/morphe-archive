.class public Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASOutput;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoAS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoASOutput"
.end annotation


# instance fields
.field matrixList:[Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASMatrix;

.field matrixNum:I

.field realCropRatio:F

.field realRadius:I


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
.method public getMatrixList()[Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASMatrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASOutput;->matrixList:[Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASMatrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMatrixNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASOutput;->matrixNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getRealCropRatio()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASOutput;->realCropRatio:F

    .line 2
    .line 3
    return p0
.end method

.method public getRealRadius()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/VideoAS$VideoASOutput;->realRadius:I

    .line 2
    .line 3
    return p0
.end method
