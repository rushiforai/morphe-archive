.class public Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;
.super Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;
.source "SourceFile"


# instance fields
.field context:Landroid/content/Context;

.field count:I

.field sticker:Lcom/momo/mcamera/mask/Sticker;

.field stickerItem:Lcom/momo/mcamera/mask/StickerItem;

.field stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;-><init>(Ljava/lang/String;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 7
    .line 8
    iput-object p1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 9
    .line 10
    new-instance v0, Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 16
    .line 17
    const-wide/16 v1, 0x28

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Lcom/momo/mcamera/mask/MmcvImageLoader;->setFrameDuration(J)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->context:Landroid/content/Context;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public getFrameTexture()[I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getMmcvImageByIndex(I)Ll/umw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 10
    .line 11
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    add-int/2addr v1, v2

    .line 15
    iput v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-gtz v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "cur count = "

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, " total number ="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-string v1, "FilterProcess"

    .line 54
    .line 55
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 59
    .line 60
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-lt v0, v1, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getLoopStart()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 75
    .line 76
    if-gez v0, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 85
    .line 86
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/umw;->e()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget-object v1, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->frameInfo:Ll/umw;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/umw;->c()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {p0, v0, v1}, Ll/lim;->updateBitmapInfo(II)V

    .line 99
    .line 100
    .line 101
    iput-boolean v2, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->needReload:Z

    .line 102
    .line 103
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->getFrameTexture()[I

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method

.method public recycleResourceInGlThread()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->recycleResourceInGlThread()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerItem:Lcom/momo/mcamera/mask/StickerItem;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerItem;->releaseFrameBuffer()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/MmcvImageLoader;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->context:Landroid/content/Context;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerItem:Lcom/momo/mcamera/mask/StickerItem;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->stickerLoader:Lcom/momo/mcamera/mask/MmcvImageLoader;

    .line 22
    .line 23
    return-void
.end method

.method public resetStatus()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/MMFrameGeomeAttrInfo;->resetStatus()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/ThirdPartEffect/Pott/attrInfo/StickerItemGeomeAttrInfo;->count:I

    .line 6
    .line 7
    return-void
.end method
