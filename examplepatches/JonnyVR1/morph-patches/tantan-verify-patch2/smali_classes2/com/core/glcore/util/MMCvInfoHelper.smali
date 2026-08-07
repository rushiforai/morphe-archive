.class public Lcom/core/glcore/util/MMCvInfoHelper;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static clone(Lcom/momocv/SingleFaceInfo;)Lcom/momocv/SingleFaceInfo;
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lcom/momocv/SingleFaceInfo;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momocv/SingleFaceInfo;-><init>()V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 11
    .line 12
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->tracking_id_:I

    .line 13
    .line 14
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->face_prob_:F

    .line 15
    .line 16
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->face_prob_:F

    .line 17
    .line 18
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->quality_:I

    .line 19
    .line 20
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->quality_:I

    .line 21
    .line 22
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->orig_face_rotate_degree_2d_:F

    .line 23
    .line 24
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->orig_face_rotate_degree_2d_:F

    .line 25
    .line 26
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->face_rotate_degree_2d_:F

    .line 27
    .line 28
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->face_rotate_degree_2d_:F

    .line 29
    .line 30
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->features_quality_:I

    .line 31
    .line 32
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->features_quality_:I

    .line 33
    .line 34
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->facepose_type_:I

    .line 35
    .line 36
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->facepose_type_:I

    .line 37
    .line 38
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->occflag_:I

    .line 39
    .line 40
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->occflag_:I

    .line 41
    .line 42
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->occtype_:I

    .line 43
    .line 44
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->occtype_:I

    .line 45
    .line 46
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->liveness_:I

    .line 47
    .line 48
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->liveness_:I

    .line 49
    .line 50
    iget v1, p0, Lcom/momocv/SingleFaceInfo;->feature_quality_score_:F

    .line 51
    .line 52
    iput v1, v0, Lcom/momocv/SingleFaceInfo;->feature_quality_score_:F

    .line 53
    .line 54
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 55
    .line 56
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 61
    .line 62
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_68_:[F

    .line 63
    .line 64
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_68_:[F

    .line 69
    .line 70
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 71
    .line 72
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 77
    .line 78
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 79
    .line 80
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 85
    .line 86
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_137_:[F

    .line 87
    .line 88
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_137_:[F

    .line 93
    .line 94
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_87_:[F

    .line 95
    .line 96
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_87_:[F

    .line 101
    .line 102
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_240_:[F

    .line 103
    .line 104
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_240_:[F

    .line 109
    .line 110
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_222_:[F

    .line 111
    .line 112
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_222_:[F

    .line 117
    .line 118
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_106_:[F

    .line 119
    .line 120
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->orig_landmarks_106_:[F

    .line 125
    .line 126
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 127
    .line 128
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 133
    .line 134
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 135
    .line 136
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 141
    .line 142
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 143
    .line 144
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 149
    .line 150
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 151
    .line 152
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 157
    .line 158
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_137_:[F

    .line 159
    .line 160
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_137_:[F

    .line 165
    .line 166
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_87_:[F

    .line 167
    .line 168
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_87_:[F

    .line 173
    .line 174
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_240_:[F

    .line 175
    .line 176
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_240_:[F

    .line 181
    .line 182
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 183
    .line 184
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_222_:[F

    .line 189
    .line 190
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks_106_:[F

    .line 191
    .line 192
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks_106_:[F

    .line 197
    .line 198
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->landmarks137_occprobe_:[F

    .line 199
    .line 200
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->landmarks137_occprobe_:[F

    .line 205
    .line 206
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->features_:[B

    .line 207
    .line 208
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([B)[B

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->features_:[B

    .line 213
    .line 214
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 215
    .line 216
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->euler_angles_:[F

    .line 221
    .line 222
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 223
    .line 224
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->camera_matrix_:[F

    .line 229
    .line 230
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 231
    .line 232
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->rotation_matrix_:[F

    .line 237
    .line 238
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 239
    .line 240
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->rotation_vector_:[F

    .line 245
    .line 246
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->translation_vector_:[F

    .line 247
    .line 248
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->translation_vector_:[F

    .line 253
    .line 254
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->projection_matrix_:[F

    .line 255
    .line 256
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->projection_matrix_:[F

    .line 261
    .line 262
    iget-object v1, p0, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 263
    .line 264
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    iput-object v1, v0, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 269
    .line 270
    iget-object p0, p0, Lcom/momocv/SingleFaceInfo;->projection_matrix_opengl_:[F

    .line 271
    .line 272
    invoke-static {p0}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    iput-object p0, v0, Lcom/momocv/SingleFaceInfo;->projection_matrix_opengl_:[F

    .line 277
    .line 278
    return-object v0
.end method

.method public static clone(Lcom/momocv/videoprocessor/VideoInfo;)Lcom/momocv/videoprocessor/VideoInfo;
    .locals 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 279
    :cond_0
    new-instance v0, Lcom/momocv/videoprocessor/VideoInfo;

    invoke-direct {v0}, Lcom/momocv/videoprocessor/VideoInfo;-><init>()V

    .line 280
    iget-object v1, p0, Lcom/momocv/videoprocessor/VideoInfo;->dst_warp_points_:[F

    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v1

    iput-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->dst_warp_points_:[F

    .line 281
    iget-object v1, p0, Lcom/momocv/videoprocessor/VideoInfo;->src_warp_points_:[F

    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v1

    iput-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->src_warp_points_:[F

    .line 282
    iget-object v1, p0, Lcom/momocv/videoprocessor/VideoInfo;->frame_rect_:[F

    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v1

    iput-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->frame_rect_:[F

    .line 283
    iget-object v1, p0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    .line 284
    array-length v1, v1

    new-array v1, v1, [Lcom/momocv/SingleFaceInfo;

    iput-object v1, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    move v1, v2

    .line 285
    :goto_0
    iget-object v3, p0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    array-length v4, v3

    if-ge v1, v4, :cond_1

    .line 286
    iget-object v4, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    aget-object v3, v3, v1

    invoke-static {v3}, Lcom/core/glcore/util/MMCvInfoHelper;->clone(Lcom/momocv/SingleFaceInfo;)Lcom/momocv/SingleFaceInfo;

    move-result-object v3

    aput-object v3, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 287
    :cond_1
    iget-object v1, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    if-eqz v1, :cond_2

    .line 288
    array-length v1, v1

    new-array v1, v1, [Lcom/momocv/videoprocessor/FaceAttribute;

    iput-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 289
    :goto_1
    iget-object v1, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    array-length v1, v1

    if-ge v2, v1, :cond_2

    .line 290
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    new-instance v3, Lcom/momocv/videoprocessor/FaceAttribute;

    invoke-direct {v3}, Lcom/momocv/videoprocessor/FaceAttribute;-><init>()V

    aput-object v3, v1, v2

    .line 291
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget v4, v3, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    iput v4, v1, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 292
    iget v4, v3, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    iput v4, v1, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    .line 293
    iget v4, v3, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    iput v4, v1, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    .line 294
    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->skin_threshold_:[I

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([I)[I

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->skin_threshold_:[I

    .line 295
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 296
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 297
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 298
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks240_:[F

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks240_:[F

    .line 299
    iget-object v1, v0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v1, v1, v2

    iget-object v3, p0, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    aget-object v3, v3, v2

    iget-object v3, v3, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks106_:[F

    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    move-result-object v3

    iput-object v3, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks106_:[F

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-object v0
.end method
