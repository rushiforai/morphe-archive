.class public Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;
.super Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;
.source "SourceFile"


# instance fields
.field private eulerAngles:[[F

.field private landmarks:[[F

.field private warpLevel1:F

.field private warpLevel1Array:[F

.field private warpLevel2:F

.field private warpLevel2Array:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public buildParams(Ll/omw;Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 2
    .line 3
    iget v1, p1, Ll/omw;->e:I

    .line 4
    .line 5
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 6
    .line 7
    iget v2, p1, Ll/omw;->f:I

    .line 8
    .line 9
    iput v2, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 10
    .line 11
    iget v3, v0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    cmpl-float v4, v3, v4

    .line 15
    .line 16
    if-lez v4, :cond_0

    .line 17
    .line 18
    int-to-float v1, v1

    .line 19
    mul-float/2addr v1, v3

    .line 20
    float-to-int v1, v1

    .line 21
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 22
    .line 23
    int-to-float v1, v2

    .line 24
    mul-float/2addr v1, v3

    .line 25
    float-to-int v1, v1

    .line 26
    iput v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 27
    .line 28
    :cond_0
    const/4 v1, 0x1

    .line 29
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->is_stable_:Z

    .line 30
    .line 31
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->multifaces_switch_:Z

    .line 32
    .line 33
    iget-boolean v2, p1, Ll/omw;->a:Z

    .line 34
    .line 35
    iput-boolean v2, v0, Lcom/momocv/BaseParams;->fliped_show_:Z

    .line 36
    .line 37
    iget v2, p1, Ll/omw;->c:I

    .line 38
    .line 39
    iput v2, v0, Lcom/momocv/BaseParams;->restore_degree_:I

    .line 40
    .line 41
    iget p1, p1, Ll/omw;->b:I

    .line 42
    .line 43
    iput p1, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 44
    .line 45
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_switch_:Z

    .line 46
    .line 47
    iget p1, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 48
    .line 49
    iput p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_type_:I

    .line 50
    .line 51
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel1Array:[F

    .line 52
    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    new-array p1, v1, [F

    .line 56
    .line 57
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel1Array:[F

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel2Array:[F

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    new-array p1, v1, [F

    .line 64
    .line 65
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel2Array:[F

    .line 66
    .line 67
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->landmarks:[[F

    .line 68
    .line 69
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 70
    .line 71
    const/4 v3, 0x2

    .line 72
    const/4 v4, 0x0

    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 76
    .line 77
    array-length p1, p1

    .line 78
    new-array v5, v3, [I

    .line 79
    .line 80
    aput p1, v5, v1

    .line 81
    .line 82
    aput v1, v5, v4

    .line 83
    .line 84
    invoke-static {v2, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, [[F

    .line 89
    .line 90
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->landmarks:[[F

    .line 91
    .line 92
    :cond_3
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->eulerAngles:[[F

    .line 93
    .line 94
    if-nez p1, :cond_4

    .line 95
    .line 96
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 97
    .line 98
    array-length p1, p1

    .line 99
    new-array v3, v3, [I

    .line 100
    .line 101
    aput p1, v3, v1

    .line 102
    .line 103
    aput v1, v3, v4

    .line 104
    .line 105
    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, [[F

    .line 110
    .line 111
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->eulerAngles:[[F

    .line 112
    .line 113
    :cond_4
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel1Array:[F

    .line 114
    .line 115
    iget v1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel1:F

    .line 116
    .line 117
    aput v1, p1, v4

    .line 118
    .line 119
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel2Array:[F

    .line 120
    .line 121
    iget v2, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel2:F

    .line 122
    .line 123
    aput v2, v1, v4

    .line 124
    .line 125
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->landmarks:[[F

    .line 126
    .line 127
    iget-object v3, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 128
    .line 129
    aput-object v3, v2, v4

    .line 130
    .line 131
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->eulerAngles:[[F

    .line 132
    .line 133
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 134
    .line 135
    aput-object p2, p0, v4

    .line 136
    .line 137
    iput-object p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_level1_:[F

    .line 138
    .line 139
    iput-object v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_level2_:[F

    .line 140
    .line 141
    iput-object v2, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks104_:[[F

    .line 142
    .line 143
    iput-object p0, v0, Lcom/momocv/beauty/BeautyWarpParams;->euler_angle_:[[F

    .line 144
    .line 145
    return-object v0
.end method

.method public changeFaceBeautyValue(Ljava/lang/String;F)V
    .locals 1

    .line 1
    const-string v0, "thin_face"

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel1:F

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v0, "big_eye"

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/MultiFaceWarpFilter;->warpLevel2:F

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public getDefaultWarpType()I
    .locals 0

    const/16 p0, 0x9

    return p0
.end method

.method public notWarp()Z
    .locals 1

    .line 1
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->warpType:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/omw;->n()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method
