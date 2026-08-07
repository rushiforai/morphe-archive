.class public Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/TaintSceneDetect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaintDetectParam"
.end annotation


# instance fields
.field backendType:I

.field detectFrequency:I

.field kernelBinPath:Ljava/lang/String;

.field modelPath:Ljava/lang/String;

.field numThread:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->detectFrequency:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->modelPath:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->kernelBinPath:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->backendType:I

    .line 11
    .line 12
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->numThread:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getBackendType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->backendType:I

    .line 2
    .line 3
    return p0
.end method

.method public getDetectFrequency()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->detectFrequency:I

    .line 2
    .line 3
    return p0
.end method

.method public getKernelBinPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->kernelBinPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getModelPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumThread()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->numThread:I

    .line 2
    .line 3
    return p0
.end method

.method public setBackendType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->backendType:I

    .line 2
    .line 3
    return-void
.end method

.method public setDetectFrequency(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->detectFrequency:I

    .line 2
    .line 3
    return-void
.end method

.method public setKernelBinPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->kernelBinPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setModelPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->modelPath:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNumThread(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/TaintSceneDetect$TaintDetectParam;->numThread:I

    .line 2
    .line 3
    return-void
.end method
