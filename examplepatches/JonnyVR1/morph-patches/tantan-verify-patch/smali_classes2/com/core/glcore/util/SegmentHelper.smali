.class public Lcom/core/glcore/util/SegmentHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CUT_BODY_TYPE:I = 0x0

.field public static final CUT_FACE_TYPE:I = 0x1

.field private static TAG:Ljava/lang/String; = "SegmentHelper"

.field private static counter:Ljava/util/concurrent/atomic/AtomicInteger; = null

.field private static cutFaceModelBuff:[B = null

.field private static cutFaceModelPath:Ljava/lang/String; = null

.field private static defaultMaskHeight:I = 0x500

.field private static defaultMaskWidth:I = 0x2d0

.field private static discardFrameDistance:I = 0x0

.field private static faceCounter:Ljava/util/concurrent/atomic/AtomicInteger; = null

.field private static faceHeight:I = 0x0

.field private static faceSegmentCount:I = 0x0

.field private static faceWidth:I = 0x0

.field private static face_is_front_camera:Z = true

.field private static face_restore_degree:I = 0x5a

.field private static face_rotate_degree:I = 0x0

.field private static forceCutFaceThreshold:I = 0x1e

.field private static frameNumber:I = 0x0

.field private static height:I = 0x0

.field private static info:Lcom/momocv/segmentation/SegmentationInfo; = null

.field private static is_front_camera:Z = true

.field private static lastLeftX:I = -0x1

.field private static lastTopY:I = -0x1

.field private static mCutType:I = 0x0

.field private static modelBuff:[B = null

.field private static modelPath:Ljava/lang/String; = null

.field private static restore_degree:I = 0x5a

.field private static rotate_degree:I

.field private static segmentCount:I

.field private static segmentation:Lcom/momocv/segmentation/Segmentation;

.field private static width:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/momocv/segmentation/SegmentationInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momocv/segmentation/SegmentationInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/core/glcore/util/SegmentHelper;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 15
    .line 16
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 19
    .line 20
    .line 21
    sput-object v0, Lcom/core/glcore/util/SegmentHelper;->faceCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 22
    .line 23
    sput v1, Lcom/core/glcore/util/SegmentHelper;->segmentCount:I

    .line 24
    .line 25
    sput v1, Lcom/core/glcore/util/SegmentHelper;->faceSegmentCount:I

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static bodyRelease()V
    .locals 3

    .line 1
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momocv/segmentation/Segmentation;->Release()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 10
    .line 11
    :cond_0
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 12
    .line 13
    iget-object v2, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iput-object v1, v0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 18
    .line 19
    :cond_1
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    sput-object v1, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 24
    .line 25
    :cond_2
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 31
    .line 32
    .line 33
    :cond_3
    sput v1, Lcom/core/glcore/util/SegmentHelper;->segmentCount:I

    .line 34
    .line 35
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 36
    .line 37
    const-string v1, "SegmentHelper release !!!"

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private static faceRelease()V
    .locals 2

    .line 1
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->cutFaceModelBuff:[B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    sput-object v0, Lcom/core/glcore/util/SegmentHelper;->cutFaceModelBuff:[B

    .line 7
    .line 8
    :cond_0
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->faceCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 14
    .line 15
    .line 16
    :cond_1
    sput v1, Lcom/core/glcore/util/SegmentHelper;->faceSegmentCount:I

    .line 17
    .line 18
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "SegmentHelper release !!!"

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static getCutType()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    return v0
.end method

.method public static getHeight()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/core/glcore/util/SegmentHelper;->height:I

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    sget v0, Lcom/core/glcore/util/SegmentHelper;->faceHeight:I

    .line 9
    .line 10
    return v0
.end method

.method public static getModelPath()Ljava/lang/String;
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->modelPath:Ljava/lang/String;

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->cutFaceModelPath:Ljava/lang/String;

    .line 9
    .line 10
    return-object v0
.end method

.method public static getRestoreDegree()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/core/glcore/util/SegmentHelper;->restore_degree:I

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    sget v0, Lcom/core/glcore/util/SegmentHelper;->face_restore_degree:I

    .line 9
    .line 10
    return v0
.end method

.method public static getRotateDegree()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/core/glcore/util/SegmentHelper;->rotate_degree:I

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    sget v0, Lcom/core/glcore/util/SegmentHelper;->face_rotate_degree:I

    .line 9
    .line 10
    return v0
.end method

.method public static getWidth()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Lcom/core/glcore/util/SegmentHelper;->width:I

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    sget v0, Lcom/core/glcore/util/SegmentHelper;->faceWidth:I

    .line 9
    .line 10
    return v0
.end method

.method public static isFrontCamera()Z
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-boolean v0, Lcom/core/glcore/util/SegmentHelper;->is_front_camera:Z

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    sget-boolean v0, Lcom/core/glcore/util/SegmentHelper;->face_is_front_camera:Z

    .line 9
    .line 10
    return v0
.end method

.method private static needProcess(II)Z
    .locals 2

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->lastLeftX:I

    .line 2
    .line 3
    sub-int/2addr p0, v0

    .line 4
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    sget v0, Lcom/core/glcore/util/SegmentHelper;->forceCutFaceThreshold:I

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    if-le p0, v0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/core/glcore/util/SegmentHelper;->lastLeftX:I

    .line 14
    .line 15
    if-ltz p0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    sget p0, Lcom/core/glcore/util/SegmentHelper;->lastTopY:I

    .line 19
    .line 20
    sub-int/2addr p1, p0

    .line 21
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    sget p1, Lcom/core/glcore/util/SegmentHelper;->forceCutFaceThreshold:I

    .line 26
    .line 27
    if-le p0, p1, :cond_1

    .line 28
    .line 29
    sget p0, Lcom/core/glcore/util/SegmentHelper;->lastTopY:I

    .line 30
    .line 31
    if-ltz p0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public static process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 2

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1, p2, p3}, Lcom/core/glcore/util/SegmentHelper;->processBody(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    invoke-static {p0, p1, p2, p3}, Lcom/core/glcore/util/SegmentHelper;->processFace(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0

    .line 18
    :cond_1
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public static process(Ll/umw;Ll/lnw;)[B
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 22
    invoke-static {p0, p1, v0, v1}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    move-result-object p0

    iget-object p0, p0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    return-object p0
.end method

.method public static process(Ll/umw;Ll/lnw;Ll/omw;)[B
    .locals 1

    const/4 v0, 0x0

    .line 20
    invoke-static {p0, p1, v0, p2}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    move-result-object p0

    iget-object p0, p0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    return-object p0
.end method

.method public static process(Ll/umw;Ll/lnw;Z)[B
    .locals 1

    const/4 v0, 0x0

    .line 21
    invoke-static {p0, p1, p2, v0}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    move-result-object p0

    iget-object p0, p0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    return-object p0
.end method

.method public static processBody(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 5

    .line 1
    const-string v0, "The Segment mode lode failed !!!"

    .line 2
    .line 3
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->modelPath:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v2, -0x1

    .line 6
    if-nez v1, :cond_2

    .line 7
    .line 8
    sget-object p1, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    array-length p1, p1

    .line 15
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 20
    .line 21
    .line 22
    move-result p3

    .line 23
    mul-int/2addr p2, p3

    .line 24
    if-eq p1, p2, :cond_1

    .line 25
    .line 26
    :cond_0
    sget-object p1, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    mul-int/2addr p2, p0

    .line 37
    new-array p0, p2, [B

    .line 38
    .line 39
    iput-object p0, p1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 40
    .line 41
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 44
    .line 45
    invoke-static {p0, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 46
    .line 47
    .line 48
    :cond_1
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 49
    .line 50
    return-object p0

    .line 51
    :cond_2
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-lez v1, :cond_3

    .line 58
    .line 59
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 60
    .line 61
    iget-object v3, v1, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 62
    .line 63
    if-eqz v3, :cond_3

    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_3
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 67
    .line 68
    if-nez v1, :cond_8

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    :try_start_0
    new-instance v3, Ljava/io/FileInputStream;

    .line 72
    .line 73
    sget-object v4, Lcom/core/glcore/util/SegmentHelper;->modelPath:Ljava/lang/String;

    .line 74
    .line 75
    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 76
    .line 77
    .line 78
    :try_start_1
    invoke-virtual {v3}, Ljava/io/FileInputStream;->available()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    new-array v1, v1, [B

    .line 83
    .line 84
    sput-object v1, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 85
    .line 86
    invoke-virtual {v3, v1}, Ljava/io/FileInputStream;->read([B)I

    .line 87
    .line 88
    .line 89
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 90
    .line 91
    if-nez v1, :cond_4

    .line 92
    .line 93
    new-instance v1, Lcom/momocv/segmentation/Segmentation;

    .line 94
    .line 95
    invoke-direct {v1}, Lcom/momocv/segmentation/Segmentation;-><init>()V

    .line 96
    .line 97
    .line 98
    sput-object v1, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catchall_0
    move-exception p2

    .line 102
    move-object v1, v3

    .line 103
    goto :goto_3

    .line 104
    :cond_4
    :goto_0
    if-eqz p2, :cond_5

    .line 105
    .line 106
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 107
    .line 108
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 109
    .line 110
    invoke-virtual {p2, v1}, Lcom/momocv/segmentation/Segmentation;->LoadModelSync([B)Z

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    goto :goto_1

    .line 115
    :cond_5
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 116
    .line 117
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 118
    .line 119
    invoke-virtual {p2, v1}, Lcom/momocv/segmentation/Segmentation;->LoadModel([B)Z

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    :goto_1
    if-nez p2, :cond_6

    .line 124
    .line 125
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {p2, v0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 128
    .line 129
    .line 130
    :cond_6
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 131
    .line 132
    .line 133
    goto :goto_5

    .line 134
    :catch_0
    move-exception p2

    .line 135
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 136
    .line 137
    new-instance v3, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :goto_2
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    invoke-static {v1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    goto :goto_5

    .line 157
    :catchall_1
    move-exception p2

    .line 158
    :goto_3
    :try_start_3
    sget-object v3, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {v3, p2}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 161
    .line 162
    .line 163
    if-eqz v1, :cond_8

    .line 164
    .line 165
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 166
    .line 167
    .line 168
    goto :goto_5

    .line 169
    :catch_1
    move-exception p2

    .line 170
    sget-object v1, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 171
    .line 172
    new-instance v3, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :catchall_2
    move-exception p0

    .line 179
    if-eqz v1, :cond_7

    .line 180
    .line 181
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :catch_2
    move-exception p1

    .line 186
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 187
    .line 188
    new-instance p3, Ljava/lang/StringBuilder;

    .line 189
    .line 190
    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p1

    .line 204
    invoke-static {p2, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_7
    :goto_4
    throw p0

    .line 208
    :cond_8
    :goto_5
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->modelBuff:[B

    .line 209
    .line 210
    if-eqz p2, :cond_d

    .line 211
    .line 212
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 213
    .line 214
    if-nez p2, :cond_9

    .line 215
    .line 216
    new-instance p2, Lcom/momocv/segmentation/Segmentation;

    .line 217
    .line 218
    invoke-direct {p2}, Lcom/momocv/segmentation/Segmentation;-><init>()V

    .line 219
    .line 220
    .line 221
    sput-object p2, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 222
    .line 223
    :cond_9
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 224
    .line 225
    iget-object p2, p2, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 226
    .line 227
    if-eqz p2, :cond_a

    .line 228
    .line 229
    array-length p2, p2

    .line 230
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    mul-int/2addr v0, v1

    .line 239
    if-eq p2, v0, :cond_b

    .line 240
    .line 241
    :cond_a
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 242
    .line 243
    invoke-virtual {p0}, Ll/umw;->e()I

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    invoke-virtual {p0}, Ll/umw;->c()I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    mul-int/2addr v0, v1

    .line 252
    new-array v0, v0, [B

    .line 253
    .line 254
    iput-object v0, p2, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 255
    .line 256
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 257
    .line 258
    iget-object p2, p2, Lcom/momocv/segmentation/SegmentationInfo;->mask_:[B

    .line 259
    .line 260
    invoke-static {p2, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 261
    .line 262
    .line 263
    :cond_b
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 264
    .line 265
    sget v0, Lcom/core/glcore/util/SegmentHelper;->segmentCount:I

    .line 266
    .line 267
    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 268
    .line 269
    .line 270
    if-eqz p3, :cond_c

    .line 271
    .line 272
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 273
    .line 274
    .line 275
    move-result-object p2

    .line 276
    invoke-virtual {p3, p2}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 277
    .line 278
    .line 279
    :cond_c
    sget-object p2, Lcom/core/glcore/util/SegmentHelper;->segmentation:Lcom/momocv/segmentation/Segmentation;

    .line 280
    .line 281
    invoke-virtual {p0}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-virtual {p1}, Ll/lnw;->c()Lcom/momocv/BaseParams;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    check-cast p1, Lcom/momocv/segmentation/SegmentationParams;

    .line 290
    .line 291
    sget-object p3, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 292
    .line 293
    invoke-virtual {p2, p0, p1, p3}, Lcom/momocv/segmentation/Segmentation;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/segmentation/SegmentationParams;Lcom/momocv/segmentation/SegmentationInfo;)Z

    .line 294
    .line 295
    .line 296
    :cond_d
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 297
    .line 298
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 299
    .line 300
    .line 301
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->info:Lcom/momocv/segmentation/SegmentationInfo;

    .line 302
    .line 303
    return-object p0
.end method

.method public static processFace(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public static processInfo(Ll/umw;Ll/lnw;)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p0, p1, v0, v1}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static processInfo(Ll/umw;Ll/lnw;Z)Lcom/momocv/segmentation/SegmentationInfo;
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p1, p2, v0}, Lcom/core/glcore/util/SegmentHelper;->process(Ll/umw;Ll/lnw;ZLl/omw;)Lcom/momocv/segmentation/SegmentationInfo;

    move-result-object p0

    return-object p0
.end method

.method public static release()V
    .locals 2

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->bodyRelease()V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/core/glcore/util/SegmentHelper;->faceRelease()V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 16
    sput v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 17
    .line 18
    return-void
.end method

.method public static setCutFaceModelPath(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "cutFaceModelPath:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-object p0, Lcom/core/glcore/util/SegmentHelper;->cutFaceModelPath:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static setCutType(I)V
    .locals 3

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne v0, p0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "invalid type : "

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {v0, p0}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "type:"

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sput p0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 47
    .line 48
    return-void
.end method

.method public static setDistanceForDiscardFrame(I)V
    .locals 2

    .line 1
    sput p0, Lcom/core/glcore/util/SegmentHelper;->discardFrameDistance:I

    .line 2
    .line 3
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "discardFrameDistance: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget v1, Lcom/core/glcore/util/SegmentHelper;->discardFrameDistance:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static setForceCutFaceThreshold(I)V
    .locals 1

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    if-lt p0, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0xc8

    .line 6
    .line 7
    if-gt p0, v0, :cond_0

    .line 8
    .line 9
    sput p0, Lcom/core/glcore/util/SegmentHelper;->forceCutFaceThreshold:I

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static setHeight(I)V
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput p0, Lcom/core/glcore/util/SegmentHelper;->height:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput p0, Lcom/core/glcore/util/SegmentHelper;->faceHeight:I

    .line 9
    .line 10
    return-void
.end method

.method public static setIsFrontCamera(Z)V
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput-boolean p0, Lcom/core/glcore/util/SegmentHelper;->is_front_camera:Z

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput-boolean p0, Lcom/core/glcore/util/SegmentHelper;->face_is_front_camera:Z

    .line 9
    .line 10
    return-void
.end method

.method public static setModelPath(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "modelPath:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sput-object p0, Lcom/core/glcore/util/SegmentHelper;->modelPath:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method public static setRestoreDegree(I)V
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput p0, Lcom/core/glcore/util/SegmentHelper;->restore_degree:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput p0, Lcom/core/glcore/util/SegmentHelper;->face_restore_degree:I

    .line 9
    .line 10
    return-void
.end method

.method public static setRotateDegree(I)V
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput p0, Lcom/core/glcore/util/SegmentHelper;->rotate_degree:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput p0, Lcom/core/glcore/util/SegmentHelper;->face_rotate_degree:I

    .line 9
    .line 10
    return-void
.end method

.method public static setSegmentCount(I)V
    .locals 2

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput p0, Lcom/core/glcore/util/SegmentHelper;->segmentCount:I

    .line 6
    .line 7
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v1, "segmentCount:"

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    sget v1, Lcom/core/glcore/util/SegmentHelper;->segmentCount:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    const/4 v1, 0x1

    .line 30
    if-ne v0, v1, :cond_1

    .line 31
    .line 32
    sput p0, Lcom/core/glcore/util/SegmentHelper;->faceSegmentCount:I

    .line 33
    .line 34
    sget-object p0, Lcom/core/glcore/util/SegmentHelper;->TAG:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v1, "faceSegmentCount:"

    .line 39
    .line 40
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget v1, Lcom/core/glcore/util/SegmentHelper;->faceSegmentCount:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {p0, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static setWidth(I)V
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/SegmentHelper;->mCutType:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sput p0, Lcom/core/glcore/util/SegmentHelper;->width:I

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    sput p0, Lcom/core/glcore/util/SegmentHelper;->faceWidth:I

    .line 9
    .line 10
    return-void
.end method
