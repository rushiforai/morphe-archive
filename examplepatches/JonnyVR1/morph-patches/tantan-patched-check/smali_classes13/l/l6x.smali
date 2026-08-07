.class public Ll/l6x;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:Ljava/nio/FloatBuffer;

.field public c:[F

.field public final d:[F

.field protected e:[F

.field public f:F

.field public g:F

.field public h:Ljava/lang/Object;

.field public i:Ljava/nio/FloatBuffer;

.field public j:Ll/gfj;

.field public k:Ll/gfj;

.field public l:Ll/ehq0;

.field m:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[F>;"
        }
    .end annotation
.end field

.field private n:Z


# direct methods
.method public constructor <init>(Ll/ehq0;Ll/gfj;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    const/16 v2, 0x10

    .line 9
    .line 10
    new-array v3, v2, [F

    .line 11
    .line 12
    iput-object v3, v0, Ll/l6x;->d:[F

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    iput v4, v0, Ll/l6x;->f:F

    .line 16
    .line 17
    iput v4, v0, Ll/l6x;->g:F

    .line 18
    .line 19
    new-instance v5, Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v5, v0, Ll/l6x;->h:Ljava/lang/Object;

    .line 25
    .line 26
    new-instance v5, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v5}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iput-object v5, v0, Ll/l6x;->m:Ljava/util/List;

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    iput-boolean v5, v0, Ll/l6x;->n:Z

    .line 39
    .line 40
    move-object/from16 v6, p2

    .line 41
    .line 42
    iput-object v6, v0, Ll/l6x;->j:Ll/gfj;

    .line 43
    .line 44
    iput-object v1, v0, Ll/l6x;->l:Ll/ehq0;

    .line 45
    .line 46
    iget v6, v1, Ll/ehq0;->b:F

    .line 47
    .line 48
    iget v7, v1, Ll/ehq0;->a:F

    .line 49
    .line 50
    div-float/2addr v6, v7

    .line 51
    iput v6, v0, Ll/l6x;->a:F

    .line 52
    .line 53
    const/high16 v7, 0x3f000000    # 0.5f

    .line 54
    .line 55
    mul-float v8, v6, v7

    .line 56
    .line 57
    const/high16 v9, -0x41000000    # -0.5f

    .line 58
    .line 59
    mul-float v10, v9, v6

    .line 60
    .line 61
    mul-float v11, v9, v6

    .line 62
    .line 63
    mul-float/2addr v6, v7

    .line 64
    const/16 v12, 0x8

    .line 65
    .line 66
    new-array v13, v12, [F

    .line 67
    .line 68
    aput v9, v13, v5

    .line 69
    .line 70
    const/4 v14, 0x1

    .line 71
    aput v8, v13, v14

    .line 72
    .line 73
    const/4 v8, 0x2

    .line 74
    aput v9, v13, v8

    .line 75
    .line 76
    const/4 v15, 0x3

    .line 77
    aput v10, v13, v15

    .line 78
    .line 79
    const/4 v10, 0x4

    .line 80
    aput v7, v13, v10

    .line 81
    .line 82
    const/16 v16, 0x5

    .line 83
    .line 84
    aput v11, v13, v16

    .line 85
    .line 86
    const/4 v11, 0x6

    .line 87
    aput v7, v13, v11

    .line 88
    .line 89
    const/16 v17, 0x7

    .line 90
    .line 91
    aput v6, v13, v17

    .line 92
    .line 93
    const/16 v6, 0x20

    .line 94
    .line 95
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    move/from16 v18, v4

    .line 100
    .line 101
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v6, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 109
    .line 110
    .line 111
    move-result-object v4

    .line 112
    iput-object v4, v0, Ll/l6x;->b:Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    invoke-virtual {v4, v13}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 115
    .line 116
    .line 117
    iget-object v4, v0, Ll/l6x;->b:Ljava/nio/FloatBuffer;

    .line 118
    .line 119
    invoke-virtual {v4, v5}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 120
    .line 121
    .line 122
    iget v4, v0, Ll/l6x;->a:F

    .line 123
    .line 124
    mul-float v6, v4, v7

    .line 125
    .line 126
    mul-float v13, v9, v4

    .line 127
    .line 128
    mul-float v19, v9, v4

    .line 129
    .line 130
    mul-float/2addr v4, v7

    .line 131
    new-array v2, v2, [F

    .line 132
    .line 133
    aput v9, v2, v5

    .line 134
    .line 135
    aput v6, v2, v14

    .line 136
    .line 137
    aput v18, v2, v8

    .line 138
    .line 139
    const/high16 v6, 0x3f800000    # 1.0f

    .line 140
    .line 141
    aput v6, v2, v15

    .line 142
    .line 143
    aput v9, v2, v10

    .line 144
    .line 145
    aput v13, v2, v16

    .line 146
    .line 147
    aput v18, v2, v11

    .line 148
    .line 149
    aput v6, v2, v17

    .line 150
    .line 151
    aput v7, v2, v12

    .line 152
    .line 153
    const/16 v8, 0x9

    .line 154
    .line 155
    aput v19, v2, v8

    .line 156
    .line 157
    const/16 v8, 0xa

    .line 158
    .line 159
    aput v18, v2, v8

    .line 160
    .line 161
    const/16 v8, 0xb

    .line 162
    .line 163
    aput v6, v2, v8

    .line 164
    .line 165
    const/16 v8, 0xc

    .line 166
    .line 167
    aput v7, v2, v8

    .line 168
    .line 169
    const/16 v7, 0xd

    .line 170
    .line 171
    aput v4, v2, v7

    .line 172
    .line 173
    const/16 v4, 0xe

    .line 174
    .line 175
    aput v18, v2, v4

    .line 176
    .line 177
    const/16 v4, 0xf

    .line 178
    .line 179
    aput v6, v2, v4

    .line 180
    .line 181
    iput-object v2, v0, Ll/l6x;->c:[F

    .line 182
    .line 183
    invoke-static {v3, v5}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 184
    .line 185
    .line 186
    const/high16 v2, -0x40800000    # -1.0f

    .line 187
    .line 188
    aput v2, v3, v5

    .line 189
    .line 190
    iget v2, v1, Ll/ehq0;->a:F

    .line 191
    .line 192
    iput v2, v0, Ll/l6x;->f:F

    .line 193
    .line 194
    iget v1, v1, Ll/ehq0;->b:F

    .line 195
    .line 196
    iput v1, v0, Ll/l6x;->g:F

    .line 197
    .line 198
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6x;->j:Ll/gfj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->destroy()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/l6x;->k:Ll/gfj;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/gfj;->destroy()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public b()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6x;->h:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6x;->k:Ll/gfj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/gfj;->getTextOutID()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    iget-object p0, p0, Ll/l6x;->j:Ll/gfj;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, -0x1

    .line 20
    return p0
.end method

.method public d(Ll/ehq0;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iput-object v1, v0, Ll/l6x;->l:Ll/ehq0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    iput-boolean v2, v0, Ll/l6x;->n:Z

    .line 9
    .line 10
    iget v3, v1, Ll/ehq0;->b:F

    .line 11
    .line 12
    iget v1, v1, Ll/ehq0;->a:F

    .line 13
    .line 14
    div-float/2addr v3, v1

    .line 15
    iput v3, v0, Ll/l6x;->a:F

    .line 16
    .line 17
    const/high16 v1, 0x3f000000    # 0.5f

    .line 18
    .line 19
    mul-float v4, v3, v1

    .line 20
    .line 21
    const/high16 v5, -0x41000000    # -0.5f

    .line 22
    .line 23
    mul-float v6, v5, v3

    .line 24
    .line 25
    mul-float v7, v5, v3

    .line 26
    .line 27
    mul-float/2addr v3, v1

    .line 28
    const/16 v8, 0x8

    .line 29
    .line 30
    new-array v9, v8, [F

    .line 31
    .line 32
    aput v5, v9, v2

    .line 33
    .line 34
    const/4 v10, 0x1

    .line 35
    aput v4, v9, v10

    .line 36
    .line 37
    const/4 v4, 0x2

    .line 38
    aput v5, v9, v4

    .line 39
    .line 40
    const/4 v11, 0x3

    .line 41
    aput v6, v9, v11

    .line 42
    .line 43
    const/4 v6, 0x4

    .line 44
    aput v1, v9, v6

    .line 45
    .line 46
    const/4 v12, 0x5

    .line 47
    aput v7, v9, v12

    .line 48
    .line 49
    const/4 v7, 0x6

    .line 50
    aput v1, v9, v7

    .line 51
    .line 52
    const/4 v13, 0x7

    .line 53
    aput v3, v9, v13

    .line 54
    .line 55
    const/16 v3, 0x20

    .line 56
    .line 57
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 62
    .line 63
    .line 64
    move-result-object v14

    .line 65
    invoke-virtual {v3, v14}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iput-object v3, v0, Ll/l6x;->b:Ljava/nio/FloatBuffer;

    .line 73
    .line 74
    invoke-virtual {v3, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 75
    .line 76
    .line 77
    iget-object v3, v0, Ll/l6x;->b:Ljava/nio/FloatBuffer;

    .line 78
    .line 79
    invoke-virtual {v3, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 80
    .line 81
    .line 82
    iget v3, v0, Ll/l6x;->a:F

    .line 83
    .line 84
    mul-float v9, v3, v1

    .line 85
    .line 86
    mul-float v14, v5, v3

    .line 87
    .line 88
    mul-float v15, v5, v3

    .line 89
    .line 90
    mul-float/2addr v3, v1

    .line 91
    move/from16 p1, v1

    .line 92
    .line 93
    const/16 v1, 0x10

    .line 94
    .line 95
    new-array v1, v1, [F

    .line 96
    .line 97
    aput v5, v1, v2

    .line 98
    .line 99
    aput v9, v1, v10

    .line 100
    .line 101
    const/4 v9, 0x0

    .line 102
    aput v9, v1, v4

    .line 103
    .line 104
    const/high16 v4, 0x3f800000    # 1.0f

    .line 105
    .line 106
    aput v4, v1, v11

    .line 107
    .line 108
    aput v5, v1, v6

    .line 109
    .line 110
    aput v14, v1, v12

    .line 111
    .line 112
    aput v9, v1, v7

    .line 113
    .line 114
    aput v4, v1, v13

    .line 115
    .line 116
    aput p1, v1, v8

    .line 117
    .line 118
    const/16 v5, 0x9

    .line 119
    .line 120
    aput v15, v1, v5

    .line 121
    .line 122
    const/16 v5, 0xa

    .line 123
    .line 124
    aput v9, v1, v5

    .line 125
    .line 126
    const/16 v5, 0xb

    .line 127
    .line 128
    aput v4, v1, v5

    .line 129
    .line 130
    const/16 v5, 0xc

    .line 131
    .line 132
    aput p1, v1, v5

    .line 133
    .line 134
    const/16 v5, 0xd

    .line 135
    .line 136
    aput v3, v1, v5

    .line 137
    .line 138
    const/16 v3, 0xe

    .line 139
    .line 140
    aput v9, v1, v3

    .line 141
    .line 142
    const/16 v3, 0xf

    .line 143
    .line 144
    aput v4, v1, v3

    .line 145
    .line 146
    iput-object v1, v0, Ll/l6x;->c:[F

    .line 147
    .line 148
    iget-object v1, v0, Ll/l6x;->d:[F

    .line 149
    .line 150
    invoke-static {v1, v2}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 151
    .line 152
    .line 153
    iget-object v1, v0, Ll/l6x;->d:[F

    .line 154
    .line 155
    const/high16 v3, -0x40800000    # -1.0f

    .line 156
    .line 157
    aput v3, v1, v2

    .line 158
    .line 159
    iget-object v1, v0, Ll/l6x;->l:Ll/ehq0;

    .line 160
    .line 161
    iget v2, v1, Ll/ehq0;->a:F

    .line 162
    .line 163
    iput v2, v0, Ll/l6x;->f:F

    .line 164
    .line 165
    iget v1, v1, Ll/ehq0;->b:F

    .line 166
    .line 167
    iput v1, v0, Ll/l6x;->g:F

    .line 168
    .line 169
    return-void
.end method

.method public e(FFLandroid/graphics/PointF;F)V
    .locals 10

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget v0, p3, Landroid/graphics/PointF;->x:F

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float/2addr v0, v1

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    sub-float/2addr v0, v2

    .line 12
    neg-float v0, v0

    .line 13
    iget p3, p3, Landroid/graphics/PointF;->y:F

    .line 14
    .line 15
    neg-float p3, p3

    .line 16
    mul-float/2addr p3, v1

    .line 17
    add-float/2addr p3, v2

    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    new-array v3, v1, [F

    .line 21
    .line 22
    new-array v1, v1, [F

    .line 23
    .line 24
    const/4 v9, 0x0

    .line 25
    invoke-static {v1, v9}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    .line 26
    .line 27
    .line 28
    neg-float v0, v0

    .line 29
    const/4 v4, 0x0

    .line 30
    invoke-static {v1, v9, v0, p3, v4}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    .line 31
    .line 32
    .line 33
    iget-object v5, p0, Ll/l6x;->d:[F

    .line 34
    .line 35
    iget-object v7, p0, Ll/l6x;->e:[F

    .line 36
    .line 37
    const/4 v8, 0x0

    .line 38
    const/4 v4, 0x0

    .line 39
    const/4 v6, 0x0

    .line 40
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 41
    .line 42
    .line 43
    move-object v7, v3

    .line 44
    move-object v5, v1

    .line 45
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 46
    .line 47
    .line 48
    move-object p3, v5

    .line 49
    const/4 v7, 0x0

    .line 50
    const/high16 v8, 0x3f800000    # 1.0f

    .line 51
    .line 52
    const/4 v6, 0x0

    .line 53
    move v5, p4

    .line 54
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    .line 55
    .line 56
    .line 57
    mul-float/2addr p1, v2

    .line 58
    mul-float/2addr p2, v2

    .line 59
    invoke-static {v3, v9, p1, p2, v2}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v7, p0, Ll/l6x;->c:[F

    .line 63
    .line 64
    const/4 v8, 0x0

    .line 65
    const/4 v6, 0x0

    .line 66
    move-object v5, v3

    .line 67
    move-object v3, p3

    .line 68
    invoke-static/range {v3 .. v8}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    .line 69
    .line 70
    .line 71
    aget p1, p3, v9

    .line 72
    .line 73
    const/4 p2, 0x1

    .line 74
    aget p4, p3, p2

    .line 75
    .line 76
    const/4 v0, 0x4

    .line 77
    aget v1, p3, v0

    .line 78
    .line 79
    const/4 v2, 0x5

    .line 80
    aget v3, p3, v2

    .line 81
    .line 82
    const/16 v4, 0x8

    .line 83
    .line 84
    aget v5, p3, v4

    .line 85
    .line 86
    const/16 v6, 0x9

    .line 87
    .line 88
    aget v6, p3, v6

    .line 89
    .line 90
    const/16 v7, 0xc

    .line 91
    .line 92
    aget v7, p3, v7

    .line 93
    .line 94
    const/16 v8, 0xd

    .line 95
    .line 96
    aget p3, p3, v8

    .line 97
    .line 98
    new-array v4, v4, [F

    .line 99
    .line 100
    aput p1, v4, v9

    .line 101
    .line 102
    aput p4, v4, p2

    .line 103
    .line 104
    const/4 p1, 0x2

    .line 105
    aput v1, v4, p1

    .line 106
    .line 107
    const/4 p1, 0x3

    .line 108
    aput v3, v4, p1

    .line 109
    .line 110
    aput v5, v4, v0

    .line 111
    .line 112
    aput v6, v4, v2

    .line 113
    .line 114
    const/4 p1, 0x6

    .line 115
    aput v7, v4, p1

    .line 116
    .line 117
    const/4 p1, 0x7

    .line 118
    aput p3, v4, p1

    .line 119
    .line 120
    iget-object p1, p0, Ll/l6x;->m:Ljava/util/List;

    .line 121
    .line 122
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Ll/l6x;->m:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public f([F)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l6x;->e:[F

    .line 2
    .line 3
    return-void
.end method

.method public g()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/l6x;->l:Ll/ehq0;

    .line 2
    .line 3
    iget v1, v0, Ll/ehq0;->e:F

    .line 4
    .line 5
    iget v0, v0, Ll/ehq0;->f:F

    .line 6
    .line 7
    new-instance v2, Landroid/graphics/PointF;

    .line 8
    .line 9
    iget-object v3, p0, Ll/l6x;->l:Ll/ehq0;

    .line 10
    .line 11
    iget v4, v3, Ll/ehq0;->c:F

    .line 12
    .line 13
    iget v3, v3, Ll/ehq0;->d:F

    .line 14
    .line 15
    invoke-direct {v2, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/l6x;->l:Ll/ehq0;

    .line 19
    .line 20
    iget v3, v3, Ll/ehq0;->g:F

    .line 21
    .line 22
    invoke-virtual {p0, v1, v0, v2, v3}, Ll/l6x;->e(FFLandroid/graphics/PointF;F)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
