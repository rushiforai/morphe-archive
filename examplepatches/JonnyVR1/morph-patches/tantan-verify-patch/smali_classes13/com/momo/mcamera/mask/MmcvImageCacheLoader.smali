.class public Lcom/momo/mcamera/mask/MmcvImageCacheLoader;
.super Lcom/momo/mcamera/mask/MmcvImageLoader;
.source "SourceFile"


# instance fields
.field private volatile cacheReady:Z

.field private mCacheImage:Ll/umw;

.field private mCacheIndex:I

.field private waitSignal:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/MmcvImageLoader;-><init>(Lcom/momo/mcamera/mask/Sticker;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->cacheReady:Z

    .line 6
    .line 7
    new-instance v0, Ll/umw;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheImage:Ll/umw;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->waitSignal:Ljava/lang/Object;

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastCurSticker:I

    .line 23
    .line 24
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->executeStickerCacheThread(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->waitSignal:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->cacheReady:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$102(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->cacheReady:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic access$200(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$300(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;)Ll/umw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheImage:Ll/umw;

    .line 2
    .line 3
    return-object p0
.end method

.method private executeStickerCacheThread(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader$1;-><init>(Lcom/momo/mcamera/mask/MmcvImageCacheLoader;Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    invoke-static {p0, v0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getMmcvImage(Landroid/content/Context;)Ll/umw;
    .locals 10

    .line 1
    iget-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->currentTime:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    const/4 v2, 0x0

    .line 14
    :try_start_0
    iget-object v3, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->waitSignal:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 17
    :try_start_1
    iget-object v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 18
    .line 19
    if-nez v4, :cond_1

    .line 20
    .line 21
    new-instance v4, Ll/umw;

    .line 22
    .line 23
    invoke-direct {v4}, Ll/umw;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_4

    .line 31
    :cond_1
    :goto_0
    iget-wide v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 32
    .line 33
    const-wide/16 v6, -0x1

    .line 34
    .line 35
    cmp-long v8, v4, v6

    .line 36
    .line 37
    if-nez v8, :cond_2

    .line 38
    .line 39
    iget-wide v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 40
    .line 41
    sub-long v4, v0, v4

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_2
    iget-wide v8, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 45
    .line 46
    sub-long/2addr v4, v8

    .line 47
    :goto_1
    iget v8, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->STICKER_MMTIME_PER_FRAME:I

    .line 48
    .line 49
    int-to-long v8, v8

    .line 50
    cmp-long v4, v4, v8

    .line 51
    .line 52
    if-gtz v4, :cond_3

    .line 53
    .line 54
    iget v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastCurSticker:I

    .line 55
    .line 56
    iget-object v5, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 57
    .line 58
    iget v5, v5, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 59
    .line 60
    if-eq v4, v5, :cond_7

    .line 61
    .line 62
    :cond_3
    iget-object v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 63
    .line 64
    invoke-virtual {v4, p1}, Lcom/momo/mcamera/mask/Sticker;->getImagePath(Landroid/content/Context;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    iput-object v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v4, :cond_4

    .line 71
    .line 72
    monitor-exit v3

    .line 73
    return-object v2

    .line 74
    :cond_4
    invoke-virtual {p0, v4}, Lcom/momo/mcamera/mask/MmcvImageLoader;->getImageIndexByPath(Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    iget v5, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheIndex:I

    .line 79
    .line 80
    if-ne v4, v5, :cond_5

    .line 81
    .line 82
    iget-boolean v5, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->cacheReady:Z

    .line 83
    .line 84
    if-eqz v5, :cond_5

    .line 85
    .line 86
    iget-object v5, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 87
    .line 88
    iget-object v8, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheImage:Ll/umw;

    .line 89
    .line 90
    iput-object v8, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 91
    .line 92
    iput-object v5, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheImage:Ll/umw;

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_5
    iget-object v5, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 96
    .line 97
    iget-object v8, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->imagePath:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v5, v8}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :goto_2
    iget-object v5, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 103
    .line 104
    iget v5, v5, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 105
    .line 106
    iput v5, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->mCacheIndex:I

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    iput-boolean v5, p0, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->cacheReady:Z

    .line 110
    .line 111
    iput v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mCurrentIndex:I

    .line 112
    .line 113
    iget-object v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 114
    .line 115
    iget v4, v4, Lcom/momo/mcamera/mask/Sticker;->curIndex:I

    .line 116
    .line 117
    iput v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastCurSticker:I

    .line 118
    .line 119
    iget-wide v4, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mRenderTime:J

    .line 120
    .line 121
    cmp-long v6, v4, v6

    .line 122
    .line 123
    if-nez v6, :cond_6

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    move-wide v0, v4

    .line 127
    :goto_3
    iput-wide v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->lastFrameTime:J

    .line 128
    .line 129
    :cond_7
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    iget-object v0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 131
    .line 132
    invoke-direct {p0, v0, p1}, Lcom/momo/mcamera/mask/MmcvImageCacheLoader;->executeStickerCacheThread(Lcom/momo/mcamera/mask/Sticker;Landroid/content/Context;)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/momo/mcamera/mask/MmcvImageLoader;->mMMCVImage:Ll/umw;

    .line 136
    .line 137
    return-object p0

    .line 138
    :goto_4
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 140
    :catchall_1
    move-exception p0

    .line 141
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 142
    .line 143
    .line 144
    return-object v2
.end method
