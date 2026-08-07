.class public Lcom/ss/android/ttvecamera/TECameraFrameSetting;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private mBufferData:[B

.field private mBufferSize:I

.field private mCameraFacing:I

.field private mCameraFormat:I

.field private mCameraFrameHeight:I

.field private mCameraFrameWidth:I

.field private mCameraOutputMode:I

.field private mCameraRotation:I

.field private mCameraTextureID:I

.field private mDirectBitmap:Landroid/graphics/Bitmap;

.field private mExposureTime:I

.field private mExtRotate:I

.field private mIso:I

.field private mMVPMatrix:[F

.field private mMaxIso:I

.field private mMetadataMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mMinIso:I

.field private mUBuf:Ljava/nio/ByteBuffer;

.field private mUParams:[I

.field private mVBuf:Ljava/nio/ByteBuffer;

.field private mVParams:[I

.field private mYBuf:Ljava/nio/ByteBuffer;

.field private mYParams:[I


# direct methods
.method public constructor <init>(IIIIILjava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[II)V
    .locals 1

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 59
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 60
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 61
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 62
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 64
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 65
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 66
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 67
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 68
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 69
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYBuf:Ljava/nio/ByteBuffer;

    .line 70
    iput-object p8, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUBuf:Ljava/nio/ByteBuffer;

    .line 71
    iput-object p10, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVBuf:Ljava/nio/ByteBuffer;

    .line 72
    iput-object p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYParams:[I

    .line 73
    iput-object p9, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUParams:[I

    .line 74
    iput-object p11, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVParams:[I

    .line 75
    iput p12, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    return-void
.end method

.method public constructor <init>(IIIII[BI)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 46
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 47
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 48
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 49
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 50
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 51
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 52
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 53
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 54
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 55
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 56
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferData:[B

    .line 57
    iput p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    return-void
.end method

.method public constructor <init>(IIIII[FIII)V
    .locals 1

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 92
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 93
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 94
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 95
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 96
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 97
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraTextureID:I

    .line 98
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 99
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 100
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 101
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 102
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMVPMatrix:[F

    .line 103
    iput p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 104
    iput p8, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    .line 105
    iput p9, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExtRotate:I

    return-void
.end method

.method public constructor <init>(IIIII[FILjava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 8
    .line 9
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 10
    .line 11
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraTextureID:I

    .line 17
    .line 18
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 19
    .line 20
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 21
    .line 22
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 23
    .line 24
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 25
    .line 26
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMVPMatrix:[F

    .line 27
    .line 28
    iput p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 29
    .line 30
    iput-object p8, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYBuf:Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    iput-object p10, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUBuf:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    iput-object p12, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVBuf:Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    iput-object p9, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYParams:[I

    .line 37
    .line 38
    iput-object p11, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUParams:[I

    .line 39
    .line 40
    iput-object p13, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVParams:[I

    .line 41
    .line 42
    iput p14, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    .line 43
    .line 44
    return-void
.end method

.method public constructor <init>(IIIII[FI[BI)V
    .locals 1

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 77
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 78
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 79
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 80
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 81
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 82
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraTextureID:I

    .line 83
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 84
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 85
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 86
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 87
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMVPMatrix:[F

    .line 88
    iput p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 89
    iput-object p8, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferData:[B

    .line 90
    iput p9, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    return-void
.end method

.method public constructor <init>(Ljava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[ILjava/nio/ByteBuffer;[IIIII)V
    .locals 1

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 107
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 108
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 109
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 110
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 111
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 112
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYBuf:Ljava/nio/ByteBuffer;

    .line 113
    iput-object p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUBuf:Ljava/nio/ByteBuffer;

    .line 114
    iput-object p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVBuf:Ljava/nio/ByteBuffer;

    .line 115
    iput-object p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYParams:[I

    .line 116
    iput-object p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUParams:[I

    .line 117
    iput-object p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVParams:[I

    .line 118
    iput p7, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 119
    iput p8, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 120
    iput p9, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 121
    iput p10, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    return-void
.end method

.method public constructor <init>([BIIIII)V
    .locals 1

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 123
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 124
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 125
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 126
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    const/4 v0, 0x0

    .line 127
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 128
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferData:[B

    .line 129
    iput p2, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferSize:I

    .line 130
    iput p3, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 131
    iput p4, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 132
    iput p5, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 133
    iput p6, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    return-void
.end method


# virtual methods
.method public getBufferData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferData:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getBufferDataSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mBufferSize:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraFacing()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraFormat()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFormat:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraFrameHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraFrameWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraOutPutMode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraRotation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 2
    .line 3
    return p0
.end method

.method public getCameraTextureID()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraTextureID:I

    .line 2
    .line 3
    return p0
.end method

.method public getDirectBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getExposureTime()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 2
    .line 3
    return p0
.end method

.method public getExtRotate()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExtRotate:I

    .line 2
    .line 3
    return p0
.end method

.method public getIso()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    .line 2
    .line 3
    return p0
.end method

.method public getMVPMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMVPMatrix:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxIso()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 2
    .line 3
    return p0
.end method

.method public getMetadata()Ljava/util/HashMap;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMetadataMap:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinIso()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 2
    .line 3
    return p0
.end method

.method public getUBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUBuf:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUParams()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mUParams:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getVBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVBuf:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVParams()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mVParams:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getYBuffer()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYBuf:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getYParams()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mYParams:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public setCameraFrameWidth(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameWidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setCameraOutPutMode(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraOutputMode:I

    .line 2
    .line 3
    return-void
.end method

.method public setCameraRotation(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraRotation:I

    .line 2
    .line 3
    return-void
.end method

.method public setCameraTextureID(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraTextureID:I

    .line 2
    .line 3
    return-void
.end method

.method public setDirectBitmap(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mDirectBitmap:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-void
.end method

.method public setMVPMatrix([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMVPMatrix:[F

    .line 2
    .line 3
    return-void
.end method

.method public setMetadata(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMetadataMap:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v0, "exposuretime"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mExposureTime:I

    .line 16
    .line 17
    const-string v0, "maxiso"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMaxIso:I

    .line 30
    .line 31
    const-string v0, "miniso"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mMinIso:I

    .line 44
    .line 45
    const-string v0, "iso"

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ljava/lang/Integer;

    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mIso:I

    .line 58
    .line 59
    return-void
.end method

.method public setmCameraFacing(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFacing:I

    .line 2
    .line 3
    return-void
.end method

.method public setmCameraFrameHeight(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/ss/android/ttvecamera/TECameraFrameSetting;->mCameraFrameHeight:I

    .line 2
    .line 3
    return-void
.end method
