.class public Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Ll/suf;


# instance fields
.field private colorHandle:I

.field facePos104:[[F

.field facePos222:[[F

.field facePos68:[[F

.field facePos96:[[F

.field faceRec:[F

.field floatBufFace104:Ljava/nio/FloatBuffer;

.field floatBufFace222:Ljava/nio/FloatBuffer;

.field floatBufFace68:Ljava/nio/FloatBuffer;

.field floatBufFace96:Ljava/nio/FloatBuffer;

.field floatBuffer:Ljava/nio/FloatBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos96:[[F

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos68:[[F

    .line 10
    .line 11
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos104:[[F

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos222:[[F

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->colorHandle:I

    .line 17
    .line 18
    return-void
.end method

.method private adjustCoordnate([F[F)V
    .locals 6

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
    move-result p0

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    array-length v1, p1

    .line 12
    if-lez v1, :cond_1

    .line 13
    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    array-length v1, p2

    .line 17
    if-lez v1, :cond_1

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    :goto_0
    array-length v2, p1

    .line 21
    div-int/lit8 v2, v2, 0x2

    .line 22
    .line 23
    if-ge v1, v2, :cond_0

    .line 24
    .line 25
    mul-int/lit8 v2, v1, 0x2

    .line 26
    .line 27
    aget v3, p2, v1

    .line 28
    .line 29
    int-to-float v4, v0

    .line 30
    div-float/2addr v3, v4

    .line 31
    const/high16 v4, 0x3f000000    # 0.5f

    .line 32
    .line 33
    sub-float/2addr v3, v4

    .line 34
    const/high16 v5, 0x40000000    # 2.0f

    .line 35
    .line 36
    mul-float/2addr v3, v5

    .line 37
    aput v3, p1, v2

    .line 38
    .line 39
    add-int/lit8 v2, v2, 0x1

    .line 40
    .line 41
    array-length v3, p1

    .line 42
    div-int/lit8 v3, v3, 0x2

    .line 43
    .line 44
    add-int/2addr v3, v1

    .line 45
    aget v3, p2, v3

    .line 46
    .line 47
    int-to-float v5, p0

    .line 48
    div-float/2addr v3, v5

    .line 49
    sub-float/2addr v3, v4

    .line 50
    const/high16 v4, -0x40000000    # -2.0f

    .line 51
    .line 52
    mul-float/2addr v3, v4

    .line 53
    aput v3, p1, v2

    .line 54
    .line 55
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    return-void

    .line 59
    :cond_1
    const-string p0, "mediaRender"

    .line 60
    .line 61
    const-string p1, "No face Info or buffer is empty"

    .line 62
    .line 63
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private putDataToFloatBuffer(Ljava/nio/FloatBuffer;[[F)Ljava/nio/FloatBuffer;
    .locals 4

    .line 1
    array-length p0, p2

    .line 2
    const/4 v0, 0x0

    .line 3
    if-gtz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 6
    .line 7
    .line 8
    return-object p1

    .line 9
    :cond_0
    if-nez p1, :cond_1

    .line 10
    .line 11
    array-length p0, p2

    .line 12
    mul-int/lit8 p0, p0, 0x4

    .line 13
    .line 14
    aget-object p1, p2, v0

    .line 15
    .line 16
    array-length p1, p1

    .line 17
    mul-int/2addr p0, p1

    .line 18
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    :cond_1
    move p0, v0

    .line 35
    :goto_0
    array-length v1, p2

    .line 36
    if-ge p0, v1, :cond_3

    .line 37
    .line 38
    aget-object v1, p2, p0

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    array-length v2, v1

    .line 43
    if-lez v2, :cond_2

    .line 44
    .line 45
    array-length v2, v1

    .line 46
    mul-int/2addr v2, p0

    .line 47
    array-length v3, v1

    .line 48
    invoke-virtual {p1, v1, v2, v3}, Ljava/nio/FloatBuffer;->put([FII)Ljava/nio/FloatBuffer;

    .line 49
    .line 50
    .line 51
    :cond_2
    add-int/lit8 p0, p0, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method private updateFaceInfo(Ll/omw;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "mediaRender"

    .line 8
    .line 9
    const-string p1, "No face"

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos68:[[F

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    array-length v1, v1

    .line 21
    if-eq v0, v1, :cond_2

    .line 22
    .line 23
    :cond_1
    const/4 v1, 0x2

    .line 24
    new-array v3, v1, [I

    .line 25
    .line 26
    const/4 v4, 0x1

    .line 27
    const/16 v5, 0x88

    .line 28
    .line 29
    aput v5, v3, v4

    .line 30
    .line 31
    aput v0, v3, v2

    .line 32
    .line 33
    sget-object v5, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 34
    .line 35
    invoke-static {v5, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, [[F

    .line 40
    .line 41
    iput-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos68:[[F

    .line 42
    .line 43
    new-array v3, v1, [I

    .line 44
    .line 45
    const/16 v6, 0xc0

    .line 46
    .line 47
    aput v6, v3, v4

    .line 48
    .line 49
    aput v0, v3, v2

    .line 50
    .line 51
    invoke-static {v5, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    check-cast v3, [[F

    .line 56
    .line 57
    iput-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos96:[[F

    .line 58
    .line 59
    new-array v3, v1, [I

    .line 60
    .line 61
    const/16 v6, 0xd0

    .line 62
    .line 63
    aput v6, v3, v4

    .line 64
    .line 65
    aput v0, v3, v2

    .line 66
    .line 67
    invoke-static {v5, v3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    check-cast v3, [[F

    .line 72
    .line 73
    iput-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos104:[[F

    .line 74
    .line 75
    new-array v1, v1, [I

    .line 76
    .line 77
    const/16 v3, 0x1bc

    .line 78
    .line 79
    aput v3, v1, v4

    .line 80
    .line 81
    aput v0, v1, v2

    .line 82
    .line 83
    invoke-static {v5, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, [[F

    .line 88
    .line 89
    iput-object v1, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos222:[[F

    .line 90
    .line 91
    :cond_2
    :goto_0
    if-ge v2, v0, :cond_7

    .line 92
    .line 93
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    if-eqz v1, :cond_6

    .line 98
    .line 99
    invoke-virtual {v1}, Ll/nuf;->l()[F

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    if-eqz v1, :cond_3

    .line 104
    .line 105
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos68:[[F

    .line 106
    .line 107
    aget-object v3, v3, v2

    .line 108
    .line 109
    invoke-direct {p0, v3, v1}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->adjustCoordnate([F[F)V

    .line 110
    .line 111
    .line 112
    :cond_3
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    invoke-virtual {v1}, Ll/nuf;->m()[F

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    if-eqz v1, :cond_4

    .line 121
    .line 122
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos96:[[F

    .line 123
    .line 124
    aget-object v3, v3, v2

    .line 125
    .line 126
    invoke-direct {p0, v3, v1}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->adjustCoordnate([F[F)V

    .line 127
    .line 128
    .line 129
    :cond_4
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {v1}, Ll/nuf;->j()[F

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    if-eqz v1, :cond_5

    .line 138
    .line 139
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos104:[[F

    .line 140
    .line 141
    aget-object v3, v3, v2

    .line 142
    .line 143
    invoke-direct {p0, v3, v1}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->adjustCoordnate([F[F)V

    .line 144
    .line 145
    .line 146
    :cond_5
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    invoke-virtual {v1}, Ll/nuf;->k()[F

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    if-eqz v1, :cond_6

    .line 155
    .line 156
    iget-object v3, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos222:[[F

    .line 157
    .line 158
    aget-object v3, v3, v2

    .line 159
    .line 160
    invoke-direct {p0, v3, v1}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->adjustCoordnate([F[F)V

    .line 161
    .line 162
    .line 163
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_7
    return-void
.end method


# virtual methods
.method public drawSub()V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super {v0}, Ll/gfj;->drawSub()V

    .line 4
    .line 5
    .line 6
    iget v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->colorHandle:I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v1, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 10
    .line 11
    .line 12
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 13
    .line 14
    if-eqz v1, :cond_3

    .line 15
    .line 16
    array-length v1, v1

    .line 17
    if-gtz v1, :cond_0

    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-static {v1, v3, v3, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 25
    .line 26
    .line 27
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 28
    .line 29
    aget v1, v1, v2

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    int-to-float v3, v3

    .line 36
    div-float/2addr v1, v3

    .line 37
    const/high16 v3, 0x3f000000    # 0.5f

    .line 38
    .line 39
    sub-float/2addr v1, v3

    .line 40
    const/high16 v4, 0x40000000    # 2.0f

    .line 41
    .line 42
    mul-float/2addr v1, v4

    .line 43
    iget-object v5, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 44
    .line 45
    const/4 v6, 0x1

    .line 46
    aget v5, v5, v6

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v7

    .line 52
    int-to-float v7, v7

    .line 53
    div-float/2addr v5, v7

    .line 54
    sub-float/2addr v5, v3

    .line 55
    const/high16 v7, -0x40000000    # -2.0f

    .line 56
    .line 57
    mul-float/2addr v5, v7

    .line 58
    iget-object v8, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 59
    .line 60
    const/4 v9, 0x2

    .line 61
    aget v8, v8, v9

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/wej;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v10

    .line 67
    int-to-float v10, v10

    .line 68
    div-float/2addr v8, v10

    .line 69
    sub-float/2addr v8, v3

    .line 70
    mul-float/2addr v8, v4

    .line 71
    iget-object v10, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 72
    .line 73
    const/4 v11, 0x3

    .line 74
    aget v10, v10, v11

    .line 75
    .line 76
    invoke-virtual {v0}, Ll/wej;->getHeight()I

    .line 77
    .line 78
    .line 79
    move-result v12

    .line 80
    int-to-float v12, v12

    .line 81
    div-float/2addr v10, v12

    .line 82
    sub-float/2addr v10, v3

    .line 83
    mul-float/2addr v10, v7

    .line 84
    const/16 v3, 0x10

    .line 85
    .line 86
    new-array v7, v3, [F

    .line 87
    .line 88
    aput v1, v7, v2

    .line 89
    .line 90
    aput v5, v7, v6

    .line 91
    .line 92
    aput v1, v7, v9

    .line 93
    .line 94
    aput v10, v7, v11

    .line 95
    .line 96
    const/4 v11, 0x4

    .line 97
    aput v1, v7, v11

    .line 98
    .line 99
    const/4 v11, 0x5

    .line 100
    aput v10, v7, v11

    .line 101
    .line 102
    const/4 v11, 0x6

    .line 103
    aput v8, v7, v11

    .line 104
    .line 105
    const/4 v11, 0x7

    .line 106
    aput v10, v7, v11

    .line 107
    .line 108
    const/16 v11, 0x8

    .line 109
    .line 110
    aput v8, v7, v11

    .line 111
    .line 112
    const/16 v12, 0x9

    .line 113
    .line 114
    aput v10, v7, v12

    .line 115
    .line 116
    const/16 v10, 0xa

    .line 117
    .line 118
    aput v8, v7, v10

    .line 119
    .line 120
    const/16 v10, 0xb

    .line 121
    .line 122
    aput v5, v7, v10

    .line 123
    .line 124
    const/16 v10, 0xc

    .line 125
    .line 126
    aput v1, v7, v10

    .line 127
    .line 128
    const/16 v1, 0xd

    .line 129
    .line 130
    aput v5, v7, v1

    .line 131
    .line 132
    const/16 v1, 0xe

    .line 133
    .line 134
    aput v8, v7, v1

    .line 135
    .line 136
    const/16 v1, 0xf

    .line 137
    .line 138
    aput v5, v7, v1

    .line 139
    .line 140
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    if-eqz v1, :cond_1

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eq v1, v3, :cond_2

    .line 149
    .line 150
    :cond_1
    const/16 v1, 0x40

    .line 151
    .line 152
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    invoke-virtual {v1, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    iput-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 169
    .line 170
    :cond_2
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 171
    .line 172
    invoke-virtual {v1, v7}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 173
    .line 174
    .line 175
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 176
    .line 177
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 178
    .line 179
    .line 180
    iget v12, v0, Ll/wej;->positionHandle:I

    .line 181
    .line 182
    const/16 v16, 0x8

    .line 183
    .line 184
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBuffer:Ljava/nio/FloatBuffer;

    .line 185
    .line 186
    const/4 v13, 0x2

    .line 187
    const/16 v14, 0x1406

    .line 188
    .line 189
    const/4 v15, 0x0

    .line 190
    move-object/from16 v17, v1

    .line 191
    .line 192
    invoke-static/range {v12 .. v17}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 193
    .line 194
    .line 195
    iget v1, v0, Ll/wej;->positionHandle:I

    .line 196
    .line 197
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 198
    .line 199
    .line 200
    invoke-static {v4}, Landroid/opengl/GLES20;->glLineWidth(F)V

    .line 201
    .line 202
    .line 203
    invoke-static {v6, v2, v11}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 204
    .line 205
    .line 206
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace68:Ljava/nio/FloatBuffer;

    .line 207
    .line 208
    iget-object v3, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos68:[[F

    .line 209
    .line 210
    invoke-direct {v0, v1, v3}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->putDataToFloatBuffer(Ljava/nio/FloatBuffer;[[F)Ljava/nio/FloatBuffer;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    iput-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace68:Ljava/nio/FloatBuffer;

    .line 215
    .line 216
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace96:Ljava/nio/FloatBuffer;

    .line 217
    .line 218
    iget-object v3, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos96:[[F

    .line 219
    .line 220
    invoke-direct {v0, v1, v3}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->putDataToFloatBuffer(Ljava/nio/FloatBuffer;[[F)Ljava/nio/FloatBuffer;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    iput-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace96:Ljava/nio/FloatBuffer;

    .line 225
    .line 226
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace104:Ljava/nio/FloatBuffer;

    .line 227
    .line 228
    iget-object v3, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos104:[[F

    .line 229
    .line 230
    invoke-direct {v0, v1, v3}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->putDataToFloatBuffer(Ljava/nio/FloatBuffer;[[F)Ljava/nio/FloatBuffer;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    iput-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace104:Ljava/nio/FloatBuffer;

    .line 235
    .line 236
    iget-object v1, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace222:Ljava/nio/FloatBuffer;

    .line 237
    .line 238
    iget-object v3, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->facePos222:[[F

    .line 239
    .line 240
    invoke-direct {v0, v1, v3}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->putDataToFloatBuffer(Ljava/nio/FloatBuffer;[[F)Ljava/nio/FloatBuffer;

    .line 241
    .line 242
    .line 243
    move-result-object v15

    .line 244
    iput-object v15, v0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->floatBufFace222:Ljava/nio/FloatBuffer;

    .line 245
    .line 246
    iget v10, v0, Ll/wej;->positionHandle:I

    .line 247
    .line 248
    const/4 v13, 0x0

    .line 249
    const/16 v14, 0x8

    .line 250
    .line 251
    const/4 v11, 0x2

    .line 252
    const/16 v12, 0x1406

    .line 253
    .line 254
    invoke-static/range {v10 .. v15}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 255
    .line 256
    .line 257
    iget v1, v0, Ll/wej;->positionHandle:I

    .line 258
    .line 259
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v15}, Ljava/nio/Buffer;->capacity()I

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    div-int/2addr v1, v9

    .line 267
    invoke-static {v2, v2, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 268
    .line 269
    .line 270
    invoke-virtual {v0}, Ll/wej;->disableDrawArray()V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_3
    :goto_0
    const-string v0, "mediaRender"

    .line 275
    .line 276
    const-string v1, "Render no face!"

    .line 277
    .line 278
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform int color;\nvarying vec2 textureCoordinate;\nvoid main(){\n if(color == 1){   gl_FragColor = texture2D(inputImageTexture0,textureCoordinate);\n }else{   gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);\n }}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nvoid main() {\n  textureCoordinate = inputTextureCoordinate;\n gl_PointSize = 3.0;   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/wej;->programHandle:I

    .line 5
    .line 6
    const-string v1, "color"

    .line 7
    .line 8
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->colorHandle:I

    .line 13
    .line 14
    return-void
.end method

.method public passShaderValues()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->colorHandle:I

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/omw;->k()[[F

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    array-length v1, v0

    .line 10
    if-lez v1, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    aget-object v0, v0, v1

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->faceRec:[F

    .line 18
    .line 19
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/beauty/DrawFaceFilter;->updateFaceInfo(Ll/omw;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method
