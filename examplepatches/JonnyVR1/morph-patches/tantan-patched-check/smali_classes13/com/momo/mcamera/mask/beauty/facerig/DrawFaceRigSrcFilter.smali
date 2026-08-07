.class public Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;
.super Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public adjustCoordnate([F[F)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    array-length v1, p2

    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    array-length v2, p1

    .line 21
    div-int/lit8 v2, v2, 0x2

    .line 22
    .line 23
    if-ge v1, v2, :cond_0

    .line 24
    .line 25
    mul-int/lit8 v2, v1, 0x2

    .line 26
    .line 27
    aget v3, p2, v1

    .line 28
    .line 29
    int-to-float v4, v0

    .line 30
    div-float/2addr v3, v4

    .line 31
    const/high16 v4, 0x3f000000    # 0.5f

    .line 32
    .line 33
    sub-float/2addr v3, v4

    .line 34
    const/high16 v5, 0x40000000    # 2.0f

    .line 35
    .line 36
    mul-float/2addr v3, v5

    .line 37
    aput v3, p1, v2

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    array-length v3, p1

    .line 42
    div-int/lit8 v3, v3, 0x2

    .line 43
    .line 44
    add-int/2addr v3, v1

    .line 45
    aget v3, p2, v3

    .line 46
    .line 47
    int-to-float v5, p0

    .line 48
    div-float/2addr v3, v5

    .line 49
    sub-float/2addr v3, v4

    .line 50
    const/high16 v4, -0x40000000    # -2.0f

    .line 51
    .line 52
    mul-float/2addr v3, v4

    .line 53
    aput v3, p1, v2

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void

    .line 59
    :cond_1
    const-string p0, "mediaRender"

    .line 60
    .line 61
    const-string p1, "No face Info or buffer is empty"

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public handCoord(ILl/omw;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 2
    .line 3
    iget-object p2, p2, Ll/omw;->j:Ll/evf;

    .line 4
    .line 5
    iget-object p2, p2, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 6
    .line 7
    iget-object p2, p2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aget-object p2, p2, v0

    .line 11
    .line 12
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;->adjustCoordnate([F[F)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public updateFaceInfo(Ll/omw;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "mediaRender"

    .line 8
    .line 9
    const-string p1, "No face"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_4

    .line 18
    .line 19
    iget-object v3, p1, Ll/omw;->j:Ll/evf;

    .line 20
    .line 21
    if-eqz v3, :cond_3

    .line 22
    .line 23
    iget-object v3, v3, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 24
    .line 25
    if-eqz v3, :cond_3

    .line 26
    .line 27
    iget-object v4, v3, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 28
    .line 29
    if-eqz v4, :cond_3

    .line 30
    .line 31
    iget-object v3, v3, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 32
    .line 33
    iget-object v4, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 34
    .line 35
    if-eqz v4, :cond_1

    .line 36
    .line 37
    array-length v4, v4

    .line 38
    aget-object v5, v3, v1

    .line 39
    .line 40
    iget-object v5, v5, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 41
    .line 42
    array-length v5, v5

    .line 43
    if-eq v4, v5, :cond_2

    .line 44
    .line 45
    :cond_1
    aget-object v3, v3, v1

    .line 46
    .line 47
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 48
    .line 49
    array-length v3, v3

    .line 50
    new-array v3, v3, [F

    .line 51
    .line 52
    iput-object v3, p0, Lcom/momo/mcamera/mask/beauty/body/DrawBodyWarpSrcFilter;->data:[F

    .line 53
    .line 54
    :cond_2
    invoke-virtual {p0, v2, p1}, Lcom/momo/mcamera/mask/beauty/facerig/DrawFaceRigSrcFilter;->handCoord(ILl/omw;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_4
    return-void
.end method
