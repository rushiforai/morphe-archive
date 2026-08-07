.class public Lcom/core/glcore/util/BeautyScoreHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static TAG:Ljava/lang/String; = "BeautyScoreHelper"

.field private static beautyScoreCvInfo:Ll/omw; = null

.field private static beautyScoreFrame:Ll/umw; = null

.field private static beautyScoreModelPath:Ljava/lang/String; = null

.field private static beautyScoreProcessDone:Z = true

.field private static beautyScoreRotateDegree:I = 0x0

.field private static beautyScores:[F = null

.field private static checkedBeautyScoreFrameNumber:I = 0x0

.field private static faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore; = null

.field private static maxValidDegree:F = 15.0f


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method public static synthetic access$000()Ll/umw;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreFrame:Ll/umw;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100()Ll/omw;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreCvInfo:Ll/omw;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()I
    .locals 1

    .line 1
    sget v0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreRotateDegree:I

    .line 2
    .line 3
    return v0
.end method

.method public static synthetic access$300()Lcom/core/glcore/util/FaceBeautyScore;
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$400()[F
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScores:[F

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$508()I
    .locals 2

    .line 1
    sget v0, Lcom/core/glcore/util/BeautyScoreHelper;->checkedBeautyScoreFrameNumber:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    sput v1, Lcom/core/glcore/util/BeautyScoreHelper;->checkedBeautyScoreFrameNumber:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic access$602(Z)Z
    .locals 0

    .line 1
    sput-boolean p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreProcessDone:Z

    .line 2
    .line 3
    return p0
.end method

.method public static detectBeautyScore(Ll/umw;Ll/omw;I)V
    .locals 2

    .line 1
    const-string v0, "The beauty mode lode failed !!!"

    .line 2
    .line 3
    if-eqz p1, :cond_5

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-gtz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    sget-boolean v1, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreProcessDone:Z

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 18
    .line 19
    const-string p1, "BeautyScore previous frame processing"

    .line 20
    .line 21
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    const/4 v1, 0x0

    .line 26
    sput-boolean v1, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreProcessDone:Z

    .line 27
    .line 28
    sput-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreFrame:Ll/umw;

    .line 29
    .line 30
    sput p2, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreRotateDegree:I

    .line 31
    .line 32
    sput-object p1, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreCvInfo:Ll/omw;

    .line 33
    .line 34
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 35
    .line 36
    if-nez p0, :cond_3

    .line 37
    .line 38
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreModelPath:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz p0, :cond_3

    .line 41
    .line 42
    new-instance p0, Lcom/core/glcore/util/FaceBeautyScore;

    .line 43
    .line 44
    invoke-direct {p0}, Lcom/core/glcore/util/FaceBeautyScore;-><init>()V

    .line 45
    .line 46
    .line 47
    sput-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 48
    .line 49
    :try_start_0
    sget-object p1, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreModelPath:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Lcom/core/glcore/util/FaceBeautyScore;->loadBeautyScoreModel(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 58
    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    sget-object p2, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreModelPath:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_0
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 78
    .line 79
    new-instance p1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p2, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreModelPath:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    :goto_0
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 97
    .line 98
    sget p1, Lcom/core/glcore/util/BeautyScoreHelper;->maxValidDegree:F

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Lcom/core/glcore/util/FaceBeautyScore;->setMaxValidDegree(F)V

    .line 101
    .line 102
    .line 103
    :cond_3
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 104
    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScores:[F

    .line 108
    .line 109
    if-eqz p0, :cond_4

    .line 110
    .line 111
    sget p1, Lcom/core/glcore/util/BeautyScoreHelper;->checkedBeautyScoreFrameNumber:I

    .line 112
    .line 113
    array-length p0, p0

    .line 114
    if-ge p1, p0, :cond_4

    .line 115
    .line 116
    new-instance p0, Lcom/core/glcore/util/BeautyScoreHelper$1;

    .line 117
    .line 118
    invoke-direct {p0}, Lcom/core/glcore/util/BeautyScoreHelper$1;-><init>()V

    .line 119
    .line 120
    .line 121
    const/4 p1, 0x2

    .line 122
    invoke-static {p1, p0}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 123
    .line 124
    .line 125
    goto :goto_1

    .line 126
    :cond_4
    const/4 p0, 0x1

    .line 127
    sput-boolean p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreProcessDone:Z

    .line 128
    .line 129
    :goto_1
    return-void

    .line 130
    :cond_5
    :goto_2
    sget-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 131
    .line 132
    const-string p1, "no face"

    .line 133
    .line 134
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public static getBeautyScore()[F
    .locals 1

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScores:[F

    .line 2
    .line 3
    return-object v0
.end method

.method public static release()V
    .locals 2

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/core/glcore/util/FaceBeautyScore;->release()V

    .line 7
    .line 8
    .line 9
    sput-object v1, Lcom/core/glcore/util/BeautyScoreHelper;->faceBeautyScore:Lcom/core/glcore/util/FaceBeautyScore;

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    sput v0, Lcom/core/glcore/util/BeautyScoreHelper;->checkedBeautyScoreFrameNumber:I

    .line 13
    .line 14
    sput-object v1, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScores:[F

    .line 15
    .line 16
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "BeautyScoreHelper release !!!"

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static resetBeautyScore()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    sput v0, Lcom/core/glcore/util/BeautyScoreHelper;->checkedBeautyScoreFrameNumber:I

    .line 3
    .line 4
    return-void
.end method

.method public static setBeautyScore([F)V
    .locals 0

    .line 1
    sput-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScores:[F

    .line 2
    .line 3
    return-void
.end method

.method public static setBeautyScoreModelPath(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/core/glcore/util/BeautyScoreHelper;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "beautyScoreModelPath:"

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
    sput-object p0, Lcom/core/glcore/util/BeautyScoreHelper;->beautyScoreModelPath:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method
