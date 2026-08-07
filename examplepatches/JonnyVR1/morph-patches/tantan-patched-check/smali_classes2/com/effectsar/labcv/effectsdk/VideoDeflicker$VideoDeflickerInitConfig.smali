.class public Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/VideoDeflicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoDeflickerInitConfig"
.end annotation


# instance fields
.field algType:I

.field backendType:I

.field binPath:Ljava/lang/String;

.field isExtOESTexture:Z

.field maxHeight:I

.field maxWidth:I

.field pixelFmt:I

.field powerLevel:I


# direct methods
.method public constructor <init>(Ljava/lang/String;ZIIIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->binPath:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->isExtOESTexture:Z

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->maxHeight:I

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->maxWidth:I

    .line 11
    .line 12
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->pixelFmt:I

    .line 13
    .line 14
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->powerLevel:I

    .line 15
    .line 16
    iput p7, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->backendType:I

    .line 17
    .line 18
    iput p8, p0, Lcom/effectsar/labcv/effectsdk/VideoDeflicker$VideoDeflickerInitConfig;->algType:I

    .line 19
    .line 20
    return-void
.end method
