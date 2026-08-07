.class public Ll/evf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public a:Lcom/momocv/facerigv3/FacerigV3Info;

.field public b:Lcom/momocv/videoprocessor/VideoInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/facerigv3/FacerigV3Info;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/facerigv3/FacerigV3Info;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a()Ll/evf;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/evf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/evf;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Lcom/momocv/facerigv3/FacerigV3Info;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/momocv/facerigv3/FacerigV3Info;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, v0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 16
    .line 17
    iget-object v2, p0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_eulers_:[F

    .line 20
    .line 21
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput-object v2, v1, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_eulers_:[F

    .line 26
    .line 27
    iget-object v1, v0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 28
    .line 29
    iget-object v2, p0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 32
    .line 33
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, v1, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 38
    .line 39
    :cond_0
    iget-object p0, p0, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/core/glcore/util/MMCvInfoHelper;->clone(Lcom/momocv/videoprocessor/VideoInfo;)Lcom/momocv/videoprocessor/VideoInfo;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iput-object p0, v0, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 46
    .line 47
    return-object v0
.end method

.method public b()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/evf;->a:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public c(Lcom/momocv/videoprocessor/VideoInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/evf;->a()Ll/evf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
