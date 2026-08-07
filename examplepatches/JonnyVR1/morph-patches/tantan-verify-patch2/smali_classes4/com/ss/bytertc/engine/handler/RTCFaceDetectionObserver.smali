.class public Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCFaceDetectionObserver"


# instance fields
.field private mVideoEffect:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/video/RTCVideoEffect;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/video/RTCVideoEffect;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;->mVideoEffect:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public OnExpressionDetectResult(II[Lcom/ss/bytertc/engine/InternalExpressDetectInfo;)V
    .locals 16
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p0

    .line 6
    .line 7
    iget-object v2, v2, Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;->mVideoEffect:Ljava/lang/ref/WeakReference;

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->getFaceDetectionObserver()Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move-object v2, v3

    .line 26
    :goto_0
    if-nez v2, :cond_1

    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    new-instance v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;

    .line 30
    .line 31
    invoke-direct {v4}, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;-><init>()V

    .line 32
    .line 33
    .line 34
    iput v0, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->detectResult:I

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    if-eqz p3, :cond_2

    .line 39
    .line 40
    if-lez v1, :cond_2

    .line 41
    .line 42
    new-array v0, v1, [Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 43
    .line 44
    iput-object v0, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->detectInfo:[Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 45
    .line 46
    iput v1, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->faceCount:I

    .line 47
    .line 48
    const/4 v0, 0x0

    .line 49
    :goto_1
    if-ge v0, v1, :cond_4

    .line 50
    .line 51
    aget-object v3, p3, v0

    .line 52
    .line 53
    iget-object v5, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->detectInfo:[Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 54
    .line 55
    new-instance v6, Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 56
    .line 57
    iget v7, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->age:F

    .line 58
    .line 59
    iget v8, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->boyProb:F

    .line 60
    .line 61
    iget v9, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->attractive:F

    .line 62
    .line 63
    iget v10, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->happyScore:F

    .line 64
    .line 65
    iget v11, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->sadScore:F

    .line 66
    .line 67
    iget v12, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->angryScore:F

    .line 68
    .line 69
    iget v13, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->surpriseScore:F

    .line 70
    .line 71
    iget v14, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->arousal:F

    .line 72
    .line 73
    iget v15, v3, Lcom/ss/bytertc/engine/InternalExpressDetectInfo;->valence:F

    .line 74
    .line 75
    invoke-direct/range {v6 .. v15}, Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;-><init>(FFFFFFFFF)V

    .line 76
    .line 77
    .line 78
    aput-object v6, v5, v0

    .line 79
    .line 80
    add-int/lit8 v0, v0, 0x1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    iput-object v3, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->detectInfo:[Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_3
    iput-object v3, v4, Lcom/ss/bytertc/engine/video/ExpressionDetectResult;->detectInfo:[Lcom/ss/bytertc/engine/video/ExpressionDetectInfo;

    .line 87
    .line 88
    :cond_4
    :goto_2
    invoke-interface {v2, v4}, Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;->onExpressionDetectResult(Lcom/ss/bytertc/engine/video/ExpressionDetectResult;)V

    .line 89
    .line 90
    .line 91
    return-void
.end method

.method public OnFaceDetectResult(IIII[Lcom/ss/bytertc/engine/InternalRectangle;J)V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;->mVideoEffect:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->getFaceDetectionObserver()Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move-object p0, v0

    .line 20
    :goto_0
    if-nez p0, :cond_1

    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    new-instance v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/ss/bytertc/engine/video/FaceDetectionResult;-><init>()V

    .line 26
    .line 27
    .line 28
    iput p2, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->imageWidth:I

    .line 29
    .line 30
    iput p3, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->imageHeight:I

    .line 31
    .line 32
    iput-wide p6, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->frameTimestampUs:J

    .line 33
    .line 34
    iput p1, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->detectResult:I

    .line 35
    .line 36
    if-eqz p5, :cond_2

    .line 37
    .line 38
    array-length p1, p5

    .line 39
    if-lez p1, :cond_2

    .line 40
    .line 41
    array-length p1, p5

    .line 42
    new-array p1, p1, [Lcom/ss/bytertc/engine/video/Rectangle;

    .line 43
    .line 44
    iput-object p1, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->faces:[Lcom/ss/bytertc/engine/video/Rectangle;

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    :goto_1
    if-ge p1, p4, :cond_3

    .line 48
    .line 49
    iget-object p2, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->faces:[Lcom/ss/bytertc/engine/video/Rectangle;

    .line 50
    .line 51
    new-instance p3, Lcom/ss/bytertc/engine/video/Rectangle;

    .line 52
    .line 53
    aget-object p6, p5, p1

    .line 54
    .line 55
    iget p7, p6, Lcom/ss/bytertc/engine/InternalRectangle;->x:I

    .line 56
    .line 57
    iget v0, p6, Lcom/ss/bytertc/engine/InternalRectangle;->y:I

    .line 58
    .line 59
    iget v2, p6, Lcom/ss/bytertc/engine/InternalRectangle;->width:I

    .line 60
    .line 61
    iget p6, p6, Lcom/ss/bytertc/engine/InternalRectangle;->height:I

    .line 62
    .line 63
    invoke-direct {p3, p7, v0, v2, p6}, Lcom/ss/bytertc/engine/video/Rectangle;-><init>(IIII)V

    .line 64
    .line 65
    .line 66
    aput-object p3, p2, p1

    .line 67
    .line 68
    add-int/lit8 p1, p1, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    iput-object v0, v1, Lcom/ss/bytertc/engine/video/FaceDetectionResult;->faces:[Lcom/ss/bytertc/engine/video/Rectangle;

    .line 72
    .line 73
    :cond_3
    invoke-interface {p0, v1}, Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;->onFaceDetectResult(Lcom/ss/bytertc/engine/video/FaceDetectionResult;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method
