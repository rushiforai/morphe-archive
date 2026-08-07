.class public Ll/lnw;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field a:Lcom/momocv/BaseParams;

.field b:Lcom/momocv/videoprocessor/VideoParams;

.field c:Lcom/momocv/FaceParams;

.field d:Lcom/momocv/segmentation/SegmentationParams;

.field e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

.field f:Lcom/momocv/express/ExpressParams;

.field g:Lcom/momocv/handsg/HandsgParams;

.field h:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 92
    iput-object v0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 93
    iput-object v0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 94
    iput-object v0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 95
    iput-object v0, p0, Ll/lnw;->d:Lcom/momocv/segmentation/SegmentationParams;

    .line 96
    iput-object v0, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    const/4 v0, 0x1

    .line 97
    iput v0, p0, Ll/lnw;->h:I

    .line 98
    new-instance v1, Lcom/momocv/videoprocessor/VideoParams;

    invoke-direct {v1}, Lcom/momocv/videoprocessor/VideoParams;-><init>()V

    iput-object v1, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 99
    iput-object v1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 100
    iput-object v1, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 101
    iput v0, p0, Ll/lnw;->h:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 6
    .line 7
    iput-object v0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 8
    .line 9
    iput-object v0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 10
    .line 11
    iput-object v0, p0, Ll/lnw;->d:Lcom/momocv/segmentation/SegmentationParams;

    .line 12
    .line 13
    iput-object v0, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 14
    .line 15
    iput p1, p0, Ll/lnw;->h:I

    .line 16
    .line 17
    packed-switch p1, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :pswitch_0
    new-instance p1, Lcom/momocv/handsg/HandsgParams;

    .line 22
    .line 23
    invoke-direct {p1}, Lcom/momocv/handsg/HandsgParams;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/lnw;->g:Lcom/momocv/handsg/HandsgParams;

    .line 27
    .line 28
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_1
    new-instance p1, Lcom/momocv/express/ExpressParams;

    .line 32
    .line 33
    invoke-direct {p1}, Lcom/momocv/express/ExpressParams;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/lnw;->f:Lcom/momocv/express/ExpressParams;

    .line 37
    .line 38
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 39
    .line 40
    return-void

    .line 41
    :pswitch_2
    new-instance p1, Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 42
    .line 43
    invoke-direct {p1}, Lcom/momocv/bodylandmark/BodyLandmarkParams;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 47
    .line 48
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_3
    new-instance p1, Lcom/momocv/segmentation/SegmentationParams;

    .line 52
    .line 53
    invoke-direct {p1}, Lcom/momocv/segmentation/SegmentationParams;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/lnw;->d:Lcom/momocv/segmentation/SegmentationParams;

    .line 57
    .line 58
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_4
    new-instance p1, Lcom/momocv/FaceParams;

    .line 62
    .line 63
    invoke-direct {p1}, Lcom/momocv/FaceParams;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 67
    .line 68
    return-void

    .line 69
    :pswitch_5
    new-instance p1, Lcom/momocv/FaceParams;

    .line 70
    .line 71
    invoke-direct {p1}, Lcom/momocv/FaceParams;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 75
    .line 76
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_6
    new-instance p1, Lcom/momocv/videoprocessor/VideoParams;

    .line 80
    .line 81
    invoke-direct {p1}, Lcom/momocv/videoprocessor/VideoParams;-><init>()V

    .line 82
    .line 83
    .line 84
    iput-object p1, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 85
    .line 86
    iput-object p1, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 87
    .line 88
    iput-object p1, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 89
    .line 90
    return-void

    .line 91
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 4
    .line 5
    return-void
.end method

.method public B(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->save_features_:Z

    .line 4
    .line 5
    return-void
.end method

.method public C(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 4
    .line 5
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->mouth_sg:Z

    .line 4
    .line 5
    return-void
.end method

.method public E(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->d:Lcom/momocv/segmentation/SegmentationParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/segmentation/SegmentationParams;->video_mode_:Z

    .line 4
    .line 5
    return-void
.end method

.method public F(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoParams;->skin_switch_:Z

    .line 4
    .line 5
    return-void
.end method

.method public G(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->supper_stable_mode_:Z

    .line 4
    .line 5
    return-void
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/momocv/bodylandmark/BodyLandmarkParams;->use_tracking_:Z

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->use_mix_:Z

    .line 4
    .line 5
    return-void
.end method

.method public J(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->use_npd_:Z

    .line 4
    .line 5
    return-void
.end method

.method public K(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_level1_:F

    .line 4
    .line 5
    return-void
.end method

.method public L(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_level2_:F

    .line 4
    .line 5
    return-void
.end method

.method public M(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_type_:I

    .line 4
    .line 5
    return-void
.end method

.method public a()Lcom/momocv/bodylandmark/BodyLandmarkParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/momocv/express/ExpressParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->f:Lcom/momocv/express/ExpressParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/momocv/BaseParams;
    .locals 1

    .line 1
    iget v0, p0, Ll/lnw;->h:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :pswitch_0
    iget-object p0, p0, Ll/lnw;->g:Lcom/momocv/handsg/HandsgParams;

    .line 9
    .line 10
    return-object p0

    .line 11
    :pswitch_1
    iget-object p0, p0, Ll/lnw;->f:Lcom/momocv/express/ExpressParams;

    .line 12
    .line 13
    return-object p0

    .line 14
    :pswitch_2
    iget-object p0, p0, Ll/lnw;->e:Lcom/momocv/bodylandmark/BodyLandmarkParams;

    .line 15
    .line 16
    return-object p0

    .line 17
    :pswitch_3
    iget-object p0, p0, Ll/lnw;->d:Lcom/momocv/segmentation/SegmentationParams;

    .line 18
    .line 19
    return-object p0

    .line 20
    :pswitch_4
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 21
    .line 22
    return-object p0

    .line 23
    :pswitch_5
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 24
    .line 25
    return-object p0

    .line 26
    :pswitch_6
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 27
    .line 28
    return-object p0

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 4
    .line 5
    return p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 4
    .line 5
    return p0
.end method

.method public f()Lcom/momocv/videoprocessor/VideoParams;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iget-boolean p0, p0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 4
    .line 5
    return p0
.end method

.method public h(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->asynchronous_face_detect_:Z

    .line 4
    .line 5
    return-void
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoParams;->beauty_switch_:Z

    .line 4
    .line 5
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->business_type_:I

    .line 4
    .line 5
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoParams;->expression_switch_:Z

    .line 4
    .line 5
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoParams;->eye_classify_switch_:Z

    .line 4
    .line 5
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->face_alignment_version_:I

    .line 4
    .line 5
    return-void
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/videoprocessor/VideoParams;->face_warp_gradual_switch_:Z

    .line 4
    .line 5
    return-void
.end method

.method public o(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/videoprocessor/VideoParams;->face_warp_gradual_thresh_:I

    .line 4
    .line 5
    return-void
.end method

.method public p(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 4
    .line 5
    return-void
.end method

.method public q(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->frame_interval_:I

    .line 4
    .line 5
    return-void
.end method

.method public r(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/videoprocessor/VideoParams;->video_processor_frame_skip_:I

    .line 4
    .line 5
    return-void
.end method

.method public s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->max_faces_:I

    .line 4
    .line 5
    return-void
.end method

.method public t(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/momocv/FaceParams;->npd_accelerate_:Z

    .line 4
    .line 5
    return-void
.end method

.method public u([[F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->f:Lcom/momocv/express/ExpressParams;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momocv/express/ExpressParams;->orig_face_rect_:[[F

    .line 4
    .line 5
    return-void
.end method

.method public v([[F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->f:Lcom/momocv/express/ExpressParams;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momocv/express/ExpressParams;->origin_landmarks96_:[[F

    .line 4
    .line 5
    return-void
.end method

.method public w(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->b:Lcom/momocv/videoprocessor/VideoParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->pose_estimation_type_:I

    .line 4
    .line 5
    return-void
.end method

.method public x(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->pose_estimation_type_:I

    .line 4
    .line 5
    return-void
.end method

.method public y(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->c:Lcom/momocv/FaceParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/FaceParams;->pose_stable_coef_:F

    .line 4
    .line 5
    return-void
.end method

.method public z(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lnw;->a:Lcom/momocv/BaseParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 4
    .line 5
    return-void
.end method
