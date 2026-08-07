.class public Lcom/momo/mcamera/mask/StickerBitmapCache;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;,
        Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;
    }
.end annotation


# static fields
.field private static final MAX_CACHE:I = 0x5


# instance fields
.field private final STICKER_MMTIME_PER_FRAME:I

.field cacheManager:Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;

.field private context:Landroid/content/Context;

.field count:I

.field i:I

.field private imagePath:Ljava/lang/String;

.field imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

.field protected imageQueenLock:Ljava/lang/Object;

.field public isLoadNew:Z

.field private lastFrameIndex:I

.field private lastFrameTime:J

.field private lastIndex:I

.field private linkedBlockingDeque:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ll/umw;",
            ">;"
        }
    .end annotation
.end field

.field private loopCount:I

.field mRenderFRate:I

.field mRenderTime:J

.field now:J

.field oldnow:J

.field oneImage:Ll/umw;

.field private pauseCache:Z

.field private readIndex:I

.field realBitmap:Landroid/graphics/Bitmap;

.field private renderTime:J

.field private running:Z

.field private startLoop:Z

.field private startTime:J

.field private sticker:Lcom/momo/mcamera/mask/Sticker;

.field t:I

.field private waitSignal:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->isLoadNew:Z

    .line 6
    .line 7
    new-instance v1, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageQueenLock:Ljava/lang/Object;

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->running:Z

    .line 15
    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->loopCount:I

    .line 17
    .line 18
    const-wide/16 v1, -0x1

    .line 19
    .line 20
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startLoop:Z

    .line 23
    .line 24
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->renderTime:J

    .line 25
    .line 26
    iput v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->i:I

    .line 27
    .line 28
    const/16 v3, 0x14

    .line 29
    .line 30
    iput v3, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderFRate:I

    .line 31
    .line 32
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderTime:J

    .line 33
    .line 34
    const/16 v1, 0x42

    .line 35
    .line 36
    iput v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->STICKER_MMTIME_PER_FRAME:I

    .line 37
    .line 38
    iput v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->lastFrameIndex:I

    .line 39
    .line 40
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->context:Landroid/content/Context;

    .line 43
    .line 44
    iput-object p3, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 45
    .line 46
    new-instance p1, Ljava/lang/Object;

    .line 47
    .line 48
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->waitSignal:Ljava/lang/Object;

    .line 52
    .line 53
    new-instance p1, Ljava/util/LinkedList;

    .line 54
    .line 55
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 59
    .line 60
    new-instance p1, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;

    .line 61
    .line 62
    invoke-direct {p1, p0}, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;-><init>(Lcom/momo/mcamera/mask/StickerBitmapCache;)V

    .line 63
    .line 64
    .line 65
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->cacheManager:Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;

    .line 66
    .line 67
    :goto_0
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->getMaxIndex()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-ge v0, p1, :cond_0

    .line 72
    .line 73
    invoke-virtual {p0, p2, v0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->addNewIndex(Landroid/content/Context;I)V

    .line 74
    .line 75
    .line 76
    iput v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 77
    .line 78
    add-int/lit8 v0, v0, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const/4 p1, 0x5

    .line 82
    iput p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 83
    .line 84
    new-instance p1, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;

    .line 85
    .line 86
    const/4 p2, 0x0

    .line 87
    invoke-direct {p1, p0, p2}, Lcom/momo/mcamera/mask/StickerBitmapCache$ReadBitmapThread;-><init>(Lcom/momo/mcamera/mask/StickerBitmapCache;Lcom/momo/mcamera/mask/StickerBitmapCache$1;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 91
    .line 92
    .line 93
    const/4 p1, 0x1

    .line 94
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->running:Z

    .line 95
    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide p1

    .line 100
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 101
    .line 102
    return-void
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/StickerBitmapCache;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->running:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/momo/mcamera/mask/StickerBitmapCache;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->running:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->waitSignal:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/StickerBitmapCache;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->context:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/momo/mcamera/mask/StickerBitmapCache;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$402(Lcom/momo/mcamera/mask/StickerBitmapCache;Ljava/util/LinkedList;)Ljava/util/LinkedList;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public addNewIndex(Landroid/content/Context;I)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->cacheManager:Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->getOneImageBuffer()Ll/umw;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object p2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imagePath:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    new-instance p1, Ll/umw;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/umw;-><init>()V

    .line 23
    .line 24
    .line 25
    const/4 p2, 0x0

    .line 26
    invoke-virtual {p1, p2}, Ll/umw;->g([B)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public cancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->waitSignal:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->running:Z

    .line 6
    .line 7
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->waitSignal:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 10
    .line 11
    .line 12
    monitor-exit v0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    throw p0
.end method

.method public getBitmap()Ll/umw;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return-object v1

    .line 7
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    iget-wide v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 12
    .line 13
    const-wide/16 v6, -0x1

    .line 14
    .line 15
    cmp-long v0, v4, v6

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 20
    .line 21
    :cond_1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->pauseCache:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->oneImage:Ll/umw;

    .line 27
    .line 28
    if-nez v0, :cond_4

    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 31
    .line 32
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->context:Landroid/content/Context;

    .line 33
    .line 34
    invoke-virtual {v0, v4}, Lcom/momo/mcamera/mask/Sticker;->getImagePath(Landroid/content/Context;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imagePath:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1, v0}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-wide v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderTime:J

    .line 44
    .line 45
    cmp-long v4, v0, v6

    .line 46
    .line 47
    if-nez v4, :cond_3

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    move-wide v2, v0

    .line 51
    :goto_0
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->lastFrameTime:J

    .line 52
    .line 53
    goto :goto_3

    .line 54
    :cond_4
    iget-wide v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderTime:J

    .line 55
    .line 56
    cmp-long v0, v4, v6

    .line 57
    .line 58
    iget-wide v8, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->lastFrameTime:J

    .line 59
    .line 60
    if-nez v0, :cond_5

    .line 61
    .line 62
    sub-long v4, v2, v8

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_5
    sub-long/2addr v4, v8

    .line 66
    :goto_1
    const-wide/16 v8, 0x42

    .line 67
    .line 68
    cmp-long v0, v4, v8

    .line 69
    .line 70
    if-lez v0, :cond_7

    .line 71
    .line 72
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 73
    .line 74
    iget-object v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->context:Landroid/content/Context;

    .line 75
    .line 76
    invoke-virtual {v0, v4}, Lcom/momo/mcamera/mask/Sticker;->getImagePath(Landroid/content/Context;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imagePath:Ljava/lang/String;

    .line 81
    .line 82
    iget-wide v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderTime:J

    .line 83
    .line 84
    cmp-long v0, v4, v6

    .line 85
    .line 86
    if-nez v0, :cond_6

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_6
    move-wide v2, v4

    .line 90
    :goto_2
    iput-wide v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->lastFrameTime:J

    .line 91
    .line 92
    :cond_7
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imagePath:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1, v0}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :goto_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->oneImage:Ll/umw;

    .line 98
    .line 99
    return-object p0
.end method

.method public getMaxIndex()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x5

    .line 8
    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public getRealBitmap()Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageProvider:Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->realBitmap:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Lcom/momo/mcamera/mask/delegate/ImageDelegateProvider;->getRealBitmap()Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->realBitmap:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->realBitmap:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public pauseCache()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->pauseCache:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageQueenLock:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    const/4 v1, 0x1

    .line 10
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->pauseCache:Z

    .line 11
    .line 12
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->realBitmap:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public readNewBitMaps(Landroid/content/Context;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageQueenLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->isLoadNew:Z

    .line 6
    .line 7
    iget v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 8
    .line 9
    add-int/lit8 v2, v2, 0x2

    .line 10
    .line 11
    iget-object v3, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 14
    .line 15
    .line 16
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    sub-int/2addr v3, v1

    .line 18
    iget v4, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    if-ge v2, v3, :cond_1

    .line 22
    .line 23
    move v2, v5

    .line 24
    :goto_0
    :try_start_1
    iget v3, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/StickerBitmapCache;->getMaxIndex()I

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    div-int/lit8 v6, v6, 0x2

    .line 31
    .line 32
    add-int/2addr v3, v6

    .line 33
    if-gt v4, v3, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, p1, v4}, Lcom/momo/mcamera/mask/StickerBitmapCache;->addNewIndex(Landroid/content/Context;I)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v2, v4, 0x1

    .line 39
    .line 40
    move v7, v4

    .line 41
    move v4, v2

    .line 42
    move v2, v7

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_4

    .line 46
    :cond_0
    add-int/2addr v2, v1

    .line 47
    iput v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 48
    .line 49
    goto :goto_3

    .line 50
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Sticker;->getFrameNumber()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-ge v4, v2, :cond_2

    .line 57
    .line 58
    invoke-virtual {p0, p1, v4}, Lcom/momo/mcamera/mask/StickerBitmapCache;->addNewIndex(Landroid/content/Context;I)V

    .line 59
    .line 60
    .line 61
    add-int/lit8 v4, v4, 0x1

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move v2, v5

    .line 65
    move v3, v2

    .line 66
    :goto_2
    const/4 v4, 0x5

    .line 67
    if-ge v2, v4, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0, p1, v2}, Lcom/momo/mcamera/mask/StickerBitmapCache;->addNewIndex(Landroid/content/Context;I)V

    .line 70
    .line 71
    .line 72
    add-int/lit8 v3, v2, 0x1

    .line 73
    .line 74
    move v7, v3

    .line 75
    move v3, v2

    .line 76
    move v2, v7

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    add-int/2addr v3, v1

    .line 79
    iput v3, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->readIndex:I

    .line 80
    .line 81
    :goto_3
    iput-boolean v5, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->isLoadNew:Z

    .line 82
    .line 83
    monitor-exit v0

    .line 84
    return-void

    .line 85
    :goto_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    throw p0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->cacheManager:Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/StickerBitmapCache$MMCVImageCacheManager;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->oneImage:Ll/umw;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->oneImage:Ll/umw;

    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public resetCache()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageQueenLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const-wide/16 v1, -0x1

    .line 5
    .line 6
    :try_start_0
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startLoop:Z

    .line 10
    .line 11
    iget-object v2, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 12
    .line 13
    iput v1, v2, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 18
    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->realBitmap:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0
.end method

.method public resetStickers(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->imageQueenLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startLoop:Z

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    iput-wide v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->startTime:J

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->linkedBlockingDeque:Ljava/util/LinkedList;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p0
.end method

.method public resumeCache()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->pauseCache:Z

    .line 3
    .line 4
    return-void
.end method

.method public setRenderTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/mcamera/mask/StickerBitmapCache;->mRenderTime:J

    .line 2
    .line 3
    return-void
.end method
