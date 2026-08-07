.class public Ll/omw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field public A:F

.field public B:Z

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:Lcom/momocv/objectdetect/ObjectDetectInfo;

.field public H:Lcom/momocv/cartoonface/CartoonfaceInfo;

.field public I:Lcom/momocv/stylizeface/StylizefaceInfo;

.field public J:Lcom/momocv/ardetect/ArDetectInfo;

.field public K:Ljava/lang/String;

.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:[B

.field private h:[B

.field private i:I

.field public j:Ll/evf;

.field public k:Lcom/momocv/videoprocessor/VideoInfo;

.field public l:Lcom/core/glcore/util/BodyLandData;

.field public m:Lcom/momocv/beauty/BodyWarpInfo;

.field private n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/nuf;",
            ">;"
        }
    .end annotation
.end field

.field o:[[F

.field p:[[F

.field public q:[[F

.field public r:[[F

.field s:[[F

.field t:[[F

.field u:[[F

.field v:[[F

.field w:[[B

.field public x:[[Lcom/momocv/LiquefyInfo;

.field public y:I

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/omw;->a:Z

    .line 6
    .line 7
    iput v0, p0, Ll/omw;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/omw;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/omw;->d:I

    .line 12
    .line 13
    iput v0, p0, Ll/omw;->e:I

    .line 14
    .line 15
    iput v0, p0, Ll/omw;->f:I

    .line 16
    .line 17
    const/16 v1, 0x11

    .line 18
    .line 19
    iput v1, p0, Ll/omw;->i:I

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/omw;->n:Ljava/util/List;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    iput-boolean v1, p0, Ll/omw;->z:Z

    .line 30
    .line 31
    const/high16 v1, -0x40800000    # -1.0f

    .line 32
    .line 33
    iput v1, p0, Ll/omw;->A:F

    .line 34
    .line 35
    iput-boolean v0, p0, Ll/omw;->B:Z

    .line 36
    .line 37
    const/4 v0, -0x1

    .line 38
    iput v0, p0, Ll/omw;->C:I

    .line 39
    .line 40
    iput v0, p0, Ll/omw;->D:I

    .line 41
    .line 42
    iput v0, p0, Ll/omw;->E:I

    .line 43
    .line 44
    iput v0, p0, Ll/omw;->F:I

    .line 45
    .line 46
    const-string v0, "default"

    .line 47
    .line 48
    iput-object v0, p0, Ll/omw;->K:Ljava/lang/String;

    .line 49
    .line 50
    new-instance v0, Lcom/momocv/videoprocessor/VideoInfo;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/momocv/videoprocessor/VideoInfo;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public A(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omw;->f:I

    .line 2
    .line 3
    return-void
.end method

.method public B(Lcom/momocv/BaseParams;)V
    .locals 3

    .line 1
    iget v0, p0, Ll/omw;->C:I

    .line 2
    .line 3
    if-ltz v0, :cond_1

    .line 4
    .line 5
    iget v1, p0, Ll/omw;->D:I

    .line 6
    .line 7
    if-ltz v1, :cond_1

    .line 8
    .line 9
    iget-object v2, p1, Lcom/momocv/BaseParams;->crop_rect:[I

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x4

    .line 14
    new-array v2, v2, [I

    .line 15
    .line 16
    iput-object v2, p1, Lcom/momocv/BaseParams;->crop_rect:[I

    .line 17
    .line 18
    :cond_0
    iget-object p1, p1, Lcom/momocv/BaseParams;->crop_rect:[I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    aput v0, p1, v2

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    aput v1, p1, v0

    .line 25
    .line 26
    const/4 v0, 0x2

    .line 27
    iget v1, p0, Ll/omw;->E:I

    .line 28
    .line 29
    aput v1, p1, v0

    .line 30
    .line 31
    const/4 v0, 0x3

    .line 32
    iget p0, p0, Ll/omw;->F:I

    .line 33
    .line 34
    aput p0, p1, v0

    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public C(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omw;->c:I

    .line 2
    .line 3
    return-void
.end method

.method public D(Ll/evf;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/omw;->j:Ll/evf;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Ll/evf;->b:Lcom/momocv/videoprocessor/VideoInfo;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iput-object p1, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/omw;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public E(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omw;->e:I

    .line 2
    .line 3
    return-void
.end method

.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/omw;->b(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public b(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/omw;->n:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 7
    .line 8
    if-eqz v0, :cond_7

    .line 9
    .line 10
    iget-object v0, v0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 11
    .line 12
    if-eqz v0, :cond_7

    .line 13
    .line 14
    array-length v0, v0

    .line 15
    const/4 v1, 0x2

    .line 16
    new-array v2, v1, [I

    .line 17
    .line 18
    const/4 v3, 0x1

    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    aput v4, v2, v3

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    aput v0, v2, v5

    .line 25
    .line 26
    sget-object v6, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 27
    .line 28
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, [[F

    .line 33
    .line 34
    iput-object v2, p0, Ll/omw;->o:[[F

    .line 35
    .line 36
    new-array v2, v1, [I

    .line 37
    .line 38
    aput v4, v2, v3

    .line 39
    .line 40
    aput v0, v2, v5

    .line 41
    .line 42
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, [[F

    .line 47
    .line 48
    iput-object v2, p0, Ll/omw;->p:[[F

    .line 49
    .line 50
    new-array v2, v1, [I

    .line 51
    .line 52
    const/4 v4, 0x4

    .line 53
    aput v4, v2, v3

    .line 54
    .line 55
    aput v0, v2, v5

    .line 56
    .line 57
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    check-cast v2, [[F

    .line 62
    .line 63
    iput-object v2, p0, Ll/omw;->s:[[F

    .line 64
    .line 65
    new-array v2, v1, [I

    .line 66
    .line 67
    aput v4, v2, v3

    .line 68
    .line 69
    aput v0, v2, v5

    .line 70
    .line 71
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, [[F

    .line 76
    .line 77
    iput-object v2, p0, Ll/omw;->t:[[F

    .line 78
    .line 79
    new-array v2, v1, [I

    .line 80
    .line 81
    aput v4, v2, v3

    .line 82
    .line 83
    aput v0, v2, v5

    .line 84
    .line 85
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, [[F

    .line 90
    .line 91
    iput-object v2, p0, Ll/omw;->u:[[F

    .line 92
    .line 93
    new-array v2, v1, [I

    .line 94
    .line 95
    aput v4, v2, v3

    .line 96
    .line 97
    aput v0, v2, v5

    .line 98
    .line 99
    invoke-static {v6, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    check-cast v2, [[F

    .line 104
    .line 105
    iput-object v2, p0, Ll/omw;->v:[[F

    .line 106
    .line 107
    iget-object v2, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 108
    .line 109
    iget-object v4, v2, Lcom/momocv/videoprocessor/VideoInfo;->src_warp_points_:[F

    .line 110
    .line 111
    if-eqz v4, :cond_0

    .line 112
    .line 113
    array-length v7, v4

    .line 114
    if-lez v7, :cond_0

    .line 115
    .line 116
    iget-object v2, v2, Lcom/momocv/videoprocessor/VideoInfo;->dst_warp_points_:[F

    .line 117
    .line 118
    if-eqz v2, :cond_0

    .line 119
    .line 120
    array-length v2, v2

    .line 121
    if-lez v2, :cond_0

    .line 122
    .line 123
    array-length v2, v4

    .line 124
    new-array v4, v1, [I

    .line 125
    .line 126
    aput v2, v4, v3

    .line 127
    .line 128
    aput v0, v4, v5

    .line 129
    .line 130
    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    check-cast v2, [[F

    .line 135
    .line 136
    iput-object v2, p0, Ll/omw;->q:[[F

    .line 137
    .line 138
    iget-object v4, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 139
    .line 140
    iget-object v7, v4, Lcom/momocv/videoprocessor/VideoInfo;->src_warp_points_:[F

    .line 141
    .line 142
    aput-object v7, v2, v5

    .line 143
    .line 144
    iget-object v2, v4, Lcom/momocv/videoprocessor/VideoInfo;->dst_warp_points_:[F

    .line 145
    .line 146
    array-length v2, v2

    .line 147
    new-array v1, v1, [I

    .line 148
    .line 149
    aput v2, v1, v3

    .line 150
    .line 151
    aput v0, v1, v5

    .line 152
    .line 153
    invoke-static {v6, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, [[F

    .line 158
    .line 159
    iput-object v1, p0, Ll/omw;->r:[[F

    .line 160
    .line 161
    iget-object v2, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 162
    .line 163
    iget-object v2, v2, Lcom/momocv/videoprocessor/VideoInfo;->dst_warp_points_:[F

    .line 164
    .line 165
    aput-object v2, v1, v5

    .line 166
    .line 167
    :cond_0
    :goto_0
    if-ge v5, v0, :cond_7

    .line 168
    .line 169
    new-instance v1, Ll/nuf;

    .line 170
    .line 171
    invoke-direct {v1}, Ll/nuf;-><init>()V

    .line 172
    .line 173
    .line 174
    iget-object v2, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 175
    .line 176
    iget-object v2, v2, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 177
    .line 178
    aget-object v2, v2, v5

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ll/nuf;->D(Lcom/momocv/SingleFaceInfo;)V

    .line 181
    .line 182
    .line 183
    iget-object v4, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 184
    .line 185
    iget-object v4, v4, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 186
    .line 187
    if-eqz v4, :cond_1

    .line 188
    .line 189
    array-length v6, v4

    .line 190
    if-lez v6, :cond_1

    .line 191
    .line 192
    aget-object v4, v4, v5

    .line 193
    .line 194
    invoke-virtual {v1, v4}, Ll/nuf;->C(Lcom/momocv/videoprocessor/FaceAttribute;)V

    .line 195
    .line 196
    .line 197
    :cond_1
    iget-object v4, p0, Ll/omw;->n:Ljava/util/List;

    .line 198
    .line 199
    invoke-interface {v4, v5, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    iget-object v1, p0, Ll/omw;->o:[[F

    .line 203
    .line 204
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->modelview_matrix_:[F

    .line 205
    .line 206
    aput-object v4, v1, v5

    .line 207
    .line 208
    iget-object v1, p0, Ll/omw;->p:[[F

    .line 209
    .line 210
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->projection_matrix_opengl_:[F

    .line 211
    .line 212
    aput-object v4, v1, v5

    .line 213
    .line 214
    iget-object v1, p0, Ll/omw;->s:[[F

    .line 215
    .line 216
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->face_rect_:[F

    .line 217
    .line 218
    aput-object v4, v1, v5

    .line 219
    .line 220
    iget-object v1, p0, Ll/omw;->t:[[F

    .line 221
    .line 222
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_96_:[F

    .line 223
    .line 224
    aput-object v4, v1, v5

    .line 225
    .line 226
    iget-object v1, p0, Ll/omw;->v:[[F

    .line 227
    .line 228
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->orig_face_rect_:[F

    .line 229
    .line 230
    aput-object v4, v1, v5

    .line 231
    .line 232
    iget-object v1, v2, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 233
    .line 234
    iput-object v1, v2, Lcom/momocv/SingleFaceInfo;->orig_landmarks_104_:[F

    .line 235
    .line 236
    if-eqz p1, :cond_4

    .line 237
    .line 238
    iget-object v1, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 239
    .line 240
    iget-object v1, v1, Lcom/momocv/videoprocessor/VideoInfo;->faces_attributes_:[Lcom/momocv/videoprocessor/FaceAttribute;

    .line 241
    .line 242
    aget-object v1, v1, v5

    .line 243
    .line 244
    iget-object v4, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks68_:[F

    .line 245
    .line 246
    if-eqz v4, :cond_2

    .line 247
    .line 248
    iput-object v4, v2, Lcom/momocv/SingleFaceInfo;->landmarks_68_:[F

    .line 249
    .line 250
    :cond_2
    iget-object v4, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks96_:[F

    .line 251
    .line 252
    if-eqz v4, :cond_3

    .line 253
    .line 254
    iput-object v4, v2, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 255
    .line 256
    :cond_3
    iget-object v1, v1, Lcom/momocv/videoprocessor/FaceAttribute;->warped_landmarks104_:[F

    .line 257
    .line 258
    if-eqz v1, :cond_4

    .line 259
    .line 260
    iput-object v1, v2, Lcom/momocv/SingleFaceInfo;->landmarks_104_:[F

    .line 261
    .line 262
    :cond_4
    iget-object v1, p0, Ll/omw;->u:[[F

    .line 263
    .line 264
    iget-object v4, v2, Lcom/momocv/SingleFaceInfo;->landmarks_96_:[F

    .line 265
    .line 266
    aput-object v4, v1, v5

    .line 267
    .line 268
    iget v1, v2, Lcom/momocv/SingleFaceInfo;->features_quality_:I

    .line 269
    .line 270
    if-ne v1, v3, :cond_6

    .line 271
    .line 272
    iget-object v1, v2, Lcom/momocv/SingleFaceInfo;->features_:[B

    .line 273
    .line 274
    if-eqz v1, :cond_6

    .line 275
    .line 276
    array-length v2, v1

    .line 277
    if-lez v2, :cond_6

    .line 278
    .line 279
    iget-object v2, p0, Ll/omw;->w:[[B

    .line 280
    .line 281
    if-nez v2, :cond_5

    .line 282
    .line 283
    new-array v2, v0, [[B

    .line 284
    .line 285
    iput-object v2, p0, Ll/omw;->w:[[B

    .line 286
    .line 287
    :cond_5
    iget-object v2, p0, Ll/omw;->w:[[B

    .line 288
    .line 289
    aput-object v1, v2, v5

    .line 290
    .line 291
    :cond_6
    add-int/lit8 v5, v5, 0x1

    .line 292
    .line 293
    goto :goto_0

    .line 294
    :cond_7
    return-void
.end method

.method public c()Ll/omw;
    .locals 5
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/omw;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/omw;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Ll/omw;->a:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Ll/omw;->a:Z

    .line 9
    .line 10
    iget v1, p0, Ll/omw;->b:I

    .line 11
    .line 12
    iput v1, v0, Ll/omw;->b:I

    .line 13
    .line 14
    iget v1, p0, Ll/omw;->c:I

    .line 15
    .line 16
    iput v1, v0, Ll/omw;->c:I

    .line 17
    .line 18
    iget v1, p0, Ll/omw;->d:I

    .line 19
    .line 20
    iput v1, v0, Ll/omw;->d:I

    .line 21
    .line 22
    iget v1, p0, Ll/omw;->e:I

    .line 23
    .line 24
    iput v1, v0, Ll/omw;->e:I

    .line 25
    .line 26
    iget v1, p0, Ll/omw;->f:I

    .line 27
    .line 28
    iput v1, v0, Ll/omw;->f:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/omw;->g:[B

    .line 31
    .line 32
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([B)[B

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Ll/omw;->g:[B

    .line 37
    .line 38
    iget-object v1, p0, Ll/omw;->h:[B

    .line 39
    .line 40
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([B)[B

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Ll/omw;->h:[B

    .line 45
    .line 46
    iget-object v1, p0, Ll/omw;->j:Ll/evf;

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/evf;->a()Ll/evf;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Ll/omw;->j:Ll/evf;

    .line 55
    .line 56
    :cond_0
    iget-object v1, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/core/glcore/util/MMCvInfoHelper;->clone(Lcom/momocv/videoprocessor/VideoInfo;)Lcom/momocv/videoprocessor/VideoInfo;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 63
    .line 64
    iget-object v1, p0, Ll/omw;->l:Lcom/core/glcore/util/BodyLandData;

    .line 65
    .line 66
    iput-object v1, v0, Ll/omw;->l:Lcom/core/glcore/util/BodyLandData;

    .line 67
    .line 68
    iget-object v1, p0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    new-instance v1, Lcom/momocv/beauty/BodyWarpInfo;

    .line 73
    .line 74
    invoke-direct {v1}, Lcom/momocv/beauty/BodyWarpInfo;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v1, v0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 78
    .line 79
    iget-object v2, p0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 80
    .line 81
    iget-object v2, v2, Lcom/momocv/beauty/BodyWarpInfo;->dst_warp_points_:[F

    .line 82
    .line 83
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    iput-object v2, v1, Lcom/momocv/beauty/BodyWarpInfo;->dst_warp_points_:[F

    .line 88
    .line 89
    iget-object v1, v0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 90
    .line 91
    iget-object v2, p0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 94
    .line 95
    invoke-static {v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([F)[F

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iput-object v2, v1, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 100
    .line 101
    :cond_1
    iget-object v1, p0, Ll/omw;->n:Ljava/util/List;

    .line 102
    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    new-instance v1, Ljava/util/ArrayList;

    .line 106
    .line 107
    iget-object v2, p0, Ll/omw;->n:Ljava/util/List;

    .line 108
    .line 109
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 114
    .line 115
    .line 116
    iput-object v1, v0, Ll/omw;->n:Ljava/util/List;

    .line 117
    .line 118
    iget-object v1, p0, Ll/omw;->n:Ljava/util/List;

    .line 119
    .line 120
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    if-eqz v1, :cond_2

    .line 125
    .line 126
    iget-object v1, p0, Ll/omw;->n:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_2

    .line 137
    .line 138
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    check-cast v2, Ll/nuf;

    .line 143
    .line 144
    iget-object v3, v0, Ll/omw;->n:Ljava/util/List;

    .line 145
    .line 146
    invoke-virtual {v2}, Ll/nuf;->a()Ll/nuf;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_2
    iget-object v1, p0, Ll/omw;->o:[[F

    .line 155
    .line 156
    const/16 v2, 0x10

    .line 157
    .line 158
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iput-object v1, v0, Ll/omw;->o:[[F

    .line 163
    .line 164
    iget-object v1, p0, Ll/omw;->p:[[F

    .line 165
    .line 166
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iput-object v1, v0, Ll/omw;->p:[[F

    .line 171
    .line 172
    iget-object v1, p0, Ll/omw;->q:[[F

    .line 173
    .line 174
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[F)[[F

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    iput-object v1, v0, Ll/omw;->q:[[F

    .line 179
    .line 180
    iget-object v1, p0, Ll/omw;->r:[[F

    .line 181
    .line 182
    invoke-static {v1}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[F)[[F

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    iput-object v1, v0, Ll/omw;->r:[[F

    .line 187
    .line 188
    iget-object v1, p0, Ll/omw;->s:[[F

    .line 189
    .line 190
    const/4 v2, 0x4

    .line 191
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    iput-object v1, v0, Ll/omw;->s:[[F

    .line 196
    .line 197
    iget-object v1, p0, Ll/omw;->t:[[F

    .line 198
    .line 199
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    iput-object v1, v0, Ll/omw;->t:[[F

    .line 204
    .line 205
    iget-object v1, p0, Ll/omw;->u:[[F

    .line 206
    .line 207
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    iput-object v1, v0, Ll/omw;->u:[[F

    .line 212
    .line 213
    iget-object v1, p0, Ll/omw;->v:[[F

    .line 214
    .line 215
    invoke-static {v1, v2}, Lcom/core/glcore/util/ArrayUtils;->bunshin([[FI)[[F

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iput-object v1, v0, Ll/omw;->v:[[F

    .line 220
    .line 221
    iget-object v1, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 222
    .line 223
    if-eqz v1, :cond_3

    .line 224
    .line 225
    iget-object v1, v1, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 226
    .line 227
    if-eqz v1, :cond_3

    .line 228
    .line 229
    array-length v1, v1

    .line 230
    new-array v2, v1, [[B

    .line 231
    .line 232
    iput-object v2, v0, Ll/omw;->w:[[B

    .line 233
    .line 234
    const/4 v2, 0x0

    .line 235
    :goto_1
    if-ge v2, v1, :cond_3

    .line 236
    .line 237
    iget-object v3, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 238
    .line 239
    iget-object v3, v3, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 240
    .line 241
    aget-object v3, v3, v2

    .line 242
    .line 243
    iget-object v4, v0, Ll/omw;->w:[[B

    .line 244
    .line 245
    iget-object v3, v3, Lcom/momocv/SingleFaceInfo;->features_:[B

    .line 246
    .line 247
    invoke-static {v3}, Lcom/core/glcore/util/ArrayUtils;->bunshin([B)[B

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    aput-object v3, v4, v2

    .line 252
    .line 253
    add-int/lit8 v2, v2, 0x1

    .line 254
    .line 255
    goto :goto_1

    .line 256
    :cond_3
    iget-boolean v1, p0, Ll/omw;->z:Z

    .line 257
    .line 258
    iput-boolean v1, v0, Ll/omw;->z:Z

    .line 259
    .line 260
    iget v1, p0, Ll/omw;->A:F

    .line 261
    .line 262
    iput v1, v0, Ll/omw;->A:F

    .line 263
    .line 264
    iget-object v1, p0, Ll/omw;->x:[[Lcom/momocv/LiquefyInfo;

    .line 265
    .line 266
    iput-object v1, v0, Ll/omw;->x:[[Lcom/momocv/LiquefyInfo;

    .line 267
    .line 268
    iget p0, p0, Ll/omw;->y:I

    .line 269
    .line 270
    iput p0, v0, Ll/omw;->y:I

    .line 271
    .line 272
    return-object v0
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
    invoke-virtual {p0}, Ll/omw;->c()Ll/omw;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/momocv/beauty/BodyWarpInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/omw;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public f()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->r:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public j(I)Ll/nuf;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/omw;->n:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p1, v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/omw;->n:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/omw;->n:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Ll/nuf;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public k()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->s:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public l()[[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->w:[[B

    .line 2
    .line 3
    return-object p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/omw;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public n()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momocv/FacesInfo;->facesinfo_:[Lcom/momocv/SingleFaceInfo;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    array-length p0, p0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public o()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->v:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public p()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->t:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public q()Ll/evf;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->j:Ll/evf;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()[[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->q:[[F

    .line 2
    .line 3
    return-object p0
.end method

.method public s()Lcom/momocv/videoprocessor/VideoInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()I
    .locals 0

    .line 1
    iget p0, p0, Ll/omw;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/omw;->m:Lcom/momocv/beauty/BodyWarpInfo;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/momocv/beauty/BodyWarpInfo;->src_warp_points_:[F

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momocv/beauty/BodyWarpInfo;->dst_warp_points_:[F

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_2
    :goto_0
    return v0
.end method

.method public v()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/omw;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public w(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omw;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public x(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/omw;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public y([B)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/omw;->g:[B

    .line 2
    .line 3
    return-void
.end method

.method public z(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/omw;->a:Z

    .line 2
    .line 3
    return-void
.end method
