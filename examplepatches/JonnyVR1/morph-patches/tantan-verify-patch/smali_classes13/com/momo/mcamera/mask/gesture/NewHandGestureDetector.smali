.class public Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;
.super Lcom/momo/mcamera/mask/gesture/CVDetector;
.source "SourceFile"


# instance fields
.field private mmFrame:Ll/umw;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/umw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 10
    .line 11
    return-void
.end method

.method private getDetector()Ll/jxk;
    .locals 0

    .line 1
    invoke-static {}, Ll/jxk;->e()Ll/jxk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private processNewGestureData([Lcom/momocv/MMBox;)V
    .locals 11

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    array-length v0, p1

    .line 9
    if-lez v0, :cond_2

    .line 10
    .line 11
    array-length v0, p1

    .line 12
    new-instance v1, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 15
    .line 16
    .line 17
    array-length v0, p1

    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v2

    .line 20
    :goto_0
    if-ge v3, v0, :cond_1

    .line 21
    .line 22
    aget-object v4, p1, v3

    .line 23
    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    new-instance v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;

    .line 27
    .line 28
    invoke-direct {v5}, Lcom/momo/xeengine/cv/bean/XEGestureInfo;-><init>()V

    .line 29
    .line 30
    .line 31
    iget-object v6, v4, Lcom/momocv/MMBox;->class_name_:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v6, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->type:Ljava/lang/String;

    .line 34
    .line 35
    iget v6, v4, Lcom/momocv/MMRect;->x_:I

    .line 36
    .line 37
    int-to-float v6, v6

    .line 38
    iget v7, v4, Lcom/momocv/MMRect;->y_:I

    .line 39
    .line 40
    int-to-float v7, v7

    .line 41
    iget v8, v4, Lcom/momocv/MMRect;->width_:I

    .line 42
    .line 43
    int-to-float v8, v8

    .line 44
    iget v9, v4, Lcom/momocv/MMRect;->height_:I

    .line 45
    .line 46
    int-to-float v9, v9

    .line 47
    const/4 v10, 0x4

    .line 48
    new-array v10, v10, [F

    .line 49
    .line 50
    aput v6, v10, v2

    .line 51
    .line 52
    const/4 v6, 0x1

    .line 53
    aput v7, v10, v6

    .line 54
    .line 55
    const/4 v6, 0x2

    .line 56
    aput v8, v10, v6

    .line 57
    .line 58
    const/4 v6, 0x3

    .line 59
    aput v9, v10, v6

    .line 60
    .line 61
    iput-object v10, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->bounds:[F

    .line 62
    .line 63
    iget v4, v4, Lcom/momocv/MMBox;->score_:F

    .line 64
    .line 65
    iput v4, v5, Lcom/momo/xeengine/cv/bean/XEGestureInfo;->score:F

    .line 66
    .line 67
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    new-instance p1, Lcom/momo/xeengine/cv/bean/XEHandInfo;

    .line 74
    .line 75
    invoke-direct {p1}, Lcom/momo/xeengine/cv/bean/XEHandInfo;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v1, p1, Lcom/momo/xeengine/cv/bean/XEHandInfo;->gestures:Ljava/util/List;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    :cond_2
    invoke-static {p0}, Lcom/core/glcore/util/XEEngineHelper;->setHandInfos(Ljava/util/ArrayList;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public setDetectInterval(I)V
    .locals 0

    return-void
.end method

.method public setHandGestureType(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/jxk;->j(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 3

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/core/glcore/cv/MMCVBoxes;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/core/glcore/cv/MMCVBoxes;-><init>()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 10
    .line 11
    const/16 v2, 0x11

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/umw;->h(I)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 17
    .line 18
    iget v2, p1, Ll/omw;->e:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/umw;->l(I)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 24
    .line 25
    iget v2, p1, Ll/omw;->e:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ll/umw;->m(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 31
    .line 32
    iget v2, p1, Ll/omw;->f:I

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/umw;->j(I)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p1, Ll/omw;->g:[B

    .line 38
    .line 39
    iget-object v2, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ll/umw;->g([B)V

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 45
    .line 46
    if-nez v1, :cond_0

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    array-length v1, v1

    .line 51
    :goto_0
    invoke-virtual {v2, v1}, Ll/umw;->f(I)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget v2, p1, Ll/omw;->c:I

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ll/qx3;->b(I)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget v2, p1, Ll/omw;->b:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ll/qx3;->c(I)V

    .line 70
    .line 71
    .line 72
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iget-boolean p1, p1, Ll/omw;->a:Z

    .line 77
    .line 78
    invoke-virtual {v1, p1}, Ll/qx3;->a(Z)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iget-object v1, p0, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->mmFrame:Ll/umw;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p1, v1}, Ll/jxk;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/momocv/handgesture/HandGestureInfo;

    .line 96
    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    invoke-static {}, Ll/cyx;->a()Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_1

    .line 104
    .line 105
    iget-object v1, p1, Lcom/momocv/handgesture/HandGestureInfo;->hand_gesture_results_:[Lcom/momocv/MMBox;

    .line 106
    .line 107
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->processNewGestureData([Lcom/momocv/MMBox;)V

    .line 108
    .line 109
    .line 110
    :cond_1
    iget-object p1, p1, Lcom/momocv/handgesture/HandGestureInfo;->hand_gesture_results_:[Lcom/momocv/MMBox;

    .line 111
    .line 112
    invoke-virtual {v0, p1}, Lcom/core/glcore/cv/MMCVBoxes;->setDetectResult([Lcom/momocv/MMBox;)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Lcom/momo/mcamera/mask/gesture/CVDetector;->gestureDetectorListener:Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;

    .line 116
    .line 117
    if-eqz p0, :cond_2

    .line 118
    .line 119
    invoke-interface {p0, v0}, Lcom/momo/mcamera/mask/gesture/CVDetector$GestureDetectorListener;->gestureDetect(Lcom/core/glcore/cv/MMCVBoxes;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-void
.end method

.method public startDetect()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/jxk;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public stopDetect()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/gesture/CVDetector;->cancel()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/gesture/NewHandGestureDetector;->getDetector()Ll/jxk;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/jxk;->i()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
