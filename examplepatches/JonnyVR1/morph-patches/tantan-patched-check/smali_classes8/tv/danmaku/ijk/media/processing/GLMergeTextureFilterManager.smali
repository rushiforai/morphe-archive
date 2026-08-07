.class public Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field private A:Z

.field private B:I

.field private C:I

.field private D:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

.field private E:J

.field private F:Z

.field private G:I

.field private H:I

.field private I:I

.field private J:F

.field private K:F

.field private L:F

.field private M:[Ljava/nio/FloatBuffer;

.field private N:[F

.field private O:[F

.field private P:[F

.field private Q:[F

.field private final R:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final S:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private T:Ljava/util/Map;

.field private a:Ll/pej;

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:Z

.field private i:I

.field private j:I

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:I

.field private p:Z

.field private q:I

.field private r:I

.field private s:I

.field private t:I

.field private u:I

.field private v:I

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Ll/pej;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x280

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 7
    .line 8
    const/16 v0, 0x160

    .line 9
    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d:I

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 19
    .line 20
    const-wide/16 v2, 0x0

    .line 21
    .line 22
    iput-wide v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 23
    .line 24
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 28
    .line 29
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

    .line 30
    .line 31
    const/high16 v4, 0x3f800000    # 1.0f

    .line 32
    .line 33
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->L:F

    .line 34
    .line 35
    const/4 v4, 0x4

    .line 36
    new-array v4, v4, [Ljava/nio/FloatBuffer;

    .line 37
    .line 38
    iput-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 39
    .line 40
    const/16 v4, 0x8

    .line 41
    .line 42
    new-array v5, v4, [F

    .line 43
    .line 44
    iput-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->N:[F

    .line 45
    .line 46
    new-array v5, v4, [F

    .line 47
    .line 48
    iput-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->O:[F

    .line 49
    .line 50
    new-array v5, v4, [F

    .line 51
    .line 52
    iput-object v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->P:[F

    .line 53
    .line 54
    new-array v4, v4, [F

    .line 55
    .line 56
    iput-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q:[F

    .line 57
    .line 58
    new-instance v4, Ljava/util/HashMap;

    .line 59
    .line 60
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 64
    .line 65
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->a:Ll/pej;

    .line 66
    .line 67
    new-instance p1, Ljava/util/LinkedList;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R:Ljava/util/Queue;

    .line 73
    .line 74
    new-instance p1, Ljava/util/LinkedList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S:Ljava/util/Queue;

    .line 80
    .line 81
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 82
    .line 83
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 84
    .line 85
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 86
    .line 87
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 88
    .line 89
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 90
    .line 91
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 92
    .line 93
    iput-wide v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 94
    .line 95
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 96
    .line 97
    return-void
.end method

.method public static synthetic Q1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic U1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic V1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Z1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic a2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic d2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 2
    .line 3
    return p0
.end method

.method private drawIndeed()V
    .locals 5

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    if-gtz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "draw: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget p0, p0, Ll/wej;->texture_in:I

    .line 13
    .line 14
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "mergeFilterManager"

    .line 22
    .line 23
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 28
    .line 29
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->o:I

    .line 30
    .line 31
    const/4 v2, 0x2

    .line 32
    const/4 v3, 0x1

    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->n2()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    if-ne v1, v3, :cond_2

    .line 41
    .line 42
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->o2()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    :cond_2
    :goto_0
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->s:I

    .line 47
    .line 48
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 49
    .line 50
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 51
    .line 52
    invoke-static {v1, v0, v2, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 53
    .line 54
    .line 55
    iget v0, p0, Ll/wej;->programHandle:I

    .line 56
    .line 57
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->passShaderValues()V

    .line 61
    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    const/4 v1, 0x4

    .line 65
    const/4 v2, 0x5

    .line 66
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 67
    .line 68
    .line 69
    iget v0, p0, Ll/wej;->positionHandle:I

    .line 70
    .line 71
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 72
    .line 73
    .line 74
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A:Z

    .line 75
    .line 76
    return-void
.end method

.method public static synthetic e2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 2
    .line 3
    return p1
.end method

.method private l2(IIF)V
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
    invoke-direct {p0, v3, v5, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private m2(IIII)V
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
    invoke-direct {p0, p4, v2, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method private n2()I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 3
    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

    .line 5
    .line 6
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/high16 v3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-eq v1, v2, :cond_7

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v1, v2, :cond_5

    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    if-eq v1, v4, :cond_4

    .line 18
    .line 19
    const/4 v5, 0x4

    .line 20
    if-eq v1, v5, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_0
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y:I

    .line 25
    .line 26
    if-eq v1, v2, :cond_3

    .line 27
    .line 28
    if-eq v1, v4, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x9

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 36
    .line 37
    int-to-float v2, v1

    .line 38
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 39
    .line 40
    int-to-float v5, v4

    .line 41
    mul-float/2addr v5, v3

    .line 42
    div-float/2addr v2, v5

    .line 43
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 44
    .line 45
    int-to-float v5, v5

    .line 46
    mul-float/2addr v5, v3

    .line 47
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 48
    .line 49
    int-to-float v6, v6

    .line 50
    div-float/2addr v5, v6

    .line 51
    cmpl-float v2, v5, v2

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-direct {p0, v4, v1, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 60
    .line 61
    .line 62
    :goto_0
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 63
    .line 64
    int-to-float v0, v0

    .line 65
    div-float v0, v3, v0

    .line 66
    .line 67
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 68
    .line 69
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 70
    .line 71
    int-to-float v0, v0

    .line 72
    div-float/2addr v3, v0

    .line 73
    iput v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    :goto_1
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 77
    .line 78
    .line 79
    :goto_2
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 80
    .line 81
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 82
    .line 83
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 84
    .line 85
    :goto_3
    add-int/2addr v1, p0

    .line 86
    sub-int/2addr v0, v1

    .line 87
    return v0

    .line 88
    :cond_4
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 89
    .line 90
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m2(IIII)V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 104
    .line 105
    return p0

    .line 106
    :cond_5
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 111
    .line 112
    int-to-float v0, v0

    .line 113
    mul-float/2addr v0, v3

    .line 114
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    div-float/2addr v0, v1

    .line 118
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 119
    .line 120
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 121
    .line 122
    invoke-direct {p0, v1, v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 123
    .line 124
    .line 125
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 126
    .line 127
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 128
    .line 129
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 133
    .line 134
    .line 135
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 136
    .line 137
    return p0

    .line 138
    :cond_7
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 139
    .line 140
    int-to-float v2, v1

    .line 141
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 142
    .line 143
    int-to-float v5, v4

    .line 144
    mul-float/2addr v5, v3

    .line 145
    div-float/2addr v2, v5

    .line 146
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 147
    .line 148
    int-to-float v5, v5

    .line 149
    mul-float/2addr v5, v3

    .line 150
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 151
    .line 152
    int-to-float v6, v6

    .line 153
    div-float/2addr v5, v6

    .line 154
    cmpl-float v2, v5, v2

    .line 155
    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    invoke-direct {p0, v4, v1, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 159
    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_8
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 163
    .line 164
    .line 165
    :goto_4
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 166
    .line 167
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 168
    .line 169
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 170
    .line 171
    goto :goto_3
.end method

.method private o2()I
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 3
    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

    .line 5
    .line 6
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/high16 v3, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-eq v1, v2, :cond_7

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-eq v1, v2, :cond_5

    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    if-eq v1, v4, :cond_4

    .line 18
    .line 19
    const/4 v5, 0x4

    .line 20
    if-eq v1, v5, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_0
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y:I

    .line 25
    .line 26
    if-eq v1, v2, :cond_3

    .line 27
    .line 28
    if-eq v1, v4, :cond_3

    .line 29
    .line 30
    const/16 v2, 0x9

    .line 31
    .line 32
    if-ne v1, v2, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 36
    .line 37
    int-to-float v2, v1

    .line 38
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 39
    .line 40
    int-to-float v5, v4

    .line 41
    mul-float/2addr v5, v3

    .line 42
    div-float/2addr v2, v5

    .line 43
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 44
    .line 45
    int-to-float v5, v5

    .line 46
    mul-float/2addr v5, v3

    .line 47
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 48
    .line 49
    int-to-float v6, v6

    .line 50
    div-float/2addr v5, v6

    .line 51
    cmpl-float v2, v5, v2

    .line 52
    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    invoke-direct {p0, v4, v1, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 60
    .line 61
    .line 62
    :goto_0
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 63
    .line 64
    int-to-float v0, v0

    .line 65
    div-float v0, v3, v0

    .line 66
    .line 67
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 68
    .line 69
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 70
    .line 71
    int-to-float v0, v0

    .line 72
    div-float/2addr v3, v0

    .line 73
    iput v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    :goto_1
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 77
    .line 78
    .line 79
    :goto_2
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 80
    .line 81
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 82
    .line 83
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 84
    .line 85
    :goto_3
    add-int/2addr v1, p0

    .line 86
    sub-int/2addr v0, v1

    .line 87
    return v0

    .line 88
    :cond_4
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 89
    .line 90
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 91
    .line 92
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    invoke-direct {p0, v0, v1, v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m2(IIII)V

    .line 101
    .line 102
    .line 103
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 104
    .line 105
    return p0

    .line 106
    :cond_5
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 111
    .line 112
    int-to-float v0, v0

    .line 113
    mul-float/2addr v0, v3

    .line 114
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    div-float/2addr v0, v1

    .line 118
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 119
    .line 120
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 121
    .line 122
    invoke-direct {p0, v1, v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 123
    .line 124
    .line 125
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 126
    .line 127
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 128
    .line 129
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 130
    .line 131
    goto :goto_3

    .line 132
    :cond_6
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 133
    .line 134
    .line 135
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 136
    .line 137
    return p0

    .line 138
    :cond_7
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 139
    .line 140
    int-to-float v2, v1

    .line 141
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 142
    .line 143
    int-to-float v5, v4

    .line 144
    mul-float/2addr v5, v3

    .line 145
    div-float/2addr v2, v5

    .line 146
    iget v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 147
    .line 148
    int-to-float v5, v5

    .line 149
    mul-float/2addr v5, v3

    .line 150
    iget v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 151
    .line 152
    int-to-float v6, v6

    .line 153
    div-float/2addr v5, v6

    .line 154
    cmpl-float v2, v5, v2

    .line 155
    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    invoke-direct {p0, v4, v1, v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l2(IIF)V

    .line 159
    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_8
    invoke-direct {p0, v0, v3, v0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y2(FFFF)V

    .line 163
    .line 164
    .line 165
    :goto_4
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 166
    .line 167
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 168
    .line 169
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 170
    .line 171
    goto :goto_3
.end method

.method private p2()I
    .locals 3

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 4
    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne p0, v1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    const/4 v1, 0x3

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne p0, v2, :cond_1

    .line 12
    .line 13
    add-int/2addr v0, v1

    .line 14
    return v0

    .line 15
    :cond_1
    if-ne p0, v1, :cond_2

    .line 16
    .line 17
    add-int/2addr v0, v2

    .line 18
    :cond_2
    return v0
.end method

.method private q2()I
    .locals 2

    .line 1
    iget v0, p0, Ll/wej;->curRotation:I

    .line 2
    .line 3
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d:I

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

.method private s2(Ljava/util/Queue;)V
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

.method private y2(FFFF)V
    .locals 11

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->N:[F

    .line 2
    .line 3
    const/4 v1, 0x7

    .line 4
    const/4 v2, 0x6

    .line 5
    const/4 v3, 0x5

    .line 6
    const/4 v4, 0x3

    .line 7
    const/4 v5, 0x2

    .line 8
    const/4 v6, 0x1

    .line 9
    const/4 v7, 0x4

    .line 10
    const/4 v8, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    aput p1, v0, v8

    .line 14
    .line 15
    aput p3, v0, v6

    .line 16
    .line 17
    aput p2, v0, v5

    .line 18
    .line 19
    aput p3, v0, v4

    .line 20
    .line 21
    aput p1, v0, v7

    .line 22
    .line 23
    aput p4, v0, v3

    .line 24
    .line 25
    aput p2, v0, v2

    .line 26
    .line 27
    aput p4, v0, v1

    .line 28
    .line 29
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 30
    .line 31
    if-eqz v9, :cond_0

    .line 32
    .line 33
    array-length v0, v0

    .line 34
    mul-int/2addr v0, v7

    .line 35
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    aput-object v0, v9, v8

    .line 52
    .line 53
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 54
    .line 55
    aget-object v0, v0, v8

    .line 56
    .line 57
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->N:[F

    .line 58
    .line 59
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, v8}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->O:[F

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    aput p1, v0, v8

    .line 71
    .line 72
    aput p4, v0, v6

    .line 73
    .line 74
    aput p1, v0, v5

    .line 75
    .line 76
    aput p3, v0, v4

    .line 77
    .line 78
    aput p2, v0, v7

    .line 79
    .line 80
    aput p4, v0, v3

    .line 81
    .line 82
    aput p2, v0, v2

    .line 83
    .line 84
    aput p3, v0, v1

    .line 85
    .line 86
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 87
    .line 88
    if-eqz v9, :cond_1

    .line 89
    .line 90
    array-length v0, v0

    .line 91
    mul-int/2addr v0, v7

    .line 92
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    aput-object v0, v9, v6

    .line 109
    .line 110
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 111
    .line 112
    aget-object v0, v0, v6

    .line 113
    .line 114
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->O:[F

    .line 115
    .line 116
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0, v8}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 121
    .line 122
    .line 123
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->P:[F

    .line 124
    .line 125
    if-eqz v0, :cond_2

    .line 126
    .line 127
    aput p2, v0, v8

    .line 128
    .line 129
    aput p4, v0, v6

    .line 130
    .line 131
    aput p1, v0, v5

    .line 132
    .line 133
    aput p4, v0, v4

    .line 134
    .line 135
    aput p2, v0, v7

    .line 136
    .line 137
    aput p3, v0, v3

    .line 138
    .line 139
    aput p1, v0, v2

    .line 140
    .line 141
    aput p3, v0, v1

    .line 142
    .line 143
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 144
    .line 145
    if-eqz v9, :cond_2

    .line 146
    .line 147
    array-length v0, v0

    .line 148
    mul-int/2addr v0, v7

    .line 149
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 154
    .line 155
    .line 156
    move-result-object v10

    .line 157
    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    aput-object v0, v9, v5

    .line 166
    .line 167
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 168
    .line 169
    aget-object v0, v0, v5

    .line 170
    .line 171
    iget-object v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->P:[F

    .line 172
    .line 173
    invoke-virtual {v0, v9}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {v0, v8}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 178
    .line 179
    .line 180
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q:[F

    .line 181
    .line 182
    if-eqz v0, :cond_3

    .line 183
    .line 184
    aput p2, v0, v8

    .line 185
    .line 186
    aput p3, v0, v6

    .line 187
    .line 188
    aput p2, v0, v5

    .line 189
    .line 190
    aput p4, v0, v4

    .line 191
    .line 192
    aput p1, v0, v7

    .line 193
    .line 194
    aput p3, v0, v3

    .line 195
    .line 196
    aput p1, v0, v2

    .line 197
    .line 198
    aput p4, v0, v1

    .line 199
    .line 200
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 201
    .line 202
    if-eqz p1, :cond_3

    .line 203
    .line 204
    array-length p2, v0

    .line 205
    mul-int/2addr p2, v7

    .line 206
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 211
    .line 212
    .line 213
    move-result-object p3

    .line 214
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    aput-object p2, p1, v4

    .line 223
    .line 224
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

    .line 225
    .line 226
    aget-object p1, p1, v4

    .line 227
    .line 228
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->Q:[F

    .line 229
    .line 230
    invoke-virtual {p1, p0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0, v8}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 235
    .line 236
    .line 237
    :cond_3
    return-void
.end method


# virtual methods
.method public A2(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setScreenSourcesInputAngle: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "mergeFilterManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->d:I

    .line 31
    .line 32
    return-void
.end method

.method public B2(JFFFFI)V
    .locals 11

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setSubViewPort: id["

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
    const-string v1, "]; view["

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

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
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    move/from16 v6, p5

    .line 31
    .line 32
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    move/from16 v7, p6

    .line 39
    .line 40
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "], z="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    move/from16 v10, p7

    .line 49
    .line 50
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const-string v1, "mergeFilterManager"

    .line 58
    .line 59
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    new-instance v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;

    .line 63
    .line 64
    move-object v3, p0

    .line 65
    move-wide v4, p1

    .line 66
    move v8, p3

    .line 67
    move v9, p4

    .line 68
    invoke-direct/range {v2 .. v10}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$2;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JFFFFI)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public C2(JII)V
    .locals 6

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$7;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$7;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JII)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public D2(I)V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_3

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/util/Map$Entry;

    .line 32
    .line 33
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ljava/lang/Long;

    .line 38
    .line 39
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 40
    .line 41
    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 46
    .line 47
    if-eqz v1, :cond_0

    .line 48
    .line 49
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->X1()J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->W1()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 58
    .line 59
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->V1()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 64
    .line 65
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->a2()I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->s:I

    .line 70
    .line 71
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->b2()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 76
    .line 77
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Z1()I

    .line 78
    .line 79
    .line 80
    move-result v4

    .line 81
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 82
    .line 83
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Y1()I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 88
    .line 89
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->drawFrame()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->T1()I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    iput v4, p0, Ll/wej;->texture_in:I

    .line 97
    .line 98
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->c2()I

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->z:I

    .line 103
    .line 104
    const/4 v5, 0x1

    .line 105
    if-ne v4, v5, :cond_1

    .line 106
    .line 107
    if-ne p1, v5, :cond_1

    .line 108
    .line 109
    const/4 v4, 0x4

    .line 110
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 111
    .line 112
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 113
    .line 114
    add-int/2addr v4, v5

    .line 115
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_1
    if-nez v4, :cond_2

    .line 119
    .line 120
    if-nez p1, :cond_2

    .line 121
    .line 122
    const/4 v4, 0x3

    .line 123
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 124
    .line 125
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 126
    .line 127
    add-int/2addr v4, v5

    .line 128
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 129
    .line 130
    :cond_2
    :goto_1
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->U1()I

    .line 131
    .line 132
    .line 133
    move-result v4

    .line 134
    iput v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y:I

    .line 135
    .line 136
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->R1()Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    iput-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 141
    .line 142
    const/4 v4, 0x0

    .line 143
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A:Z

    .line 144
    .line 145
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->z:I

    .line 146
    .line 147
    if-ne v4, p1, :cond_0

    .line 148
    .line 149
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 150
    .line 151
    .line 152
    iget-boolean v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A:Z

    .line 153
    .line 154
    if-eqz v4, :cond_0

    .line 155
    .line 156
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 157
    .line 158
    if-eqz v4, :cond_0

    .line 159
    .line 160
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S1()Z

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    if-nez v4, :cond_0

    .line 165
    .line 166
    new-instance v4, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    const-string v6, "newTextureReady: userid="

    .line 169
    .line 170
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v2, "; first frame render finish"

    .line 177
    .line 178
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    const-string v3, "mergeFilterManager"

    .line 186
    .line 187
    invoke-static {v3, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 191
    .line 192
    invoke-interface {v2}, Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;->a()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, v5}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->g2(Z)V

    .line 196
    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :cond_3
    return-void
.end method

.method public E2(JZ)V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$5;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public F2(JILandroid/graphics/SurfaceTexture;)V
    .locals 6

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$4;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$4;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JILandroid/graphics/SurfaceTexture;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public G2(JLandroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$3;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JLandroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    const-string v0, "destroy(S)"

    .line 2
    .line 3
    const-string v1, "mergeFilterManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k2()V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R:Ljava/util/Queue;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S:Ljava/util/Queue;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 26
    .line 27
    .line 28
    :cond_1
    const-string p0, "destroy"

    .line 29
    .line 30
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public drawFrame()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    const-string v1, ", height="

    .line 4
    .line 5
    const-string v2, "mergeFilterManager"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    new-instance v0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v4, "drawFrame: 1 "

    .line 25
    .line 26
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v4, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 30
    .line 31
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v2, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->initFBO()V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x1

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, "drawFrame: 1 width="

    .line 49
    .line 50
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    move v0, v3

    .line 79
    :goto_0
    iget-object v4, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 80
    .line 81
    if-eqz v4, :cond_3

    .line 82
    .line 83
    invoke-virtual {v4}, Ll/lej;->h()[I

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    if-nez v4, :cond_3

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 96
    .line 97
    .line 98
    move-result v4

    .line 99
    if-eqz v4, :cond_2

    .line 100
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v4, "drawFrame: 2, "

    .line 104
    .line 105
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v0, ","

    .line 112
    .line 113
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 117
    .line 118
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v2, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->initFBO()V

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    const-string v3, "drawFrame: 2 width="

    .line 135
    .line 136
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_3
    :goto_1
    iget-boolean v0, p0, Ll/gfj;->dirty:Z

    .line 165
    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 169
    .line 170
    invoke-virtual {v0}, Ll/lej;->h()[I

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    aget v0, v0, v3

    .line 175
    .line 176
    const v1, 0x8d40

    .line 177
    .line 178
    .line 179
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 180
    .line 181
    .line 182
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->drawIndeed()V

    .line 183
    .line 184
    .line 185
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    .line 186
    .line 187
    .line 188
    :cond_4
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nvarying vec2 textureCoordinate;\nvarying float clear_image; \nvarying vec2 sizeInverse; \nvoid main(){\nvec4 image = texture2D(inputImageTexture0,textureCoordinate);\nvec2 center = textureCoordinate;\nif (sizeInverse.x != 0.0 && sizeInverse.y != 0.0) {\nvec4 lt=texture2D(inputImageTexture0, clamp(center+vec2(- sizeInverse.x, sizeInverse.y), 0.0, 1.0)); \nvec4 lb=texture2D(inputImageTexture0, clamp(center+vec2(-sizeInverse.x, -sizeInverse.y), 0.0, 1.0)); \nvec4 rt=texture2D(inputImageTexture0, clamp(center+vec2(sizeInverse.x, sizeInverse.y), 0.0, 1.0)); \nvec4 rb=texture2D(inputImageTexture0, clamp(center+vec2(sizeInverse.x, -sizeInverse.y), 0.0, 1.0)); \nimage = clamp((image+lt+lb+rt+rb)*0.2, 0.0, 1.0);\n}\ngl_FragColor = clear_image*image + (1.0-clear_image)*vec4(0.0,0.0,0.0,1.0); \n}\n"

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
    const-string p0, "attribute vec4 position;\nattribute vec2 inputTextureCoordinate;\nvarying vec2 textureCoordinate;\nuniform float clearScreen; \nuniform float widthInverse; \nuniform float heightInverse; \nvarying float clear_image; \nvarying vec2 sizeInverse; \nvoid main() {\nclear_image = clearScreen; \nsizeInverse = vec2(widthInverse, heightInverse); \n  textureCoordinate = inputTextureCoordinate;\n   gl_Position = position;\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public h2(JII)V
    .locals 6

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$1;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JII)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i2(II)V
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e:I

    .line 2
    .line 3
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q:I

    .line 4
    .line 5
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f:I

    .line 6
    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->r:I

    .line 8
    .line 9
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 10
    .line 11
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->s:I

    .line 12
    .line 13
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 14
    .line 15
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t:I

    .line 16
    .line 17
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 18
    .line 19
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->u:I

    .line 20
    .line 21
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 22
    .line 23
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->v:I

    .line 24
    .line 25
    iput p1, p0, Ll/wej;->texture_in:I

    .line 26
    .line 27
    const/4 p1, 0x1

    .line 28
    if-nez p2, :cond_0

    .line 29
    .line 30
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x2

    .line 35
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 36
    .line 37
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 38
    .line 39
    add-int/2addr v0, p1

    .line 40
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    if-ne p2, p1, :cond_1

    .line 44
    .line 45
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 46
    .line 47
    if-ne v0, p1, :cond_1

    .line 48
    .line 49
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->x:I

    .line 50
    .line 51
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 52
    .line 53
    add-int/2addr v0, p1

    .line 54
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 55
    .line 56
    :cond_1
    :goto_0
    const/4 p1, -0x1

    .line 57
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->y:I

    .line 58
    .line 59
    const/4 p1, 0x0

    .line 60
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->A:Z

    .line 64
    .line 65
    iget p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 66
    .line 67
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->z:I

    .line 68
    .line 69
    if-ne p1, p2, :cond_2

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "init fbo: ("

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ","

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string v1, ")"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v1, "mergeFilterManager"

    .line 44
    .line 45
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    new-instance v0, Ll/lej;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v0, v1, v2}, Ll/lej;->b(II)V

    .line 72
    .line 73
    .line 74
    const v0, 0x8d40

    .line 75
    .line 76
    .line 77
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    const v1, 0x8cd5

    .line 82
    .line 83
    .line 84
    if-ne v0, v1, :cond_1

    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 100
    .line 101
    .line 102
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
    const-string v1, "clearScreen"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->G:I

    .line 40
    .line 41
    iget v0, p0, Ll/wej;->programHandle:I

    .line 42
    .line 43
    const-string v1, "widthInverse"

    .line 44
    .line 45
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->H:I

    .line 50
    .line 51
    iget v0, p0, Ll/wej;->programHandle:I

    .line 52
    .line 53
    const-string v1, "heightInverse"

    .line 54
    .line 55
    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->I:I

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

.method public j2(JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 1

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$8;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;JLtv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public k2()V
    .locals 7

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "@@@ clearSubView: sub size="

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "mergeFilterManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eqz v2, :cond_1

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Ljava/util/Map$Entry;

    .line 51
    .line 52
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ljava/lang/Long;

    .line 57
    .line 58
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 59
    .line 60
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 65
    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    new-instance v4, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v5, "@@@ clearSubView: remove id["

    .line 71
    .line 72
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->X1()J

    .line 76
    .line 77
    .line 78
    move-result-wide v5

    .line 79
    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v5, "]"

    .line 83
    .line 84
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-static {v1, v4}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->release()V

    .line 95
    .line 96
    .line 97
    :cond_0
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 98
    .line 99
    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    const-string v2, "@@@ clearSubView: E sub size="

    .line 106
    .line 107
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 111
    .line 112
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 127
    .line 128
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->s2(Ljava/util/Queue;)V

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
    const-string v0, "mergeFilterManager"

    .line 13
    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "newTextureReady: newfata="

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
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g:Z

    .line 50
    .line 51
    const/4 v3, 0x1

    .line 52
    if-eqz v2, :cond_1

    .line 53
    .line 54
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e:I

    .line 55
    .line 56
    if-ne v0, v2, :cond_1

    .line 57
    .line 58
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f:I

    .line 59
    .line 60
    if-eq v1, v2, :cond_2

    .line 61
    .line 62
    :cond_1
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->e:I

    .line 63
    .line 64
    iput v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->f:I

    .line 65
    .line 66
    iput-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->g:Z

    .line 67
    .line 68
    :cond_2
    const/4 v0, 0x0

    .line 69
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 70
    .line 71
    invoke-virtual {p0, p1, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i2(II)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D2(I)V

    .line 75
    .line 76
    .line 77
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 78
    .line 79
    if-nez v1, :cond_3

    .line 80
    .line 81
    const-string v1, "mergeFilterManager"

    .line 82
    .line 83
    const-string v2, "newTextureReady: no find zoder zero"

    .line 84
    .line 85
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    if-le v1, v3, :cond_4

    .line 90
    .line 91
    const-string v1, "mergeFilterManager"

    .line 92
    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    const-string v4, "newTextureReady: find "

    .line 96
    .line 97
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 101
    .line 102
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v4, " zoder zero"

    .line 106
    .line 107
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    :cond_4
    :goto_1
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 118
    .line 119
    if-eqz v1, :cond_5

    .line 120
    .line 121
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->B:I

    .line 122
    .line 123
    if-nez v1, :cond_5

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/wej;->getBackgroundRed()F

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {p0}, Ll/wej;->getBackgroundGreen()F

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    invoke-virtual {p0}, Ll/wej;->getBackgroundBlue()F

    .line 134
    .line 135
    .line 136
    move-result v4

    .line 137
    invoke-virtual {p0}, Ll/wej;->getBackgroundAlpha()F

    .line 138
    .line 139
    .line 140
    move-result v5

    .line 141
    invoke-static {v1, v2, v4, v5}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 142
    .line 143
    .line 144
    const/16 v1, 0x4100

    .line 145
    .line 146
    invoke-static {v1}, Landroid/opengl/GLES20;->glClear(I)V

    .line 147
    .line 148
    .line 149
    :cond_5
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 150
    .line 151
    invoke-virtual {p0, p1, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i2(II)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->D2(I)V

    .line 155
    .line 156
    .line 157
    iget p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 158
    .line 159
    if-nez p1, :cond_6

    .line 160
    .line 161
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 162
    .line 163
    if-eqz p1, :cond_6

    .line 164
    .line 165
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-lez p1, :cond_6

    .line 170
    .line 171
    const-string p1, "mergeFilterManager"

    .line 172
    .line 173
    new-instance v1, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v2, "newTextureReady: "

    .line 176
    .line 177
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->C:I

    .line 181
    .line 182
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v2, " < "

    .line 186
    .line 187
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 191
    .line 192
    invoke-interface {v2}, Ljava/util/Map;->size()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    :cond_6
    iget-object p1, p0, Ll/gfj;->listLock:Ljava/lang/Object;

    .line 207
    .line 208
    monitor-enter p1

    .line 209
    :try_start_0
    iget-object v1, p0, Ll/gfj;->targets:Ljava/util/List;

    .line 210
    .line 211
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-eqz v2, :cond_8

    .line 220
    .line 221
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    check-cast v2, Ll/dfj;

    .line 226
    .line 227
    iget-object v3, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 228
    .line 229
    if-eqz v3, :cond_7

    .line 230
    .line 231
    invoke-virtual {v3}, Ll/lej;->i()[I

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    aget v3, v3, v0

    .line 236
    .line 237
    invoke-interface {v2, v3, p0, p3}, Ll/dfj;->newTextureReady(ILl/gfj;Z)V

    .line 238
    .line 239
    .line 240
    goto :goto_2

    .line 241
    :catchall_0
    move-exception p0

    .line 242
    goto :goto_3

    .line 243
    :cond_7
    const-string v2, "mergeFilterManager"

    .line 244
    .line 245
    const-string v3, "glFrameBuffer is null"

    .line 246
    .line 247
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_8
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->S:Ljava/util/Queue;

    .line 256
    .line 257
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->s2(Ljava/util/Queue;)V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :goto_3
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 262
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
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->G:I

    .line 10
    .line 11
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->L:F

    .line 12
    .line 13
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 14
    .line 15
    .line 16
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->H:I

    .line 17
    .line 18
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->J:F

    .line 19
    .line 20
    invoke-static {v1, v3}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    .line 21
    .line 22
    .line 23
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->I:I

    .line 24
    .line 25
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->K:F

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
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->o:I

    .line 49
    .line 50
    const/4 v3, 0x2

    .line 51
    if-ne v1, v3, :cond_0

    .line 52
    .line 53
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p2()I

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
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->q2()I

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
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

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
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->M:[Ljava/nio/FloatBuffer;

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

.method public r2(J)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ removeSubView:id["

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
    const-string v1, "]"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "mergeFilterManager"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    .line 24
    .line 25
    new-instance v0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1, p2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager$9;-><init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->t2(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setRenderSize(II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setRenderSize:["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ","

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "]-->"

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "mergeFilterManager"

    .line 42
    .line 43
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 47
    .line 48
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 49
    .line 50
    invoke-super {p0, p1, p2}, Ll/wej;->setRenderSize(II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public t2(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->R:Ljava/util/Queue;

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

.method public u2(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setAnchorOutputOrient: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->o:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "mergeFilterManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->o:I

    .line 31
    .line 32
    return-void
.end method

.method public v2(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setAnchorSmallView: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "mergeFilterManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 31
    .line 32
    if-eq v0, p1, :cond_0

    .line 33
    .line 34
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->p:Z

    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public w2(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setAnchorSourcesMode: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->n:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "mergeFilterManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->n:I

    .line 31
    .line 32
    return-void
.end method

.method public x2(IIIII)V
    .locals 10

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setAnchorView: input view["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ","

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, "], z="

    .line 32
    .line 33
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, ",status="

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v3, ";ViewUserID="

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 55
    .line 56
    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v3, "mergeFilterManager"

    .line 64
    .line 65
    invoke-static {v3, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v4, "@@@ setAnchorView: history view["

    .line 71
    .line 72
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 76
    .line 77
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 84
    .line 85
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 92
    .line 93
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 100
    .line 101
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    iget v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 108
    .line 109
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-static {v3, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    .line 118
    .line 119
    if-ltz p1, :cond_3

    .line 120
    .line 121
    if-ltz p2, :cond_3

    .line 122
    .line 123
    if-ltz p3, :cond_3

    .line 124
    .line 125
    if-gez p4, :cond_0

    .line 126
    .line 127
    goto/16 :goto_1

    .line 128
    .line 129
    :cond_0
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 130
    .line 131
    const-wide/16 v6, 0x0

    .line 132
    .line 133
    cmp-long v0, v4, v6

    .line 134
    .line 135
    if-eqz v0, :cond_1

    .line 136
    .line 137
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->F:Z

    .line 138
    .line 139
    if-eqz v0, :cond_1

    .line 140
    .line 141
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 142
    .line 143
    if-eqz v0, :cond_2

    .line 144
    .line 145
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-eqz v0, :cond_2

    .line 154
    .line 155
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->T:Ljava/util/Map;

    .line 156
    .line 157
    iget-wide v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 158
    .line 159
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    move-object v4, v0

    .line 168
    check-cast v4, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;

    .line 169
    .line 170
    if-eqz v4, :cond_2

    .line 171
    .line 172
    move v5, p1

    .line 173
    move v6, p2

    .line 174
    move v7, p3

    .line 175
    move v8, p4

    .line 176
    move v9, p5

    .line 177
    invoke-virtual/range {v4 .. v9}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->j2(IIIII)V

    .line 178
    .line 179
    .line 180
    new-instance p1, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    const-string p2, "@@@ setAnchorView: set id["

    .line 183
    .line 184
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    iget-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->E:J

    .line 188
    .line 189
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    const-string p2, "], view["

    .line 193
    .line 194
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    invoke-static {v3, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    goto :goto_0

    .line 232
    :cond_1
    move v5, p1

    .line 233
    move v6, p2

    .line 234
    move v7, p3

    .line 235
    move v8, p4

    .line 236
    move v9, p5

    .line 237
    iput v5, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 238
    .line 239
    iput v6, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 240
    .line 241
    iput v7, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 242
    .line 243
    iput v8, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 244
    .line 245
    iput v9, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 246
    .line 247
    :cond_2
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    const-string p2, "@@@ setAnchorView: result view["

    .line 250
    .line 251
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    iget p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->i:I

    .line 255
    .line 256
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    iget p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->j:I

    .line 263
    .line 264
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    iget p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->l:I

    .line 271
    .line 272
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->k:I

    .line 279
    .line 280
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->m:I

    .line 287
    .line 288
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-static {v3, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    :cond_3
    :goto_1
    return-void
.end method

.method public z2(II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "@@@ setOutputSize: ["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ","

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, "-->["

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v1, "]"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const-string v1, "mergeFilterManager"

    .line 47
    .line 48
    invoke-static {v1, v0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    .line 50
    .line 51
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->b:I

    .line 52
    .line 53
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilterManager;->c:I

    .line 54
    .line 55
    return-void
.end method
