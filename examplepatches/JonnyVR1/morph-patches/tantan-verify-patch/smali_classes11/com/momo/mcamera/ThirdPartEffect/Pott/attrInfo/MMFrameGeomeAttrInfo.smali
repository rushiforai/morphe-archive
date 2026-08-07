.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;
.super Ll/lim;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/ImageDelegate;
.implements Ll/gam;


# instance fields
.field frameInfo:Ll/umw;

.field framePath:Ljava/lang/String;

.field frameTexture:I

.field protected needReload:Z

.field targetHeight:I

.field targetWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/lim;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/umw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 13
    .line 14
    iput-boolean v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 15
    .line 16
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 17
    .line 18
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 19
    .line 20
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->framePath:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-static {v0, p1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/umw;->e()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/umw;->c()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {p0, p1, v0}, Ll/lim;->updateBitmapInfo(II)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method


# virtual methods
.method public getFrame()Ll/umw;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->framePath:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/umw;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 19
    .line 20
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->framePath:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 26
    .line 27
    return-object p0
.end method

.method public getFrameHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lim;->bitmapHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrameTexture()[I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-boolean v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 36
    .line 37
    :cond_1
    :goto_0
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    filled-new-array {p0}, [I

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public getFrameWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lim;->bitmapWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public recycleImageBuffers()V
    .locals 0

    return-void
.end method

.method public recycleResourceInGlThread()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->framePath:Ljava/lang/String;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Ll/umw;->g([B)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 12
    .line 13
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    filled-new-array {v0}, [I

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->destroyTexture([I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameTexture:I

    .line 26
    .line 27
    return-void
.end method

.method public resetStatus()V
    .locals 0

    return-void
.end method

.method public setTargetWidthAndHeight(II)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetHeight:I

    .line 2
    .line 3
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->targetWidth:I

    .line 4
    .line 5
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 0

    return-void
.end method
