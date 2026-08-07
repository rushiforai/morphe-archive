.class public Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;
.super Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;
.source "SourceFile"


# instance fields
.field private eulerAngles:[[F

.field private landmarks:[[F

.field private warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

.field private xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 10
    .line 11
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
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 52
    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    new-array p1, v1, [Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->landmarks:[[F

    .line 60
    .line 61
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 62
    .line 63
    const/4 v3, 0x2

    .line 64
    const/4 v4, 0x0

    .line 65
    if-nez p1, :cond_2

    .line 66
    .line 67
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 68
    .line 69
    array-length p1, p1

    .line 70
    new-array v5, v3, [I

    .line 71
    .line 72
    aput p1, v5, v1

    .line 73
    .line 74
    aput v1, v5, v4

    .line 75
    .line 76
    invoke-static {v2, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, [[F

    .line 81
    .line 82
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->landmarks:[[F

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->eulerAngles:[[F

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    iget-object p1, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 89
    .line 90
    array-length p1, p1

    .line 91
    new-array v3, v3, [I

    .line 92
    .line 93
    aput p1, v3, v1

    .line 94
    .line 95
    aput v1, v3, v4

    .line 96
    .line 97
    invoke-static {v2, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, [[F

    .line 102
    .line 103
    iput-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->eulerAngles:[[F

    .line 104
    .line 105
    :cond_3
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 106
    .line 107
    iget-object v1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 108
    .line 109
    aput-object v1, p1, v4

    .line 110
    .line 111
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->landmarks:[[F

    .line 112
    .line 113
    aget-object p1, p1, v4

    .line 114
    .line 115
    iget-object v1, p2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 116
    .line 117
    invoke-static {p1, v1}, Lcom/momo/mcamera/util/ImageProcessUtil;->transformLandMark104Points([F[F)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->eulerAngles:[[F

    .line 121
    .line 122
    iget-object p2, p2, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 123
    .line 124
    aput-object p2, p1, v4

    .line 125
    .line 126
    iget-object p2, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->xCameraWarpParams:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 127
    .line 128
    iput-object p2, v0, Lcom/momocv/beauty/BeautyWarpParams;->warp_level_group_:[Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->landmarks:[[F

    .line 131
    .line 132
    iput-object p0, v0, Lcom/momocv/beauty/BeautyWarpParams;->landmarks104_:[[F

    .line 133
    .line 134
    iput-object p1, v0, Lcom/momocv/beauty/BeautyWarpParams;->euler_angle_:[[F

    .line 135
    .line 136
    return-object v0
.end method

.method public changeFaceBeautyValue(Ljava/lang/String;F)V
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
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, -0x1

    .line 17
    sparse-switch v0, :sswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :sswitch_0
    const-string v0, "mouth_size"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_1
    const/16 v1, 0xf

    .line 33
    .line 34
    goto/16 :goto_0

    .line 35
    .line 36
    :sswitch_1
    const-string v0, "nose_width"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    goto/16 :goto_0

    .line 45
    .line 46
    :cond_2
    const/16 v1, 0xe

    .line 47
    .line 48
    goto/16 :goto_0

    .line 49
    .line 50
    :sswitch_2
    const-string v0, "lip_thickness"

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-nez p1, :cond_3

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_3
    const/16 v1, 0xd

    .line 61
    .line 62
    goto/16 :goto_0

    .line 63
    .line 64
    :sswitch_3
    const-string v0, "face_width"

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_4

    .line 71
    .line 72
    goto/16 :goto_0

    .line 73
    .line 74
    :cond_4
    const/16 v1, 0xc

    .line 75
    .line 76
    goto/16 :goto_0

    .line 77
    .line 78
    :sswitch_4
    const-string v0, "nose_size"

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-nez p1, :cond_5

    .line 85
    .line 86
    goto/16 :goto_0

    .line 87
    .line 88
    :cond_5
    const/16 v1, 0xb

    .line 89
    .line 90
    goto/16 :goto_0

    .line 91
    .line 92
    :sswitch_5
    const-string v0, "nose_lift"

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_6

    .line 99
    .line 100
    goto/16 :goto_0

    .line 101
    .line 102
    :cond_6
    const/16 v1, 0xa

    .line 103
    .line 104
    goto/16 :goto_0

    .line 105
    .line 106
    :sswitch_6
    const-string v0, "forehead"

    .line 107
    .line 108
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_7

    .line 113
    .line 114
    goto/16 :goto_0

    .line 115
    .line 116
    :cond_7
    const/16 v1, 0x9

    .line 117
    .line 118
    goto/16 :goto_0

    .line 119
    .line 120
    :sswitch_7
    const-string v0, "nose_ridge_width"

    .line 121
    .line 122
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_8

    .line 127
    .line 128
    goto/16 :goto_0

    .line 129
    .line 130
    :cond_8
    const/16 v1, 0x8

    .line 131
    .line 132
    goto/16 :goto_0

    .line 133
    .line 134
    :sswitch_8
    const-string v0, "jaw_shape"

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-nez p1, :cond_9

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_9
    const/4 v1, 0x7

    .line 144
    goto :goto_0

    .line 145
    :sswitch_9
    const-string v0, "big_eye"

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    if-nez p1, :cond_a

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_a
    const/4 v1, 0x6

    .line 155
    goto :goto_0

    .line 156
    :sswitch_a
    const-string v0, "eye_distance"

    .line 157
    .line 158
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-nez p1, :cond_b

    .line 163
    .line 164
    goto :goto_0

    .line 165
    :cond_b
    const/4 v1, 0x5

    .line 166
    goto :goto_0

    .line 167
    :sswitch_b
    const-string v0, "thin_face"

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-nez p1, :cond_c

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_c
    const/4 v1, 0x4

    .line 177
    goto :goto_0

    .line 178
    :sswitch_c
    const-string v0, "eye_tilt"

    .line 179
    .line 180
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    if-nez p1, :cond_d

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_d
    const/4 v1, 0x3

    .line 188
    goto :goto_0

    .line 189
    :sswitch_d
    const-string v0, "chin_length"

    .line 190
    .line 191
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_e

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_e
    const/4 v1, 0x2

    .line 199
    goto :goto_0

    .line 200
    :sswitch_e
    const-string v0, "nose_tip_size"

    .line 201
    .line 202
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    if-nez p1, :cond_f

    .line 207
    .line 208
    goto :goto_0

    .line 209
    :cond_f
    const/4 v1, 0x1

    .line 210
    goto :goto_0

    .line 211
    :sswitch_f
    const-string v0, "shorten_face"

    .line 212
    .line 213
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-nez p1, :cond_10

    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_10
    const/4 v1, 0x0

    .line 221
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 222
    .line 223
    .line 224
    :goto_1
    return-void

    .line 225
    :pswitch_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 226
    .line 227
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_size_:F

    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 231
    .line 232
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_width_:F

    .line 233
    .line 234
    return-void

    .line 235
    :pswitch_2
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 236
    .line 237
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->lip_thickness_:F

    .line 238
    .line 239
    return-void

    .line 240
    :pswitch_3
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 241
    .line 242
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->face_width_:F

    .line 243
    .line 244
    return-void

    .line 245
    :pswitch_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 246
    .line 247
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_size_:F

    .line 248
    .line 249
    return-void

    .line 250
    :pswitch_5
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 251
    .line 252
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_lift_:F

    .line 253
    .line 254
    return-void

    .line 255
    :pswitch_6
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 256
    .line 257
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->forehead_ud_:F

    .line 258
    .line 259
    return-void

    .line 260
    :pswitch_7
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 261
    .line 262
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_ridge_width_:F

    .line 263
    .line 264
    return-void

    .line 265
    :pswitch_8
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 266
    .line 267
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_width_:F

    .line 268
    .line 269
    return-void

    .line 270
    :pswitch_9
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 271
    .line 272
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_size_:F

    .line 273
    .line 274
    return-void

    .line 275
    :pswitch_a
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 276
    .line 277
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_distance_:F

    .line 278
    .line 279
    return-void

    .line 280
    :pswitch_b
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 281
    .line 282
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->mm_thin_face_:F

    .line 283
    .line 284
    return-void

    .line 285
    :pswitch_c
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 286
    .line 287
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->eye_tilt_ratio_:F

    .line 288
    .line 289
    return-void

    .line 290
    :pswitch_d
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 291
    .line 292
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->chin_length_:F

    .line 293
    .line 294
    return-void

    .line 295
    :pswitch_e
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 296
    .line 297
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->nose_tip_size_:F

    .line 298
    .line 299
    return-void

    .line 300
    :pswitch_f
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/CXFaceWarpFilter;->warpLevelParams:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 301
    .line 302
    iput p2, p0, Lcom/momocv/beauty/XCameraWarpLevelParams;->short_face_:F

    .line 303
    .line 304
    return-void

    .line 305
    :sswitch_data_0
    .sparse-switch
        -0x69fb43c9 -> :sswitch_f
        -0x5b8b5fef -> :sswitch_e
        -0x5b67e385 -> :sswitch_d
        -0x518cc7f5 -> :sswitch_c
        -0x29f587bd -> :sswitch_b
        -0x1f40e5bd -> :sswitch_a
        -0x6d8498e -> :sswitch_9
        0x4f34c2 -> :sswitch_8
        0xc0b44c6 -> :sswitch_7
        0x1bd41c9c -> :sswitch_6
        0x353da3f7 -> :sswitch_5
        0x3540d4ed -> :sswitch_4
        0x36f56d64 -> :sswitch_3
        0x5664b8c8 -> :sswitch_2
        0x7311d65a -> :sswitch_1
        0x76164079 -> :sswitch_0
    .end sparse-switch

    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
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
    :pswitch_data_0
    .packed-switch 0x0
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

.method public getDefaultWarpType()I
    .locals 0

    const/16 p0, 0xa

    return p0
.end method

.method public notWarp()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;->mmcvInfo:Ll/omw;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/omw;->n()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method
