.class public Ll/nuf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private a:Lcom/momocv/SingleFaceInfo;

.field private b:Lcom/momocv/videoprocessor/FaceAttribute;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public A()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public B()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public C(Lcom/momocv/videoprocessor/FaceAttribute;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    return-void
.end method

.method public D(Lcom/momocv/SingleFaceInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    return-void
.end method

.method public a()Ll/nuf;
    .locals 4
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/nuf;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/nuf;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v1, Lcom/momocv/videoprocessor/FaceAttribute;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/momocv/videoprocessor/FaceAttribute;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 16
    .line 17
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->skin_threshold_:[I

    .line 20
    .line 21
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([I)[I

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->skin_threshold_:[I

    .line 26
    .line 27
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 28
    .line 29
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 32
    .line 33
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 38
    .line 39
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 40
    .line 41
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 44
    .line 45
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 50
    .line 51
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 52
    .line 53
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 56
    .line 57
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 62
    .line 63
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 64
    .line 65
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks240_:[F

    .line 68
    .line 69
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks240_:[F

    .line 74
    .line 75
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 76
    .line 77
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks106_:[F

    .line 80
    .line 81
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iput-object v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks106_:[F

    .line 86
    .line 87
    iget-object v1, v0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 88
    .line 89
    iget-object v2, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 90
    .line 91
    iget v3, v2, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    .line 92
    .line 93
    iput v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    .line 94
    .line 95
    iget v3, v2, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    .line 96
    .line 97
    iput v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    .line 98
    .line 99
    iget v2, v2, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 100
    .line 101
    iput v2, v1, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 102
    .line 103
    :cond_0
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 104
    .line 105
    invoke-static {p0}, Lcom/core/glcore/util/MMCvInfoHelper;->clone(Lcom/momocv/SingleFaceInfo;)Lcom/momocv/SingleFaceInfo;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iput-object p0, v0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 110
    .line 111
    return-object v0
.end method

.method public b()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public c()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 4
    .line 5
    return-object p0
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
    invoke-virtual {p0}, Ll/nuf;->a()Ll/nuf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 4
    .line 5
    return p0
.end method

.method public e()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public f()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/SingleFaceInfo;->face_rotate_degree_2d_:F

    .line 4
    .line 5
    return p0
.end method

.method public j()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public k()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public l()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public m()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public n()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    .line 4
    .line 5
    return p0
.end method

.method public o()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public p()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public q()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_222_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public r()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public s()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->projection_matrix_opengl_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public t()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    .line 4
    .line 5
    return p0
.end method

.method public u()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public v()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public w()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->skin_threshold_:[I

    .line 4
    .line 5
    return-object p0
.end method

.method public x()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget p0, p0, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 4
    .line 5
    return p0
.end method

.method public y()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->a:Lcom/momocv/SingleFaceInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->translation_vector_:[F

    .line 4
    .line 5
    return-object p0
.end method

.method public z()[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nuf;->b:Lcom/momocv/videoprocessor/FaceAttribute;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 4
    .line 5
    return-object p0
.end method
