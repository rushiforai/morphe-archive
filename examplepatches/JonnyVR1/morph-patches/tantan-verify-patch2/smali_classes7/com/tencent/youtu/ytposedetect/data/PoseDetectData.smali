.class public Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public faceDetectStatus:I

.field public faceQualityStatus:I

.field public faceRect:Landroid/graphics/Rect;

.field public faceShape:[F

.field public faceVisible:[F

.field public frameH:I

.field public frameW:I

.field public imgData:[B

.field public isFaceShaking:Z

.field public pitch:F

.field public postType:I

.field public roll:F

.field public yaw:F


# direct methods
.method public constructor <init>([F[FI[BFFFIILandroid/graphics/Rect;IIZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->faceShape:[F

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->faceVisible:[F

    .line 7
    .line 8
    iput p3, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->postType:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->imgData:[B

    .line 11
    .line 12
    iput p5, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->pitch:F

    .line 13
    .line 14
    iput p6, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->yaw:F

    .line 15
    .line 16
    iput p7, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->roll:F

    .line 17
    .line 18
    iput p8, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->faceDetectStatus:I

    .line 19
    .line 20
    iput p9, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->faceQualityStatus:I

    .line 21
    .line 22
    iput-object p10, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->faceRect:Landroid/graphics/Rect;

    .line 23
    .line 24
    iput p11, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->frameW:I

    .line 25
    .line 26
    iput p12, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->frameH:I

    .line 27
    .line 28
    iput-boolean p13, p0, Lcom/tencent/youtu/ytposedetect/data/PoseDetectData;->isFaceShaking:Z

    .line 29
    .line 30
    return-void
.end method
