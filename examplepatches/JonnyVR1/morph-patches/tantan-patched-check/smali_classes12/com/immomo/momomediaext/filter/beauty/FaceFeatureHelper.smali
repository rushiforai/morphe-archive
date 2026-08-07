.class public Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mMMFrame:Ll/umw;

.field private mParamsInfo:Ll/lnw;

.field public scale:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 10
    .line 11
    new-instance v0, Ll/lnw;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, v1}, Ll/lnw;-><init>(I)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 18
    .line 19
    const/high16 v0, 0x3e800000    # 0.25f

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->scale:F

    .line 22
    .line 23
    return-void
.end method

.method private transformEngineMatrix(Lcom/momocv/SingleFaceInfo;II)V
    .locals 0

    .line 1
    new-instance p0, Lcom/momocv/FacePoseParams;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momocv/FacePoseParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/momocv/FacePoseParams;->image_width_:I

    .line 7
    .line 8
    iput p3, p0, Lcom/momocv/FacePoseParams;->image_height_:I

    .line 9
    .line 10
    iget-object p2, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 11
    .line 12
    iput-object p2, p0, Lcom/momocv/FacePoseParams;->landmarks_:[F

    .line 13
    .line 14
    new-instance p2, Lcom/momocv/FacePoseInfo;

    .line 15
    .line 16
    invoke-direct {p2}, Lcom/momocv/FacePoseInfo;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p0, p2}, Lcom/momocv/videoprocessor/VideoProcessor;->nativCalcRTMatrixByLandmarks(Lcom/momocv/FacePoseParams;Lcom/momocv/FacePoseInfo;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->euler_angles_:[F

    .line 23
    .line 24
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 25
    .line 26
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->camera_matrix_:[F

    .line 27
    .line 28
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 29
    .line 30
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->rotation_matrix_:[F

    .line 31
    .line 32
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 33
    .line 34
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->rotation_vector_:[F

    .line 35
    .line 36
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 37
    .line 38
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->projection_matrix_:[F

    .line 39
    .line 40
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->projection_matrix_:[F

    .line 41
    .line 42
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->modelview_matrix_:[F

    .line 43
    .line 44
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 45
    .line 46
    iget-object p0, p2, Lcom/momocv/FacePoseInfo;->projection_matrix_opengl_:[F

    .line 47
    .line 48
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->projection_matrix_opengl_:[F

    .line 49
    .line 50
    return-void
.end method

.method private transformEulerAngles(Lcom/momocv/SingleFaceInfo;FFF)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    array-length p0, p0

    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    new-array p0, v0, [F

    .line 10
    .line 11
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 12
    .line 13
    :cond_1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    aput p3, p0, p1

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    aput p2, p0, p1

    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    neg-float p2, p4

    .line 23
    aput p2, p0, p1

    .line 24
    .line 25
    return-void
.end method

.method private transformFaceLandmark(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceLandmark68(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceLandmark96(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceLandmark104(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private transformFaceLandmark104(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V
    .locals 6

    .line 1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0xd0

    .line 6
    .line 7
    new-array p0, p0, [F

    .line 8
    .line 9
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 10
    .line 11
    :cond_0
    new-instance p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->with([Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 21
    .line 22
    const v4, 0x406a3d71    # 3.66f

    .line 23
    .line 24
    .line 25
    const v5, 0x402a3d71    # 2.66f

    .line 26
    .line 27
    .line 28
    const v2, 0x402a3d71    # 2.66f

    .line 29
    .line 30
    .line 31
    const v3, 0x406a3d71    # 3.66f

    .line 32
    .line 33
    .line 34
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->convert96to104([FFFFF)[F

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 39
    .line 40
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 41
    .line 42
    return-void
.end method

.method private transformFaceLandmark68(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x88

    .line 6
    .line 7
    new-array p0, p0, [F

    .line 8
    .line 9
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object p3, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 13
    .line 14
    array-length p4, p3

    .line 15
    div-int/lit8 p4, p4, 0x2

    .line 16
    .line 17
    if-ge p0, p4, :cond_1

    .line 18
    .line 19
    sget-object p3, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->points68:Landroid/util/SparseArray;

    .line 20
    .line 21
    invoke-virtual {p3, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p3

    .line 25
    check-cast p3, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;

    .line 26
    .line 27
    iget p3, p3, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->transformPoint:I

    .line 28
    .line 29
    aget-object p3, p2, p3

    .line 30
    .line 31
    iget-object p4, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 32
    .line 33
    invoke-virtual {p3}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getX()F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    aput v0, p4, p0

    .line 38
    .line 39
    iget-object p4, p1, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 40
    .line 41
    add-int/lit8 v0, p0, 0x44

    .line 42
    .line 43
    invoke-virtual {p3}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;->getY()F

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    aput p3, p4, v0

    .line 48
    .line 49
    add-int/lit8 p0, p0, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iput-object p3, p1, Lcom/momocv/SingleFaceInfo;->orig_landmarks_68_:[F

    .line 53
    .line 54
    return-void
.end method

.method private transformFaceLandmark96(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0xc0

    .line 6
    .line 7
    new-array p0, p0, [F

    .line 8
    .line 9
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 10
    .line 11
    :cond_0
    new-instance p0, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->with([Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p2, 0x0

    .line 21
    :goto_0
    iget-object p3, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 22
    .line 23
    array-length p4, p3

    .line 24
    div-int/lit8 p4, p4, 0x2

    .line 25
    .line 26
    if-ge p2, p4, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Lcom/immomo/momomediaext/filter/beauty/FacePointConfig;->get96PointAt(I)Landroid/graphics/PointF;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    iget-object p4, p1, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 33
    .line 34
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    aput v0, p4, p2

    .line 37
    .line 38
    add-int/lit8 v0, p2, 0x60

    .line 39
    .line 40
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 41
    .line 42
    aput p3, p4, v0

    .line 43
    .line 44
    add-int/lit8 p2, p2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iput-object p3, p1, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 48
    .line 49
    return-void
.end method

.method private transformFaceRect(Lcom/momocv/SingleFaceInfo;Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;)V
    .locals 6

    .line 1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    new-array p0, v0, [F

    .line 7
    .line 8
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getLeft()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    int-to-float v1, v1

    .line 17
    const/4 v2, 0x0

    .line 18
    aput v1, p0, v2

    .line 19
    .line 20
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getTop()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    const/4 v3, 0x1

    .line 28
    aput v1, p0, v3

    .line 29
    .line 30
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 31
    .line 32
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getRight()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    const/4 v4, 0x2

    .line 38
    aput v1, p0, v4

    .line 39
    .line 40
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 41
    .line 42
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getBottom()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    const/4 v5, 0x3

    .line 48
    aput v1, p0, v5

    .line 49
    .line 50
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 51
    .line 52
    if-nez p0, :cond_1

    .line 53
    .line 54
    new-array p0, v0, [F

    .line 55
    .line 56
    iput-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 57
    .line 58
    :cond_1
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 59
    .line 60
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getLeft()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    int-to-float v0, v0

    .line 65
    aput v0, p0, v2

    .line 66
    .line 67
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 68
    .line 69
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getTop()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    int-to-float v0, v0

    .line 74
    aput v0, p0, v3

    .line 75
    .line 76
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 77
    .line 78
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getRight()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    int-to-float v0, v0

    .line 83
    aput v0, p0, v4

    .line 84
    .line 85
    iget-object p0, p1, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 86
    .line 87
    invoke-virtual {p2}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;->getBottom()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    int-to-float p1, p1

    .line 92
    aput p1, p0, v5

    .line 93
    .line 94
    return-void
.end method

.method private wrapFaceDetectParams([BLl/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 2
    .line 3
    const/16 v1, 0x11

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/umw;->h(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 9
    .line 10
    iget v1, p2, Ll/omw;->e:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/umw;->m(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 16
    .line 17
    iget v1, p2, Ll/omw;->f:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/umw;->j(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/umw;->g([B)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 36
    .line 37
    array-length p1, p1

    .line 38
    invoke-virtual {v0, p1}, Ll/umw;->f(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 42
    .line 43
    iget v0, p2, Ll/omw;->e:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ll/umw;->l(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 49
    .line 50
    iget v0, p2, Ll/omw;->b:I

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ll/lnw;->A(I)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 56
    .line 57
    iget v0, p2, Ll/omw;->c:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ll/lnw;->z(I)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 63
    .line 64
    iget-boolean p2, p2, Ll/omw;->a:Z

    .line 65
    .line 66
    invoke-virtual {p1, p2}, Ll/lnw;->p(Z)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 70
    .line 71
    const/4 p2, 0x1

    .line 72
    invoke-virtual {p1, p2}, Ll/lnw;->h(Z)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    invoke-virtual {p1, v0}, Ll/lnw;->k(Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/lnw;->l(Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Ll/lnw;->i(Z)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Ll/lnw;->F(Z)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Ll/lnw;->n(Z)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 102
    .line 103
    invoke-virtual {p1, p2}, Ll/lnw;->w(I)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 107
    .line 108
    const/4 p2, 0x2

    .line 109
    invoke-virtual {p1, p2}, Ll/lnw;->j(I)V

    .line 110
    .line 111
    .line 112
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Ll/lnw;->B(Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method


# virtual methods
.method public transformFaceFeature(Lcom/effectsar/labcv/effectsdk/BefFaceInfo;Ll/omw;II)V
    .locals 9

    .line 1
    invoke-virtual {p2}, Ll/omw;->t()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p2}, Ll/omw;->m()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p2, Ll/omw;->b:I

    .line 10
    .line 11
    const/16 v3, 0x5a

    .line 12
    .line 13
    if-eq v2, v3, :cond_0

    .line 14
    .line 15
    const/16 v3, 0x10e

    .line 16
    .line 17
    if-ne v2, v3, :cond_1

    .line 18
    .line 19
    :cond_0
    invoke-virtual {p2}, Ll/omw;->m()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p2}, Ll/omw;->t()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    :cond_1
    int-to-float v2, p3

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    mul-float/2addr v2, v3

    .line 31
    int-to-float v3, v0

    .line 32
    div-float/2addr v2, v3

    .line 33
    iput v2, p2, Ll/omw;->A:F

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo;->getFace106s()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p2}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    array-length v3, p1

    .line 44
    new-array v3, v3, [Lcom/momocv/SingleFaceInfo;

    .line 45
    .line 46
    iput-object v3, v2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 47
    .line 48
    array-length v3, p1

    .line 49
    new-array v3, v3, [Lcom/momocv/videoprocessor/FaceAttribute;

    .line 50
    .line 51
    iput-object v3, v2, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 52
    .line 53
    const/4 v3, 0x0

    .line 54
    :goto_0
    iget-object v4, v2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 55
    .line 56
    array-length v4, v4

    .line 57
    if-ge v3, v4, :cond_3

    .line 58
    .line 59
    new-instance v4, Lcom/momocv/SingleFaceInfo;

    .line 60
    .line 61
    invoke-direct {v4}, Lcom/momocv/SingleFaceInfo;-><init>()V

    .line 62
    .line 63
    .line 64
    aget-object v5, p1, v3

    .line 65
    .line 66
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getPoints_array()[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-direct {p0, v4, v6, v0, v1}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceLandmark(Lcom/momocv/SingleFaceInfo;[Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FacePoint;II)V

    .line 71
    .line 72
    .line 73
    invoke-direct {p0, v4, p3, p4}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformEngineMatrix(Lcom/momocv/SingleFaceInfo;II)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getRect()Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    invoke-direct {p0, v4, v6}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformFaceRect(Lcom/momocv/SingleFaceInfo;Lcom/effectsar/labcv/effectsdk/BefFaceInfo$FaceRect;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getYaw()F

    .line 84
    .line 85
    .line 86
    move-result v6

    .line 87
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getPitch()F

    .line 88
    .line 89
    .line 90
    move-result v7

    .line 91
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getRoll()F

    .line 92
    .line 93
    .line 94
    move-result v8

    .line 95
    invoke-direct {p0, v4, v6, v7, v8}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->transformEulerAngles(Lcom/momocv/SingleFaceInfo;FFF)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getRoll()F

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    const/4 v7, 0x0

    .line 103
    cmpg-float v6, v6, v7

    .line 104
    .line 105
    if-gez v6, :cond_2

    .line 106
    .line 107
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getRoll()F

    .line 108
    .line 109
    .line 110
    move-result v6

    .line 111
    neg-float v6, v6

    .line 112
    goto :goto_1

    .line 113
    :cond_2
    const/high16 v6, 0x43b40000    # 360.0f

    .line 114
    .line 115
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getRoll()F

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    sub-float/2addr v6, v7

    .line 120
    :goto_1
    iput v6, v4, Lcom/momocv/SingleFaceInfo;->face_rotate_degree_2d_:F

    .line 121
    .line 122
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getID()I

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    iput v6, v4, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 127
    .line 128
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getScore()F

    .line 129
    .line 130
    .line 131
    move-result v6

    .line 132
    iput v6, v4, Lcom/momocv/SingleFaceInfo;->feature_quality_score_:F

    .line 133
    .line 134
    iget-object v6, v2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 135
    .line 136
    aput-object v4, v6, v3

    .line 137
    .line 138
    new-instance v4, Lcom/momocv/videoprocessor/FaceAttribute;

    .line 139
    .line 140
    invoke-direct {v4}, Lcom/momocv/videoprocessor/FaceAttribute;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v5}, Lcom/effectsar/labcv/effectsdk/BefFaceInfo$Face106;->getAction()I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    iput v5, v4, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 148
    .line 149
    iget-object v5, v2, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 150
    .line 151
    aput-object v4, v5, v3

    .line 152
    .line 153
    add-int/lit8 v3, v3, 0x1

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_3
    invoke-virtual {p2}, Ll/omw;->a()V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->isUseAnimojiFaceRig()Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-eqz p1, :cond_4

    .line 164
    .line 165
    iget-object p1, p2, Ll/omw;->g:[B

    .line 166
    .line 167
    invoke-direct {p0, p1, p2}, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->wrapFaceDetectParams([BLl/omw;)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mMMFrame:Ll/umw;

    .line 171
    .line 172
    iget-object p0, p0, Lcom/immomo/momomediaext/filter/beauty/FaceFeatureHelper;->mParamsInfo:Ll/lnw;

    .line 173
    .line 174
    invoke-static {p1, p0, p2}, Lcom/immomo/momomediaext/filter/beauty/ByteDanceFacerigHelper;->processFacrigFrame(Ll/umw;Ll/lnw;Ll/omw;)Ll/evf;

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    if-eqz p0, :cond_4

    .line 179
    .line 180
    invoke-virtual {p2, p0}, Ll/omw;->D(Ll/evf;)V

    .line 181
    .line 182
    .line 183
    :cond_4
    return-void
.end method
