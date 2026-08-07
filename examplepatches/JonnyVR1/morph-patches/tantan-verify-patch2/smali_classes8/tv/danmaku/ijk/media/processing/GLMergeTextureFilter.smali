.class public Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field private A:[Ljava/nio/FloatBuffer;

.field private B:[F

.field private C:[F

.field private D:[F

.field private E:[F

.field private final E0:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private F:Z

.field private final F0:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private G:I

.field private H:I

.field private I:I

.field private J:I

.field private K:Z

.field private L:I

.field private M:I

.field private N:F

.field private O:I

.field private P:I

.field private Q:F

.field private R:F

.field private S:Z

.field private T:[I

.field private U:Z

.field private V:Z

.field private W:I

.field private X:I

.field protected Y:Ll/qnw;

.field private Z:I

.field private a:Ll/pej;

.field private b:I

.field private c:I

.field protected d:[I

.field protected e:[I

.field protected f:[I

.field protected g:[I

.field protected i:[I

.field protected j:[I

.field protected k:[Ll/qnw;

.field private k0:Landroid/graphics/SurfaceTexture;

.field protected l:[Landroid/graphics/Bitmap;

.field protected m:[I

.field protected n:[Landroid/graphics/SurfaceTexture;

.field protected o:[Z

.field protected p:[I

.field private p0:I

.field protected q:[I

.field protected r:[I

.field protected s:[I

.field protected t:[J

.field protected u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

.field protected v:[I

.field protected x:I

.field protected y:I

.field private z:I


# direct methods
.method private B2(I)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "swap(S): s0Pos["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aget v1, v1, v2

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ","

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 22
    .line 23
    aget v3, v3, v2

    .line 24
    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 32
    .line 33
    aget v3, v3, v2

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 42
    .line 43
    aget v3, v3, v2

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v3, "]--->s"

    .line 49
    .line 50
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v3, "Pos["

    .line 57
    .line 58
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 62
    .line 63
    aget v3, v3, p1

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 72
    .line 73
    aget v3, v3, p1

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 82
    .line 83
    aget v3, v3, p1

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 92
    .line 93
    aget v1, v1, p1

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v1, "], fsi:"

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v1, ", svn:"

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v1, "mergeFilter"

    .line 123
    .line 124
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 128
    .line 129
    aget v1, v0, v2

    .line 130
    .line 131
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 132
    .line 133
    aget v4, v3, v2

    .line 134
    .line 135
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 136
    .line 137
    aget v6, v5, v2

    .line 138
    .line 139
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 140
    .line 141
    aget v8, v7, v2

    .line 142
    .line 143
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 144
    .line 145
    aget v9, p0, v2

    .line 146
    .line 147
    aget v10, v0, p1

    .line 148
    .line 149
    aput v10, v0, v2

    .line 150
    .line 151
    aget v10, v3, p1

    .line 152
    .line 153
    aput v10, v3, v2

    .line 154
    .line 155
    aget v10, v5, p1

    .line 156
    .line 157
    aput v10, v5, v2

    .line 158
    .line 159
    aget v10, v7, p1

    .line 160
    .line 161
    aput v10, v7, v2

    .line 162
    .line 163
    aget v10, p0, p1

    .line 164
    .line 165
    aput v10, p0, v2

    .line 166
    .line 167
    aput v1, v0, p1

    .line 168
    .line 169
    aput v4, v3, p1

    .line 170
    .line 171
    aput v6, v5, p1

    .line 172
    .line 173
    aput v8, v7, p1

    .line 174
    .line 175
    aput v9, p0, p1

    .line 176
    .line 177
    return-void
.end method

.method public static synthetic Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Z:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Z:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k0:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k0:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->W:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p0:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 2
    .line 3
    sub-int/2addr v0, p1

    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 5
    .line 6
    return v0
.end method

.method public static synthetic a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->B2(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 2
    .line 3
    return p1
.end method

.method private drawIndeed()V
    .locals 9

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    const-string v1, "mergeFilter"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v2, "draw: "

    .line 14
    .line 15
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ll/wej;->texture_in:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ", "

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, "), FID:"

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 52
    .line 53
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 54
    .line 55
    if-ge v0, v2, :cond_8

    .line 56
    .line 57
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->J:I

    .line 58
    .line 59
    const/4 v2, 0x2

    .line 60
    const/4 v3, 0x1

    .line 61
    const/4 v4, 0x0

    .line 62
    if-ne v0, v2, :cond_1

    .line 63
    .line 64
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i2()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    goto :goto_0

    .line 69
    :cond_1
    if-ne v0, v3, :cond_2

    .line 70
    .line 71
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j2()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    goto :goto_0

    .line 76
    :cond_2
    move v0, v4

    .line 77
    :goto_0
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 78
    .line 79
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 80
    .line 81
    aget v5, v5, v6

    .line 82
    .line 83
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 84
    .line 85
    aget v7, v7, v6

    .line 86
    .line 87
    iget-object v8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 88
    .line 89
    aget v6, v8, v6

    .line 90
    .line 91
    invoke-static {v5, v0, v7, v6}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 92
    .line 93
    .line 94
    iget v0, p0, Ll/wej;->programHandle:I

    .line 95
    .line 96
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 97
    .line 98
    .line 99
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 100
    .line 101
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 102
    .line 103
    if-ne v0, v5, :cond_6

    .line 104
    .line 105
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->H:I

    .line 106
    .line 107
    const/16 v6, 0x4100

    .line 108
    .line 109
    if-eq v0, v2, :cond_5

    .line 110
    .line 111
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_3
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 117
    .line 118
    if-ne v0, v3, :cond_6

    .line 119
    .line 120
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 121
    .line 122
    aget v0, v0, v5

    .line 123
    .line 124
    if-nez v0, :cond_4

    .line 125
    .line 126
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 127
    .line 128
    aget v0, v0, v5

    .line 129
    .line 130
    if-nez v0, :cond_4

    .line 131
    .line 132
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 133
    .line 134
    aget v0, v0, v5

    .line 135
    .line 136
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 137
    .line 138
    aget v1, v1, v5

    .line 139
    .line 140
    if-lt v0, v1, :cond_4

    .line 141
    .line 142
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 143
    .line 144
    aget v0, v0, v5

    .line 145
    .line 146
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 147
    .line 148
    aget v1, v1, v5

    .line 149
    .line 150
    if-ge v0, v1, :cond_6

    .line 151
    .line 152
    :cond_4
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 165
    .line 166
    .line 167
    move-result v5

    .line 168
    invoke-static {v0, v1, v2, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 169
    .line 170
    .line 171
    invoke-static {v6}, Landroid/opengl/GLES20;->glClear(I)V

    .line 172
    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_5
    :goto_1
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 180
    .line 181
    .line 182
    move-result v2

    .line 183
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 184
    .line 185
    .line 186
    move-result v5

    .line 187
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    invoke-static {v0, v2, v5, v7}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 192
    .line 193
    .line 194
    invoke-static {v6}, Landroid/opengl/GLES20;->glClear(I)V

    .line 195
    .line 196
    .line 197
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 198
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    const-string v2, "----drawIndeed: Clean="

    .line 202
    .line 203
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 207
    .line 208
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    const-string v2, ";"

    .line 212
    .line 213
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 217
    .line 218
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    :cond_6
    :goto_2
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->passShaderValues()V

    .line 229
    .line 230
    .line 231
    const/4 v0, 0x5

    .line 232
    const/4 v1, 0x4

    .line 233
    invoke-static {v0, v4, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 234
    .line 235
    .line 236
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 237
    .line 238
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 242
    .line 243
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 244
    .line 245
    aget v1, v0, p0

    .line 246
    .line 247
    if-nez v1, :cond_7

    .line 248
    .line 249
    aput v3, v0, p0

    .line 250
    .line 251
    :cond_7
    return-void

    .line 252
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    const-string v2, "currence ID["

    .line 255
    .line 256
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 260
    .line 261
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v2, "]>"

    .line 265
    .line 266
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 270
    .line 271
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    .line 280
    .line 281
    return-void
.end method

.method private f2(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 2
    .line 3
    aget v0, v0, p1

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-eq v0, v1, :cond_b

    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 9
    .line 10
    aget v0, v0, p1

    .line 11
    .line 12
    if-eq v0, v1, :cond_b

    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 15
    .line 16
    aget v0, v0, p1

    .line 17
    .line 18
    if-eq v0, v1, :cond_b

    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 21
    .line 22
    aget v0, v0, p1

    .line 23
    .line 24
    if-ne v0, v1, :cond_0

    .line 25
    .line 26
    goto/16 :goto_6

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 29
    .line 30
    aget-object v2, v0, p1

    .line 31
    .line 32
    const/16 v3, 0x9

    .line 33
    .line 34
    const/4 v4, 0x3

    .line 35
    const/4 v5, 0x7

    .line 36
    const/4 v6, 0x2

    .line 37
    if-nez v2, :cond_6

    .line 38
    .line 39
    new-instance v2, Ll/qnw;

    .line 40
    .line 41
    invoke-direct {v2}, Ll/qnw;-><init>()V

    .line 42
    .line 43
    .line 44
    aput-object v2, v0, p1

    .line 45
    .line 46
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 47
    .line 48
    aget v0, v0, p1

    .line 49
    .line 50
    if-ne v0, v5, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 53
    .line 54
    aget-object v0, v0, p1

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    invoke-virtual {v0, v2}, Ll/qnw;->setOESMode(Z)V

    .line 58
    .line 59
    .line 60
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 61
    .line 62
    aget-object v0, v0, p1

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/qnw;->initWithGLContext()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 68
    .line 69
    aget v0, v0, p1

    .line 70
    .line 71
    if-eq v0, v1, :cond_5

    .line 72
    .line 73
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 74
    .line 75
    aget v2, v2, p1

    .line 76
    .line 77
    if-eq v2, v1, :cond_5

    .line 78
    .line 79
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 80
    .line 81
    aget v1, v1, p1

    .line 82
    .line 83
    if-eq v1, v6, :cond_3

    .line 84
    .line 85
    if-eq v1, v4, :cond_3

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 91
    .line 92
    aget-object v1, v1, p1

    .line 93
    .line 94
    invoke-virtual {v1, v2, v0}, Ll/qnw;->setRenderSize(II)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_3
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 99
    .line 100
    aget-object v1, v1, p1

    .line 101
    .line 102
    invoke-virtual {v1, v2, v0, v6}, Ll/qnw;->setDisplayMode(III)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 106
    .line 107
    aget-object v0, v0, p1

    .line 108
    .line 109
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 110
    .line 111
    aget v1, v1, p1

    .line 112
    .line 113
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 114
    .line 115
    aget v2, v2, p1

    .line 116
    .line 117
    invoke-virtual {v0, v1, v2}, Ll/qnw;->setRenderSize(II)V

    .line 118
    .line 119
    .line 120
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 121
    .line 122
    aget v0, v0, p1

    .line 123
    .line 124
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 125
    .line 126
    if-ne v0, v5, :cond_4

    .line 127
    .line 128
    aget-object v0, v1, p1

    .line 129
    .line 130
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 131
    .line 132
    aget-object v1, v1, p1

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 135
    .line 136
    .line 137
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 138
    .line 139
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 140
    .line 141
    aget-object v1, v1, p1

    .line 142
    .line 143
    invoke-virtual {v1}, Ll/qnw;->getBitmapTextureID()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    aput v1, v0, p1

    .line 148
    .line 149
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 150
    .line 151
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 152
    .line 153
    aget-object v1, v1, p1

    .line 154
    .line 155
    invoke-virtual {v1}, Ll/qnw;->getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    aput-object v1, v0, p1

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_4
    aget-object v0, v1, p1

    .line 163
    .line 164
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 165
    .line 166
    aget v1, v1, p1

    .line 167
    .line 168
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 169
    .line 170
    aget-object v2, v2, p1

    .line 171
    .line 172
    invoke-virtual {v0, v1, v2}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 173
    .line 174
    .line 175
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 176
    .line 177
    aget-object v0, v0, p1

    .line 178
    .line 179
    invoke-virtual {v0}, Ll/qnw;->drawFrame()V

    .line 180
    .line 181
    .line 182
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 186
    .line 187
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 188
    .line 189
    aget-object p0, p0, p1

    .line 190
    .line 191
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    aput p0, v0, p1

    .line 196
    .line 197
    return-void

    .line 198
    :cond_5
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 199
    .line 200
    aput v1, p0, p1

    .line 201
    .line 202
    return-void

    .line 203
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 204
    .line 205
    aget v0, v0, p1

    .line 206
    .line 207
    if-eq v0, v1, :cond_a

    .line 208
    .line 209
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 210
    .line 211
    aget v0, v0, p1

    .line 212
    .line 213
    if-eq v0, v1, :cond_a

    .line 214
    .line 215
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 216
    .line 217
    aget v0, v0, p1

    .line 218
    .line 219
    if-ne v0, v5, :cond_7

    .line 220
    .line 221
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 222
    .line 223
    aget-object v0, v0, p1

    .line 224
    .line 225
    invoke-virtual {v2, v0}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 229
    .line 230
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 231
    .line 232
    aget-object v1, v1, p1

    .line 233
    .line 234
    invoke-virtual {v1}, Ll/qnw;->getBitmapTextureID()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    aput v1, v0, p1

    .line 239
    .line 240
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 241
    .line 242
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 243
    .line 244
    aget-object v1, v1, p1

    .line 245
    .line 246
    invoke-virtual {v1}, Ll/qnw;->getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    aput-object v1, v0, p1

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 254
    .line 255
    aget v0, v0, p1

    .line 256
    .line 257
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 258
    .line 259
    aget-object v1, v1, p1

    .line 260
    .line 261
    invoke-virtual {v2, v0, v1}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 262
    .line 263
    .line 264
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 265
    .line 266
    aget v0, v0, p1

    .line 267
    .line 268
    if-eq v0, v6, :cond_9

    .line 269
    .line 270
    if-eq v0, v4, :cond_9

    .line 271
    .line 272
    if-ne v0, v3, :cond_8

    .line 273
    .line 274
    goto :goto_4

    .line 275
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 276
    .line 277
    aget-object v0, v0, p1

    .line 278
    .line 279
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 280
    .line 281
    aget v1, v1, p1

    .line 282
    .line 283
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 284
    .line 285
    aget v2, v2, p1

    .line 286
    .line 287
    invoke-virtual {v0, v1, v2}, Ll/qnw;->setRenderSize(II)V

    .line 288
    .line 289
    .line 290
    goto :goto_5

    .line 291
    :cond_9
    :goto_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 292
    .line 293
    aget-object v0, v0, p1

    .line 294
    .line 295
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 296
    .line 297
    aget v1, v1, p1

    .line 298
    .line 299
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 300
    .line 301
    aget v2, v2, p1

    .line 302
    .line 303
    invoke-virtual {v0, v1, v2, v6}, Ll/qnw;->setDisplayMode(III)V

    .line 304
    .line 305
    .line 306
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 307
    .line 308
    aget-object v0, v0, p1

    .line 309
    .line 310
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 311
    .line 312
    aget v1, v1, p1

    .line 313
    .line 314
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 315
    .line 316
    aget v2, v2, p1

    .line 317
    .line 318
    invoke-virtual {v0, v1, v2}, Ll/qnw;->setRenderSize(II)V

    .line 319
    .line 320
    .line 321
    :goto_5
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 322
    .line 323
    aget-object v0, v0, p1

    .line 324
    .line 325
    invoke-virtual {v0}, Ll/qnw;->drawFrame()V

    .line 326
    .line 327
    .line 328
    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    .line 329
    .line 330
    .line 331
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 332
    .line 333
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 334
    .line 335
    aget-object p0, p0, p1

    .line 336
    .line 337
    invoke-virtual {p0}, Ll/gfj;->getTextOutID()I

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    aput p0, v0, p1

    .line 342
    .line 343
    return-void

    .line 344
    :cond_a
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 345
    .line 346
    aput v1, p0, p1

    .line 347
    .line 348
    return-void

    .line 349
    :cond_b
    :goto_6
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 350
    .line 351
    aput v1, p0, p1

    .line 352
    .line 353
    return-void
.end method

.method private g2(IIF)V
    .locals 7

    .line 1
    int-to-float v0, p2

    .line 2
    div-float v1, v0, p3

    .line 3
    .line 4
    float-to-int v1, v1

    .line 5
    int-to-float v2, p1

    .line 6
    mul-float/2addr p3, v2

    .line 7
    float-to-int p3, p3

    .line 8
    const/4 v3, 0x0

    .line 9
    const/high16 v4, 0x3f000000    # 0.5f

    .line 10
    .line 11
    const/high16 v5, 0x3f800000    # 1.0f

    .line 12
    .line 13
    if-ge v1, p1, :cond_0

    .line 14
    .line 15
    sub-int/2addr p1, v1

    .line 16
    int-to-float p1, p1

    .line 17
    mul-float/2addr p1, v4

    .line 18
    div-float/2addr p1, v2

    .line 19
    sub-float p2, v5, p1

    .line 20
    .line 21
    move v6, v3

    .line 22
    move v3, p1

    .line 23
    move p1, v6

    .line 24
    move v6, v5

    .line 25
    move v5, p2

    .line 26
    move p2, v6

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    sub-int/2addr p2, p3

    .line 29
    int-to-float p1, p2

    .line 30
    mul-float/2addr p1, v4

    .line 31
    div-float/2addr p1, v0

    .line 32
    sub-float p2, v5, p1

    .line 33
    .line 34
    :goto_0
    invoke-direct {p0, v3, v5, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private h2(IIII)V
    .locals 4

    .line 1
    mul-int v0, p1, p4

    .line 2
    .line 3
    div-int/2addr v0, p3

    .line 4
    mul-int/2addr p3, p2

    .line 5
    div-int/2addr p3, p4

    .line 6
    const/4 p4, 0x0

    .line 7
    const/high16 v1, 0x3f000000    # 0.5f

    .line 8
    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-gt p3, p1, :cond_0

    .line 12
    .line 13
    sub-int p2, p1, p3

    .line 14
    .line 15
    int-to-float p2, p2

    .line 16
    mul-float/2addr p2, v1

    .line 17
    int-to-float p1, p1

    .line 18
    div-float/2addr p2, p1

    .line 19
    sub-float p1, v2, p2

    .line 20
    .line 21
    move v3, v2

    .line 22
    move v2, p1

    .line 23
    move p1, p4

    .line 24
    move p4, p2

    .line 25
    move p2, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sub-int p1, p2, v0

    .line 28
    .line 29
    int-to-float p1, p1

    .line 30
    mul-float/2addr p1, v1

    .line 31
    int-to-float p2, p2

    .line 32
    div-float/2addr p1, p2

    .line 33
    sub-float p2, v2, p1

    .line 34
    .line 35
    :goto_0
    invoke-direct {p0, p4, v2, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private i2()I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q:F

    .line 3
    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R:F

    .line 5
    .line 6
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 7
    .line 8
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    const/high16 v4, 0x3f800000    # 1.0f

    .line 12
    .line 13
    if-ne v1, v2, :cond_3

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->H:I

    .line 18
    .line 19
    if-ne v2, v3, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 22
    .line 23
    aget v0, v0, v1

    .line 24
    .line 25
    int-to-float v0, v0

    .line 26
    mul-float/2addr v0, v4

    .line 27
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 28
    .line 29
    aget v2, v2, v1

    .line 30
    .line 31
    int-to-float v2, v2

    .line 32
    div-float/2addr v0, v2

    .line 33
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 34
    .line 35
    aget v2, v2, v1

    .line 36
    .line 37
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 38
    .line 39
    aget v1, v3, v1

    .line 40
    .line 41
    invoke-direct {p0, v2, v1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 42
    .line 43
    .line 44
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 45
    .line 46
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 47
    .line 48
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 49
    .line 50
    aget v1, v1, v2

    .line 51
    .line 52
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 53
    .line 54
    aget p0, p0, v2

    .line 55
    .line 56
    :goto_0
    add-int/2addr v1, p0

    .line 57
    sub-int/2addr v0, v1

    .line 58
    return v0

    .line 59
    :cond_0
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 63
    .line 64
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 65
    .line 66
    aget p0, v0, p0

    .line 67
    .line 68
    return p0

    .line 69
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 70
    .line 71
    aget v0, v0, v2

    .line 72
    .line 73
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 74
    .line 75
    const/4 v3, 0x1

    .line 76
    if-ne v0, v3, :cond_2

    .line 77
    .line 78
    aget v0, v1, v2

    .line 79
    .line 80
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 81
    .line 82
    aget v1, v1, v2

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->h2(IIII)V

    .line 93
    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    aget v0, v1, v2

    .line 97
    .line 98
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 99
    .line 100
    aget v1, v1, v2

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->h2(IIII)V

    .line 111
    .line 112
    .line 113
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 114
    .line 115
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 116
    .line 117
    aget p0, v0, p0

    .line 118
    .line 119
    return p0

    .line 120
    :cond_3
    if-nez v1, :cond_5

    .line 121
    .line 122
    if-eqz v2, :cond_5

    .line 123
    .line 124
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 125
    .line 126
    aget v2, v2, v1

    .line 127
    .line 128
    int-to-float v3, v2

    .line 129
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 130
    .line 131
    aget v5, v5, v1

    .line 132
    .line 133
    int-to-float v6, v5

    .line 134
    mul-float/2addr v6, v4

    .line 135
    div-float/2addr v3, v6

    .line 136
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 137
    .line 138
    aget v6, v6, v1

    .line 139
    .line 140
    int-to-float v6, v6

    .line 141
    mul-float/2addr v6, v4

    .line 142
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 143
    .line 144
    aget v1, v7, v1

    .line 145
    .line 146
    int-to-float v1, v1

    .line 147
    div-float/2addr v6, v1

    .line 148
    cmpl-float v1, v6, v3

    .line 149
    .line 150
    if-eqz v1, :cond_4

    .line 151
    .line 152
    invoke-direct {p0, v5, v2, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_4
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 157
    .line 158
    .line 159
    :goto_2
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 160
    .line 161
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 162
    .line 163
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 164
    .line 165
    aget v1, v1, v2

    .line 166
    .line 167
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 168
    .line 169
    aget p0, p0, v2

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_5
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 173
    .line 174
    aget v2, v2, v1

    .line 175
    .line 176
    if-eq v2, v3, :cond_8

    .line 177
    .line 178
    const/4 v3, 0x3

    .line 179
    if-eq v2, v3, :cond_8

    .line 180
    .line 181
    const/16 v3, 0x9

    .line 182
    .line 183
    if-ne v2, v3, :cond_6

    .line 184
    .line 185
    goto :goto_4

    .line 186
    :cond_6
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 187
    .line 188
    aget v2, v2, v1

    .line 189
    .line 190
    int-to-float v3, v2

    .line 191
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 192
    .line 193
    aget v5, v5, v1

    .line 194
    .line 195
    int-to-float v6, v5

    .line 196
    mul-float/2addr v6, v4

    .line 197
    div-float/2addr v3, v6

    .line 198
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 199
    .line 200
    aget v6, v6, v1

    .line 201
    .line 202
    int-to-float v6, v6

    .line 203
    mul-float/2addr v6, v4

    .line 204
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 205
    .line 206
    aget v1, v7, v1

    .line 207
    .line 208
    int-to-float v1, v1

    .line 209
    div-float/2addr v6, v1

    .line 210
    cmpl-float v1, v6, v3

    .line 211
    .line 212
    if-eqz v1, :cond_7

    .line 213
    .line 214
    invoke-direct {p0, v5, v2, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 215
    .line 216
    .line 217
    goto :goto_3

    .line 218
    :cond_7
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 219
    .line 220
    .line 221
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 222
    .line 223
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 224
    .line 225
    aget v0, v0, v1

    .line 226
    .line 227
    int-to-float v0, v0

    .line 228
    div-float v0, v4, v0

    .line 229
    .line 230
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q:F

    .line 231
    .line 232
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 233
    .line 234
    aget v0, v0, v1

    .line 235
    .line 236
    int-to-float v0, v0

    .line 237
    div-float/2addr v4, v0

    .line 238
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R:F

    .line 239
    .line 240
    goto :goto_5

    .line 241
    :cond_8
    :goto_4
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 242
    .line 243
    .line 244
    :goto_5
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 245
    .line 246
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 247
    .line 248
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 249
    .line 250
    aget v1, v1, v2

    .line 251
    .line 252
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 253
    .line 254
    aget p0, p0, v2

    .line 255
    .line 256
    goto/16 :goto_0
.end method

.method private j2()I
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q:F

    .line 3
    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R:F

    .line 5
    .line 6
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 7
    .line 8
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 9
    .line 10
    const/4 v3, 0x2

    .line 11
    const/high16 v4, 0x3f800000    # 1.0f

    .line 12
    .line 13
    if-ne v1, v2, :cond_4

    .line 14
    .line 15
    if-nez v1, :cond_2

    .line 16
    .line 17
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->H:I

    .line 18
    .line 19
    if-eq v2, v3, :cond_1

    .line 20
    .line 21
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 30
    .line 31
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 32
    .line 33
    aget p0, v0, p0

    .line 34
    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 37
    .line 38
    aget v0, v0, v1

    .line 39
    .line 40
    int-to-float v0, v0

    .line 41
    mul-float/2addr v0, v4

    .line 42
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 43
    .line 44
    aget v2, v2, v1

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    div-float/2addr v0, v2

    .line 48
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 49
    .line 50
    aget v2, v2, v1

    .line 51
    .line 52
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 53
    .line 54
    aget v1, v3, v1

    .line 55
    .line 56
    invoke-direct {p0, v2, v1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 57
    .line 58
    .line 59
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 60
    .line 61
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 62
    .line 63
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 64
    .line 65
    aget v1, v1, v2

    .line 66
    .line 67
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 68
    .line 69
    aget p0, p0, v2

    .line 70
    .line 71
    :goto_1
    add-int/2addr v1, p0

    .line 72
    sub-int/2addr v0, v1

    .line 73
    return v0

    .line 74
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 75
    .line 76
    aget v0, v0, v2

    .line 77
    .line 78
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 79
    .line 80
    const/4 v3, 0x1

    .line 81
    if-ne v0, v3, :cond_3

    .line 82
    .line 83
    aget v0, v1, v2

    .line 84
    .line 85
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 86
    .line 87
    aget v1, v1, v2

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->h2(IIII)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_3
    aget v0, v1, v2

    .line 102
    .line 103
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 104
    .line 105
    aget v1, v1, v2

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->h2(IIII)V

    .line 116
    .line 117
    .line 118
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 119
    .line 120
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 121
    .line 122
    aget p0, v0, p0

    .line 123
    .line 124
    return p0

    .line 125
    :cond_4
    if-nez v1, :cond_6

    .line 126
    .line 127
    if-eqz v2, :cond_6

    .line 128
    .line 129
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 130
    .line 131
    aget v2, v2, v1

    .line 132
    .line 133
    int-to-float v3, v2

    .line 134
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 135
    .line 136
    aget v5, v5, v1

    .line 137
    .line 138
    int-to-float v6, v5

    .line 139
    mul-float/2addr v6, v4

    .line 140
    div-float/2addr v3, v6

    .line 141
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 142
    .line 143
    aget v6, v6, v1

    .line 144
    .line 145
    int-to-float v6, v6

    .line 146
    mul-float/2addr v6, v4

    .line 147
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 148
    .line 149
    aget v1, v7, v1

    .line 150
    .line 151
    int-to-float v1, v1

    .line 152
    div-float/2addr v6, v1

    .line 153
    cmpl-float v1, v6, v3

    .line 154
    .line 155
    if-eqz v1, :cond_5

    .line 156
    .line 157
    invoke-direct {p0, v5, v2, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_5
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 162
    .line 163
    .line 164
    :goto_3
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 165
    .line 166
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 167
    .line 168
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 169
    .line 170
    aget v1, v1, v2

    .line 171
    .line 172
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 173
    .line 174
    aget p0, p0, v2

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_6
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 178
    .line 179
    aget v2, v2, v1

    .line 180
    .line 181
    if-eq v2, v3, :cond_9

    .line 182
    .line 183
    const/4 v3, 0x3

    .line 184
    if-eq v2, v3, :cond_9

    .line 185
    .line 186
    const/16 v3, 0x9

    .line 187
    .line 188
    if-ne v2, v3, :cond_7

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :cond_7
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 192
    .line 193
    aget v2, v2, v1

    .line 194
    .line 195
    int-to-float v3, v2

    .line 196
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 197
    .line 198
    aget v5, v5, v1

    .line 199
    .line 200
    int-to-float v6, v5

    .line 201
    mul-float/2addr v6, v4

    .line 202
    div-float/2addr v3, v6

    .line 203
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 204
    .line 205
    aget v6, v6, v1

    .line 206
    .line 207
    int-to-float v6, v6

    .line 208
    mul-float/2addr v6, v4

    .line 209
    iget-object v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 210
    .line 211
    aget v1, v7, v1

    .line 212
    .line 213
    int-to-float v1, v1

    .line 214
    div-float/2addr v6, v1

    .line 215
    cmpl-float v1, v6, v3

    .line 216
    .line 217
    if-eqz v1, :cond_8

    .line 218
    .line 219
    invoke-direct {p0, v5, v2, v6}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g2(IIF)V

    .line 220
    .line 221
    .line 222
    goto :goto_4

    .line 223
    :cond_8
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 224
    .line 225
    .line 226
    :goto_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 227
    .line 228
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 229
    .line 230
    aget v0, v0, v1

    .line 231
    .line 232
    int-to-float v0, v0

    .line 233
    div-float v0, v4, v0

    .line 234
    .line 235
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q:F

    .line 236
    .line 237
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 238
    .line 239
    aget v0, v0, v1

    .line 240
    .line 241
    int-to-float v0, v0

    .line 242
    div-float/2addr v4, v0

    .line 243
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R:F

    .line 244
    .line 245
    goto :goto_6

    .line 246
    :cond_9
    :goto_5
    invoke-direct {p0, v0, v4, v0, v4}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p2(FFFF)V

    .line 247
    .line 248
    .line 249
    :goto_6
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 250
    .line 251
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 252
    .line 253
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 254
    .line 255
    aget v1, v1, v2

    .line 256
    .line 257
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 258
    .line 259
    aget p0, p0, v2

    .line 260
    .line 261
    goto/16 :goto_1
.end method

.method private l2()I
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->H:I

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-ne v1, v2, :cond_0

    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    add-int/lit8 v0, v0, 0x3

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 16
    .line 17
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 18
    .line 19
    if-ne v1, p0, :cond_1

    .line 20
    .line 21
    if-nez v1, :cond_1

    .line 22
    .line 23
    return v0

    .line 24
    :cond_1
    if-eqz p0, :cond_2

    .line 25
    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x3

    .line 29
    .line 30
    return v0

    .line 31
    :cond_2
    if-ne v1, p0, :cond_3

    .line 32
    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    :cond_3
    return v0
.end method

.method private m2()I
    .locals 2

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->G:I

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne p0, v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/16 v1, 0x5a

    .line 10
    .line 11
    if-ne p0, v1, :cond_1

    .line 12
    .line 13
    return v0

    .line 14
    :cond_1
    const/16 v1, 0x10e

    .line 15
    .line 16
    if-ne p0, v1, :cond_2

    .line 17
    .line 18
    add-int/lit8 v0, v0, 0x2

    .line 19
    .line 20
    :cond_2
    return v0
.end method

.method private n2(Ljava/util/Queue;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p1

    .line 2
    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    monitor-exit p1

    .line 21
    return-void

    .line 22
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw p0
.end method

.method private p2(FFFF)V
    .locals 11

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->F:Z

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->B:[F

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->C:[F

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->D:[F

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E:[F

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->F:Z

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    new-array v0, v1, [Ljava/nio/FloatBuffer;

    .line 31
    .line 32
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 33
    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    new-array v3, v0, [F

    .line 37
    .line 38
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->B:[F

    .line 39
    .line 40
    new-array v3, v0, [F

    .line 41
    .line 42
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->C:[F

    .line 43
    .line 44
    new-array v3, v0, [F

    .line 45
    .line 46
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->D:[F

    .line 47
    .line 48
    new-array v0, v0, [F

    .line 49
    .line 50
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E:[F

    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->F:Z

    .line 53
    .line 54
    if-eqz v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->B:[F

    .line 57
    .line 58
    const/4 v3, 0x0

    .line 59
    aput p1, v0, v3

    .line 60
    .line 61
    aput p3, v0, v2

    .line 62
    .line 63
    const/4 v4, 0x2

    .line 64
    aput p2, v0, v4

    .line 65
    .line 66
    const/4 v5, 0x3

    .line 67
    aput p3, v0, v5

    .line 68
    .line 69
    aput p1, v0, v1

    .line 70
    .line 71
    const/4 v6, 0x5

    .line 72
    aput p4, v0, v6

    .line 73
    .line 74
    const/4 v7, 0x6

    .line 75
    aput p2, v0, v7

    .line 76
    .line 77
    const/4 v8, 0x7

    .line 78
    aput p4, v0, v8

    .line 79
    .line 80
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 81
    .line 82
    aget-object v10, v9, v3

    .line 83
    .line 84
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    aput-object v0, v9, v3

    .line 89
    .line 90
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->C:[F

    .line 91
    .line 92
    aput p1, v0, v3

    .line 93
    .line 94
    aput p4, v0, v2

    .line 95
    .line 96
    aput p1, v0, v4

    .line 97
    .line 98
    aput p3, v0, v5

    .line 99
    .line 100
    aput p2, v0, v1

    .line 101
    .line 102
    aput p4, v0, v6

    .line 103
    .line 104
    aput p2, v0, v7

    .line 105
    .line 106
    aput p3, v0, v8

    .line 107
    .line 108
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 109
    .line 110
    aget-object v10, v9, v2

    .line 111
    .line 112
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    aput-object v0, v9, v2

    .line 117
    .line 118
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->D:[F

    .line 119
    .line 120
    aput p2, v0, v3

    .line 121
    .line 122
    aput p4, v0, v2

    .line 123
    .line 124
    aput p1, v0, v4

    .line 125
    .line 126
    aput p4, v0, v5

    .line 127
    .line 128
    aput p2, v0, v1

    .line 129
    .line 130
    aput p3, v0, v6

    .line 131
    .line 132
    aput p1, v0, v7

    .line 133
    .line 134
    aput p3, v0, v8

    .line 135
    .line 136
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 137
    .line 138
    aget-object v10, v9, v4

    .line 139
    .line 140
    invoke-static {v10, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    aput-object v0, v9, v4

    .line 145
    .line 146
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E:[F

    .line 147
    .line 148
    aput p2, v0, v3

    .line 149
    .line 150
    aput p3, v0, v2

    .line 151
    .line 152
    aput p2, v0, v4

    .line 153
    .line 154
    aput p4, v0, v5

    .line 155
    .line 156
    aput p1, v0, v1

    .line 157
    .line 158
    aput p3, v0, v6

    .line 159
    .line 160
    aput p1, v0, v7

    .line 161
    .line 162
    aput p4, v0, v8

    .line 163
    .line 164
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 165
    .line 166
    aget-object p1, p0, v5

    .line 167
    .line 168
    invoke-static {p1, v0}, Ll/ch3;->a(Ljava/nio/FloatBuffer;[F)Ljava/nio/FloatBuffer;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    aput-object p1, p0, v5

    .line 173
    .line 174
    :cond_2
    return-void
.end method


# virtual methods
.method public A2(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "close(S): "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",svn:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, ","

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "mergeFilter"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    const-wide/16 v0, 0x9

    .line 39
    .line 40
    cmp-long v0, p1, v0

    .line 41
    .line 42
    if-gtz v0, :cond_1

    .line 43
    .line 44
    const-wide/16 v0, 0x0

    .line 45
    .line 46
    cmp-long v0, p1, v0

    .line 47
    .line 48
    if-gtz v0, :cond_0

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;

    .line 52
    .line 53
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$2;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JZ)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    :goto_0
    return-void
.end method

.method public C2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    .locals 8

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p4, v0, :cond_0

    .line 3
    .line 4
    if-nez p5, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    new-instance v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-wide v3, p1

    .line 11
    move-object v6, p3

    .line 12
    move v5, p4

    .line 13
    move-object v7, p5

    .line 14
    invoke-direct/range {v1 .. v7}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$4;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JILandroid/graphics/SurfaceTexture;Landroid/graphics/Bitmap;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public destroy()V
    .locals 8

    .line 1
    const-string v0, "destroy(S)"

    .line 2
    .line 3
    const-string v1, "mergeFilter"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->S:Z

    .line 10
    .line 11
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E0:Ljava/util/Queue;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v2}, Ljava/util/Collection;->clear()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->F0:Ljava/util/Queue;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Collection;->clear()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->T:[I

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    const/4 v4, 0x0

    .line 32
    if-eqz v2, :cond_2

    .line 33
    .line 34
    invoke-static {v0, v2, v4}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 35
    .line 36
    .line 37
    iput-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->T:[I

    .line 38
    .line 39
    :cond_2
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 40
    .line 41
    move v2, v4

    .line 42
    :goto_0
    const/16 v5, 0x9

    .line 43
    .line 44
    if-ge v2, v5, :cond_6

    .line 45
    .line 46
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 47
    .line 48
    aput-object v3, v5, v2

    .line 49
    .line 50
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 51
    .line 52
    aput v4, v5, v2

    .line 53
    .line 54
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 55
    .line 56
    const/4 v6, -0x1

    .line 57
    aput v6, v5, v2

    .line 58
    .line 59
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 60
    .line 61
    aput v6, v5, v2

    .line 62
    .line 63
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 64
    .line 65
    aput v6, v5, v2

    .line 66
    .line 67
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 68
    .line 69
    aput v6, v5, v2

    .line 70
    .line 71
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->i:[I

    .line 72
    .line 73
    aput v4, v5, v2

    .line 74
    .line 75
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 76
    .line 77
    aput v6, v5, v2

    .line 78
    .line 79
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 80
    .line 81
    aget-object v5, v5, v2

    .line 82
    .line 83
    if-eqz v5, :cond_3

    .line 84
    .line 85
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 86
    .line 87
    .line 88
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 89
    .line 90
    aput-object v3, v5, v2

    .line 91
    .line 92
    :cond_3
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 93
    .line 94
    aput v6, v5, v2

    .line 95
    .line 96
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 97
    .line 98
    aput v6, v5, v2

    .line 99
    .line 100
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 101
    .line 102
    aput v6, v5, v2

    .line 103
    .line 104
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 105
    .line 106
    aput v4, v5, v2

    .line 107
    .line 108
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 109
    .line 110
    aput-boolean v4, v5, v2

    .line 111
    .line 112
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 113
    .line 114
    const-wide/16 v6, -0x1

    .line 115
    .line 116
    aput-wide v6, v5, v2

    .line 117
    .line 118
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 119
    .line 120
    aget-object v5, v5, v2

    .line 121
    .line 122
    if-eqz v5, :cond_4

    .line 123
    .line 124
    invoke-virtual {v5}, Landroid/graphics/SurfaceTexture;->release()V

    .line 125
    .line 126
    .line 127
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 128
    .line 129
    aput-object v3, v5, v2

    .line 130
    .line 131
    :cond_4
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->s:[I

    .line 132
    .line 133
    aput v0, v5, v2

    .line 134
    .line 135
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 136
    .line 137
    aget-object v5, v5, v2

    .line 138
    .line 139
    if-eqz v5, :cond_5

    .line 140
    .line 141
    invoke-virtual {v5}, Ll/qnw;->destroy()V

    .line 142
    .line 143
    .line 144
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k:[Ll/qnw;

    .line 145
    .line 146
    aput-object v3, v5, v2

    .line 147
    .line 148
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_6
    const-string p0, "destroy"

    .line 152
    .line 153
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public drawFrame()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    const-string v1, "mergeFilter"

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->initFBO()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v2, "width:"

    .line 26
    .line 27
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, ", height:"

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->initFBO()V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    const-string v2, "width="

    .line 86
    .line 87
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v2, ", height="

    .line 98
    .line 99
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_3
    :goto_1
    iget-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 118
    .line 119
    if-eqz v0, :cond_4

    .line 120
    .line 121
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    const/4 v1, 0x0

    .line 128
    aget v0, v0, v1

    .line 129
    .line 130
    const v2, 0x8d40

    .line 131
    .line 132
    .line 133
    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 134
    .line 135
    .line 136
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->drawIndeed()V

    .line 137
    .line 138
    .line 139
    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 140
    .line 141
    .line 142
    :cond_4
    return-void
.end method

.method public e2(FFFFZ)V
    .locals 0

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p2, "clear screen,"

    .line 4
    .line 5
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string p2, "mergeFilter"

    .line 16
    .line 17
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    const/4 p1, 0x1

    .line 21
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->K:Z

    .line 22
    .line 23
    if-nez p5, :cond_0

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string p3, "clear screen, "

    .line 28
    .line 29
    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p3, ",mSubWndChanged="

    .line 36
    .line 37
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget p3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 41
    .line 42
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string p3, "/160"

    .line 46
    .line 47
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    const/16 p1, 0x28

    .line 58
    .line 59
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    const/16 p1, 0xa0

    .line 63
    .line 64
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 65
    .line 66
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying float clear_image; \nvarying vec2 imageStep; \nvoid main(){\nvec4 image = texture2D(inputImageTexture0,textureCoordinate);\nvec2 center = textureCoordinate;\nif (imageStep.x != 0.0 && imageStep.y != 0.0) {\nvec4 lt=texture2D(inputImageTexture0, clamp(center+vec2(-imageStep.x, imageStep.y), 0.0, 1.0)); \nvec4 lb=texture2D(inputImageTexture0, clamp(center+vec2(-imageStep.x, -imageStep.y), 0.0, 1.0)); \nvec4 rt=texture2D(inputImageTexture0, clamp(center+vec2(imageStep.x, imageStep.y), 0.0, 1.0)); \nvec4 rb=texture2D(inputImageTexture0, clamp(center+vec2(imageStep.x, -imageStep.y), 0.0, 1.0)); \nimage = clamp((image+lt+lb+rt+rb)*0.2, 0.0, 1.0);\n}\ngl_FragColor = clear_image*image + (1.0-clear_image)*vec4(0.0,0.0,0.0,1.0); \n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextOutID()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/lej;->i()[I

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    aget p0, p0, v0

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public getVertexShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float imageClear; \nuniform float widthStep; \nuniform float heightStep; \nvarying float clear_image; \nvarying vec2 imageStep; \nvoid main() {\nclear_image = imageClear; \nimageStep = vec2(widthStep, heightStep); \n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-static {}, Ll/sej;->d()Ll/sej;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v0, v1, v2}, Ll/sej;->c(II)Ll/lej;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 35
    .line 36
    .line 37
    const v0, 0x8d40

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const v1, 0x8cd5

    .line 45
    .line 46
    .line 47
    if-ne v0, v1, :cond_1

    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public initShaderHandles()V
    .locals 2

    .line 1
    iget v0, p0, Ll/wej;->programHandle:I

    .line 2
    .line 3
    const-string v1, "inputImageTexture0"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/wej;->textureHandle:I

    .line 10
    .line 11
    iget v0, p0, Ll/wej;->programHandle:I

    .line 12
    .line 13
    const-string v1, "position"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/wej;->positionHandle:I

    .line 20
    .line 21
    iget v0, p0, Ll/wej;->programHandle:I

    .line 22
    .line 23
    const-string v1, "inputTextureCoordinate"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/wej;->texCoordHandle:I

    .line 30
    .line 31
    iget v0, p0, Ll/wej;->programHandle:I

    .line 32
    .line 33
    const-string v1, "imageClear"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->M:I

    .line 40
    .line 41
    iget v0, p0, Ll/wej;->programHandle:I

    .line 42
    .line 43
    const-string v1, "widthStep"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->O:I

    .line 50
    .line 51
    iget v0, p0, Ll/wej;->programHandle:I

    .line 52
    .line 53
    const-string v1, "heightStep"

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->P:I

    .line 60
    .line 61
    return-void
.end method

.method public initWithGLContext()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k2(I)Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 2
    .line 3
    aget-object p0, p0, p1

    .line 4
    .line 5
    return-object p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 9

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E0:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n2(Ljava/util/Queue;)V

    .line 4
    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "mergeFilter"

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "newfata="

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, ", dirty="

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean v2, p0, Ll/gfj;->dirty:Z

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->S:Z

    .line 42
    .line 43
    const/4 v1, 0x0

    .line 44
    if-nez v0, :cond_1d

    .line 45
    .line 46
    iput v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 47
    .line 48
    move v0, v1

    .line 49
    :goto_1
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    if-ge v0, v2, :cond_1a

    .line 53
    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 55
    .line 56
    iget-boolean v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->K:Z

    .line 57
    .line 58
    if-nez v4, :cond_2

    .line 59
    .line 60
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 61
    .line 62
    if-lez v4, :cond_1

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_1
    const/high16 v4, 0x3f800000    # 1.0f

    .line 66
    .line 67
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->N:F

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :cond_2
    :goto_2
    const/4 v4, 0x0

    .line 71
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->N:F

    .line 72
    .line 73
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 74
    .line 75
    if-lez v4, :cond_3

    .line 76
    .line 77
    add-int/lit8 v4, v4, -0x1

    .line 78
    .line 79
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->L:I

    .line 80
    .line 81
    :cond_3
    :goto_3
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 82
    .line 83
    if-eqz v4, :cond_6

    .line 84
    .line 85
    if-nez v0, :cond_4

    .line 86
    .line 87
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 88
    .line 89
    goto :goto_4

    .line 90
    :cond_4
    if-ne v0, v4, :cond_5

    .line 91
    .line 92
    iput v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :cond_5
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 96
    .line 97
    :cond_6
    :goto_4
    iget-boolean v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 98
    .line 99
    if-eqz v4, :cond_9

    .line 100
    .line 101
    const/4 v4, 0x2

    .line 102
    if-lt v2, v4, :cond_9

    .line 103
    .line 104
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 105
    .line 106
    const/4 v2, 0x7

    .line 107
    if-nez v0, :cond_8

    .line 108
    .line 109
    :goto_5
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 110
    .line 111
    if-ge v3, v4, :cond_9

    .line 112
    .line 113
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 114
    .line 115
    aget v4, v4, v3

    .line 116
    .line 117
    if-ne v4, v2, :cond_7

    .line 118
    .line 119
    iput v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 120
    .line 121
    goto :goto_6

    .line 122
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 123
    .line 124
    goto :goto_5

    .line 125
    :cond_8
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 126
    .line 127
    aget v3, v3, v0

    .line 128
    .line 129
    if-ne v3, v2, :cond_9

    .line 130
    .line 131
    iput v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 132
    .line 133
    :cond_9
    :goto_6
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 134
    .line 135
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 136
    .line 137
    aget-boolean v2, v2, v3

    .line 138
    .line 139
    if-nez v2, :cond_a

    .line 140
    .line 141
    goto/16 :goto_a

    .line 142
    .line 143
    :cond_a
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 144
    .line 145
    aget v2, v2, v3

    .line 146
    .line 147
    const/4 v4, -0x1

    .line 148
    if-eq v2, v4, :cond_b

    .line 149
    .line 150
    if-eq v2, p1, :cond_c

    .line 151
    .line 152
    :cond_b
    if-nez v3, :cond_c

    .line 153
    .line 154
    const-string v2, "mergeFilter"

    .line 155
    .line 156
    new-instance v3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    const-string v5, "index:"

    .line 159
    .line 160
    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 164
    .line 165
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v5, ", "

    .line 169
    .line 170
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 174
    .line 175
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 176
    .line 177
    aget v5, v5, v6

    .line 178
    .line 179
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v5, "--->"

    .line 183
    .line 184
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 198
    .line 199
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 200
    .line 201
    aput p1, v2, v3

    .line 202
    .line 203
    :cond_c
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m:[I

    .line 204
    .line 205
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 206
    .line 207
    aget v2, v2, v3

    .line 208
    .line 209
    if-ne v2, v4, :cond_d

    .line 210
    .line 211
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l:[Landroid/graphics/Bitmap;

    .line 212
    .line 213
    aget-object v5, v5, v3

    .line 214
    .line 215
    if-eqz v5, :cond_e

    .line 216
    .line 217
    :cond_d
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 218
    .line 219
    aget v5, v5, v3

    .line 220
    .line 221
    if-lez v5, :cond_e

    .line 222
    .line 223
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 224
    .line 225
    aget v5, v5, v3

    .line 226
    .line 227
    if-gtz v5, :cond_f

    .line 228
    .line 229
    :cond_e
    if-eqz v3, :cond_f

    .line 230
    .line 231
    goto/16 :goto_a

    .line 232
    .line 233
    :cond_f
    if-eqz v3, :cond_12

    .line 234
    .line 235
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 236
    .line 237
    aget v2, v2, v3

    .line 238
    .line 239
    if-eq v2, v4, :cond_10

    .line 240
    .line 241
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 242
    .line 243
    aget-object v2, v2, v3

    .line 244
    .line 245
    if-nez v2, :cond_11

    .line 246
    .line 247
    :cond_10
    invoke-direct {p0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f2(I)V

    .line 248
    .line 249
    .line 250
    :cond_11
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->j:[I

    .line 251
    .line 252
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 253
    .line 254
    aget v2, v2, v3

    .line 255
    .line 256
    if-eq v2, v4, :cond_19

    .line 257
    .line 258
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n:[Landroid/graphics/SurfaceTexture;

    .line 259
    .line 260
    aget-object v3, v5, v3

    .line 261
    .line 262
    if-eqz v3, :cond_19

    .line 263
    .line 264
    iput v2, p0, Ll/wej;->texture_in:I

    .line 265
    .line 266
    goto :goto_7

    .line 267
    :cond_12
    iput v2, p0, Ll/wej;->texture_in:I

    .line 268
    .line 269
    :goto_7
    if-nez v0, :cond_14

    .line 270
    .line 271
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 276
    .line 277
    .line 278
    move-result v3

    .line 279
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 280
    .line 281
    if-ne v2, v5, :cond_13

    .line 282
    .line 283
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->c:I

    .line 284
    .line 285
    if-eq v3, v5, :cond_14

    .line 286
    .line 287
    :cond_13
    iput v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 288
    .line 289
    iput v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->c:I

    .line 290
    .line 291
    invoke-virtual {p0, v3}, Ll/wej;->setWidth(I)V

    .line 292
    .line 293
    .line 294
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 295
    .line 296
    invoke-virtual {p0, v2}, Ll/wej;->setHeight(I)V

    .line 297
    .line 298
    .line 299
    :cond_14
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 300
    .line 301
    .line 302
    move-result v2

    .line 303
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 304
    .line 305
    .line 306
    move-result v3

    .line 307
    iget-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 308
    .line 309
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 310
    .line 311
    aget v7, v5, v6

    .line 312
    .line 313
    if-eq v7, v4, :cond_17

    .line 314
    .line 315
    iget-object v8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 316
    .line 317
    aget v8, v8, v6

    .line 318
    .line 319
    if-ne v8, v4, :cond_15

    .line 320
    .line 321
    goto :goto_8

    .line 322
    :cond_15
    if-ne v2, v7, :cond_16

    .line 323
    .line 324
    if-eq v3, v8, :cond_18

    .line 325
    .line 326
    :cond_16
    if-nez v6, :cond_18

    .line 327
    .line 328
    const-string v4, "mergeFilter"

    .line 329
    .line 330
    new-instance v5, Ljava/lang/StringBuilder;

    .line 331
    .line 332
    const-string v6, "w/h:["

    .line 333
    .line 334
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 338
    .line 339
    iget v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 340
    .line 341
    aget v6, v6, v7

    .line 342
    .line 343
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    const-string v6, ","

    .line 347
    .line 348
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    iget-object v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 352
    .line 353
    iget v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 354
    .line 355
    aget v6, v6, v7

    .line 356
    .line 357
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 358
    .line 359
    .line 360
    const-string v6, "]===>["

    .line 361
    .line 362
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    const-string v6, ","

    .line 369
    .line 370
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    const-string v6, "], ID="

    .line 377
    .line 378
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 382
    .line 383
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v5

    .line 390
    invoke-static {v4, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    .line 392
    .line 393
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 394
    .line 395
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 396
    .line 397
    aput v2, v4, v5

    .line 398
    .line 399
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 400
    .line 401
    aput v3, v2, v5

    .line 402
    .line 403
    goto :goto_9

    .line 404
    :cond_17
    :goto_8
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 405
    .line 406
    .line 407
    move-result v2

    .line 408
    aput v2, v5, v6

    .line 409
    .line 410
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 411
    .line 412
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y:I

    .line 413
    .line 414
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 415
    .line 416
    .line 417
    move-result v4

    .line 418
    aput v4, v2, v3

    .line 419
    .line 420
    :cond_18
    :goto_9
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->a:Ll/pej;

    .line 421
    .line 422
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->c:I

    .line 423
    .line 424
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 425
    .line 426
    invoke-virtual {v2, v3, v4}, Ll/pej;->c(II)V

    .line 427
    .line 428
    .line 429
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 430
    .line 431
    .line 432
    :cond_19
    :goto_a
    add-int/lit8 v0, v0, 0x1

    .line 433
    .line 434
    goto/16 :goto_1

    .line 435
    .line 436
    :cond_1a
    move p1, v3

    .line 437
    :goto_b
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 438
    .line 439
    if-ge p1, v0, :cond_1d

    .line 440
    .line 441
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->v:[I

    .line 442
    .line 443
    aget v2, v0, p1

    .line 444
    .line 445
    if-ne v2, v3, :cond_1c

    .line 446
    .line 447
    add-int/lit8 v2, v2, 0x1

    .line 448
    .line 449
    aput v2, v0, p1

    .line 450
    .line 451
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k2(I)Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    if-eqz v0, :cond_1b

    .line 456
    .line 457
    const-string v0, "mergeFilter"

    .line 458
    .line 459
    new-instance v2, Ljava/lang/StringBuilder;

    .line 460
    .line 461
    const-string v4, "---- sub view "

    .line 462
    .line 463
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 467
    .line 468
    .line 469
    const-string v4, "call callback"

    .line 470
    .line 471
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 472
    .line 473
    .line 474
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    .line 480
    .line 481
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->k2(I)Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 482
    .line 483
    .line 484
    move-result-object v0

    .line 485
    invoke-interface {v0}, Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;->a()V

    .line 486
    .line 487
    .line 488
    goto :goto_c

    .line 489
    :cond_1b
    const-string v0, "mergeFilter"

    .line 490
    .line 491
    new-instance v2, Ljava/lang/StringBuilder;

    .line 492
    .line 493
    const-string v4, "---- sub view "

    .line 494
    .line 495
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    const-string v4, "call callback null"

    .line 502
    .line 503
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 504
    .line 505
    .line 506
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v2

    .line 510
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 511
    .line 512
    .line 513
    :cond_1c
    :goto_c
    add-int/lit8 p1, p1, 0x1

    .line 514
    .line 515
    goto :goto_b

    .line 516
    :cond_1d
    iget-object p1, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 517
    .line 518
    monitor-enter p1

    .line 519
    :try_start_0
    iget-object v0, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 520
    .line 521
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 526
    .line 527
    .line 528
    move-result v2

    .line 529
    if-eqz v2, :cond_1f

    .line 530
    .line 531
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    check-cast v2, Ll/dfj;

    .line 536
    .line 537
    iget-object v3, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 538
    .line 539
    if-eqz v3, :cond_1e

    .line 540
    .line 541
    invoke-virtual {v3}, Ll/lej;->i()[I

    .line 542
    .line 543
    .line 544
    move-result-object v3

    .line 545
    aget v3, v3, v1

    .line 546
    .line 547
    invoke-interface {v2, v3, p0, p3}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 548
    .line 549
    .line 550
    goto :goto_d

    .line 551
    :catchall_0
    move-exception p0

    .line 552
    goto :goto_e

    .line 553
    :cond_1e
    const-string v2, "mergeFilter"

    .line 554
    .line 555
    const-string v3, "glFrameBuffer is null"

    .line 556
    .line 557
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    .line 559
    .line 560
    goto :goto_d

    .line 561
    :cond_1f
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 562
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 563
    .line 564
    .line 565
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->F0:Ljava/util/Queue;

    .line 566
    .line 567
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->n2(Ljava/util/Queue;)V

    .line 568
    .line 569
    .line 570
    return-void

    .line 571
    :goto_e
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 572
    throw p0
.end method

.method public o2(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E0:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->E0:Ljava/util/Queue;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception p0

    .line 12
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    throw p0
.end method

.method public passShaderValues()V
    .locals 10

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 7
    .line 8
    .line 9
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->M:I

    .line 10
    .line 11
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->N:F

    .line 12
    .line 13
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->O:I

    .line 17
    .line 18
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Q:F

    .line 19
    .line 20
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->P:I

    .line 24
    .line 25
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->R:F

    .line 26
    .line 27
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 28
    .line 29
    .line 30
    iget v4, p0, Ll/wej;->positionHandle:I

    .line 31
    .line 32
    const/16 v8, 0x8

    .line 33
    .line 34
    iget-object v9, p0, Ll/wej;->renderVertices:Ljava/nio/FloatBuffer;

    .line 35
    .line 36
    const/4 v5, 0x2

    .line 37
    const/16 v6, 0x1406

    .line 38
    .line 39
    const/4 v7, 0x0

    .line 40
    invoke-static/range {v4 .. v9}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 41
    .line 42
    .line 43
    iget v1, p0, Ll/wej;->positionHandle:I

    .line 44
    .line 45
    invoke-static {v1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 46
    .line 47
    .line 48
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->J:I

    .line 49
    .line 50
    const/4 v3, 0x2

    .line 51
    if-ne v1, v3, :cond_0

    .line 52
    .line 53
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->l2()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    const/4 v3, 0x1

    .line 59
    if-ne v1, v3, :cond_1

    .line 60
    .line 61
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->m2()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    :cond_1
    :goto_0
    rem-int/lit8 v0, v0, 0x4

    .line 66
    .line 67
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 68
    .line 69
    aget-object v1, v1, v0

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 72
    .line 73
    .line 74
    iget v3, p0, Ll/wej;->texCoordHandle:I

    .line 75
    .line 76
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->A:[Ljava/nio/FloatBuffer;

    .line 77
    .line 78
    aget-object v8, v1, v0

    .line 79
    .line 80
    const/4 v4, 0x2

    .line 81
    const/16 v5, 0x1406

    .line 82
    .line 83
    const/4 v6, 0x0

    .line 84
    const/16 v7, 0x8

    .line 85
    .line 86
    invoke-static/range {v3 .. v8}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Ll/wej;->texCoordHandle:I

    .line 90
    .line 91
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    .line 92
    .line 93
    .line 94
    const v0, 0x84c0

    .line 95
    .line 96
    .line 97
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 98
    .line 99
    .line 100
    const/16 v0, 0xde1

    .line 101
    .line 102
    iget v1, p0, Ll/wej;->texture_in:I

    .line 103
    .line 104
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 105
    .line 106
    .line 107
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 108
    .line 109
    invoke-static {p0, v2}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public q2(Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->u:[Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 2
    .line 3
    aput-object p1, p0, p2

    .line 4
    .line 5
    return-void
.end method

.method public r2(I)V
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-gt p1, v0, :cond_0

    .line 5
    .line 6
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->I:I

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s2(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->J:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderSize(II)V
    .locals 1

    .line 1
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b:I

    .line 2
    .line 3
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->c:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->K:Z

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->G:I

    .line 10
    .line 11
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t2(I)V
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->I:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->G:I

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 p1, -0x1

    .line 10
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->G:I

    .line 11
    .line 12
    return-void
.end method

.method public u2(Z)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "----setSmallViewScreen(S): smallView="

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "mergeFilter"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 26
    .line 27
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 28
    .line 29
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v0, "----setSmallViewScreen(E): Clean="

    .line 32
    .line 33
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->V:Z

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, ";"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->U:Z

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public v2(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x9

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    cmp-long v0, p1, v0

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;

    .line 17
    .line 18
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$7;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public w2(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "full screen(S): "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "; fsi:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ", svn:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "mergeFilter"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x9

    .line 49
    .line 50
    cmp-long v0, p1, v0

    .line 51
    .line 52
    if-gtz v0, :cond_1

    .line 53
    .line 54
    const-wide/16 v0, 0x0

    .line 55
    .line 56
    cmp-long v0, p1, v0

    .line 57
    .line 58
    if-gtz v0, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;

    .line 62
    .line 63
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JZ)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public x2(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "hide(S): "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, "; fsi:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, ", svn:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "mergeFilter"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    const-wide/16 v0, 0x9

    .line 49
    .line 50
    cmp-long v0, p1, v0

    .line 51
    .line 52
    if-gtz v0, :cond_1

    .line 53
    .line 54
    const-wide/16 v0, 0x0

    .line 55
    .line 56
    cmp-long v0, p1, v0

    .line 57
    .line 58
    if-gtz v0, :cond_0

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;

    .line 62
    .line 63
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JZ)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    :goto_0
    return-void
.end method

.method public y2(JIIIII)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----pos(S): "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", ["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ","

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, "],fsi="

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v1, ", svn="

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "mergeFilter"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    const-wide/16 v0, 0x9

    .line 69
    .line 70
    cmp-long v0, p1, v0

    .line 71
    .line 72
    if-gtz v0, :cond_1

    .line 73
    .line 74
    const-wide/16 v0, 0x0

    .line 75
    .line 76
    cmp-long v0, p1, v0

    .line 77
    .line 78
    if-ltz v0, :cond_1

    .line 79
    .line 80
    if-ltz p3, :cond_1

    .line 81
    .line 82
    if-ltz p4, :cond_1

    .line 83
    .line 84
    if-lez p5, :cond_1

    .line 85
    .line 86
    if-gtz p6, :cond_0

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;

    .line 90
    .line 91
    move-object v1, p0

    .line 92
    move-wide v2, p1

    .line 93
    move v4, p3

    .line 94
    move v5, p4

    .line 95
    move v6, p5

    .line 96
    move v7, p6

    .line 97
    move/from16 v8, p7

    .line 98
    .line 99
    invoke-direct/range {v0 .. v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$3;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JIIIII)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :cond_1
    :goto_0
    return-void
.end method

.method public z2(JIIII)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----size(S): "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", ["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ","

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "],changed="

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, " fsi:"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->z:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, ", svn:"

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "type"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const-string v1, "mergeFilter"

    .line 68
    .line 69
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    const-wide/16 v0, 0x9

    .line 73
    .line 74
    cmp-long v0, p1, v0

    .line 75
    .line 76
    if-gtz v0, :cond_4

    .line 77
    .line 78
    const-wide/16 v0, 0x0

    .line 79
    .line 80
    cmp-long v0, p1, v0

    .line 81
    .line 82
    if-lez v0, :cond_4

    .line 83
    .line 84
    if-lez p3, :cond_4

    .line 85
    .line 86
    if-gtz p4, :cond_0

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_0
    if-lez p3, :cond_1

    .line 90
    .line 91
    if-gtz p4, :cond_2

    .line 92
    .line 93
    :cond_1
    move-object v2, p0

    .line 94
    move-wide v3, p1

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    new-instance v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;

    .line 97
    .line 98
    move-object v2, p0

    .line 99
    move-wide v3, p1

    .line 100
    move v5, p3

    .line 101
    move v6, p4

    .line 102
    move v8, p5

    .line 103
    move v7, p6

    .line 104
    invoke-direct/range {v1 .. v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$8;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JIIII)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o2(Ljava/lang/Runnable;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :goto_0
    const/4 p0, 0x1

    .line 112
    :goto_1
    iget p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 113
    .line 114
    if-ge p0, p1, :cond_4

    .line 115
    .line 116
    iget-object p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 117
    .line 118
    aget-wide p2, p1, p0

    .line 119
    .line 120
    cmp-long p1, v3, p2

    .line 121
    .line 122
    if-nez p1, :cond_3

    .line 123
    .line 124
    iget-object p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 125
    .line 126
    aget-boolean p1, p1, p0

    .line 127
    .line 128
    if-nez p1, :cond_3

    .line 129
    .line 130
    iget-object p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->p:[I

    .line 131
    .line 132
    const/4 p2, -0x1

    .line 133
    aput p2, p1, p0

    .line 134
    .line 135
    iget-object p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->q:[I

    .line 136
    .line 137
    aput p2, p1, p0

    .line 138
    .line 139
    iget-object p1, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->r:[I

    .line 140
    .line 141
    const/4 p2, 0x0

    .line 142
    aput p2, p1, p0

    .line 143
    .line 144
    :cond_3
    add-int/lit8 p0, p0, 0x1

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_4
    :goto_2
    return-void
.end method
