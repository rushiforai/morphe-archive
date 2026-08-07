.class public Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InitConfig"
.end annotation


# instance fields
.field asnycProcess:Z

.field disableAsf:Z

.field disableDayScene:Z

.field disableDenoise:Z

.field disableHdr:Z

.field disableNightScene:Z

.field height:I

.field kernelBinPath:Ljava/lang/String;

.field oneKeyRecordHdrV2:Z

.field powerLevel:I

.field sceneMode:I

.field width:I


# direct methods
.method public constructor <init>(IILjava/lang/String;ZZZZZZZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->height:I

    .line 7
    .line 8
    iput-object p3, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->kernelBinPath:Ljava/lang/String;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->disableDenoise:Z

    .line 11
    .line 12
    iput-boolean p5, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->disableHdr:Z

    .line 13
    .line 14
    iput-boolean p6, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->oneKeyRecordHdrV2:Z

    .line 15
    .line 16
    iput-boolean p7, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->asnycProcess:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->disableNightScene:Z

    .line 19
    .line 20
    iput-boolean p9, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->disableDayScene:Z

    .line 21
    .line 22
    iput-boolean p10, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->disableAsf:Z

    .line 23
    .line 24
    iput p11, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->powerLevel:I

    .line 25
    .line 26
    iput p12, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$InitConfig;->sceneMode:I

    .line 27
    .line 28
    return-void
.end method
