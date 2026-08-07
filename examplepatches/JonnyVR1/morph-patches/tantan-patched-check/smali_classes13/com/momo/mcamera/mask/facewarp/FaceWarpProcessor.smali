.class public Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private eulerAngles:[[F

.field private landmarks:[[F

.field private landmarks106:[[F

.field private landmarks222:[[F

.field private landmarks240:[[F

.field private final originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

.field protected warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

.field private warpLevel1:F

.field private warpLevel1Array:[F

.field private warpLevel2:F

.field private warpLevel2Array:[F

.field private warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

.field private final warpParamMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/momocv/beauty/XCameraWarpLevelParams;",
            ">;"
        }
    .end annotation
.end field

.field protected warpParams:Lcom/momocv/beauty/BeautyWarpParams;

.field private warpType:I

.field private xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/beauty/BeautyWarpParams;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/beauty/BeautyWarpParams;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 10
    .line 11
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 17
    .line 18
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 21
    .line 22
    .line 23
    filled-new-array {v0}, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 28
    .line 29
    const/16 v0, 0x9

    .line 30
    .line 31
    iput v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 32
    .line 33
    new-instance v0, Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 39
    .line 40
    new-instance v0, Lcom/momocv/beauty/BeautyWarpInfo;

    .line 41
    .line 42
    invoke-direct {v0}, Lcom/momocv/beauty/BeautyWarpInfo;-><init>()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 46
    .line 47
    const/4 v0, 0x1

    .line 48
    new-array v1, v0, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 49
    .line 50
    iput-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 51
    .line 52
    new-array v1, v0, [F

    .line 53
    .line 54
    iput-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 55
    .line 56
    new-array v0, v0, [F

    .line 57
    .line 58
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 59
    .line 60
    return-void
.end method

.method private buildParams(Ll/omw;[Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

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
    iget v2, p1, Ll/omw;->b:I

    .line 42
    .line 43
    iput v2, v0, Lcom/momocv/BaseParams;->rotate_degree_:I

    .line 44
    .line 45
    iput-boolean v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_switch_:Z

    .line 46
    .line 47
    iget v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 48
    .line 49
    iput v2, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_type_:I

    .line 50
    .line 51
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 52
    .line 53
    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 54
    .line 55
    const/4 v4, 0x2

    .line 56
    const/4 v5, 0x0

    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    array-length v2, v2

    .line 60
    array-length v6, p2

    .line 61
    if-eq v2, v6, :cond_2

    .line 62
    .line 63
    :cond_1
    array-length v2, p2

    .line 64
    aget-object v6, p2, v5

    .line 65
    .line 66
    iget-object v6, v6, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 67
    .line 68
    array-length v6, v6

    .line 69
    new-array v7, v4, [I

    .line 70
    .line 71
    aput v6, v7, v1

    .line 72
    .line 73
    aput v2, v7, v5

    .line 74
    .line 75
    invoke-static {v3, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, [[F

    .line 80
    .line 81
    iput-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 82
    .line 83
    :cond_2
    iget v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 84
    .line 85
    const/16 v6, 0x68

    .line 86
    .line 87
    const/16 v7, 0x67

    .line 88
    .line 89
    if-ne v2, v7, :cond_4

    .line 90
    .line 91
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks240:[[F

    .line 92
    .line 93
    if-eqz v2, :cond_3

    .line 94
    .line 95
    array-length v2, v2

    .line 96
    array-length v8, p2

    .line 97
    if-eq v2, v8, :cond_8

    .line 98
    .line 99
    :cond_3
    array-length v2, p2

    .line 100
    aget-object v8, p2, v5

    .line 101
    .line 102
    iget-object v8, v8, Lcom/momocv/SingleFaceInfo;->orig_landmarks_240_:[F

    .line 103
    .line 104
    array-length v8, v8

    .line 105
    new-array v9, v4, [I

    .line 106
    .line 107
    aput v8, v9, v1

    .line 108
    .line 109
    aput v2, v9, v5

    .line 110
    .line 111
    invoke-static {v3, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, [[F

    .line 116
    .line 117
    iput-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks240:[[F

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    if-ne v2, v6, :cond_8

    .line 121
    .line 122
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks106:[[F

    .line 123
    .line 124
    if-eqz v2, :cond_5

    .line 125
    .line 126
    array-length v2, v2

    .line 127
    array-length v8, p2

    .line 128
    if-eq v2, v8, :cond_6

    .line 129
    .line 130
    :cond_5
    array-length v2, p2

    .line 131
    aget-object v8, p2, v5

    .line 132
    .line 133
    iget-object v8, v8, Lcom/momocv/SingleFaceInfo;->orig_landmarks_106_:[F

    .line 134
    .line 135
    array-length v8, v8

    .line 136
    new-array v9, v4, [I

    .line 137
    .line 138
    aput v8, v9, v1

    .line 139
    .line 140
    aput v2, v9, v5

    .line 141
    .line 142
    invoke-static {v3, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    check-cast v2, [[F

    .line 147
    .line 148
    iput-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks106:[[F

    .line 149
    .line 150
    :cond_6
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks222:[[F

    .line 151
    .line 152
    if-eqz v2, :cond_7

    .line 153
    .line 154
    array-length v2, v2

    .line 155
    array-length v8, p2

    .line 156
    if-eq v2, v8, :cond_8

    .line 157
    .line 158
    :cond_7
    array-length v2, p2

    .line 159
    aget-object v8, p2, v5

    .line 160
    .line 161
    iget-object v8, v8, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 162
    .line 163
    array-length v8, v8

    .line 164
    new-array v9, v4, [I

    .line 165
    .line 166
    aput v8, v9, v1

    .line 167
    .line 168
    aput v2, v9, v5

    .line 169
    .line 170
    invoke-static {v3, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, [[F

    .line 175
    .line 176
    iput-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks222:[[F

    .line 177
    .line 178
    :cond_8
    :goto_0
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->eulerAngles:[[F

    .line 179
    .line 180
    if-eqz v2, :cond_9

    .line 181
    .line 182
    array-length v2, v2

    .line 183
    array-length v8, p2

    .line 184
    if-eq v2, v8, :cond_a

    .line 185
    .line 186
    :cond_9
    array-length v2, p2

    .line 187
    aget-object v8, p2, v5

    .line 188
    .line 189
    iget-object v8, v8, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 190
    .line 191
    array-length v8, v8

    .line 192
    new-array v9, v4, [I

    .line 193
    .line 194
    aput v8, v9, v1

    .line 195
    .line 196
    aput v2, v9, v5

    .line 197
    .line 198
    invoke-static {v3, v9}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    check-cast v1, [[F

    .line 203
    .line 204
    iput-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->eulerAngles:[[F

    .line 205
    .line 206
    :cond_a
    invoke-direct {p0, v0, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->chooseWarpParams(Lcom/momocv/beauty/BeautyWarpParams;[Lcom/momocv/SingleFaceInfo;)V

    .line 207
    .line 208
    .line 209
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 210
    .line 211
    iput-object p2, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks104_:[[F

    .line 212
    .line 213
    iget p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 214
    .line 215
    if-ne p2, v7, :cond_b

    .line 216
    .line 217
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks240:[[F

    .line 218
    .line 219
    iput-object p2, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks240_:[[F

    .line 220
    .line 221
    goto :goto_1

    .line 222
    :cond_b
    if-ne p2, v6, :cond_c

    .line 223
    .line 224
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks106:[[F

    .line 225
    .line 226
    iput-object p2, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks106_:[[F

    .line 227
    .line 228
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks222:[[F

    .line 229
    .line 230
    iput-object p2, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks222_:[[F

    .line 231
    .line 232
    :cond_c
    :goto_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->eulerAngles:[[F

    .line 233
    .line 234
    iput-object p0, v0, Lcom/momocv/beauty/BeautyWarpParams;->euler_angle_:[[F

    .line 235
    .line 236
    invoke-virtual {p1, v0}, Ll/omw;->B(Lcom/momocv/BaseParams;)V

    .line 237
    .line 238
    .line 239
    iget-object p0, v0, Lcom/momocv/BaseParams;->crop_rect:[I

    .line 240
    .line 241
    if-eqz p0, :cond_d

    .line 242
    .line 243
    aget p1, p0, v4

    .line 244
    .line 245
    iput p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_width_:I

    .line 246
    .line 247
    const/4 p1, 0x3

    .line 248
    aget p0, p0, p1

    .line 249
    .line 250
    iput p0, v0, Lcom/momocv/beauty/BeautyWarpParams;->image_height_:I

    .line 251
    .line 252
    :cond_d
    return-object v0
.end method

.method private changeBeautyValue(Ljava/lang/String;F)V
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
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1:F

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
    iput p2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2:F

    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method private changeCameraXValue(Ljava/lang/String;F)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "mouth_size"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0x12

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "nose_width"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :cond_1
    const/16 v1, 0x11

    .line 39
    .line 40
    goto/16 :goto_0

    .line 41
    .line 42
    :sswitch_2
    const-string v0, "lip_thickness"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-nez p1, :cond_2

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_2
    const/16 v1, 0x10

    .line 53
    .line 54
    goto/16 :goto_0

    .line 55
    .line 56
    :sswitch_3
    const-string v0, "face_width"

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :cond_3
    const/16 v1, 0xf

    .line 67
    .line 68
    goto/16 :goto_0

    .line 69
    .line 70
    :sswitch_4
    const-string v0, "nose_size"

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :cond_4
    const/16 v1, 0xe

    .line 81
    .line 82
    goto/16 :goto_0

    .line 83
    .line 84
    :sswitch_5
    const-string v0, "nose_lift"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    goto/16 :goto_0

    .line 93
    .line 94
    :cond_5
    const/16 v1, 0xd

    .line 95
    .line 96
    goto/16 :goto_0

    .line 97
    .line 98
    :sswitch_6
    const-string v0, "forehead"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    goto/16 :goto_0

    .line 107
    .line 108
    :cond_6
    const/16 v1, 0xc

    .line 109
    .line 110
    goto/16 :goto_0

    .line 111
    .line 112
    :sswitch_7
    const-string v0, "nose_ridge_width"

    .line 113
    .line 114
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-nez p1, :cond_7

    .line 119
    .line 120
    goto/16 :goto_0

    .line 121
    .line 122
    :cond_7
    const/16 v1, 0xb

    .line 123
    .line 124
    goto/16 :goto_0

    .line 125
    .line 126
    :sswitch_8
    const-string v0, "jaw_width"

    .line 127
    .line 128
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_8

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :cond_8
    const/16 v1, 0xa

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_9
    const-string v0, "jaw_shape"

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    if-nez p1, :cond_9

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_9
    const/16 v1, 0x9

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_a
    const-string v0, "big_eye"

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-nez p1, :cond_a

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_a
    const/16 v1, 0x8

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_b
    const-string v0, "eye_distance"

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_b

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_b
    const/4 v1, 0x7

    .line 178
    goto :goto_0

    .line 179
    :sswitch_c
    const-string v0, "cheekbone_width"

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_c

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_c
    const/4 v1, 0x6

    .line 189
    goto :goto_0

    .line 190
    :sswitch_d
    const-string v0, "thin_face"

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-nez p1, :cond_d

    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_d
    const/4 v1, 0x5

    .line 200
    goto :goto_0

    .line 201
    :sswitch_e
    const-string v0, "eye_height"

    .line 202
    .line 203
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_e

    .line 208
    .line 209
    goto :goto_0

    .line 210
    :cond_e
    const/4 v1, 0x4

    .line 211
    goto :goto_0

    .line 212
    :sswitch_f
    const-string v0, "eye_tilt"

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-nez p1, :cond_f

    .line 219
    .line 220
    goto :goto_0

    .line 221
    :cond_f
    const/4 v1, 0x3

    .line 222
    goto :goto_0

    .line 223
    :sswitch_10
    const-string v0, "chin_length"

    .line 224
    .line 225
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-nez p1, :cond_10

    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_10
    const/4 v1, 0x2

    .line 233
    goto :goto_0

    .line 234
    :sswitch_11
    const-string v0, "nose_tip_size"

    .line 235
    .line 236
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    if-nez p1, :cond_11

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_11
    const/4 v1, 0x1

    .line 244
    goto :goto_0

    .line 245
    :sswitch_12
    const-string v0, "shorten_face"

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-nez p1, :cond_12

    .line 252
    .line 253
    goto :goto_0

    .line 254
    :cond_12
    const/4 v1, 0x0

    .line 255
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 256
    .line 257
    .line 258
    return-void

    .line 259
    :pswitch_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 260
    .line 261
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_size_:F

    .line 262
    .line 263
    return-void

    .line 264
    :pswitch_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 265
    .line 266
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_width_:F

    .line 267
    .line 268
    return-void

    .line 269
    :pswitch_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 270
    .line 271
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_thickness_:F

    .line 272
    .line 273
    return-void

    .line 274
    :pswitch_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 275
    .line 276
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->face_width_:F

    .line 277
    .line 278
    return-void

    .line 279
    :pswitch_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 280
    .line 281
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_size_:F

    .line 282
    .line 283
    return-void

    .line 284
    :pswitch_5
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 285
    .line 286
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_lift_:F

    .line 287
    .line 288
    return-void

    .line 289
    :pswitch_6
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 290
    .line 291
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->forehead_ud_:F

    .line 292
    .line 293
    return-void

    .line 294
    :pswitch_7
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 295
    .line 296
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_ridge_width_:F

    .line 297
    .line 298
    return-void

    .line 299
    :pswitch_8
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 300
    .line 301
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->jaw_width_:F

    .line 302
    .line 303
    return-void

    .line 304
    :pswitch_9
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 305
    .line 306
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_width_:F

    .line 307
    .line 308
    return-void

    .line 309
    :pswitch_a
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 310
    .line 311
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_size_:F

    .line 312
    .line 313
    return-void

    .line 314
    :pswitch_b
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 315
    .line 316
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_distance_:F

    .line 317
    .line 318
    return-void

    .line 319
    :pswitch_c
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 320
    .line 321
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->cheekbone_width_:F

    .line 322
    .line 323
    return-void

    .line 324
    :pswitch_d
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 325
    .line 326
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->mm_thin_face_:F

    .line 327
    .line 328
    return-void

    .line 329
    :pswitch_e
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 330
    .line 331
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_height_:F

    .line 332
    .line 333
    return-void

    .line 334
    :pswitch_f
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 335
    .line 336
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_tilt_ratio_:F

    .line 337
    .line 338
    return-void

    .line 339
    :pswitch_10
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 340
    .line 341
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_length_:F

    .line 342
    .line 343
    return-void

    .line 344
    :pswitch_11
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 345
    .line 346
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_tip_size_:F

    .line 347
    .line 348
    return-void

    .line 349
    :pswitch_12
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 350
    .line 351
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->short_face_:F

    .line 352
    .line 353
    return-void

    .line 354
    nop

    .line 355
    :sswitch_data_0
    .sparse-switch
        -0x69fb43c9 -> :sswitch_12
        -0x5b8b5fef -> :sswitch_11
        -0x5b67e385 -> :sswitch_10
        -0x518cc7f5 -> :sswitch_f
        -0x362ea50b -> :sswitch_e
        -0x29f587bd -> :sswitch_d
        -0x2772d1af -> :sswitch_c
        -0x1f40e5bd -> :sswitch_b
        -0x6d8498e -> :sswitch_a
        0x4f34c2 -> :sswitch_9
        0x8812e7 -> :sswitch_8
        0xc0b44c6 -> :sswitch_7
        0x1bd41c9c -> :sswitch_6
        0x353da3f7 -> :sswitch_5
        0x3540d4ed -> :sswitch_4
        0x36f56d64 -> :sswitch_3
        0x5664b8c8 -> :sswitch_2
        0x7311d65a -> :sswitch_1
        0x76164079 -> :sswitch_0
    .end sparse-switch

    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private chooseWarpParams(Lcom/momocv/beauty/BeautyWarpParams;[Lcom/momocv/SingleFaceInfo;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    :try_start_0
    array-length v1, p2

    .line 3
    if-ge v0, v1, :cond_3

    .line 4
    .line 5
    iget v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 6
    .line 7
    const/16 v2, 0xa

    .line 8
    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 14
    .line 15
    aput-object v2, v1, v0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 18
    .line 19
    aget-object v2, p2, v0

    .line 20
    .line 21
    iget-object v2, v2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 22
    .line 23
    invoke-direct {p0, v2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->transformLandMark104Points([F)[F

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    aput-object v2, v1, v0

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 30
    .line 31
    iput-object v1, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 32
    .line 33
    goto/16 :goto_1

    .line 34
    .line 35
    :cond_0
    const/16 v2, 0x67

    .line 36
    .line 37
    if-ne v1, v2, :cond_1

    .line 38
    .line 39
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 42
    .line 43
    aput-object v2, v1, v0

    .line 44
    .line 45
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 46
    .line 47
    aget-object v3, p2, v0

    .line 48
    .line 49
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 50
    .line 51
    aput-object v3, v2, v0

    .line 52
    .line 53
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks240:[[F

    .line 54
    .line 55
    aget-object v3, p2, v0

    .line 56
    .line 57
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->landmarks_240_:[F

    .line 58
    .line 59
    aput-object v3, v2, v0

    .line 60
    .line 61
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 62
    .line 63
    iget v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1:F

    .line 64
    .line 65
    aput v3, v2, v0

    .line 66
    .line 67
    iget-object v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 68
    .line 69
    iget v4, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2:F

    .line 70
    .line 71
    aput v4, v3, v0

    .line 72
    .line 73
    iput-object v2, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level1_:[F

    .line 74
    .line 75
    iput-object v3, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level2_:[F

    .line 76
    .line 77
    iput-object v1, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_1
    const/16 v2, 0x68

    .line 81
    .line 82
    if-ne v1, v2, :cond_2

    .line 83
    .line 84
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 85
    .line 86
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 87
    .line 88
    aput-object v2, v1, v0

    .line 89
    .line 90
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 91
    .line 92
    aget-object v3, p2, v0

    .line 93
    .line 94
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 95
    .line 96
    aput-object v3, v2, v0

    .line 97
    .line 98
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks106:[[F

    .line 99
    .line 100
    aget-object v3, p2, v0

    .line 101
    .line 102
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->landmarks_106_:[F

    .line 103
    .line 104
    aput-object v3, v2, v0

    .line 105
    .line 106
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks222:[[F

    .line 107
    .line 108
    aget-object v3, p2, v0

    .line 109
    .line 110
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 111
    .line 112
    aput-object v3, v2, v0

    .line 113
    .line 114
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 115
    .line 116
    iget v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1:F

    .line 117
    .line 118
    aput v3, v2, v0

    .line 119
    .line 120
    iget-object v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 121
    .line 122
    iget v4, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2:F

    .line 123
    .line 124
    aput v4, v3, v0

    .line 125
    .line 126
    iput-object v2, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level1_:[F

    .line 127
    .line 128
    iput-object v3, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level2_:[F

    .line 129
    .line 130
    iput-object v1, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_2
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->landmarks:[[F

    .line 134
    .line 135
    aget-object v2, p2, v0

    .line 136
    .line 137
    iget-object v2, v2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 138
    .line 139
    aput-object v2, v1, v0

    .line 140
    .line 141
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 142
    .line 143
    iget v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1:F

    .line 144
    .line 145
    aput v2, v1, v0

    .line 146
    .line 147
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 148
    .line 149
    iget v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2:F

    .line 150
    .line 151
    aput v3, v2, v0

    .line 152
    .line 153
    iput-object v1, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level1_:[F

    .line 154
    .line 155
    iput-object v2, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level2_:[F

    .line 156
    .line 157
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->originWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 158
    .line 159
    iput-object v1, p1, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 160
    .line 161
    :goto_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->eulerAngles:[[F

    .line 162
    .line 163
    aget-object v2, p2, v0

    .line 164
    .line 165
    iget-object v2, v2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 166
    .line 167
    aput-object v2, v1, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    .line 169
    add-int/lit8 v0, v0, 0x1

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_3
    return-void

    .line 174
    :catch_0
    move-exception p0

    .line 175
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method private getParamsInCache(I)Lcom/momocv/beauty/XCameraWarpLevelParams;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 20
    .line 21
    invoke-direct {v2}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 38
    .line 39
    return-object p0
.end method

.method private declared-synchronized processSingleWarpPoint(Ll/omw;[Lcom/momocv/SingleFaceInfo;[Lcom/momocv/videoprocessor/FaceAttribute;)V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->buildParams(Ll/omw;[Lcom/momocv/SingleFaceInfo;)Lcom/momocv/beauty/BeautyWarpParams;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 7
    .line 8
    const/16 v2, 0x67

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    const/4 v4, 0x0

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    const/16 v2, 0x68

    .line 15
    .line 16
    if-ne v1, v2, :cond_1

    .line 17
    .line 18
    :cond_0
    iput-boolean v4, v0, Lcom/momocv/beauty/BeautyWarpParams;->face_warp_gradual_switch_:Z

    .line 19
    .line 20
    iget-object v1, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    array-length v2, v1

    .line 25
    move v5, v4

    .line 26
    :goto_0
    if-ge v5, v2, :cond_1

    .line 27
    .line 28
    aget-object v6, v1, v5

    .line 29
    .line 30
    iput-boolean v3, v6, Lcom/momocv/beauty/XCameraWarpLevelParams;->thinface_euler_switch_:Z

    .line 31
    .line 32
    add-int/lit8 v5, v5, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 38
    .line 39
    const/4 v2, 0x0

    .line 40
    iput-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->src_warp_points_:[F

    .line 41
    .line 42
    iput-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->dst_warp_points_:[F

    .line 43
    .line 44
    invoke-static {}, Ll/tuf;->a()Ll/tuf;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 49
    .line 50
    invoke-virtual {v1, v0, v2}, Ll/tuf;->b(Lcom/momocv/beauty/BeautyWarpParams;Lcom/momocv/beauty/BeautyWarpInfo;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 57
    .line 58
    iget-object v1, v0, Lcom/momocv/beauty/BeautyWarpInfo;->all_src_warp_points_:[[F

    .line 59
    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    iget-object v2, v0, Lcom/momocv/beauty/BeautyWarpInfo;->all_dst_warp_points_:[[F

    .line 63
    .line 64
    if-nez v2, :cond_2

    .line 65
    .line 66
    iget-object v2, v0, Lcom/momocv/beauty/BeautyWarpInfo;->src_warp_points_:[F

    .line 67
    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    iget-object v5, v0, Lcom/momocv/beauty/BeautyWarpInfo;->dst_warp_points_:[F

    .line 71
    .line 72
    if-eqz v5, :cond_2

    .line 73
    .line 74
    array-length v0, v2

    .line 75
    const/4 v1, 0x2

    .line 76
    new-array v6, v1, [I

    .line 77
    .line 78
    aput v0, v6, v3

    .line 79
    .line 80
    aput v3, v6, v4

    .line 81
    .line 82
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 83
    .line 84
    invoke-static {v0, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    check-cast v6, [[F

    .line 89
    .line 90
    iput-object v6, p1, Ll/omw;->q:[[F

    .line 91
    .line 92
    array-length v6, v5

    .line 93
    new-array v1, v1, [I

    .line 94
    .line 95
    aput v6, v1, v3

    .line 96
    .line 97
    aput v3, v1, v4

    .line 98
    .line 99
    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, [[F

    .line 104
    .line 105
    iput-object v0, p1, Ll/omw;->r:[[F

    .line 106
    .line 107
    iget-object v1, p1, Ll/omw;->q:[[F

    .line 108
    .line 109
    aput-object v2, v1, v4

    .line 110
    .line 111
    aput-object v5, v0, v4

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    iput-object v1, p1, Ll/omw;->q:[[F

    .line 115
    .line 116
    iget-object v0, v0, Lcom/momocv/beauty/BeautyWarpInfo;->all_dst_warp_points_:[[F

    .line 117
    .line 118
    iput-object v0, p1, Ll/omw;->r:[[F

    .line 119
    .line 120
    :goto_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 121
    .line 122
    iget-object v0, v0, Lcom/momocv/beauty/BeautyWarpInfo;->liquefy_info:[[Lcom/momocv/LiquefyInfo;

    .line 123
    .line 124
    iput-object v0, p1, Ll/omw;->x:[[Lcom/momocv/LiquefyInfo;

    .line 125
    .line 126
    invoke-direct {p0, p2, p3}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->setLandmarks([Lcom/momocv/SingleFaceInfo;[Lcom/momocv/videoprocessor/FaceAttribute;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    .line 128
    .line 129
    :cond_3
    monitor-exit p0

    .line 130
    return-void

    .line 131
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 132
    throw p1
.end method

.method private setLandmarks([Lcom/momocv/SingleFaceInfo;[Lcom/momocv/videoprocessor/FaceAttribute;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p2

    .line 3
    if-ge v0, v1, :cond_5

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpInfo:Lcom/momocv/beauty/BeautyWarpInfo;

    .line 6
    .line 7
    iget-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks68_:[[F

    .line 8
    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    aget-object v3, p1, v0

    .line 12
    .line 13
    aget-object v2, v2, v0

    .line 14
    .line 15
    iput-object v2, v3, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 16
    .line 17
    aget-object v3, p2, v0

    .line 18
    .line 19
    iput-object v2, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 20
    .line 21
    :cond_0
    iget-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks96_:[[F

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    aget-object v3, p1, v0

    .line 26
    .line 27
    aget-object v2, v2, v0

    .line 28
    .line 29
    iput-object v2, v3, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 30
    .line 31
    aget-object v3, p2, v0

    .line 32
    .line 33
    iput-object v2, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 34
    .line 35
    :cond_1
    iget-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks104_:[[F

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    aget-object v3, p1, v0

    .line 40
    .line 41
    aget-object v2, v2, v0

    .line 42
    .line 43
    iput-object v2, v3, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 44
    .line 45
    aget-object v3, p2, v0

    .line 46
    .line 47
    iput-object v2, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 48
    .line 49
    :cond_2
    iget-object v2, v1, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks240_:[[F

    .line 50
    .line 51
    if-eqz v2, :cond_3

    .line 52
    .line 53
    aget-object v3, p1, v0

    .line 54
    .line 55
    aget-object v2, v2, v0

    .line 56
    .line 57
    iput-object v2, v3, Lcom/momocv/SingleFaceInfo;->landmarks_240_:[F

    .line 58
    .line 59
    aget-object v3, p2, v0

    .line 60
    .line 61
    iput-object v2, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks240_:[F

    .line 62
    .line 63
    :cond_3
    iget-object v1, v1, Lcom/momocv/beauty/BeautyWarpInfo;->warped_landmarks106_:[[F

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    aget-object v2, p1, v0

    .line 68
    .line 69
    aget-object v1, v1, v0

    .line 70
    .line 71
    iput-object v1, v2, Lcom/momocv/SingleFaceInfo;->landmarks_106_:[F

    .line 72
    .line 73
    aget-object v2, p2, v0

    .line 74
    .line 75
    iput-object v1, v2, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks106_:[F

    .line 76
    .line 77
    :cond_4
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    return-void
.end method

.method private transformLandMark104Points([F)[F
    .locals 9

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length p0, p1

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    goto :goto_3

    .line 7
    :cond_0
    new-instance p0, Landroid/graphics/PointF;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    aget v1, p1, v0

    .line 11
    .line 12
    const/16 v2, 0x68

    .line 13
    .line 14
    aget v2, p1, v2

    .line 15
    .line 16
    invoke-direct {p0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 17
    .line 18
    .line 19
    new-instance v1, Landroid/graphics/PointF;

    .line 20
    .line 21
    const/16 v2, 0x12

    .line 22
    .line 23
    aget v3, p1, v2

    .line 24
    .line 25
    const/16 v4, 0x7a

    .line 26
    .line 27
    aget v4, p1, v4

    .line 28
    .line 29
    invoke-direct {v1, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 30
    .line 31
    .line 32
    new-instance v3, Landroid/graphics/PointF;

    .line 33
    .line 34
    iget v4, p0, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    iget v5, v1, Landroid/graphics/PointF;->x:F

    .line 37
    .line 38
    add-float/2addr v4, v5

    .line 39
    const/high16 v5, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr v4, v5

    .line 42
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 45
    .line 46
    add-float/2addr p0, v1

    .line 47
    div-float/2addr p0, v5

    .line 48
    invoke-direct {v3, v4, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 49
    .line 50
    .line 51
    :goto_0
    if-ge v0, v2, :cond_3

    .line 52
    .line 53
    new-instance p0, Landroid/graphics/PointF;

    .line 54
    .line 55
    aget v1, p1, v0

    .line 56
    .line 57
    add-int/lit8 v4, v0, 0x68

    .line 58
    .line 59
    aget v5, p1, v4

    .line 60
    .line 61
    invoke-direct {p0, v1, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 62
    .line 63
    .line 64
    const/high16 v1, 0x41000000    # 8.0f

    .line 65
    .line 66
    const v5, 0x3df5c28f    # 0.12f

    .line 67
    .line 68
    .line 69
    const/16 v6, 0x9

    .line 70
    .line 71
    const/high16 v7, 0x3f800000    # 1.0f

    .line 72
    .line 73
    if-ge v0, v6, :cond_1

    .line 74
    .line 75
    int-to-float v6, v0

    .line 76
    :goto_1
    div-float/2addr v6, v1

    .line 77
    sub-float v1, v7, v6

    .line 78
    .line 79
    mul-float/2addr v1, v5

    .line 80
    add-float/2addr v1, v7

    .line 81
    goto :goto_2

    .line 82
    :cond_1
    if-le v0, v6, :cond_2

    .line 83
    .line 84
    const/high16 v6, 0x41900000    # 18.0f

    .line 85
    .line 86
    int-to-float v8, v0

    .line 87
    sub-float/2addr v6, v8

    .line 88
    goto :goto_1

    .line 89
    :cond_2
    move v1, v7

    .line 90
    :goto_2
    sub-float/2addr v7, v1

    .line 91
    iget v5, v3, Landroid/graphics/PointF;->x:F

    .line 92
    .line 93
    mul-float/2addr v5, v7

    .line 94
    iget v6, p0, Landroid/graphics/PointF;->x:F

    .line 95
    .line 96
    mul-float/2addr v6, v1

    .line 97
    add-float/2addr v5, v6

    .line 98
    aput v5, p1, v0

    .line 99
    .line 100
    iget v5, v3, Landroid/graphics/PointF;->y:F

    .line 101
    .line 102
    mul-float/2addr v7, v5

    .line 103
    iget p0, p0, Landroid/graphics/PointF;->y:F

    .line 104
    .line 105
    mul-float/2addr v1, p0

    .line 106
    add-float/2addr v7, v1

    .line 107
    aput v7, p1, v4

    .line 108
    .line 109
    add-int/lit8 v0, v0, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    :goto_3
    return-object p1
.end method


# virtual methods
.method public declared-synchronized clearFaceWarpMapParams()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 3
    .line 4
    iget-object v0, v0, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 17
    throw v0
.end method

.method public loadWrapConfig(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/tuf;->a()Ll/tuf;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/tuf;->c(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public process(Ll/omw;)V
    .locals 5

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_2

    .line 20
    .line 21
    :cond_1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    new-array v0, v0, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    new-array v0, v0, [F

    .line 34
    .line 35
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    new-array v0, v0, [F

    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 44
    .line 45
    :cond_2
    invoke-virtual {p1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v1, v1, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 56
    .line 57
    iget v2, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 58
    .line 59
    const/16 v3, 0xa

    .line 60
    .line 61
    if-ne v2, v3, :cond_3

    .line 62
    .line 63
    const/4 v0, 0x1

    .line 64
    new-array v1, v0, [Lcom/momocv/SingleFaceInfo;

    .line 65
    .line 66
    invoke-virtual {p1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object v2, v2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 71
    .line 72
    const/4 v3, 0x0

    .line 73
    aget-object v2, v2, v3

    .line 74
    .line 75
    aput-object v2, v1, v3

    .line 76
    .line 77
    new-array v2, v0, [Lcom/momocv/videoprocessor/FaceAttribute;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    iget-object v4, v4, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 84
    .line 85
    aget-object v4, v4, v3

    .line 86
    .line 87
    aput-object v4, v2, v3

    .line 88
    .line 89
    new-array v3, v0, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 90
    .line 91
    iput-object v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 92
    .line 93
    new-array v3, v0, [F

    .line 94
    .line 95
    iput-object v3, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel1Array:[F

    .line 96
    .line 97
    new-array v0, v0, [F

    .line 98
    .line 99
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevel2Array:[F

    .line 100
    .line 101
    move-object v0, v1

    .line 102
    move-object v1, v2

    .line 103
    :cond_3
    invoke-direct {p0, p1, v0, v1}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->processSingleWarpPoint(Ll/omw;[Lcom/momocv/SingleFaceInfo;[Lcom/momocv/videoprocessor/FaceAttribute;)V

    .line 104
    .line 105
    .line 106
    :cond_4
    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    invoke-static {}, Ll/tuf;->a()Ll/tuf;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/tuf;->d()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/HashMap;->clear()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setFaceBeautyValue(Ljava/lang/String;F)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 9
    .line 10
    const/16 v1, 0xa

    .line 11
    .line 12
    if-eq v0, v1, :cond_2

    .line 13
    .line 14
    const/16 v1, 0x67

    .line 15
    .line 16
    if-eq v0, v1, :cond_2

    .line 17
    .line 18
    const/16 v1, 0x68

    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->changeBeautyValue(Ljava/lang/String;F)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_2
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->changeCameraXValue(Ljava/lang/String;F)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public declared-synchronized setMapParams(Ljava/lang/String;F)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 3
    .line 4
    iget-object v1, v0, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, v0, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/momocv/beauty/XCameraWarpLevelParams;->params:Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p1
.end method

.method public setScaleFactor(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParams:Lcom/momocv/beauty/BeautyWarpParams;

    .line 2
    .line 3
    iput p1, p0, Lcom/momocv/BaseParams;->scale_factor_:F

    .line 4
    .line 5
    return-void
.end method

.method public setWarpType(I)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpType:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/FaceWarpProcessor;->warpParamMap:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 22
    .line 23
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
