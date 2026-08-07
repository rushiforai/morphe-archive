.class public Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static volatile isLoadedModel:Z

.field public static volatile path:Ljava/lang/String;

.field private static volatile resetPath:Z

.field private static volatile startLoad:Z


# instance fields
.field public handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

.field public handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

.field public handDetectLandmarkPostInfo:Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

.field private mmFrame:Lcom/momocv/MMFrame;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkPostInfo:Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic access$000()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$002(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 2
    .line 3
    return p0
.end method

.method private loadModel(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    sput-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->startLoad:Z

    .line 5
    .line 6
    iget-object p0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 7
    .line 8
    sget-object p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->LoadModel(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput-boolean p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 15
    .line 16
    sget-boolean p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    sget-object p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "pick noise model is invalid:%s"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    sget-object p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    sget-boolean p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->startLoad:Z

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    sget-boolean p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    sput-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->startLoad:Z

    .line 45
    .line 46
    new-instance p1, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector$1;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector$1;-><init>(Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x2

    .line 52
    invoke-static {p0, p1}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public static resetPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    sput-object p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    sput-boolean p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->resetPath:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method


# virtual methods
.method public process(Ll/omw;)Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;
    .locals 2

    const/16 v0, 0x11

    const/4 v1, 0x0

    .line 161
    invoke-virtual {p0, p1, v0, v1}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->process(Ll/omw;IZ)Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

    move-result-object p0

    return-object p0
.end method

.method public declared-synchronized process(Ll/omw;IZ)Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->resetPath:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->Release()V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto/16 :goto_1

    .line 20
    .line 21
    :cond_0
    :goto_0
    sput-boolean v2, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 22
    .line 23
    sput-boolean v2, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->startLoad:Z

    .line 24
    .line 25
    sput-boolean v2, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->resetPath:Z

    .line 26
    .line 27
    :cond_1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    const/4 v3, 0x1

    .line 32
    if-ge v0, v3, :cond_2

    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return-object v1

    .line 36
    :cond_2
    :try_start_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 37
    .line 38
    if-nez v0, :cond_3

    .line 39
    .line 40
    new-instance v0, Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 46
    .line 47
    :cond_3
    invoke-direct {p0, p3}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->loadModel(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->mmFrame:Lcom/momocv/MMFrame;

    .line 51
    .line 52
    if-nez p3, :cond_4

    .line 53
    .line 54
    new-instance p3, Lcom/momocv/MMFrame;

    .line 55
    .line 56
    invoke-direct {p3}, Lcom/momocv/MMFrame;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->mmFrame:Lcom/momocv/MMFrame;

    .line 60
    .line 61
    :cond_4
    iget-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 62
    .line 63
    if-nez p3, :cond_5

    .line 64
    .line 65
    new-instance p3, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 66
    .line 67
    invoke-direct {p3}, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 71
    .line 72
    :cond_5
    iget-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->mmFrame:Lcom/momocv/MMFrame;

    .line 73
    .line 74
    iput p2, p3, Lcom/momocv/MMFrame;->format_:I

    .line 75
    .line 76
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    iput p2, p3, Lcom/momocv/MMFrame;->width_:I

    .line 81
    .line 82
    iget-object p2, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->mmFrame:Lcom/momocv/MMFrame;

    .line 83
    .line 84
    iget p3, p1, Ll/omw;->f:I

    .line 85
    .line 86
    iput p3, p2, Lcom/momocv/MMFrame;->height_:I

    .line 87
    .line 88
    iget-object p3, p1, Ll/omw;->g:[B

    .line 89
    .line 90
    iput-object p3, p2, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 91
    .line 92
    array-length p3, p3

    .line 93
    iput p3, p2, Lcom/momocv/MMFrame;->data_len_:I

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/omw;->t()I

    .line 96
    .line 97
    .line 98
    move-result p3

    .line 99
    iput p3, p2, Lcom/momocv/MMFrame;->step_:I

    .line 100
    .line 101
    iget-object p2, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 102
    .line 103
    iget p3, p1, Ll/omw;->b:I

    .line 104
    .line 105
    iput p3, p2, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 106
    .line 107
    iget-boolean p3, p1, Ll/omw;->a:Z

    .line 108
    .line 109
    iput-boolean p3, p2, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 110
    .line 111
    iget p3, p1, Ll/omw;->c:I

    .line 112
    .line 113
    iput p3, p2, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    if-eqz p2, :cond_6

    .line 120
    .line 121
    iget-object p2, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 122
    .line 123
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    invoke-virtual {p3}, Ll/nuf;->q()[F

    .line 128
    .line 129
    .line 130
    move-result-object p3

    .line 131
    iput-object p3, p2, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->orig_landmarks_222_:[F

    .line 132
    .line 133
    :cond_6
    sget-boolean p2, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z

    .line 134
    .line 135
    if-eqz p2, :cond_7

    .line 136
    .line 137
    iget-object p2, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 140
    .line 141
    .line 142
    iget-object p1, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 143
    .line 144
    iget-object p2, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->mmFrame:Lcom/momocv/MMFrame;

    .line 145
    .line 146
    iget-object p3, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkParams:Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;

    .line 147
    .line 148
    iget-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkPostInfo:Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;

    .line 149
    .line 150
    invoke-virtual {p1, p2, p3, v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;)Z

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmarkPostInfo:Lcom/momocv/handdetectlandmark/HandDetectLandmarkPostInfo;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    .line 155
    monitor-exit p0

    .line 156
    return-object p1

    .line 157
    :cond_7
    monitor-exit p0

    .line 158
    return-object v1

    .line 159
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 160
    throw p1
.end method

.method public declared-synchronized release()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->Release()V

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    sput-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->startLoad:Z

    .line 17
    .line 18
    sput-boolean v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->isLoadedModel:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v0
.end method
