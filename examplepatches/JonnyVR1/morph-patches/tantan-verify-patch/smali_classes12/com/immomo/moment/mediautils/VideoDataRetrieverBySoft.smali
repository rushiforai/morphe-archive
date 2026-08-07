.class public Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
.super Ll/n7y;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;,
        Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;,
        Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$OnThumbnailListComplete;,
        Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;
    }
.end annotation


# static fields
.field public static final AV_PIX_FMT_BGRA:I = 0x1e

.field public static final AV_PIX_FMT_NV12:I = 0x19

.field public static final AV_PIX_FMT_RGBA:I = 0x1c

.field public static final AV_PIX_FMT_YUV420P:I = 0x0

.field public static final BITMAP_IMAGE:I = 0x1

.field public static final BYTERAW_DATA:I = 0x4

.field public static final BYTERAW_IMAGE:I = 0x3

.field public static final GET_FRAME_TYPE_BY_BEST:I = 0x1

.field public static final INTRAW_DATA:I = 0x5

.field public static final INTRAW_IMAGE:I = 0x2


# instance fields
.field private final BEST_FRAME_NEED_CNT_FOR_FIVE_MINS:I

.field private final BEST_FRAME_NEED_CNT_FOR_ONE_MINS:I

.field private final BEST_FRAME_NEED_CNT_FOR_THREE_MINS:I

.field private final GET_FRAME_TYPE_NORMAL:I

.field private final ONE_MINIS_DURATION:I

.field private TAG:Ljava/lang/String;

.field private final THREE_MINIS_DURATION:I

.field private WAIT_TIME_US:J

.field private mARGBData:[I

.field private mCompleteListener:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$OnThumbnailListComplete;

.field mCurBmp:Landroid/graphics/Bitmap;

.field private mDstByteData:[B

.field private mDstIntData:[I

.field private mDuration:J

.field private mExit:Z

.field private mFaceModeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

.field private mHandler:J

.field private mHeight:I

.field private mImageFrameFilterListener:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

.field private mIndex:I

.field private mProcessHelper:Ll/o3m;

.field private mSync:Ljava/lang/Object;

.field mThumbnailList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;",
            ">;"
        }
    .end annotation
.end field

.field private mType:I

.field private mWidth:I

.field private tasks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/n7y;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "VideoDataRetriever"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->TAG:Ljava/lang/String;

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 11
    .line 12
    new-instance v0, Ljava/lang/Object;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mARGBData:[I

    .line 21
    .line 22
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 23
    .line 24
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 25
    .line 26
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCurBmp:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    iput v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 30
    .line 31
    const v2, 0x3938700

    .line 32
    .line 33
    .line 34
    iput v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->ONE_MINIS_DURATION:I

    .line 35
    .line 36
    const v2, 0xaba9500

    .line 37
    .line 38
    .line 39
    iput v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->THREE_MINIS_DURATION:I

    .line 40
    .line 41
    iput v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->GET_FRAME_TYPE_NORMAL:I

    .line 42
    .line 43
    const/16 v2, 0xa

    .line 44
    .line 45
    iput v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->BEST_FRAME_NEED_CNT_FOR_ONE_MINS:I

    .line 46
    .line 47
    const/16 v2, 0x14

    .line 48
    .line 49
    iput v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->BEST_FRAME_NEED_CNT_FOR_THREE_MINS:I

    .line 50
    .line 51
    const/16 v2, 0x1e

    .line 52
    .line 53
    iput v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->BEST_FRAME_NEED_CNT_FOR_FIVE_MINS:I

    .line 54
    .line 55
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 56
    .line 57
    iput-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFaceModeList:Ljava/util/List;

    .line 58
    .line 59
    const-wide/16 v0, 0x2710

    .line 60
    .line 61
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->WAIT_TIME_US:J

    .line 62
    .line 63
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/lrw;->g()Ll/o3m;

    .line 68
    .line 69
    .line 70
    invoke-static {}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeCreateVideoDataRetriver()J

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 75
    .line 76
    return-void
.end method

.method public static synthetic access$100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDuration:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1100(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->tasks:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetYuvAndRgbOutFlag(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$1300(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$1400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;J)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeDecodeOneFrame(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$1600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[B)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetYuvImage([B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1700(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mARGBData:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;[I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetRGBImage([I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$1900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getAutoStep()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public static synthetic access$200(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ll/o3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic access$2000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;J)J
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getAutoMaxLength(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic access$300(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFaceModeList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$400(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$500(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$600(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$800(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$900(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mImageFrameFilterListener:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 2
    .line 3
    return-object p0
.end method

.method private allocImagebuffer(I)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-lez v0, :cond_9

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_9

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    mul-int/2addr v0, v2

    .line 23
    if-eqz p1, :cond_4

    .line 24
    .line 25
    const/16 v2, 0x19

    .line 26
    .line 27
    if-eq p1, v2, :cond_4

    .line 28
    .line 29
    const/16 v2, 0x1c

    .line 30
    .line 31
    if-eq p1, v2, :cond_0

    .line 32
    .line 33
    const/16 v2, 0x1e

    .line 34
    .line 35
    if-eq p1, v2, :cond_0

    .line 36
    .line 37
    return v1

    .line 38
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    array-length p1, p1

    .line 43
    mul-int/lit8 v1, v0, 0x4

    .line 44
    .line 45
    if-eq p1, v1, :cond_2

    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    mul-int/2addr p1, v1

    .line 56
    mul-int/lit8 p1, p1, 0x4

    .line 57
    .line 58
    new-array p1, p1, [B

    .line 59
    .line 60
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 61
    .line 62
    :cond_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 63
    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    array-length p1, p1

    .line 67
    if-eq p1, v0, :cond_8

    .line 68
    .line 69
    :cond_3
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    mul-int/2addr p1, v0

    .line 78
    new-array p1, p1, [I

    .line 79
    .line 80
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 84
    .line 85
    if-eqz p1, :cond_5

    .line 86
    .line 87
    array-length p1, p1

    .line 88
    mul-int/lit8 v1, v0, 0x3

    .line 89
    .line 90
    div-int/lit8 v1, v1, 0x2

    .line 91
    .line 92
    if-eq p1, v1, :cond_6

    .line 93
    .line 94
    :cond_5
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    mul-int/2addr p1, v1

    .line 103
    mul-int/lit8 p1, p1, 0x3

    .line 104
    .line 105
    div-int/lit8 p1, p1, 0x2

    .line 106
    .line 107
    new-array p1, p1, [B

    .line 108
    .line 109
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 110
    .line 111
    :cond_6
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 112
    .line 113
    if-eqz p1, :cond_7

    .line 114
    .line 115
    array-length p1, p1

    .line 116
    if-eq p1, v0, :cond_8

    .line 117
    .line 118
    :cond_7
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    mul-int/2addr p1, v0

    .line 127
    new-array p1, p1, [I

    .line 128
    .line 129
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 130
    .line 131
    :cond_8
    :goto_0
    const/4 p0, 0x1

    .line 132
    return p0

    .line 133
    :cond_9
    return v1
.end method

.method private decodecOneFrameToBmp(JII)Landroid/graphics/Bitmap;
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetYuvAndRgbOutFlag(Z)V

    .line 3
    .line 4
    .line 5
    const/16 v0, 0x1e

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetDstPixFmt(I)V

    .line 8
    .line 9
    .line 10
    if-lez p4, :cond_0

    .line 11
    .line 12
    if-lez p4, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, p3, p4}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->setDstImageSize(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    const/4 v1, 0x5

    .line 18
    invoke-direct {p0, p1, p2, v1, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decoderOneFrame(JII)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    move-object v0, p1

    .line 23
    check-cast v0, [I

    .line 24
    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    if-gtz p3, :cond_1

    .line 28
    .line 29
    iget p3, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mWidth:I

    .line 30
    .line 31
    :cond_1
    move v2, p3

    .line 32
    if-gtz p4, :cond_2

    .line 33
    .line 34
    iget p4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHeight:I

    .line 35
    .line 36
    :cond_2
    move v4, p4

    .line 37
    const/4 v1, 0x0

    .line 38
    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 39
    .line 40
    move v3, v2

    .line 41
    invoke-static/range {v0 .. v5}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_3
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method private decoderOneFrame(JII)Ljava/lang/Object;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetYuvAndRgbOutFlag(Z)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p4}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetDstPixFmt(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeDecodeOneFrame(J)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-lez p1, :cond_1

    .line 13
    .line 14
    invoke-direct {p0, p4}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->allocImagebuffer(I)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x5

    .line 21
    if-ne p3, p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 24
    .line 25
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetDstImage([I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstIntData:[I

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_0
    const/4 p1, 0x4

    .line 35
    if-ne p3, p1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetDstImage([B)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDstByteData:[B

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_1
    const/4 p0, 0x0

    .line 49
    return-object p0
.end method

.method private getAutoMaxLength(J)J
    .locals 6

    .line 1
    const-wide/32 v0, 0x1e8480

    .line 2
    .line 3
    .line 4
    rem-long v2, v0, p1

    .line 5
    .line 6
    const-wide/16 v4, 0x0

    .line 7
    .line 8
    cmp-long p0, v2, v4

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    sub-long/2addr p1, v2

    .line 13
    add-long/2addr p1, v0

    .line 14
    return-wide p1

    .line 15
    :cond_0
    return-wide v0
.end method

.method private getAutoStep()J
    .locals 2

    const-wide/32 v0, 0x493e0

    return-wide v0
.end method

.method private initNativeRetriever(Ljava/lang/String;)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 19
    .line 20
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeInitVideoDataRetriver(JLjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 26
    return p0
.end method

.method private static native nativeCreateVideoDataRetriver()J
.end method

.method private nativeDecodeOneFrame(J)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeDecodeOneFrame(JJ)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private static native nativeDecodeOneFrame(JJ)I
.end method

.method private nativeGetDstImage([B)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetDstFmtData(J[B)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, -0x1

    .line 15
    return p0
.end method

.method private nativeGetDstImage([I)I
    .locals 4

    .line 16
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_0

    .line 17
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetDstFmtDataIntArray(J[I)I

    move-result p0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method private nativeGetDuration()J
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    return-wide v0

    .line 12
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetDuration(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method private nativeGetFps()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetFrameRate(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeGetHeight()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetHeight(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeGetRGBImage([B)I
    .locals 4

    .line 16
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 17
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetRGBByteImageData(J[B)I

    move-result p0

    return p0
.end method

.method private nativeGetRGBImage([I)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetRGBImageData(J[I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeGetRotation()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetRotation(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeGetWidth()I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetWidth(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeGetYuvImage([B)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverGetYUVImageData(J[B)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private static native nativeInitVideoDataRetriver(JLjava/lang/String;)I
.end method

.method private static native nativeMediaRetrieverGetDstFmtData(J[B)I
.end method

.method private static native nativeMediaRetrieverGetDstFmtDataIntArray(J[I)I
.end method

.method private static native nativeMediaRetrieverGetDuration(J)J
.end method

.method private static native nativeMediaRetrieverGetFrameRate(J)I
.end method

.method private static native nativeMediaRetrieverGetHeight(J)I
.end method

.method private static native nativeMediaRetrieverGetRGBByteImageData(J[B)I
.end method

.method private static native nativeMediaRetrieverGetRGBImageData(J[I)I
.end method

.method private static native nativeMediaRetrieverGetRotation(J)I
.end method

.method private static native nativeMediaRetrieverGetWidth(J)I
.end method

.method private static native nativeMediaRetrieverGetYUVImageData(J[B)I
.end method

.method private static native nativeMediaRetrieverRelease(J)I
.end method

.method private static native nativeMediaRetrieverSeek(JJ)I
.end method

.method private static native nativeMediaRetrieverSetDstPixFmt(JI)V
.end method

.method private static native nativeMediaRetrieverSetYuvAndRgbOut(JI)V
.end method

.method private nativeRelease()I
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverRelease(J)I

    .line 12
    .line 13
    .line 14
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private nativeSeek(J)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, -0x1

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {v0, v1, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverSeek(JJ)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private nativeSetDstPixFmt(I)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverSetDstPixFmt(JI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private static native nativeSetDstPixSize(JII)V
.end method

.method private nativeSetYuvAndRgbOutFlag(Z)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeMediaRetrieverSetYuvAndRgbOut(JI)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private seek(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSeek(J)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private setDstImageSize(II)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {v0, v1, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSetDstPixSize(JII)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public executeFrameFilter()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/Thread;

    .line 6
    .line 7
    new-instance v1, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$1;-><init>(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "DataRetriverBySoft"

    .line 15
    .line 16
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public getBestImage()Landroid/graphics/Bitmap;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getDuration()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetDuration()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public getFrameAbsTime(J)Landroid/graphics/Bitmap;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const-wide/16 v1, 0x3e8

    .line 5
    .line 6
    mul-long/2addr p1, v1

    .line 7
    const/4 v1, 0x0

    .line 8
    :try_start_0
    invoke-direct {p0, p1, p2, v1, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decodecOneFrameToBmp(JII)Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    monitor-exit v0

    .line 13
    return-object p0

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

.method public getFrameAtTime(J)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeSeek(J)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-gez v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    monitor-exit v0

    .line 12
    return-object p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    invoke-direct {p0, p1, p2, v1, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decodecOneFrameToBmp(JII)Landroid/graphics/Bitmap;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    monitor-exit v0

    .line 21
    return-object p0

    .line 22
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method public getFrameRate()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetFps()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getImageByList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    const/16 v1, 0x1e

    .line 276
    invoke-virtual {p0, p1, v0, v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getImageByList(Ljava/util/List;II)V

    .line 277
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->TAG:Ljava/lang/String;

    const-string p1, "\n\n"

    invoke-static {p0, p1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public getImageByList(Ljava/util/List;II)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;",
            ">;II)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mType:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mThumbnailList:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, 0x0

    .line 21
    if-lez v4, :cond_1

    .line 22
    .line 23
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    check-cast v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 28
    .line 29
    iget-wide v6, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 30
    .line 31
    invoke-direct {p0, v6, v7}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->seek(J)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto/16 :goto_4

    .line 37
    .line 38
    :cond_1
    :goto_0
    iput v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 39
    .line 40
    :cond_2
    :goto_1
    iget v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-ge v4, v5, :cond_7

    .line 47
    .line 48
    iget-boolean v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 49
    .line 50
    if-nez v4, :cond_7

    .line 51
    .line 52
    iget v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 53
    .line 54
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 59
    .line 60
    if-ne p2, v1, :cond_3

    .line 61
    .line 62
    iget-wide v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 63
    .line 64
    iget v7, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstWidth:I

    .line 65
    .line 66
    iget v8, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->dstHeight:I

    .line 67
    .line 68
    invoke-direct {p0, v5, v6, v7, v8}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decodecOneFrameToBmp(JII)Landroid/graphics/Bitmap;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    if-eqz v5, :cond_5

    .line 73
    .line 74
    iput-object v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->bmp:Landroid/graphics/Bitmap;

    .line 75
    .line 76
    iget-object v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->TAG:Ljava/lang/String;

    .line 77
    .line 78
    new-instance v6, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v7, "get cur frame cost "

    .line 84
    .line 85
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 89
    .line 90
    .line 91
    move-result-wide v7

    .line 92
    sub-long/2addr v7, v2

    .line 93
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    invoke-static {v5, v2}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    goto :goto_2

    .line 108
    :cond_3
    const/4 v5, 0x2

    .line 109
    if-ne p2, v5, :cond_4

    .line 110
    .line 111
    iget-wide v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 112
    .line 113
    const/4 v7, 0x5

    .line 114
    invoke-direct {p0, v5, v6, v7, p3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decoderOneFrame(JII)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    check-cast v5, [I

    .line 119
    .line 120
    iput-object v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->intBuffer:[I

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_4
    const/4 v5, 0x3

    .line 124
    if-ne p2, v5, :cond_5

    .line 125
    .line 126
    iget-wide v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 127
    .line 128
    const/4 v7, 0x4

    .line 129
    invoke-direct {p0, v5, v6, v7, p3}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->decoderOneFrame(JII)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    check-cast v5, [B

    .line 134
    .line 135
    iput-object v5, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->byteBuffer:[B

    .line 136
    .line 137
    :cond_5
    :goto_2
    iget v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 138
    .line 139
    add-int/2addr v5, v1

    .line 140
    iput v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 141
    .line 142
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    if-ge v5, v6, :cond_2

    .line 147
    .line 148
    iget v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 149
    .line 150
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v5

    .line 154
    check-cast v5, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 155
    .line 156
    iget-wide v5, v5, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 157
    .line 158
    iget-wide v7, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 159
    .line 160
    cmp-long v5, v5, v7

    .line 161
    .line 162
    if-ltz v5, :cond_6

    .line 163
    .line 164
    iget v5, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 165
    .line 166
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    check-cast v5, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 171
    .line 172
    iget-wide v5, v5, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 173
    .line 174
    iget-wide v7, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 175
    .line 176
    sub-long/2addr v5, v7

    .line 177
    const-wide/32 v7, 0xf4240

    .line 178
    .line 179
    .line 180
    cmp-long v4, v5, v7

    .line 181
    .line 182
    if-ltz v4, :cond_2

    .line 183
    .line 184
    :cond_6
    iget-object v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->TAG:Ljava/lang/String;

    .line 185
    .line 186
    new-instance v5, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .line 190
    .line 191
    const-string v6, "seek to new pos "

    .line 192
    .line 193
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget v6, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 197
    .line 198
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v6

    .line 202
    check-cast v6, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 203
    .line 204
    iget-wide v6, v6, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 205
    .line 206
    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-static {v4, v5}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 214
    .line 215
    .line 216
    iget v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mIndex:I

    .line 217
    .line 218
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    check-cast v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 223
    .line 224
    iget-wide v4, v4, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->pts:J

    .line 225
    .line 226
    invoke-direct {p0, v4, v5}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->seek(J)V

    .line 227
    .line 228
    .line 229
    goto/16 :goto_1

    .line 230
    .line 231
    :cond_7
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 232
    .line 233
    if-eqz p0, :cond_a

    .line 234
    .line 235
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    :cond_8
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-eqz p2, :cond_9

    .line 244
    .line 245
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object p2

    .line 249
    check-cast p2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;

    .line 250
    .line 251
    if-eqz p2, :cond_8

    .line 252
    .line 253
    iget-object p3, p2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->bmp:Landroid/graphics/Bitmap;

    .line 254
    .line 255
    if-eqz p3, :cond_8

    .line 256
    .line 257
    invoke-virtual {p3}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 258
    .line 259
    .line 260
    move-result p3

    .line 261
    if-nez p3, :cond_8

    .line 262
    .line 263
    iget-object p2, p2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$Node;->bmp:Landroid/graphics/Bitmap;

    .line 264
    .line 265
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    .line 266
    .line 267
    .line 268
    goto :goto_3

    .line 269
    :cond_9
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 270
    .line 271
    .line 272
    :cond_a
    monitor-exit v0

    .line 273
    return-void

    .line 274
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 275
    throw p0
.end method

.method public getImageRotation()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getRotation()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetRotation()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public init(Ljava/lang/String;)Z
    .locals 6

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    if-eqz p1, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 20
    .line 21
    invoke-static {v4, v5, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeInitVideoDataRetriver(JLjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-gez p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 28
    .line 29
    .line 30
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHandler:J

    .line 31
    .line 32
    return v1

    .line 33
    :cond_1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetWidth()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mWidth:I

    .line 38
    .line 39
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetHeight()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHeight:I

    .line 44
    .line 45
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeGetDuration()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mDuration:J

    .line 50
    .line 51
    iget p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mWidth:I

    .line 52
    .line 53
    iget v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mHeight:I

    .line 54
    .line 55
    mul-int/2addr p1, v0

    .line 56
    new-array p1, p1, [I

    .line 57
    .line 58
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mARGBData:[I

    .line 59
    .line 60
    const/4 p0, 0x1

    .line 61
    return p0

    .line 62
    :cond_2
    :goto_0
    return v1
.end method

.method public initWithType(Ljava/lang/String;II)Z
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->initWithType(Ljava/lang/String;III)Z

    move-result p0

    return p0
.end method

.method public initWithType(Ljava/lang/String;III)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iput p2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mType:I

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    if-ne p2, p1, :cond_1

    .line 13
    .line 14
    new-instance p2, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;-><init>(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;)V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-static {p0, p3, p4}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->access$000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;II)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return p1
.end method

.method public release()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mSync:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->nativeRelease()I

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mExit:Z

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    throw p0
.end method

.method public setBestFrameCnt(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFrameFilter:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;->access$000(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$BestFrameFilter;II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setImageFrameFilterListener(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mImageFrameFilterListener:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnCompleteListener(Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$OnThumbnailListComplete;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mCompleteListener:Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$OnThumbnailListComplete;

    .line 2
    .line 3
    return-void
.end method

.method public setmFaceModeList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->mFaceModeList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
