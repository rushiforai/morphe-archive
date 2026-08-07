.class public Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoDeflicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoDeflickerProcessParam"
.end annotation


# instance fields
.field blendRate:F

.field height:I

.field inputTextureId:I

.field isFirst:Z

.field kernelSize:F

.field open:Z

.field stMatrix:[F

.field strideH:I

.field strideW:I

.field width:I


# direct methods
.method public constructor <init>(IIIIZIFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->height:I

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->strideW:I

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->strideH:I

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->open:Z

    .line 13
    .line 14
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->inputTextureId:I

    .line 15
    .line 16
    iput p7, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->blendRate:F

    .line 17
    .line 18
    iput p8, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerProcessParam;->kernelSize:F

    .line 19
    .line 20
    return-void
.end method
