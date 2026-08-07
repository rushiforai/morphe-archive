.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;
.super Ll/d33;
.source "SourceFile"


# instance fields
.field context:Landroid/content/Context;

.field inputexture:I

.field stickerItem:Lcom/momo/mcamera/mask/StickerItem;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/d33;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->inputexture:I

    .line 6
    .line 7
    new-instance v0, Lcom/momo/mcamera/mask/StickerItem;

    .line 8
    .line 9
    invoke-direct {v0, p1, p2}, Lcom/momo/mcamera/mask/StickerItem;-><init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->stickerItem:Lcom/momo/mcamera/mask/StickerItem;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->context:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getSubFrameShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvoid main(){\n   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/d33;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->stickerItem:Lcom/momo/mcamera/mask/StickerItem;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerItem;->getStickerAspectRatio()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->geometryAttrInfo:Ll/lim;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/lim;->updateBitmapAspectRatio(F)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public passShaderValues([I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->stickerItem:Lcom/momo/mcamera/mask/StickerItem;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->context:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/StickerItem;->getMmcvImage(Landroid/content/Context;)Ll/umw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->geometryAttrInfo:Ll/lim;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0}, Ll/umw;->c()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {v1, v2, v3}, Ll/lim;->updateBitmapInfo(II)V

    .line 20
    .line 21
    .line 22
    invoke-super {p0, p1}, Ll/d33;->passShaderValues([I)V

    .line 23
    .line 24
    .line 25
    iget p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->inputexture:I

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-static {v0}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->inputexture:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {p1, v0}, Lcom/core/glcore/util/TextureHelper;->loadDataToTexture(ILl/umw;)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->inputexture:I

    .line 41
    .line 42
    :goto_0
    const p1, 0x84c0

    .line 43
    .line 44
    .line 45
    invoke-static {p1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 46
    .line 47
    .line 48
    const/16 p1, 0xde1

    .line 49
    .line 50
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->inputexture:I

    .line 51
    .line 52
    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 53
    .line 54
    .line 55
    iget p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->textureHandle:I

    .line 56
    .line 57
    const/4 p1, 0x0

    .line 58
    invoke-static {p0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public setRenderSize(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ll/d33;->setRenderSize(II)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/program/esprogram/FullscreenStickerRenderProgram;->geometryAttrInfo:Ll/lim;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/lim;->setBaseRenderSize(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
