.class public Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$a;,
        Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$b;,
        Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$TECameraAlgoResult;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/ss/android/ttvecamera/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addCameraAlgorithm(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public destroy()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getResult()Ll/xqh0;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public init()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public native nativeAddCameraAlgorithm(JLjava/lang/Object;)I
.end method

.method public native nativeAlgorithmDestroy(J)I
.end method

.method public native nativeAlgorithmGetResult(J)Ljava/lang/Object;
.end method

.method public nativeCallback_onError(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public nativeCallback_onProcess(FZ)V
    .locals 0

    return-void
.end method

.method public native nativeInit()J
.end method

.method public native nativeProcessAlgorithm(JLjava/lang/Object;)Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$TECameraAlgoResult;
.end method

.method public native nativeRemoveCameraAlgorithm(JI)I
.end method

.method public native nativeUpdateCameraAlgorithmParam(JLjava/lang/Object;)I
.end method

.method public processAlgorithm(Lcom/ss/android/ttvecamera/TECameraFrame;)Lcom/ss/android/ttvecamera/TECameraFrame;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public removeCameraAlgorithm(I)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public setErrorListener(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$a;)V
    .locals 0

    return-void
.end method

.method public setProcessListener(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmInterface$b;)V
    .locals 0

    return-void
.end method

.method public updateCameraAlgorithmParam(Lcom/ss/android/ttvecamera/cameraalgorithm/TECameraAlgorithmParam;)I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method
