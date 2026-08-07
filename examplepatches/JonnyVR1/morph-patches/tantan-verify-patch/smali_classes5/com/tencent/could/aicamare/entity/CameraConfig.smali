.class public Lcom/tencent/could/aicamare/entity/CameraConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public isBackCamera:Z

.field public isByteDataBuffer:Z

.field public isLand:Z

.field public isMainThread:Z

.field public isSupportZoom:Z

.field public maxFps:I

.field public minFps:I

.field public mustDiffMinAndMaxFps:Z

.field public preHeight:I

.field public preWidth:I

.field public zoom:Lcom/tencent/could/aicamare/enums/CameraZoom;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isSupportZoom:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera:Z

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput-boolean v1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isByteDataBuffer:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isLand:Z

    .line 15
    .line 16
    const/16 v1, 0x780

    .line 17
    .line 18
    iput v1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preWidth:I

    .line 19
    .line 20
    const/16 v1, 0x438

    .line 21
    .line 22
    iput v1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preHeight:I

    .line 23
    .line 24
    const/16 v1, 0x18

    .line 25
    .line 26
    iput v1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->minFps:I

    .line 27
    .line 28
    const/16 v1, 0x1e

    .line 29
    .line 30
    iput v1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->maxFps:I

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->mustDiffMinAndMaxFps:Z

    .line 33
    .line 34
    sget-object v0, Lcom/tencent/could/aicamare/enums/CameraZoom;->ZOOM_1X:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->zoom:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public getMaxFps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->maxFps:I

    .line 2
    .line 3
    return p0
.end method

.method public getMinFps()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->minFps:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getPreWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getZoom()Lcom/tencent/could/aicamare/enums/CameraZoom;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->zoom:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 2
    .line 3
    return-object p0
.end method

.method public isBackCamera()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera:Z

    .line 2
    .line 3
    return p0
.end method

.method public isByteDataBuffer()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isByteDataBuffer:Z

    .line 2
    .line 3
    return p0
.end method

.method public isLand()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isLand:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMainThread()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread:Z

    .line 2
    .line 3
    return p0
.end method

.method public isMustDiffMinAndMaxFps()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->mustDiffMinAndMaxFps:Z

    .line 2
    .line 3
    return p0
.end method

.method public isSupportZoom()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isSupportZoom:Z

    .line 2
    .line 3
    return p0
.end method

.method public setBackCamera(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isBackCamera:Z

    .line 2
    .line 3
    return-void
.end method

.method public setByteDataBuffer(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isByteDataBuffer:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLand(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isLand:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMainThread(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isMainThread:Z

    .line 2
    .line 3
    return-void
.end method

.method public setMaxFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->maxFps:I

    .line 2
    .line 3
    return-void
.end method

.method public setMinFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->minFps:I

    .line 2
    .line 3
    return-void
.end method

.method public setMustDiffMinAndMaxFps(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->mustDiffMinAndMaxFps:Z

    .line 2
    .line 3
    return-void
.end method

.method public setPreHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preHeight:I

    .line 2
    .line 3
    return-void
.end method

.method public setPreWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->preWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setSupportZoom(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->isSupportZoom:Z

    .line 2
    .line 3
    return-void
.end method

.method public setZoom(Lcom/tencent/could/aicamare/enums/CameraZoom;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/could/aicamare/entity/CameraConfig;->zoom:Lcom/tencent/could/aicamare/enums/CameraZoom;

    .line 2
    .line 3
    return-void
.end method
