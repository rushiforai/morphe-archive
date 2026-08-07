.class public Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xpl$a;


# instance fields
.field dataList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "[B>;"
        }
    .end annotation
.end field

.field emptyList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "[B>;"
        }
    .end annotation
.end field

.field isPreviewing:Z

.field lastCameraTime:J

.field lastSendTime:J

.field private mBasicRender:Lcom/momo/mcamera/mask/BasicRender;

.field private mCamera:Ll/xpl;

.field private mCameraTexture:Landroid/graphics/SurfaceTexture;

.field private mFaceRig:Lcom/momocv/facerigv3/FaceRigV3;

.field private mFaceRigInfo:Lcom/momocv/facerigv3/FacerigV3Info;

.field private mFacerigV3Params:Lcom/momocv/facerigv3/FacerigV3Params;

.field mFrameIndex:I

.field private mHandler:Landroid/os/Handler;

.field private mHandlerThread:Landroid/os/HandlerThread;

.field private mMFrame:Lcom/momocv/MMFrame;

.field private mOnFaceDetectListener:Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;

.field private mVideoInfo:Lcom/momocv/videoprocessor/VideoInfo;

.field private mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

.field private mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

.field mXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

.field private mrCoreParameters:Ll/tow;

.field processIntevla:J

.field syncLock:Ljava/lang/Object;

.field final syncObj:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncObj:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->isPreviewing:Z

    .line 13
    .line 14
    new-instance v0, Ljava/lang/Object;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncLock:Ljava/lang/Object;

    .line 20
    .line 21
    const-wide/16 v0, 0x0

    .line 22
    .line 23
    iput-wide v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->lastCameraTime:J

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->lastSendTime:J

    .line 26
    .line 27
    iput-wide v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->processIntevla:J

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->process([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private initCoreParams(Ll/row;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/row;->j()Ll/erf0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iput v1, v0, Ll/tow;->u:I

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/row;->j()Ll/erf0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput v1, v0, Ll/tow;->v:I

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/row;->g()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, v0, Ll/tow;->H:I

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/row;->h()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput v1, v0, Ll/tow;->F:I

    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/row;->i()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, v0, Ll/tow;->D:I

    .line 48
    .line 49
    iget-object p0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    iput p1, p0, Ll/tow;->M:I

    .line 53
    .line 54
    return-void
.end method

.method private makeInfo(Lcom/momocv/videoprocessor/VideoInfo;Lcom/momocv/facerigv3/FacerigV3Info;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/momocv/videoprocessor/VideoInfo;",
            "Lcom/momocv/facerigv3/FacerigV3Info;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/momo/xeengine/cv/bean/XEFaceInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_2

    .line 4
    .line 5
    array-length p1, p0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p1, 0x0

    .line 10
    aget-object p0, p0, p1

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/momo/xeengine/cv/bean/XEFaceInfo;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 26
    .line 27
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks68:[F

    .line 28
    .line 29
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 30
    .line 31
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->landmarks96:[F

    .line 32
    .line 33
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 34
    .line 35
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->faceBounds:[F

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 38
    .line 39
    aget v3, v2, p1

    .line 40
    .line 41
    iput v3, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->pitch:F

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    aget v4, v2, v3

    .line 45
    .line 46
    iput v4, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->yaw:F

    .line 47
    .line 48
    const/4 v4, 0x2

    .line 49
    aget v2, v2, v4

    .line 50
    .line 51
    iput v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->roll:F

    .line 52
    .line 53
    iget v2, p0, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 54
    .line 55
    iput v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->trackId:I

    .line 56
    .line 57
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 58
    .line 59
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->cameraMatrix:[F

    .line 60
    .line 61
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 62
    .line 63
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationMatrix:[F

    .line 64
    .line 65
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 66
    .line 67
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->rotationVector:[F

    .line 68
    .line 69
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->translation_vector_:[F

    .line 70
    .line 71
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->translationVector:[F

    .line 72
    .line 73
    iget-object v2, p0, Lcom/momocv/SingleFaceInfo;->projection_matrix_:[F

    .line 74
    .line 75
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->projectionMatrix:[F

    .line 76
    .line 77
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 78
    .line 79
    iput-object p0, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->modelViewMatrix:[F

    .line 80
    .line 81
    if-eqz p2, :cond_1

    .line 82
    .line 83
    iget-object p0, p2, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_eulers_:[F

    .line 84
    .line 85
    if-eqz p0, :cond_1

    .line 86
    .line 87
    iget-object v2, p2, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 88
    .line 89
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 90
    .line 91
    const/16 v2, 0x36

    .line 92
    .line 93
    new-array v2, v2, [F

    .line 94
    .line 95
    const/4 v4, 0x3

    .line 96
    invoke-static {p0, p1, v2, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p2, Lcom/momocv/facerigv3/FacerigV3Info;->facerigV3_scores_:[F

    .line 100
    .line 101
    const/16 p2, 0x33

    .line 102
    .line 103
    invoke-static {p0, p1, v2, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 104
    .line 105
    .line 106
    iput-object v2, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->facerigStates:[F

    .line 107
    .line 108
    :cond_1
    iput v3, v1, Lcom/momo/xeengine/cv/bean/XEFaceInfo;->meType:I

    .line 109
    .line 110
    return-object v0

    .line 111
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 112
    return-object p0
.end method

.method private process([B)V
    .locals 6

    .line 1
    iget v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFrameIndex:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFrameIndex:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 8
    .line 9
    iget v2, v0, Ll/tow;->e:I

    .line 10
    .line 11
    if-eqz v2, :cond_8

    .line 12
    .line 13
    iget v0, v0, Ll/tow;->f:I

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 20
    .line 21
    .line 22
    new-instance v0, Lcom/momocv/facerigv3/FacerigV3Info;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/momocv/facerigv3/FacerigV3Info;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRigInfo:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 28
    .line 29
    invoke-direct {p0}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->setParams()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mMFrame:Lcom/momocv/MMFrame;

    .line 33
    .line 34
    iput-object p1, v0, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 35
    .line 36
    array-length v2, p1

    .line 37
    iput v2, v0, Lcom/momocv/MMFrame;->data_len_:I

    .line 38
    .line 39
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 42
    .line 43
    iget-object v4, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoInfo:Lcom/momocv/videoprocessor/VideoInfo;

    .line 44
    .line 45
    invoke-virtual {v2, v0, v3, v4}, Lcom/momocv/videoprocessor/VideoProcessor;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_1

    .line 50
    .line 51
    goto/16 :goto_3

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoInfo:Lcom/momocv/videoprocessor/VideoInfo;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    if-eqz v0, :cond_3

    .line 59
    .line 60
    array-length v3, v0

    .line 61
    if-lez v3, :cond_3

    .line 62
    .line 63
    aget-object v0, v0, v2

    .line 64
    .line 65
    iget-object v3, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFacerigV3Params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 66
    .line 67
    iget-object v4, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 68
    .line 69
    iput-object v4, v3, Lcom/momocv/facerigv3/FacerigV3Params;->orig_landmarks_96_:[F

    .line 70
    .line 71
    new-instance v3, Lcom/momocv/MMFrame;

    .line 72
    .line 73
    invoke-direct {v3}, Lcom/momocv/MMFrame;-><init>()V

    .line 74
    .line 75
    .line 76
    iget-object v4, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 77
    .line 78
    iget v5, v4, Ll/tow;->e:I

    .line 79
    .line 80
    iput v5, v3, Lcom/momocv/MMFrame;->width_:I

    .line 81
    .line 82
    iget v4, v4, Ll/tow;->f:I

    .line 83
    .line 84
    iput v4, v3, Lcom/momocv/MMFrame;->height_:I

    .line 85
    .line 86
    iput v5, v3, Lcom/momocv/MMFrame;->step_:I

    .line 87
    .line 88
    mul-int/2addr v5, v4

    .line 89
    mul-int/lit8 v5, v5, 0x3

    .line 90
    .line 91
    const/4 v4, 0x2

    .line 92
    div-int/2addr v5, v4

    .line 93
    iput v5, v3, Lcom/momocv/MMFrame;->data_len_:I

    .line 94
    .line 95
    const/16 v5, 0x11

    .line 96
    .line 97
    iput v5, v3, Lcom/momocv/MMFrame;->format_:I

    .line 98
    .line 99
    iput-object p1, v3, Lcom/momocv/MMFrame;->data_ptr_:[B

    .line 100
    .line 101
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFacerigV3Params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 102
    .line 103
    iget-object v5, p1, Lcom/momocv/facerigv3/FacerigV3Params;->orig_landmarks_96_:[F

    .line 104
    .line 105
    if-eqz v5, :cond_2

    .line 106
    .line 107
    iget-object v0, v0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 108
    .line 109
    if-eqz v0, :cond_2

    .line 110
    .line 111
    array-length v5, v0

    .line 112
    if-le v5, v4, :cond_2

    .line 113
    .line 114
    iput-object v0, p1, Lcom/momocv/facerigv3/FacerigV3Params;->face_processor_eulers_:[F

    .line 115
    .line 116
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 117
    .line 118
    iget-boolean v0, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 119
    .line 120
    iput-boolean v0, p1, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 121
    .line 122
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRig:Lcom/momocv/facerigv3/FaceRigV3;

    .line 123
    .line 124
    iget-object v4, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRigInfo:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 125
    .line 126
    invoke-virtual {v0, v3, p1, v4}, Lcom/momocv/facerigv3/FaceRigV3;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/facerigv3/FacerigV3Params;Lcom/momocv/facerigv3/FacerigV3Info;)Z

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoInfo:Lcom/momocv/videoprocessor/VideoInfo;

    .line 130
    .line 131
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRigInfo:Lcom/momocv/facerigv3/FacerigV3Info;

    .line 132
    .line 133
    invoke-direct {p0, p1, v0}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->makeInfo(Lcom/momocv/videoprocessor/VideoInfo;Lcom/momocv/facerigv3/FacerigV3Info;)Ljava/util/ArrayList;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    goto :goto_0

    .line 138
    :cond_3
    const/4 p1, 0x0

    .line 139
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mOnFaceDetectListener:Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;

    .line 140
    .line 141
    if-eqz v0, :cond_6

    .line 142
    .line 143
    if-eqz p1, :cond_5

    .line 144
    .line 145
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-gtz v0, :cond_4

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_4
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mOnFaceDetectListener:Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;

    .line 153
    .line 154
    invoke-interface {v0, v1}, Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;->hasFaceDetectInfo(Z)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mOnFaceDetectListener:Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;

    .line 159
    .line 160
    invoke-interface {v0, v2}, Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;->hasFaceDetectInfo(Z)V

    .line 161
    .line 162
    .line 163
    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 164
    .line 165
    if-eqz v0, :cond_7

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    if-eqz v0, :cond_7

    .line 172
    .line 173
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->dispatchFaceInfo(Ljava/util/List;)V

    .line 174
    .line 175
    .line 176
    :cond_7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 177
    .line 178
    .line 179
    move-result-wide v0

    .line 180
    iput-wide v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->processIntevla:J

    .line 181
    .line 182
    :cond_8
    :goto_3
    return-void
.end method

.method private setParams()V
    .locals 4

    .line 1
    new-instance v0, Lcom/momocv/MMFrame;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momocv/MMFrame;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mMFrame:Lcom/momocv/MMFrame;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 9
    .line 10
    iget v2, v1, Ll/tow;->e:I

    .line 11
    .line 12
    iput v2, v0, Lcom/momocv/MMFrame;->width_:I

    .line 13
    .line 14
    iget v1, v1, Ll/tow;->f:I

    .line 15
    .line 16
    iput v1, v0, Lcom/momocv/MMFrame;->height_:I

    .line 17
    .line 18
    const/16 v1, 0x11

    .line 19
    .line 20
    iput v1, v0, Lcom/momocv/MMFrame;->format_:I

    .line 21
    .line 22
    iput v2, v0, Lcom/momocv/MMFrame;->step_:I

    .line 23
    .line 24
    new-instance v0, Lcom/momocv/videoprocessor/VideoParams;

    .line 25
    .line 26
    invoke-direct {v0}, Lcom/momocv/videoprocessor/VideoParams;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    iput v1, v0, Lcom/momocv/FaceParams;->max_faces_:I

    .line 33
    .line 34
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 35
    .line 36
    iget v2, v2, Ll/tow;->D:I

    .line 37
    .line 38
    if-nez v2, :cond_0

    .line 39
    .line 40
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 41
    .line 42
    invoke-interface {v2}, Ll/xpl;->m()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    rsub-int v2, v2, 0x10e

    .line 48
    .line 49
    :goto_0
    iput v2, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 54
    .line 55
    invoke-interface {v2}, Ll/xpl;->m()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    iput v2, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 60
    .line 61
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 62
    .line 63
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 64
    .line 65
    invoke-interface {v2}, Ll/xpl;->i()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    iput-boolean v2, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 70
    .line 71
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoParams:Lcom/momocv/videoprocessor/VideoParams;

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    iput-boolean v2, v0, Lcom/momocv/FaceParams;->detect_single_frame_:Z

    .line 75
    .line 76
    iput-boolean v2, v0, Lcom/momocv/FaceParams;->save_features_:Z

    .line 77
    .line 78
    iput-boolean v1, v0, Lcom/momocv/FaceParams;->use_npd_:Z

    .line 79
    .line 80
    iput-boolean v2, v0, Lcom/momocv/FaceParams;->use_mix_:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/momocv/FaceParams;->asynchronous_save_features_:Z

    .line 83
    .line 84
    iput-boolean v2, v0, Lcom/momocv/FaceParams;->feature_strict_:Z

    .line 85
    .line 86
    iput v1, v0, Lcom/momocv/FaceParams;->pose_estimation_type_:I

    .line 87
    .line 88
    const v3, 0x5f3759ee

    .line 89
    .line 90
    .line 91
    iput v3, v0, Lcom/momocv/FaceParams;->save_features_version_:I

    .line 92
    .line 93
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->track_switch_:Z

    .line 94
    .line 95
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->beauty_switch_:Z

    .line 96
    .line 97
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->skin_switch_:Z

    .line 98
    .line 99
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->multifaces_switch_:Z

    .line 100
    .line 101
    iput v2, v0, Lcom/momocv/videoprocessor/VideoParams;->warp_type_:I

    .line 102
    .line 103
    const/4 v3, 0x0

    .line 104
    iput v3, v0, Lcom/momocv/videoprocessor/VideoParams;->warp_level1_:F

    .line 105
    .line 106
    iput v3, v0, Lcom/momocv/videoprocessor/VideoParams;->warp_level2_:F

    .line 107
    .line 108
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->expression_switch_:Z

    .line 109
    .line 110
    iput-boolean v2, v0, Lcom/momocv/videoprocessor/VideoParams;->eye_classify_switch_:Z

    .line 111
    .line 112
    iput v2, v0, Lcom/momocv/FaceParams;->face_alignment_version_:I

    .line 113
    .line 114
    const/high16 v3, 0x41200000    # 10.0f

    .line 115
    .line 116
    iput v3, v0, Lcom/momocv/FaceParams;->focal_length_multiply_:F

    .line 117
    .line 118
    iput-boolean v1, v0, Lcom/momocv/FaceParams;->do_facedect_corp_center_:Z

    .line 119
    .line 120
    iput-boolean v1, v0, Lcom/momocv/FaceParams;->asynchronous_face_detect_:Z

    .line 121
    .line 122
    iput-boolean v2, v0, Lcom/momocv/FaceParams;->debug_on_:Z

    .line 123
    .line 124
    new-instance v0, Lcom/momocv/videoprocessor/VideoInfo;

    .line 125
    .line 126
    invoke-direct {v0}, Lcom/momocv/videoprocessor/VideoInfo;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoInfo:Lcom/momocv/videoprocessor/VideoInfo;

    .line 130
    .line 131
    new-instance v0, Lcom/momocv/facerigv3/FacerigV3Params;

    .line 132
    .line 133
    invoke-direct {v0}, Lcom/momocv/facerigv3/FacerigV3Params;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFacerigV3Params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 139
    .line 140
    iget v1, v1, Ll/tow;->D:I

    .line 141
    .line 142
    if-nez v1, :cond_1

    .line 143
    .line 144
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 145
    .line 146
    invoke-interface {v1}, Ll/xpl;->m()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_1

    .line 151
    :cond_1
    rsub-int v1, v1, 0x10e

    .line 152
    .line 153
    :goto_1
    iput v1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 154
    .line 155
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFacerigV3Params:Lcom/momocv/facerigv3/FacerigV3Params;

    .line 156
    .line 157
    iget-object p0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 158
    .line 159
    invoke-interface {p0}, Ll/xpl;->m()I

    .line 160
    .line 161
    .line 162
    move-result p0

    .line 163
    iput p0, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 164
    .line 165
    return-void
.end method


# virtual methods
.method public initAnimoji(Lcom/momo/xeengine/XE3DEngine;ILl/row;)Z
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mXE3DEngine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncObj:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter p1

    .line 6
    :try_start_0
    new-instance v0, Ll/tow;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/tow;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 12
    .line 13
    invoke-direct {p0, p3}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->initCoreParams(Ll/row;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mrCoreParameters:Ll/tow;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->initInternalParamter(Ll/tow;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 22
    .line 23
    invoke-interface {v0, p2, p3}, Ll/xpl;->G(ILl/row;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_0

    .line 28
    .line 29
    const-string p0, "AnimojiUtil"

    .line 30
    .line 31
    const-string p2, "Camera prepare Failed!"

    .line 32
    .line 33
    invoke-static {p0, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    monitor-exit p1

    .line 38
    return p0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 42
    .line 43
    invoke-interface {p2, p0}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Lcom/core/glcore/datadot/DataDotUtils;->getInstance()Lcom/core/glcore/datadot/DataDotUtils;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0}, Lcom/core/glcore/datadot/DataDotUtils;->getRecoderDataDotInfo()Lcom/core/glcore/datadot/RecoderDataDotInfo;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 p2, 0x1

    .line 55
    invoke-virtual {p0, p2}, Lcom/core/glcore/datadot/RecoderDataDotInfo;->setCameraDetectAnimoji(Z)V

    .line 56
    .line 57
    .line 58
    monitor-exit p1

    .line 59
    return p2

    .line 60
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 61
    throw p0
.end method

.method public initInternalParamter(Ll/tow;)V
    .locals 1

    .line 1
    new-instance v0, Ll/biw;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/biw;-><init>(Ll/tow;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 7
    .line 8
    new-instance v0, Lcom/momo/mcamera/mask/BasicRender;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Lcom/momo/mcamera/mask/BasicRender;-><init>(Ll/tow;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mBasicRender:Lcom/momo/mcamera/mask/BasicRender;

    .line 14
    .line 15
    return-void
.end method

.method public loadFaceDetectMode(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/momocv/videoprocessor/VideoProcessor;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momocv/videoprocessor/VideoProcessor;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Lcom/momocv/videoprocessor/VideoProcessor;->LoadModel(Ljava/lang/String;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "AnimojiUtil"

    .line 15
    .line 16
    const-string p1, "initData: videoProcessor load model failed"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public loadFaceRigMode(Ljava/lang/String;)Z
    .locals 1

    .line 1
    new-instance v0, Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/momocv/facerigv3/FaceRigV3;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRig:Lcom/momocv/facerigv3/FaceRigV3;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lcom/momocv/facerigv3/FaceRigV3;->LoadModel(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const-string p0, "AnimojiUtil"

    .line 15
    .line 16
    const-string p1, "initData: faceRig loadModel failed"

    .line 17
    .line 18
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public onData([B)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRig:Lcom/momocv/facerigv3/FaceRigV3;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iput-wide v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->lastCameraTime:J

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandler:Landroid/os/Handler;

    .line 18
    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    new-instance v0, Landroid/os/HandlerThread;

    .line 22
    .line 23
    const-string v1, "AniUtilProc"

    .line 24
    .line 25
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandlerThread:Landroid/os/HandlerThread;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandlerThread:Landroid/os/HandlerThread;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-direct {v0, p0, v1}, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil$1;-><init>(Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;Landroid/os/Looper;)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandler:Landroid/os/Handler;

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->dataList:Ljava/util/LinkedList;

    .line 47
    .line 48
    const/4 v1, 0x0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 52
    .line 53
    if-nez v0, :cond_3

    .line 54
    .line 55
    :cond_2
    new-instance v0, Ljava/util/LinkedList;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->dataList:Ljava/util/LinkedList;

    .line 61
    .line 62
    new-instance v0, Ljava/util/LinkedList;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 68
    .line 69
    move v0, v1

    .line 70
    :goto_0
    const/4 v2, 0x3

    .line 71
    if-ge v0, v2, :cond_3

    .line 72
    .line 73
    array-length v2, p1

    .line 74
    new-array v2, v2, [B

    .line 75
    .line 76
    iget-object v3, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 77
    .line 78
    invoke-virtual {v3, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncLock:Ljava/lang/Object;

    .line 88
    .line 89
    monitor-enter v0

    .line 90
    :try_start_0
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 91
    .line 92
    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-lez v2, :cond_4

    .line 97
    .line 98
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->emptyList:Ljava/util/LinkedList;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/util/LinkedList;->pollFirst()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, [B

    .line 108
    .line 109
    array-length v3, p1

    .line 110
    invoke-static {p1, v1, v2, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    .line 112
    .line 113
    iget-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->dataList:Ljava/util/LinkedList;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput v1, p1, Landroid/os/Message;->what:I

    .line 123
    .line 124
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandler:Landroid/os/Handler;

    .line 125
    .line 126
    invoke-virtual {v1, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 127
    .line 128
    .line 129
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 130
    .line 131
    .line 132
    move-result-wide v1

    .line 133
    iput-wide v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->lastSendTime:J

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :catchall_0
    move-exception p0

    .line 137
    goto :goto_2

    .line 138
    :cond_4
    :goto_1
    monitor-exit v0

    .line 139
    return-void

    .line 140
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    throw p0

    .line 142
    :cond_5
    :goto_3
    return-void
.end method

.method public release()V
    .locals 3

    .line 1
    const-string v0, "AnimojiUtil"

    .line 2
    .line 3
    const-string v1, "AnimojiUtil release"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncObj:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mVideoProcessor:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mFaceRig:Lcom/momocv/facerigv3/FaceRigV3;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/momocv/facerigv3/FaceRigV3;->Release()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-interface {v1, v2}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 37
    .line 38
    invoke-interface {v1}, Ll/xpl;->release()V

    .line 39
    .line 40
    .line 41
    iput-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    iput-boolean v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->isPreviewing:Z

    .line 45
    .line 46
    :cond_2
    iget-object p0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mHandlerThread:Landroid/os/HandlerThread;

    .line 47
    .line 48
    if-eqz p0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/os/HandlerThread;->quit()Z

    .line 51
    .line 52
    .line 53
    :cond_3
    monitor-exit v0

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public setOnFaceDetectListener(Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mOnFaceDetectListener:Lcom/momo/mcamera/AnimojiUtils/OnFaceDetectListener;

    .line 2
    .line 3
    return-void
.end method

.method public startPreview()V
    .locals 3

    .line 1
    const-string v0, "AnimojiUtil"

    .line 2
    .line 3
    const-string v1, "AnimojiUtil startPreview"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncObj:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-boolean v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->isPreviewing:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 20
    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mBasicRender:Lcom/momo/mcamera/mask/BasicRender;

    .line 24
    .line 25
    if-eqz v1, :cond_1

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/BasicRender;->createTexture()Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-interface {v1, v2}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 40
    .line 41
    invoke-interface {v1, p0}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 47
    .line 48
    invoke-interface {v1, v2}, Ll/xpl;->j(Landroid/graphics/SurfaceTexture;)Z

    .line 49
    .line 50
    .line 51
    :cond_1
    const/4 v1, 0x1

    .line 52
    iput-boolean v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->isPreviewing:Z

    .line 53
    .line 54
    monitor-exit v0

    .line 55
    return-void

    .line 56
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    throw p0
.end method

.method public stopPreview()V
    .locals 3

    .line 1
    const-string v0, "AnimojiUtil"

    .line 2
    .line 3
    const-string v1, "AnimojiUtil stopPreview"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->syncObj:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {v1, v2}, Ll/xpl;->K(Ll/xpl$a;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCamera:Ll/xpl;

    .line 20
    .line 21
    invoke-interface {v1}, Ll/xpl;->a()I

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    iput-object v2, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->mCameraTexture:Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    iput-boolean v1, p0, Lcom/momo/mcamera/AnimojiUtils/AnimojiUtil;->isPreviewing:Z

    .line 31
    .line 32
    monitor-exit v0

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0
.end method
