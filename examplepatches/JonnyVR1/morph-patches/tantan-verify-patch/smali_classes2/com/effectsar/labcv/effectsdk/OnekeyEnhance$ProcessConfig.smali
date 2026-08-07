.class public Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/OnekeyEnhance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProcessConfig"
.end annotation


# instance fields
.field cvDetectFrames:I

.field faceList:[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;

.field faceNum:I

.field height:I

.field initDecayFrames:I

.field isFirstFrame:Z

.field isProtectFace:Z

.field iso:I

.field iso_max:I

.field iso_min:I

.field width:I


# direct methods
.method public constructor <init>(IIIIIIZZII[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso:I

    .line 5
    .line 6
    iput p2, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_max:I

    .line 7
    .line 8
    iput p3, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_min:I

    .line 9
    .line 10
    iput p4, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->cvDetectFrames:I

    .line 11
    .line 12
    iput p5, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->width:I

    .line 13
    .line 14
    iput p6, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->height:I

    .line 15
    .line 16
    iput-boolean p7, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isFirstFrame:Z

    .line 17
    .line 18
    iput-boolean p8, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isProtectFace:Z

    .line 19
    .line 20
    iput p9, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->initDecayFrames:I

    .line 21
    .line 22
    iput p10, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceNum:I

    .line 23
    .line 24
    iput-object p11, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceList:[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public getCvDetectFrames()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->cvDetectFrames:I

    .line 2
    .line 3
    return p0
.end method

.method public getFaceList()[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceList:[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFaceNum()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getInitDecayFrames()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->initDecayFrames:I

    .line 2
    .line 3
    return p0
.end method

.method public getIso()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso:I

    .line 2
    .line 3
    return p0
.end method

.method public getIso_max()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_max:I

    .line 2
    .line 3
    return p0
.end method

.method public getIso_min()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_min:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public isFirstFrame()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isFirstFrame:Z

    .line 2
    .line 3
    return p0
.end method

.method public isProtectFace()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isProtectFace:Z

    .line 2
    .line 3
    return p0
.end method

.method public setCvDetectFrames(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->cvDetectFrames:I

    .line 2
    .line 3
    return-void
.end method

.method public setFaceList([Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceList:[Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$FaceRect;

    .line 2
    .line 3
    return-void
.end method

.method public setFaceNum(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->faceNum:I

    .line 2
    .line 3
    return-void
.end method

.method public setFirstFrame(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isFirstFrame:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->height:I

    .line 2
    .line 3
    return-void
.end method

.method public setInitDecayFrames(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->initDecayFrames:I

    .line 2
    .line 3
    return-void
.end method

.method public setIso(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso:I

    .line 2
    .line 3
    return-void
.end method

.method public setIso_max(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_max:I

    .line 2
    .line 3
    return-void
.end method

.method public setIso_min(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->iso_min:I

    .line 2
    .line 3
    return-void
.end method

.method public setProtectFace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->isProtectFace:Z

    .line 2
    .line 3
    return-void
.end method

.method public setWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/OnekeyEnhance$ProcessConfig;->width:I

    .line 2
    .line 3
    return-void
.end method
