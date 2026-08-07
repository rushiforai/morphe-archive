.class public Lio/agora/rtc2/video/SegmentationProperty;
.super Ljava/lang/Object;


# static fields
.field public static final SEG_MODEL_AI:I = 0x1

.field public static final SEG_MODEL_GREEN:I = 0x2


# instance fields
.field public greenCapacity:F

.field public modelType:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput v0, p0, Lio/agora/rtc2/video/SegmentationProperty;->modelType:I

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lio/agora/rtc2/video/SegmentationProperty;->greenCapacity:F

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lio/agora/rtc2/video/SegmentationProperty;->modelType:I

    iput p2, p0, Lio/agora/rtc2/video/SegmentationProperty;->greenCapacity:F

    return-void
.end method
