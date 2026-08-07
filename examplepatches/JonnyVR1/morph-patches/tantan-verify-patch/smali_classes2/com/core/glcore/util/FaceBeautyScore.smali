.class public Lcom/core/glcore/util/FaceBeautyScore;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.core.glcore.util.FaceBeautyScore"


# instance fields
.field private mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

.field private mBeautyScoreInfo:Lcom/momocv/beautyscore/BeautyScoreInfo;

.field private mBeautyScoreParams:Lcom/momocv/beautyscore/BeautyScoreParams;

.field private maxValidDegree:F


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
    const/high16 v0, 0x41700000    # 15.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->maxValidDegree:F

    .line 7
    .line 8
    new-instance v0, Lcom/momocv/beautyscore/BeautyScore;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momocv/beautyscore/BeautyScore;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/momocv/beautyscore/BeautyScore;->Create()V

    .line 16
    .line 17
    .line 18
    new-instance v0, Lcom/momocv/beautyscore/BeautyScoreParams;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/momocv/beautyscore/BeautyScoreParams;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreParams:Lcom/momocv/beautyscore/BeautyScoreParams;

    .line 24
    .line 25
    new-instance v0, Lcom/momocv/beautyscore/BeautyScoreInfo;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/momocv/beautyscore/BeautyScoreInfo;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreInfo:Lcom/momocv/beautyscore/BeautyScoreInfo;

    .line 31
    .line 32
    return-void
.end method

.method private isValid(Ll/omw;F)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    array-length v0, p0

    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    aget-object p0, p0, p1

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    aget v0, v0, p1

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    cmpg-float v0, v0, p2

    .line 30
    .line 31
    if-gtz v0, :cond_1

    .line 32
    .line 33
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    aget p0, p0, v0

    .line 37
    .line 38
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    cmpg-float p0, p0, p2

    .line 43
    .line 44
    if-gtz p0, :cond_1

    .line 45
    .line 46
    return v0

    .line 47
    :cond_0
    sget-object p0, Lcom/core/glcore/util/FaceBeautyScore;->TAG:Ljava/lang/String;

    .line 48
    .line 49
    const-string p2, "facesinfo_ is null"

    .line 50
    .line 51
    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    :cond_1
    return p1
.end method


# virtual methods
.method public calculateImageFaceBeautyScore(Ll/umw;Ll/omw;I)F
    .locals 1

    .line 1
    iget v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->maxValidDegree:F

    .line 2
    .line 3
    invoke-direct {p0, p2, v0}, Lcom/core/glcore/util/FaceBeautyScore;->isValid(Ll/omw;F)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreParams:Lcom/momocv/beautyscore/BeautyScoreParams;

    .line 10
    .line 11
    iput p3, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    iput p3, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 15
    .line 16
    iput-boolean p3, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 17
    .line 18
    invoke-virtual {p2}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    iget-object p2, p2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 23
    .line 24
    aget-object p2, p2, p3

    .line 25
    .line 26
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 27
    .line 28
    iput-object p2, v0, Lcom/momocv/beautyscore/BeautyScoreParams;->coord_96pt_:[F

    .line 29
    .line 30
    iget-object p2, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object p3, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreParams:Lcom/momocv/beautyscore/BeautyScoreParams;

    .line 37
    .line 38
    iget-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreInfo:Lcom/momocv/beautyscore/BeautyScoreInfo;

    .line 39
    .line 40
    invoke-virtual {p2, p1, p3, v0}, Lcom/momocv/beautyscore/BeautyScore;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/beautyscore/BeautyScoreParams;Lcom/momocv/beautyscore/BeautyScoreInfo;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScoreInfo:Lcom/momocv/beautyscore/BeautyScoreInfo;

    .line 47
    .line 48
    iget p0, p0, Lcom/momocv/beautyscore/BeautyScoreInfo;->beauty_score:F

    .line 49
    .line 50
    return p0

    .line 51
    :cond_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 52
    .line 53
    return p0
.end method

.method public loadBeautyScoreModel(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object p0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/momocv/beautyscore/BeautyScore;->LoadModel(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const-string p0, "beautyScoreModelPath \u5df2\u7ecf\u88ab\u9500\u6bc1\uff01"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :goto_0
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    const-string p0, "beautyScoreModelPath \u662f\u7a7a\u7684\uff01"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momocv/beautyscore/BeautyScore;->Release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/core/glcore/util/FaceBeautyScore;->mBeautyScore:Lcom/momocv/beautyscore/BeautyScore;

    .line 10
    .line 11
    return-void
.end method

.method public setMaxValidDegree(F)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    const/high16 v0, 0x42b40000    # 90.0f

    .line 7
    .line 8
    cmpg-float v0, p1, v0

    .line 9
    .line 10
    if-gez v0, :cond_0

    .line 11
    .line 12
    iput p1, p0, Lcom/core/glcore/util/FaceBeautyScore;->maxValidDegree:F

    .line 13
    .line 14
    :cond_0
    return-void
.end method
