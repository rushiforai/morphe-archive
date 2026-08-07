.class Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/StickerBitmapCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MMCVImageCacheManager"
.end annotation


# instance fields
.field cacheArray:[Ll/umw;

.field curIndex:I

.field mmcvImageDataSize:I

.field final synthetic this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

.field totalSize:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/StickerBitmapCache;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->this$0:Lcom/momo/mcamera/mask/StickerBitmapCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->mmcvImageDataSize:I

    .line 8
    .line 9
    iput p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->curIndex:I

    .line 10
    .line 11
    const/4 p1, 0x5

    .line 12
    iput p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->totalSize:I

    .line 13
    .line 14
    new-array p1, p1, [Ll/umw;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->updateImageArray()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private updateImageArray()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->totalSize:I

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 7
    .line 8
    new-instance v2, Ll/umw;

    .line 9
    .line 10
    invoke-direct {v2}, Ll/umw;-><init>()V

    .line 11
    .line 12
    .line 13
    aput-object v2, v1, v0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 16
    .line 17
    aget-object v1, v1, v0

    .line 18
    .line 19
    add-int/lit8 v0, v0, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    move v1, v0

    .line 7
    :goto_0
    iget v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->totalSize:I

    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 12
    .line 13
    aget-object v2, v2, v1

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iput v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->mmcvImageDataSize:I

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public getOneImageBuffer()Ll/umw;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->cacheArray:[Ll/umw;

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->curIndex:I

    .line 4
    .line 5
    aget-object v0, v0, v1

    .line 6
    .line 7
    add-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iget v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->totalSize:I

    .line 10
    .line 11
    rem-int/2addr v1, v2

    .line 12
    iput v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->curIndex:I

    .line 13
    .line 14
    return-object v0
.end method

.method public setMmcvImageDataSize(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->mmcvImageDataSize:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->updateImageArray()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
