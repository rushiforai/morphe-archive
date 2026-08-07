.class public Lcom/momo/mcamera/mask/FaceMaskFilter;
.super Lcom/momo/mcamera/mask/FaceDetectFilter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/FaceMaskFilter$Model;
    }
.end annotation


# static fields
.field protected static final COORDS_PER_VERTEX:I = 0x2


# instance fields
.field private curMMCVImage:Ll/umw;

.field private mCount:I

.field private mLastHasFace:Z

.field private mStickerChanged:Z

.field private mStickersList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field protected maskListLock:Ljava/lang/Object;

.field private model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

.field private mvpAngle:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/Map<",
            "Ljava/lang/Float;",
            "[F>;>;"
        }
    .end annotation
.end field

.field private mvpLists:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field private sticker:Lcom/momo/mcamera/mask/Sticker;

.field protected vertexBufer:Ljava/nio/FloatBuffer;

.field protected final vertexStride:I


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpLists:Ljava/util/List;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/Object;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickerChanged:Z

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickersList:Ljava/util/List;

    .line 38
    .line 39
    iput v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mCount:I

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mLastHasFace:Z

    .line 42
    .line 43
    const/16 v2, 0x8

    .line 44
    .line 45
    iput v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexStride:I

    .line 46
    .line 47
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 48
    .line 49
    new-instance v2, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 50
    .line 51
    invoke-direct {v2, p0, v1}, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;-><init>(Lcom/momo/mcamera/mask/FaceMaskFilter;Lcom/momo/mcamera/mask/FaceMaskFilter$1;)V

    .line 52
    .line 53
    .line 54
    iput-object v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 55
    .line 56
    new-instance v1, Ll/umw;

    .line 57
    .line 58
    invoke-direct {v1}, Ll/umw;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Lcom/momo/mcamera/mask/Mask;->getTexturePath()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/umw;->a()[B

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iput-object v2, v1, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->data:[B

    .line 83
    .line 84
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget-object v2, v2, Lcom/momo/mcamera/mask/Mask;->landmarks:[F

    .line 91
    .line 92
    iput-object v2, v1, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->texCoords:[F

    .line 93
    .line 94
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iput-boolean p1, v1, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->comic:Z

    .line 101
    .line 102
    iput-boolean v0, p0, Ll/gfj;->useCache:Z

    .line 103
    .line 104
    return-void
.end method

.method private drawFace([F[F)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->comic:Z

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    sget-object v0, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexesWithCornerPoint:[I

    .line 10
    .line 11
    array-length v0, v0

    .line 12
    new-instance v3, Lcom/momocv/mangaface/MangaFace;

    .line 13
    .line 14
    invoke-direct {v3}, Lcom/momocv/mangaface/MangaFace;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v4, Lcom/momocv/mangaface/MangaFaceParams;

    .line 18
    .line 19
    invoke-direct {v4}, Lcom/momocv/mangaface/MangaFaceParams;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p2, v4, Lcom/momocv/mangaface/MangaFaceParams;->euler_angles_:[F

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, v4, Lcom/momocv/mangaface/MangaFaceParams;->image_height_:I

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, v4, Lcom/momocv/mangaface/MangaFaceParams;->image_width_:I

    .line 35
    .line 36
    iput-object p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->landmarks96_:[F

    .line 37
    .line 38
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageHeight()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->manga_height_:I

    .line 62
    .line 63
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 64
    .line 65
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getImageWidth()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    iput p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->manga_width_:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_1
    :goto_0
    const/16 p1, 0x280

    .line 73
    .line 74
    iput p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->manga_height_:I

    .line 75
    .line 76
    const/16 p1, 0x1e0

    .line 77
    .line 78
    iput p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->manga_width_:I

    .line 79
    .line 80
    :goto_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->texCoords:[F

    .line 83
    .line 84
    iput-object p1, v4, Lcom/momocv/mangaface/MangaFaceParams;->manga_landmarks_:[F

    .line 85
    .line 86
    new-instance p1, Lcom/momocv/mangaface/MangaFaceInfo;

    .line 87
    .line 88
    invoke-direct {p1}, Lcom/momocv/mangaface/MangaFaceInfo;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v4, p1}, Lcom/momocv/mangaface/MangaFace;->manga_face(Lcom/momocv/mangaface/MangaFaceParams;Lcom/momocv/mangaface/MangaFaceInfo;)Z

    .line 92
    .line 93
    .line 94
    iget-object p1, p1, Lcom/momocv/mangaface/MangaFaceInfo;->landmarks96_plus4_pts_:[F

    .line 95
    .line 96
    iget-object p2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 97
    .line 98
    iget-object p2, p2, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->texCoords:[F

    .line 99
    .line 100
    invoke-static {p1, p2}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulationWithCornerPoint([F[F)[[F

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    aget-object p2, p1, v2

    .line 105
    .line 106
    aget-object p1, p1, v1

    .line 107
    .line 108
    goto :goto_2

    .line 109
    :cond_2
    sget-object p2, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->CXFaceTriangulationIndexes:[I

    .line 110
    .line 111
    array-length v0, p2

    .line 112
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 113
    .line 114
    .line 115
    move-result p2

    .line 116
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 121
    .line 122
    iget-object v4, v4, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->texCoords:[F

    .line 123
    .line 124
    invoke-static {p1, p2, v3, v4}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;->getFaceTriangulation([FII[F)[[F

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    aget-object p2, p1, v2

    .line 129
    .line 130
    aget-object p1, p1, v1

    .line 131
    .line 132
    :goto_2
    invoke-virtual {p0, p2}, Ll/wej;->setRenderVertices([F)V

    .line 133
    .line 134
    .line 135
    iget-object p2, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 136
    .line 137
    invoke-virtual {p2, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 138
    .line 139
    .line 140
    iget v3, p0, Ll/wej;->positionHandle:I

    .line 141
    .line 142
    const/4 v7, 0x0

    .line 143
    iget-object v8, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    const/4 v4, 0x2

    .line 146
    const/16 v5, 0x1406

    .line 147
    .line 148
    const/4 v6, 0x0

    .line 149
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 150
    .line 151
    .line 152
    iget p2, p0, Ll/wej;->positionHandle:I

    .line 153
    .line 154
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 158
    .line 159
    const/4 v1, 0x4

    .line 160
    if-nez p2, :cond_3

    .line 161
    .line 162
    array-length p2, p1

    .line 163
    mul-int/2addr p2, v1

    .line 164
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 169
    .line 170
    .line 171
    move-result-object v3

    .line 172
    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    iput-object p2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 181
    .line 182
    :cond_3
    iget-object p2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 183
    .line 184
    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->rewind()Ljava/nio/Buffer;

    .line 185
    .line 186
    .line 187
    iget-object p2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 188
    .line 189
    invoke-virtual {p2, p1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 193
    .line 194
    invoke-virtual {p1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 195
    .line 196
    .line 197
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 198
    .line 199
    const/4 v7, 0x0

    .line 200
    iget-object v8, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->vertexBufer:Ljava/nio/FloatBuffer;

    .line 201
    .line 202
    const/4 v4, 0x2

    .line 203
    const/16 v5, 0x1406

    .line 204
    .line 205
    const/4 v6, 0x0

    .line 206
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 207
    .line 208
    .line 209
    iget p0, p0, Ll/wej;->texCoordHandle:I

    .line 210
    .line 211
    invoke-static {p0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 212
    .line 213
    .line 214
    invoke-static {v1, v2, v0}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 215
    .line 216
    .line 217
    return-void
.end method


# virtual methods
.method public addStickerList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/mcamera/mask/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickersList:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public cancelDraw()V
    .locals 0

    return-void
.end method

.method public clearPoints()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpLists:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/wej;->texture_in:I

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public drawSub()V
    .locals 5

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
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/wej;->programHandle:I

    .line 14
    .line 15
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x4100

    .line 19
    .line 20
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-static {v0, v1, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->maskListLock:Ljava/lang/Object;

    .line 43
    .line 44
    monitor-enter v0

    .line 45
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 46
    .line 47
    iget-boolean v1, v1, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->comic:Z

    .line 48
    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    :goto_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 52
    .line 53
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-ge v2, v1, :cond_2

    .line 58
    .line 59
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ljava/util/Map;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    if-eqz v3, :cond_0

    .line 83
    .line 84
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    check-cast v3, [F

    .line 89
    .line 90
    iget-object v4, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 91
    .line 92
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    check-cast v4, Ljava/util/Map;

    .line 97
    .line 98
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    check-cast v4, [F

    .line 103
    .line 104
    invoke-direct {p0, v4, v3}, Lcom/momo/mcamera/mask/FaceMaskFilter;->drawFace([F[F)V

    .line 105
    .line 106
    .line 107
    goto :goto_1

    .line 108
    :catchall_0
    move-exception p0

    .line 109
    goto :goto_3

    .line 110
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpLists:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_2

    .line 124
    .line 125
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    check-cast v2, [F

    .line 130
    .line 131
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 132
    .line 133
    .line 134
    const/4 v3, 0x0

    .line 135
    invoke-direct {p0, v2, v3}, Lcom/momo/mcamera/mask/FaceMaskFilter;->drawFace([F[F)V

    .line 136
    .line 137
    .line 138
    goto :goto_2

    .line 139
    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    invoke-virtual {p0}, Ll/wej;->disableDrawArray()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/FaceMaskFilter;->clearPoints()V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :goto_3
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 148
    throw p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getFragmentShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->getVertexShader()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    iget-object p1, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    iput-object p1, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 4
    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget p1, p0, Ll/wej;->texture_in:I

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-boolean p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickerChanged:Z

    .line 15
    .line 16
    if-nez p1, :cond_2

    .line 17
    .line 18
    :cond_1
    iget-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/core/glcore/util/TextureHelper;->bitmapToTexture(Ll/umw;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput p1, p0, Ll/wej;->texture_in:I

    .line 25
    .line 26
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickerChanged:Z

    .line 28
    .line 29
    :cond_2
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public passShaderValues()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/gfj;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->texture_in:I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    filled-new-array {v0}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    iput v2, p0, Ll/wej;->texture_in:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public resetSticker(Lcom/momo/mcamera/mask/Sticker;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 13
    .line 14
    :cond_1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    filled-new-array {v0}, [I

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-static {v3, v0, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 25
    .line 26
    .line 27
    iput v2, p0, Ll/wej;->texture_in:I

    .line 28
    .line 29
    :cond_2
    iput-object p1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->sticker:Lcom/momo/mcamera/mask/Sticker;

    .line 30
    .line 31
    new-instance v0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 32
    .line 33
    invoke-direct {v0, p0, v1}, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;-><init>(Lcom/momo/mcamera/mask/FaceMaskFilter;Lcom/momo/mcamera/mask/FaceMaskFilter$1;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 37
    .line 38
    new-instance v0, Ll/umw;

    .line 39
    .line 40
    invoke-direct {v0}, Ll/umw;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Lcom/momo/mcamera/mask/Mask;->getTexturePath()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v0, v1}, Lcom/core/glcore/util/ImageUtils;->decodeMMCVImage(Ll/umw;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->curMMCVImage:Ll/umw;

    .line 59
    .line 60
    invoke-virtual {v1}, Ll/umw;->a()[B

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->data:[B

    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->getMask()Lcom/momo/mcamera/mask/Mask;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    iget-object v1, v1, Lcom/momo/mcamera/mask/Mask;->landmarks:[F

    .line 73
    .line 74
    iput-object v1, v0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->texCoords:[F

    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->model:Lcom/momo/mcamera/mask/FaceMaskFilter$Model;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/Sticker;->isComic()Z

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput-boolean p1, v0, Lcom/momo/mcamera/mask/FaceMaskFilter$Model;->comic:Z

    .line 83
    .line 84
    iput-boolean v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickerChanged:Z

    .line 85
    .line 86
    return-void
.end method

.method public setDetectParam(Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpLists:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-object v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->warpedPoints104:[F

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points104:[F

    .line 14
    .line 15
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    new-instance v0, Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->euler_angles:[F

    .line 24
    .line 25
    iget-object p1, p1, Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;->points96:[F

    .line 26
    .line 27
    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mvpAngle:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget v0, p0, Ll/wej;->texture_in:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x1

    .line 13
    if-gtz v0, :cond_1

    .line 14
    .line 15
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mLastHasFace:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickersList:Ljava/util/List;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mCount:I

    .line 30
    .line 31
    add-int/2addr v0, v1

    .line 32
    iput v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mCount:I

    .line 33
    .line 34
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickersList:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    rem-int/2addr v0, v2

    .line 41
    iput v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mCount:I

    .line 42
    .line 43
    iget-object v2, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mStickersList:Ljava/util/List;

    .line 44
    .line 45
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/momo/mcamera/mask/Sticker;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/FaceMaskFilter;->resetSticker(Lcom/momo/mcamera/mask/Sticker;)V

    .line 52
    .line 53
    .line 54
    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mLastHasFace:Z

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-lez p1, :cond_2

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/momo/mcamera/mask/FaceMaskFilter;->mLastHasFace:Z

    .line 64
    .line 65
    :cond_2
    :goto_0
    return-void
.end method
