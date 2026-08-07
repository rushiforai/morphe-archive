.class public Ll/wc4;
.super Ll/gb20;
.source "SourceFile"

# interfaces
.implements Ll/xpl$a;
.implements Ll/xpl$d;
.implements Ll/hql;
.implements Ll/ja4$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wc4$l;,
        Ll/wc4$k;
    }
.end annotation


# instance fields
.field private A:Ll/lnw;

.field private B:Z

.field private C:Ll/v94;

.field private D:Ll/nx3;

.field private E:Ll/yuf;

.field private E0:Ljava/util/concurrent/atomic/AtomicBoolean;

.field F:Ll/wc4$l;

.field private G:I

.field private H:Landroid/graphics/SurfaceTexture;

.field private I:I

.field private J:I

.field K:Z

.field L:I

.field M:I

.field N:I

.field O:I

.field private P:J

.field private Q:Z

.field private R:Ljava/lang/Object;

.field private S:J

.field private T:I

.field protected U:J

.field protected V:I

.field protected W:I

.field public X:I

.field private Y:[B

.field private Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

.field private f:Ll/ja4;

.field private g:Ll/tow;

.field private i:Ll/g510;

.field private j:Z

.field private k:Ll/row;

.field private k0:Ll/lnw;

.field private l:Ljava/lang/Object;

.field m:Ll/q210$a;

.field private n:Landroid/os/HandlerThread;

.field private o:Landroid/os/Handler;

.field private p:I

.field private p0:[B

.field private q:Z

.field private r:Z

.field s:I

.field private t:J

.field private u:J

.field v:I

.field x:J

.field private y:Lcom/momocv/videoprocessor/VideoProcessor;

.field private z:Ll/umw;


# direct methods
.method public constructor <init>(Ll/uow;Ll/q210$a;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Ll/gb20;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/wc4;->j:Z

    .line 6
    .line 7
    new-instance v1, Ljava/lang/Object;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/wc4;->l:Ljava/lang/Object;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-object v1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 16
    .line 17
    iput-object v1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 18
    .line 19
    const/16 v2, 0xc8

    .line 20
    .line 21
    iput v2, p0, Ll/wc4;->p:I

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/wc4;->q:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/wc4;->r:Z

    .line 26
    .line 27
    iput v0, p0, Ll/wc4;->s:I

    .line 28
    .line 29
    const-wide/16 v2, 0x0

    .line 30
    .line 31
    iput-wide v2, p0, Ll/wc4;->t:J

    .line 32
    .line 33
    const-wide/16 v4, 0xf

    .line 34
    .line 35
    iput-wide v4, p0, Ll/wc4;->u:J

    .line 36
    .line 37
    const/16 v4, 0x3c

    .line 38
    .line 39
    iput v4, p0, Ll/wc4;->v:I

    .line 40
    .line 41
    iput-wide v2, p0, Ll/wc4;->x:J

    .line 42
    .line 43
    new-instance v4, Ll/umw;

    .line 44
    .line 45
    invoke-direct {v4}, Ll/umw;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v4, p0, Ll/wc4;->z:Ll/umw;

    .line 49
    .line 50
    new-instance v4, Ll/lnw;

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    invoke-direct {v4, v5}, Ll/lnw;-><init>(I)V

    .line 54
    .line 55
    .line 56
    iput-object v4, p0, Ll/wc4;->A:Ll/lnw;

    .line 57
    .line 58
    iput-object v1, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 59
    .line 60
    iput v0, p0, Ll/wc4;->G:I

    .line 61
    .line 62
    iput-object v1, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 63
    .line 64
    iput-boolean v0, p0, Ll/wc4;->K:Z

    .line 65
    .line 66
    iput v0, p0, Ll/wc4;->L:I

    .line 67
    .line 68
    iput v0, p0, Ll/wc4;->M:I

    .line 69
    .line 70
    iput v0, p0, Ll/wc4;->N:I

    .line 71
    .line 72
    iput v0, p0, Ll/wc4;->O:I

    .line 73
    .line 74
    iput-boolean v0, p0, Ll/wc4;->Q:Z

    .line 75
    .line 76
    new-instance v1, Ljava/lang/Object;

    .line 77
    .line 78
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v1, p0, Ll/wc4;->R:Ljava/lang/Object;

    .line 82
    .line 83
    iput-wide v2, p0, Ll/wc4;->S:J

    .line 84
    .line 85
    iput v0, p0, Ll/wc4;->T:I

    .line 86
    .line 87
    iput-wide v2, p0, Ll/wc4;->U:J

    .line 88
    .line 89
    iput v0, p0, Ll/wc4;->V:I

    .line 90
    .line 91
    iput v0, p0, Ll/wc4;->W:I

    .line 92
    .line 93
    const/16 v1, 0x1e

    .line 94
    .line 95
    iput v1, p0, Ll/wc4;->X:I

    .line 96
    .line 97
    new-instance v1, Ll/lnw;

    .line 98
    .line 99
    const/4 v2, 0x5

    .line 100
    invoke-direct {v1, v2}, Ll/lnw;-><init>(I)V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Ll/wc4;->k0:Ll/lnw;

    .line 104
    .line 105
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 106
    .line 107
    invoke-direct {v1, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 108
    .line 109
    .line 110
    iput-object v1, p0, Ll/wc4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 111
    .line 112
    iput-object p2, p0, Ll/wc4;->m:Ll/q210$a;

    .line 113
    .line 114
    if-nez p1, :cond_0

    .line 115
    .line 116
    new-instance p2, Ll/tow;

    .line 117
    .line 118
    invoke-direct {p2}, Ll/tow;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    iput-object p1, p0, Ll/wc4;->g:Ll/tow;

    .line 125
    .line 126
    :goto_0
    iget p2, p1, Ll/uow;->D0:I

    .line 127
    .line 128
    int-to-long v1, p2

    .line 129
    iput-wide v1, p0, Ll/wc4;->u:J

    .line 130
    .line 131
    new-instance p2, Ll/ja4;

    .line 132
    .line 133
    invoke-direct {p2, p1, v0}, Ll/ja4;-><init>(Ll/tow;Z)V

    .line 134
    .line 135
    .line 136
    iput-object p2, p0, Ll/wc4;->f:Ll/ja4;

    .line 137
    .line 138
    iput-boolean v5, p0, Ll/wej;->useNewViewPort:Z

    .line 139
    .line 140
    new-instance p1, Ll/v94;

    .line 141
    .line 142
    invoke-direct {p1}, Ll/v94;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 146
    .line 147
    return-void
.end method

.method public static synthetic V1(Ll/wc4;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wc4;->q2([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic W1(Ll/wc4;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->p0:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X1(Ll/wc4;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/wc4;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Y1(Ll/wc4;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/wc4;->G:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic Z1(Ll/wc4;[B)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wc4;->j2([B)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a2(Ll/wc4;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b2(Ll/wc4;)Ll/ja4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c2(Ll/wc4;)Ll/tow;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->g:Ll/tow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d2(Ll/wc4;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/wc4;->r:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic e2(Ll/wc4;Ll/ylg;)Ll/ylg;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public static synthetic f2(Ll/wc4;Ll/yuf;)Ll/yuf;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4;->E:Ll/yuf;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g2(Ll/wc4;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h2(Ll/wc4;Landroid/graphics/SurfaceTexture;)Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p1
.end method

.method private i2(Ll/omw;)V
    .locals 13

    .line 1
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, "hasFace"

    .line 22
    .line 23
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 28
    .line 29
    invoke-virtual {v0, v4, v3}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/wc4;->C:Ll/v94;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/v94;->a()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iget v3, p0, Ll/wc4;->L:I

    .line 39
    .line 40
    rem-int/2addr v3, v0

    .line 41
    if-nez v3, :cond_0

    .line 42
    .line 43
    iput v2, p0, Ll/wc4;->L:I

    .line 44
    .line 45
    invoke-virtual {p1, v2}, Ll/omw;->j(I)Ll/nuf;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/nuf;->p()[F

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v3, p0, Ll/wc4;->f:Ll/ja4;

    .line 54
    .line 55
    iget v4, p1, Ll/omw;->e:I

    .line 56
    .line 57
    iget v5, p1, Ll/omw;->f:I

    .line 58
    .line 59
    aget v6, v0, v2

    .line 60
    .line 61
    aget v7, v0, v1

    .line 62
    .line 63
    const/4 v11, 0x2

    .line 64
    aget v8, v0, v11

    .line 65
    .line 66
    const/4 v12, 0x3

    .line 67
    aget v9, v0, v12

    .line 68
    .line 69
    const/high16 v10, 0x3f800000    # 1.0f

    .line 70
    .line 71
    invoke-virtual/range {v3 .. v10}, Ll/ja4;->d(IIFFFFF)V

    .line 72
    .line 73
    .line 74
    aget v3, v0, v1

    .line 75
    .line 76
    aget v4, v0, v12

    .line 77
    .line 78
    add-float/2addr v3, v4

    .line 79
    const/high16 v4, 0x3f000000    # 0.5f

    .line 80
    .line 81
    mul-float/2addr v3, v4

    .line 82
    iget v5, p1, Ll/omw;->f:I

    .line 83
    .line 84
    int-to-float v5, v5

    .line 85
    div-float/2addr v3, v5

    .line 86
    aget v5, v0, v2

    .line 87
    .line 88
    aget v0, v0, v11

    .line 89
    .line 90
    add-float/2addr v5, v0

    .line 91
    mul-float/2addr v5, v4

    .line 92
    iget p1, p1, Ll/omw;->e:I

    .line 93
    .line 94
    int-to-float p1, p1

    .line 95
    div-float/2addr v5, p1

    .line 96
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p1, v3, v5}, Ll/u6y;->W(FF)V

    .line 101
    .line 102
    .line 103
    :cond_0
    iget p1, p0, Ll/wc4;->L:I

    .line 104
    .line 105
    add-int/2addr p1, v1

    .line 106
    iput p1, p0, Ll/wc4;->L:I

    .line 107
    .line 108
    iput v2, p0, Ll/wc4;->M:I

    .line 109
    .line 110
    return-void

    .line 111
    :cond_1
    iget p1, p0, Ll/wc4;->M:I

    .line 112
    .line 113
    add-int/2addr p1, v1

    .line 114
    iput p1, p0, Ll/wc4;->M:I

    .line 115
    .line 116
    iget v0, p0, Ll/wc4;->p:I

    .line 117
    .line 118
    if-ne p1, v0, :cond_2

    .line 119
    .line 120
    iput v2, p0, Ll/wc4;->M:I

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/wc4;->e()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-eqz p1, :cond_2

    .line 127
    .line 128
    invoke-direct {p0}, Ll/wc4;->n2()V

    .line 129
    .line 130
    .line 131
    :cond_2
    return-void
.end method

.method private j2([B)V
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-object v2, p0, Ll/wc4;->z:Ll/umw;

    .line 6
    .line 7
    const/16 v3, 0x11

    .line 8
    .line 9
    invoke-virtual {v2, v3}, Ll/umw;->h(I)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/wc4;->z:Ll/umw;

    .line 13
    .line 14
    iget-object v3, p0, Ll/wc4;->g:Ll/tow;

    .line 15
    .line 16
    iget v3, v3, Ll/tow;->e:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ll/umw;->m(I)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/wc4;->z:Ll/umw;

    .line 22
    .line 23
    iget-object v3, p0, Ll/wc4;->g:Ll/tow;

    .line 24
    .line 25
    iget v3, v3, Ll/tow;->f:I

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ll/umw;->j(I)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/wc4;->z:Ll/umw;

    .line 31
    .line 32
    invoke-virtual {v2, p1}, Ll/umw;->g([B)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/wc4;->z:Ll/umw;

    .line 36
    .line 37
    array-length p1, p1

    .line 38
    invoke-virtual {v2, p1}, Ll/umw;->f(I)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/wc4;->z:Ll/umw;

    .line 42
    .line 43
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 44
    .line 45
    iget v2, v2, Ll/tow;->e:I

    .line 46
    .line 47
    invoke-virtual {p1, v2}, Ll/umw;->l(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/wc4;->k0:Ll/lnw;

    .line 51
    .line 52
    invoke-direct {p0}, Ll/wc4;->p2()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    invoke-virtual {p1, v2}, Ll/lnw;->A(I)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/wc4;->k0:Ll/lnw;

    .line 60
    .line 61
    iget-object v2, p0, Ll/wc4;->f:Ll/ja4;

    .line 62
    .line 63
    invoke-virtual {v2}, Ll/ja4;->g()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    invoke-virtual {p1, v2}, Ll/lnw;->z(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/wc4;->k0:Ll/lnw;

    .line 71
    .line 72
    iget-object v2, p0, Ll/wc4;->f:Ll/ja4;

    .line 73
    .line 74
    invoke-virtual {v2}, Ll/ja4;->m()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    invoke-virtual {p1, v2}, Ll/lnw;->p(Z)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/wc4;->k0:Ll/lnw;

    .line 82
    .line 83
    const/4 v2, 0x1

    .line 84
    invoke-virtual {p1, v2}, Ll/lnw;->H(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 88
    .line 89
    if-nez p1, :cond_0

    .line 90
    .line 91
    new-instance p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 92
    .line 93
    invoke-direct {p1}, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 97
    .line 98
    :cond_0
    iget-boolean p1, p0, Ll/wc4;->B:Z

    .line 99
    .line 100
    if-nez p1, :cond_1

    .line 101
    .line 102
    iget-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 103
    .line 104
    invoke-virtual {p1}, Ll/v94;->c()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-nez p1, :cond_1

    .line 113
    .line 114
    iget-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/v94;->l()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iget-object v3, p0, Ll/wc4;->C:Ll/v94;

    .line 121
    .line 122
    invoke-virtual {v3}, Ll/v94;->c()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-static {p1, v3}, Lcom/core/glcore/util/BodyLandHelper;->setModelTypeAndPath(ZLjava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iput-boolean v2, p0, Ll/wc4;->B:Z

    .line 130
    .line 131
    :cond_1
    iget-object p1, p0, Ll/wc4;->z:Ll/umw;

    .line 132
    .line 133
    iget-object v2, p0, Ll/wc4;->k0:Ll/lnw;

    .line 134
    .line 135
    iget-object v3, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 136
    .line 137
    invoke-static {p1, v2, v3}, Lcom/core/glcore/util/BodyLandHelper;->process(Ll/umw;Ll/lnw;Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 141
    .line 142
    .line 143
    move-result-wide v2

    .line 144
    sub-long/2addr v2, v0

    .line 145
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1, v2, v3}, Ll/u6y;->V(J)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/core/glcore/util/BodyLandHelper;->setBodyInfos(Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;)V

    .line 155
    .line 156
    .line 157
    sget-boolean p1, Ll/im80;->a:Z

    .line 158
    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 164
    .line 165
    if-eqz p1, :cond_4

    .line 166
    .line 167
    array-length p1, p1

    .line 168
    if-lez p1, :cond_4

    .line 169
    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    .line 171
    .line 172
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Ll/wc4;->Z:Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;

    .line 176
    .line 177
    iget-object p0, p0, Lcom/momocv/bodylandmark/BodyLandmarkPostInfo;->multi_person_:[[Lcom/momocv/MMJoint;

    .line 178
    .line 179
    array-length v0, p0

    .line 180
    const/4 v1, 0x0

    .line 181
    move v2, v1

    .line 182
    :goto_0
    if-ge v2, v0, :cond_3

    .line 183
    .line 184
    aget-object v3, p0, v2

    .line 185
    .line 186
    const-string v4, "["

    .line 187
    .line 188
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    array-length v4, v3

    .line 192
    move v5, v1

    .line 193
    :goto_1
    if-ge v5, v4, :cond_2

    .line 194
    .line 195
    aget-object v6, v3, v5

    .line 196
    .line 197
    const-string v7, "[x = "

    .line 198
    .line 199
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget v7, v6, Lcom/momocv/MMPoint;->x_:I

    .line 203
    .line 204
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v7, ", y = "

    .line 208
    .line 209
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget v7, v6, Lcom/momocv/MMPoint;->y_:I

    .line 213
    .line 214
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    const-string v7, ", score = "

    .line 218
    .line 219
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    iget v6, v6, Lcom/momocv/MMJoint;->score_:F

    .line 223
    .line 224
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    const-string v6, "], "

    .line 228
    .line 229
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    add-int/lit8 v5, v5, 0x1

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_2
    const-string v3, "]"

    .line 236
    .line 237
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    add-int/lit8 v2, v2, 0x1

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_3
    const-string p0, "mao"

    .line 244
    .line 245
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-static {p0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 250
    .line 251
    .line 252
    :cond_4
    return-void
.end method

.method private k2(Ll/omw;)V
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/wc4;->x:J

    .line 2
    .line 3
    const-wide/16 v2, 0x41

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "faceDetectUse A "

    .line 17
    .line 18
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v3, p0, Ll/wc4;->x:J

    .line 22
    .line 23
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v3, " mMMCVInfo[0]"

    .line 27
    .line 28
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ll/omw;->n()I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 43
    .line 44
    invoke-virtual {v0, v2, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget p1, p0, Ll/wc4;->T:I

    .line 48
    .line 49
    add-int/lit8 p1, p1, 0x1

    .line 50
    .line 51
    iput p1, p0, Ll/wc4;->T:I

    .line 52
    .line 53
    const/16 v0, 0xa

    .line 54
    .line 55
    if-le p1, v0, :cond_0

    .line 56
    .line 57
    iget-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Ll/v94;->u(Z)V

    .line 60
    .line 61
    .line 62
    iput v1, p0, Ll/wc4;->T:I

    .line 63
    .line 64
    :cond_0
    return-void

    .line 65
    :cond_1
    iput v1, p0, Ll/wc4;->T:I

    .line 66
    .line 67
    return-void
.end method

.method private l2([BLl/omw;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/wc4;->g:Ll/tow;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, v0, Ll/tow;->e:I

    .line 6
    .line 7
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setWidth(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/wc4;->g:Ll/tow;

    .line 11
    .line 12
    iget v0, v0, Ll/tow;->f:I

    .line 13
    .line 14
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setHeight(I)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0}, Ll/wc4;->p2()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setRotateDegree(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/ja4;->g()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setRestoreDegree(I)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/ja4;->m()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v0}, Lcom/core/glcore/util/SegmentHelper;->setIsFrontCamera(Z)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-direct {p0, p1}, Ll/wc4;->u2([B)V

    .line 43
    .line 44
    .line 45
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->isUseFacerig()Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p1, p0, Ll/wc4;->z:Ll/umw;

    .line 52
    .line 53
    iget-object v0, p0, Ll/wc4;->A:Ll/lnw;

    .line 54
    .line 55
    invoke-static {p1, v0}, Lcom/core/glcore/util/FacerigHelper;->process(Ll/umw;Ll/lnw;)Ll/evf;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 p1, 0x0

    .line 61
    :goto_0
    invoke-virtual {p2, p1}, Ll/omw;->D(Ll/evf;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/wc4;->C:Ll/v94;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/v94;->e()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget-object v1, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 73
    .line 74
    if-nez v1, :cond_2

    .line 75
    .line 76
    if-eqz p1, :cond_2

    .line 77
    .line 78
    new-instance v1, Lcom/momocv/videoprocessor/VideoProcessor;

    .line 79
    .line 80
    invoke-direct {v1}, Lcom/momocv/videoprocessor/VideoProcessor;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 84
    .line 85
    const-string v1, "live_mmcv"

    .line 86
    .line 87
    const-string v2, "VideoProcessor.Create"

    .line 88
    .line 89
    invoke-static {v1, v2}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    const/4 v2, 0x2

    .line 97
    if-lt v1, v2, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 100
    .line 101
    const/4 v2, 0x0

    .line 102
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, Ljava/lang/String;

    .line 107
    .line 108
    const/4 v3, 0x1

    .line 109
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    check-cast p1, Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v1, v2, p1}, Lcom/momocv/videoprocessor/VideoProcessor;->LoadModel(Ljava/lang/String;Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    :cond_2
    iget-object p1, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 119
    .line 120
    if-eqz p1, :cond_3

    .line 121
    .line 122
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    iget-object p0, p0, Ll/wc4;->A:Ll/lnw;

    .line 129
    .line 130
    invoke-virtual {p0}, Ll/lnw;->f()Lcom/momocv/videoprocessor/VideoParams;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p2}, Ll/omw;->s()Lcom/momocv/videoprocessor/VideoInfo;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {p1, v1, p0, v2}, Lcom/momocv/videoprocessor/VideoProcessor;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    invoke-virtual {p2, p0}, Ll/omw;->b(I)V

    .line 146
    .line 147
    .line 148
    :cond_3
    return-void
.end method

.method private m2([BLl/omw;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/wc4;->u2([B)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/wc4;->z:Ll/umw;

    .line 5
    .line 6
    iget-object p0, p0, Ll/wc4;->A:Ll/lnw;

    .line 7
    .line 8
    invoke-static {p1, p0}, Lcom/core/glcore/util/FacerigHelper;->process(Ll/umw;Ll/lnw;)Ll/evf;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p2, p0}, Ll/omw;->D(Ll/evf;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private n2()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->c()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/high16 v0, 0x3f000000    # 0.5f

    .line 11
    .line 12
    invoke-virtual {p0, v0, v0}, Ll/u6y;->W(FF)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private final p2()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc4;->g:Ll/tow;

    .line 2
    .line 3
    iget v0, v0, Ll/tow;->D:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ja4;->g()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    rsub-int p0, v0, 0x10e

    .line 15
    .line 16
    return p0
.end method

.method private q2([B)V
    .locals 12

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/wc4;->l:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    new-instance v1, Ll/omw;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/omw;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/wc4;->f:Ll/ja4;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/ja4;->f()Ll/xpl;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v2, :cond_14

    .line 19
    .line 20
    iget-boolean v2, p0, Ll/wc4;->r:Z

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    goto/16 :goto_7

    .line 25
    .line 26
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    iget-wide v4, p0, Ll/wc4;->P:J

    .line 31
    .line 32
    sub-long/2addr v2, v4

    .line 33
    const-wide/16 v4, 0x3e8

    .line 34
    .line 35
    cmp-long v2, v2, v4

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    if-lez v2, :cond_2

    .line 39
    .line 40
    iget-boolean v2, p0, Ll/wc4;->Q:Z

    .line 41
    .line 42
    if-eqz v2, :cond_2

    .line 43
    .line 44
    iput-boolean v3, p0, Ll/wc4;->Q:Z

    .line 45
    .line 46
    iput-boolean v3, p0, Ll/wc4;->K:Z

    .line 47
    .line 48
    invoke-direct {p0}, Ll/wc4;->n2()V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto/16 :goto_8

    .line 54
    .line 55
    :cond_2
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v6

    .line 59
    iget v2, p0, Ll/wc4;->I:I

    .line 60
    .line 61
    if-nez v2, :cond_4

    .line 62
    .line 63
    iget-object v2, p0, Ll/wc4;->k:Ll/row;

    .line 64
    .line 65
    invoke-virtual {v2}, Ll/row;->h()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_3

    .line 70
    .line 71
    iget-object v2, p0, Ll/wc4;->k:Ll/row;

    .line 72
    .line 73
    invoke-virtual {v2}, Ll/row;->h()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    int-to-long v8, v2

    .line 78
    div-long/2addr v4, v8

    .line 79
    goto :goto_1

    .line 80
    :cond_3
    const-wide/16 v4, 0x42

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_4
    int-to-long v8, v2

    .line 84
    div-long/2addr v4, v8

    .line 85
    :goto_1
    iget-wide v8, p0, Ll/wc4;->t:J

    .line 86
    .line 87
    sub-long/2addr v6, v8

    .line 88
    cmp-long v2, v6, v4

    .line 89
    .line 90
    if-ltz v2, :cond_13

    .line 91
    .line 92
    iget-boolean v2, p0, Ll/wc4;->q:Z

    .line 93
    .line 94
    if-eqz v2, :cond_5

    .line 95
    .line 96
    goto/16 :goto_6

    .line 97
    .line 98
    :cond_5
    const-wide/16 v10, 0x0

    .line 99
    .line 100
    cmp-long v2, v8, v10

    .line 101
    .line 102
    if-eqz v2, :cond_7

    .line 103
    .line 104
    const-wide/16 v10, 0x5

    .line 105
    .line 106
    mul-long/2addr v10, v4

    .line 107
    cmp-long v2, v6, v10

    .line 108
    .line 109
    if-lez v2, :cond_6

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_6
    add-long/2addr v8, v4

    .line 113
    iput-wide v8, p0, Ll/wc4;->t:J

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_7
    :goto_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 117
    .line 118
    .line 119
    move-result-wide v4

    .line 120
    iput-wide v4, p0, Ll/wc4;->t:J

    .line 121
    .line 122
    :goto_3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 123
    .line 124
    .line 125
    move-result-wide v4

    .line 126
    iput-wide v4, p0, Ll/wc4;->S:J

    .line 127
    .line 128
    iget-object v2, p0, Ll/wc4;->C:Ll/v94;

    .line 129
    .line 130
    invoke-virtual {v2}, Ll/v94;->m()Z

    .line 131
    .line 132
    .line 133
    move-result v2

    .line 134
    iget-object v4, p0, Ll/wc4;->Y:[B

    .line 135
    .line 136
    if-eqz v4, :cond_8

    .line 137
    .line 138
    array-length v4, v4

    .line 139
    array-length v5, p1

    .line 140
    if-eq v4, v5, :cond_9

    .line 141
    .line 142
    :cond_8
    array-length v4, p1

    .line 143
    new-array v4, v4, [B

    .line 144
    .line 145
    iput-object v4, p0, Ll/wc4;->Y:[B

    .line 146
    .line 147
    :cond_9
    iget-object v4, p0, Ll/wc4;->Y:[B

    .line 148
    .line 149
    array-length v5, p1

    .line 150
    invoke-static {p1, v3, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 151
    .line 152
    .line 153
    if-eqz v2, :cond_a

    .line 154
    .line 155
    iget-object v2, p0, Ll/wc4;->Y:[B

    .line 156
    .line 157
    invoke-direct {p0, v2, v1}, Ll/wc4;->l2([BLl/omw;)V

    .line 158
    .line 159
    .line 160
    goto :goto_4

    .line 161
    :cond_a
    invoke-static {}, Lcom/core/glcore/util/FacerigHelper;->isUseFacerig()Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    if-eqz v2, :cond_b

    .line 166
    .line 167
    iget-object v2, p0, Ll/wc4;->Y:[B

    .line 168
    .line 169
    invoke-direct {p0, v2, v1}, Ll/wc4;->m2([BLl/omw;)V

    .line 170
    .line 171
    .line 172
    :cond_b
    :goto_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 173
    .line 174
    .line 175
    move-result-wide v4

    .line 176
    iget-wide v6, p0, Ll/wc4;->S:J

    .line 177
    .line 178
    sub-long/2addr v4, v6

    .line 179
    iput-wide v4, p0, Ll/wc4;->x:J

    .line 180
    .line 181
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    iget-wide v4, p0, Ll/wc4;->x:J

    .line 186
    .line 187
    invoke-virtual {v2, v4, v5}, Ll/u6y;->e0(J)V

    .line 188
    .line 189
    .line 190
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->isUseBodyLand()Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    const/4 v4, 0x2

    .line 195
    if-eqz v2, :cond_e

    .line 196
    .line 197
    iget-object v2, p0, Ll/wc4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 198
    .line 199
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_e

    .line 204
    .line 205
    iget-object v2, p0, Ll/wc4;->p0:[B

    .line 206
    .line 207
    if-eqz v2, :cond_c

    .line 208
    .line 209
    array-length v2, v2

    .line 210
    array-length v5, p1

    .line 211
    if-ge v2, v5, :cond_d

    .line 212
    .line 213
    :cond_c
    array-length v2, p1

    .line 214
    new-array v2, v2, [B

    .line 215
    .line 216
    iput-object v2, p0, Ll/wc4;->p0:[B

    .line 217
    .line 218
    :cond_d
    iget-object v2, p0, Ll/wc4;->p0:[B

    .line 219
    .line 220
    array-length v5, p1

    .line 221
    invoke-static {p1, v3, v2, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/wc4;->E0:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 225
    .line 226
    invoke-virtual {p1, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 227
    .line 228
    .line 229
    new-instance p1, Ll/wc4$i;

    .line 230
    .line 231
    invoke-direct {p1, p0}, Ll/wc4$i;-><init>(Ll/wc4;)V

    .line 232
    .line 233
    .line 234
    invoke-static {v4, p1}, Lcom/immomo/mmutil/task/c;->d(ILjava/lang/Runnable;)V

    .line 235
    .line 236
    .line 237
    :cond_e
    iget-object p1, p0, Ll/wc4;->Y:[B

    .line 238
    .line 239
    invoke-direct {p0, v1, p1}, Ll/wc4;->t2(Ll/omw;[B)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v1}, Ll/omw;->n()I

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    if-lez p1, :cond_f

    .line 247
    .line 248
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    const/4 v2, 0x1

    .line 253
    invoke-virtual {p1, v2}, Ll/u6y;->l0(Z)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {v1, v3}, Ll/omw;->j(I)Ll/nuf;

    .line 257
    .line 258
    .line 259
    move-result-object p1

    .line 260
    invoke-virtual {p1}, Ll/nuf;->p()[F

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    aget v3, p1, v3

    .line 269
    .line 270
    iget v6, v1, Ll/omw;->e:I

    .line 271
    .line 272
    int-to-float v7, v6

    .line 273
    div-float/2addr v3, v7

    .line 274
    aget v2, p1, v2

    .line 275
    .line 276
    iget v7, v1, Ll/omw;->f:I

    .line 277
    .line 278
    int-to-float v8, v7

    .line 279
    div-float/2addr v2, v8

    .line 280
    aget v4, p1, v4

    .line 281
    .line 282
    int-to-float v6, v6

    .line 283
    div-float/2addr v4, v6

    .line 284
    const/4 v6, 0x3

    .line 285
    aget p1, p1, v6

    .line 286
    .line 287
    int-to-float v6, v7

    .line 288
    div-float/2addr p1, v6

    .line 289
    invoke-virtual {v5, v3, v2, v4, p1}, Ll/u6y;->g0(FFFF)V

    .line 290
    .line 291
    .line 292
    goto :goto_5

    .line 293
    :cond_f
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-virtual {p1, v3}, Ll/u6y;->l0(Z)V

    .line 298
    .line 299
    .line 300
    :goto_5
    iget-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 301
    .line 302
    invoke-virtual {p1}, Ll/v94;->a()I

    .line 303
    .line 304
    .line 305
    move-result p1

    .line 306
    if-lez p1, :cond_10

    .line 307
    .line 308
    invoke-direct {p0, v1}, Ll/wc4;->i2(Ll/omw;)V

    .line 309
    .line 310
    .line 311
    :cond_10
    iget-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 312
    .line 313
    invoke-virtual {p1}, Ll/v94;->p()Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    if-eqz p1, :cond_11

    .line 318
    .line 319
    invoke-direct {p0, v1}, Ll/wc4;->k2(Ll/omw;)V

    .line 320
    .line 321
    .line 322
    :cond_11
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 323
    .line 324
    .line 325
    move-result-wide v2

    .line 326
    iget-object p1, p0, Ll/wc4;->Y:[B

    .line 327
    .line 328
    invoke-direct {p0, v1, p1}, Ll/wc4;->s2(Ll/omw;[B)V

    .line 329
    .line 330
    .line 331
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 336
    .line 337
    .line 338
    move-result-wide v4

    .line 339
    sub-long/2addr v4, v2

    .line 340
    invoke-virtual {p1, v4, v5}, Ll/u6y;->b0(J)V

    .line 341
    .line 342
    .line 343
    iget-object p1, p0, Ll/wc4;->E:Ll/yuf;

    .line 344
    .line 345
    if-eqz p1, :cond_12

    .line 346
    .line 347
    invoke-virtual {v1}, Ll/omw;->l()[[B

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    if-eqz p1, :cond_12

    .line 352
    .line 353
    iget-object p0, p0, Ll/wc4;->E:Ll/yuf;

    .line 354
    .line 355
    invoke-virtual {v1}, Ll/omw;->l()[[B

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    invoke-interface {p0, p1}, Ll/yuf;->a([[B)V

    .line 360
    .line 361
    .line 362
    :cond_12
    monitor-exit v0

    .line 363
    return-void

    .line 364
    :cond_13
    :goto_6
    monitor-exit v0

    .line 365
    return-void

    .line 366
    :cond_14
    :goto_7
    monitor-exit v0

    .line 367
    return-void

    .line 368
    :goto_8
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 369
    throw p0
.end method

.method private r2()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wc4$l;->c()Ll/wc4$k;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/wc4$l;->c()Ll/wc4$k;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ll/wc4$k;->a()V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    :catch_0
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private s2(Ll/omw;[B)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wc4;->i:Ll/g510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/wc4$j;

    .line 6
    .line 7
    invoke-direct {v1, p0, p2}, Ll/wc4$j;-><init>(Ll/wc4;[B)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Ll/wc4$a;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/wc4$a;-><init>(Ll/wc4;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1, v1, p2}, Ll/g510;->A(Ll/omw;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method private t2(Ll/omw;[B)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ja4;->m()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1, v0}, Ll/omw;->z(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/wc4;->p2()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual {p1, v0}, Ll/omw;->w(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/ja4;->g()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1, v0}, Ll/omw;->C(I)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ll/omw;->y([B)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 30
    .line 31
    iget p2, p2, Ll/tow;->e:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ll/omw;->E(I)V

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 37
    .line 38
    iget p2, p2, Ll/tow;->f:I

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/omw;->A(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/wc4;->g:Ll/tow;

    .line 44
    .line 45
    iget p0, p0, Ll/tow;->D:I

    .line 46
    .line 47
    invoke-virtual {p1, p0}, Ll/omw;->x(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method private u2([B)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 4
    .line 5
    const/16 v2, 0x11

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ll/umw;->h(I)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 11
    .line 12
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 13
    .line 14
    iget v2, v2, Ll/tow;->e:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ll/umw;->m(I)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 20
    .line 21
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 22
    .line 23
    iget v2, v2, Ll/tow;->f:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Ll/umw;->j(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ll/umw;->g([B)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/wc4;->z:Ll/umw;

    .line 42
    .line 43
    array-length p1, p1

    .line 44
    invoke-virtual {v1, p1}, Ll/umw;->f(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/wc4;->z:Ll/umw;

    .line 48
    .line 49
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 50
    .line 51
    iget v1, v1, Ll/tow;->e:I

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/umw;->l(I)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 57
    .line 58
    invoke-direct {p0}, Ll/wc4;->p2()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    invoke-virtual {p1, v1}, Ll/lnw;->A(I)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 66
    .line 67
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/ja4;->g()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p1, v1}, Ll/lnw;->z(I)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 77
    .line 78
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 79
    .line 80
    invoke-virtual {v1}, Ll/ja4;->m()Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-virtual {p1, v1}, Ll/lnw;->p(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1, v1}, Ll/lnw;->M(I)V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/v94;->i()F

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-virtual {p1, v1}, Ll/lnw;->K(F)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/v94;->b()F

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-virtual {p1, v1}, Ll/lnw;->L(F)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/v94;->h()F

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    invoke-virtual {p1, v1}, Ll/lnw;->C(F)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/v94;->g()Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    invoke-virtual {p1, v1}, Ll/lnw;->D(Z)V

    .line 130
    .line 131
    .line 132
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/v94;->f()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    invoke-virtual {p1, v1}, Ll/lnw;->q(I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/v94;->q()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    invoke-virtual {p1, v1}, Ll/lnw;->G(Z)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 151
    .line 152
    const/4 v1, 0x1

    .line 153
    invoke-virtual {p1, v1}, Ll/lnw;->h(Z)V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/v94;->d()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {p1, v2}, Ll/lnw;->r(I)V

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Ll/wc4;->D:Ll/nx3;

    .line 166
    .line 167
    iget-object v2, p0, Ll/wc4;->A:Ll/lnw;

    .line 168
    .line 169
    const/16 v3, 0x68

    .line 170
    .line 171
    const/4 v4, 0x0

    .line 172
    if-nez p1, :cond_1

    .line 173
    .line 174
    invoke-virtual {v0}, Ll/v94;->n()Z

    .line 175
    .line 176
    .line 177
    move-result p1

    .line 178
    invoke-virtual {v2, p1}, Ll/lnw;->k(Z)V

    .line 179
    .line 180
    .line 181
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 182
    .line 183
    invoke-virtual {v0}, Ll/v94;->o()Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    invoke-virtual {p1, v2}, Ll/lnw;->l(Z)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    iget-object v2, p0, Ll/wc4;->A:Ll/lnw;

    .line 195
    .line 196
    if-ne p1, v3, :cond_0

    .line 197
    .line 198
    invoke-virtual {v2, v4}, Ll/lnw;->F(Z)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 202
    .line 203
    invoke-virtual {p1, v4}, Ll/lnw;->i(Z)V

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_0
    invoke-virtual {v0}, Ll/v94;->k()Z

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    invoke-virtual {v2, p1}, Ll/lnw;->i(Z)V

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 215
    .line 216
    invoke-virtual {p1, v1}, Ll/lnw;->F(Z)V

    .line 217
    .line 218
    .line 219
    :goto_0
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 220
    .line 221
    invoke-virtual {p1, v4}, Ll/lnw;->n(Z)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 225
    .line 226
    invoke-virtual {p1, v1}, Ll/lnw;->w(I)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Ll/wc4;->A:Ll/lnw;

    .line 230
    .line 231
    const/4 v0, 0x2

    .line 232
    invoke-virtual {p1, v0}, Ll/lnw;->j(I)V

    .line 233
    .line 234
    .line 235
    goto/16 :goto_2

    .line 236
    .line 237
    :cond_1
    invoke-virtual {p1}, Ll/nx3;->a()I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    invoke-virtual {v2, v1}, Ll/lnw;->j(I)V

    .line 242
    .line 243
    .line 244
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 245
    .line 246
    invoke-virtual {p1}, Ll/nx3;->b()I

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    invoke-virtual {v1, v2}, Ll/lnw;->m(I)V

    .line 251
    .line 252
    .line 253
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 254
    .line 255
    invoke-virtual {p1}, Ll/nx3;->d()I

    .line 256
    .line 257
    .line 258
    move-result v2

    .line 259
    invoke-virtual {v1, v2}, Ll/lnw;->s(I)V

    .line 260
    .line 261
    .line 262
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 263
    .line 264
    invoke-virtual {p1}, Ll/nx3;->e()I

    .line 265
    .line 266
    .line 267
    move-result v2

    .line 268
    invoke-virtual {v1, v2}, Ll/lnw;->x(I)V

    .line 269
    .line 270
    .line 271
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 272
    .line 273
    invoke-virtual {p1}, Ll/nx3;->f()F

    .line 274
    .line 275
    .line 276
    move-result v2

    .line 277
    invoke-virtual {v1, v2}, Ll/lnw;->y(F)V

    .line 278
    .line 279
    .line 280
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 281
    .line 282
    invoke-virtual {p1}, Ll/nx3;->k()Z

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    invoke-virtual {v1, v2}, Ll/lnw;->t(Z)V

    .line 287
    .line 288
    .line 289
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 290
    .line 291
    invoke-virtual {p1}, Ll/nx3;->n()Z

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    invoke-virtual {v1, v2}, Ll/lnw;->J(Z)V

    .line 296
    .line 297
    .line 298
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 299
    .line 300
    invoke-virtual {p1}, Ll/nx3;->m()Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    invoke-virtual {v1, v2}, Ll/lnw;->I(Z)V

    .line 305
    .line 306
    .line 307
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 308
    .line 309
    invoke-virtual {p1}, Ll/nx3;->h()Z

    .line 310
    .line 311
    .line 312
    move-result v2

    .line 313
    invoke-virtual {v0}, Ll/v94;->n()Z

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    and-int/2addr v2, v5

    .line 318
    invoke-virtual {v1, v2}, Ll/lnw;->k(Z)V

    .line 319
    .line 320
    .line 321
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 322
    .line 323
    invoke-virtual {p1}, Ll/nx3;->i()Z

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    invoke-virtual {v0}, Ll/v94;->o()Z

    .line 328
    .line 329
    .line 330
    move-result v5

    .line 331
    and-int/2addr v2, v5

    .line 332
    invoke-virtual {v1, v2}, Ll/lnw;->l(Z)V

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ll/v94;->j()I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    iget-object v1, p0, Ll/wc4;->A:Ll/lnw;

    .line 340
    .line 341
    if-ne v0, v3, :cond_2

    .line 342
    .line 343
    invoke-virtual {v1, v4}, Ll/lnw;->F(Z)V

    .line 344
    .line 345
    .line 346
    iget-object v0, p0, Ll/wc4;->A:Ll/lnw;

    .line 347
    .line 348
    invoke-virtual {v0, v4}, Ll/lnw;->i(Z)V

    .line 349
    .line 350
    .line 351
    goto :goto_1

    .line 352
    :cond_2
    invoke-virtual {p1}, Ll/nx3;->l()Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    invoke-virtual {v1, v0}, Ll/lnw;->F(Z)V

    .line 357
    .line 358
    .line 359
    iget-object v0, p0, Ll/wc4;->A:Ll/lnw;

    .line 360
    .line 361
    invoke-virtual {p1}, Ll/nx3;->g()Z

    .line 362
    .line 363
    .line 364
    move-result v1

    .line 365
    invoke-virtual {v0, v1}, Ll/lnw;->i(Z)V

    .line 366
    .line 367
    .line 368
    :goto_1
    iget-object v0, p0, Ll/wc4;->A:Ll/lnw;

    .line 369
    .line 370
    invoke-virtual {p1}, Ll/nx3;->j()Z

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    invoke-virtual {v0, v1}, Ll/lnw;->n(Z)V

    .line 375
    .line 376
    .line 377
    iget-object v0, p0, Ll/wc4;->A:Ll/lnw;

    .line 378
    .line 379
    invoke-virtual {p1}, Ll/nx3;->c()I

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    invoke-virtual {v0, p1}, Ll/lnw;->o(I)V

    .line 384
    .line 385
    .line 386
    :goto_2
    iget-object p0, p0, Ll/wc4;->A:Ll/lnw;

    .line 387
    .line 388
    invoke-virtual {p0, v4}, Ll/lnw;->B(Z)V

    .line 389
    .line 390
    .line 391
    return-void
.end method


# virtual methods
.method public B(Ll/row;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "resetCamera"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/wc4;->k:Ll/row;

    .line 13
    .line 14
    iget-object p1, p0, Ll/wc4;->i:Ll/g510;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    new-instance v0, Ll/wc4$c;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/wc4$c;-><init>(Ll/wc4;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/g510;->i(Ll/u410;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/wc4;->i:Ll/g510;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/g510;->D()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v1, "resetCamera\r\nvideoWidth:"

    .line 42
    .line 43
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 47
    .line 48
    iget v1, v1, Ll/tow;->s:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",videoHeight:"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 59
    .line 60
    iget v1, v1, Ll/tow;->t:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v1, ",visualWidth:"

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 71
    .line 72
    iget v1, v1, Ll/tow;->u:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v1, ",visualHeight:"

    .line 78
    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 83
    .line 84
    iget v1, v1, Ll/tow;->v:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v1, ",encodeWidth:"

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 95
    .line 96
    iget v1, v1, Ll/tow;->m:I

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v1, ",encodeHeight:"

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 107
    .line 108
    iget v1, v1, Ll/tow;->n:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v1, ",videoBitrate:"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 119
    .line 120
    iget v1, v1, Ll/tow;->H:I

    .line 121
    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v1, ",audioBitrate:"

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 131
    .line 132
    iget v1, v1, Ll/tow;->S:I

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, ",videoFPS:"

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 143
    .line 144
    iget v1, v1, Ll/tow;->F:I

    .line 145
    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v1, ",targetWidth"

    .line 150
    .line 151
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v1, p0, Ll/wc4;->k:Ll/row;

    .line 155
    .line 156
    invoke-virtual {v1}, Ll/row;->f()Ll/erf0;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Ll/erf0;->b()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v1, ",targetHeight"

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    iget-object v1, p0, Ll/wc4;->k:Ll/row;

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/row;->f()Ll/erf0;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {v1}, Ll/erf0;->a()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, ", renderFps"

    .line 186
    .line 187
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Ll/wc4;->k:Ll/row;

    .line 191
    .line 192
    invoke-virtual {v1}, Ll/row;->h()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v1, ", degree"

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v1, p0, Ll/wc4;->J:I

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-virtual {p1, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 217
    .line 218
    iget v0, p0, Ll/wc4;->J:I

    .line 219
    .line 220
    iget-object v1, p0, Ll/wc4;->k:Ll/row;

    .line 221
    .line 222
    invoke-virtual {p1, v0, v1}, Ll/ja4;->s(ILl/row;)Z

    .line 223
    .line 224
    .line 225
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 226
    .line 227
    new-instance v0, Ll/wc4$d;

    .line 228
    .line 229
    invoke-direct {v0, p0}, Ll/wc4$d;-><init>(Ll/wc4;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1, v0}, Ll/ja4;->x(Ll/ciw$h;)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 236
    .line 237
    new-instance v0, Ll/wc4$e;

    .line 238
    .line 239
    invoke-direct {v0, p0}, Ll/wc4$e;-><init>(Ll/wc4;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, v0}, Ll/ja4;->y(Landroid/hardware/Camera$ErrorCallback;)V

    .line 243
    .line 244
    .line 245
    :cond_1
    const/4 p1, 0x0

    .line 246
    iput-boolean p1, p0, Ll/wc4;->r:Z

    .line 247
    .line 248
    invoke-virtual {p0}, Ll/wc4;->o2()Landroid/graphics/SurfaceTexture;

    .line 249
    .line 250
    .line 251
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 252
    .line 253
    iget-object v1, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ll/ja4;->B(Landroid/graphics/SurfaceTexture;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_2

    .line 260
    .line 261
    iget-object v0, p0, Ll/wc4;->m:Ll/q210$a;

    .line 262
    .line 263
    if-eqz v0, :cond_2

    .line 264
    .line 265
    const/16 v1, 0x4100

    .line 266
    .line 267
    const/4 v2, -0x1

    .line 268
    invoke-interface {v0, v1, v2, p1, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    :cond_2
    return-void
.end method

.method public D([B)V
    .locals 1

    .line 1
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/u6y;->N()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/wc4;->g:Ll/tow;

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/tow;->g0:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ll/wc4;->q2([B)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-direct {p0, p1}, Ll/wc4;->q2([B)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public E(ILl/row;)V
    .locals 7

    .line 1
    iput-object p2, p0, Ll/wc4;->k:Ll/row;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ll/wc4;->q:Z

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    iput-boolean v1, p0, Ll/wc4;->Q:Z

    .line 8
    .line 9
    iput p1, p0, Ll/wc4;->J:I

    .line 10
    .line 11
    const/16 v2, 0x4100

    .line 12
    .line 13
    :try_start_0
    iget-object v3, p0, Ll/wc4;->f:Ll/ja4;

    .line 14
    .line 15
    invoke-virtual {v3, p1, p2}, Ll/ja4;->C(ILl/row;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    iget-object v3, p0, Ll/wc4;->m:Ll/q210$a;

    .line 22
    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    const/4 v4, -0x5

    .line 26
    invoke-interface {v3, v2, v4, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    :catch_0
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v5, "startPreview degree:"

    .line 36
    .line 37
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v5, "Pipeline_Normal_pip->PIPLINE"

    .line 48
    .line 49
    invoke-virtual {v3, v5, v4}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iput-object p2, p0, Ll/wc4;->k:Ll/row;

    .line 53
    .line 54
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    new-instance v4, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    const-string v6, "switchCamera line: 551 videoWidth:"

    .line 61
    .line 62
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 66
    .line 67
    iget v6, v6, Ll/tow;->s:I

    .line 68
    .line 69
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v6, ",videoHeight:"

    .line 73
    .line 74
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 78
    .line 79
    iget v6, v6, Ll/tow;->t:I

    .line 80
    .line 81
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string v6, ",visualWidth:"

    .line 85
    .line 86
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 90
    .line 91
    iget v6, v6, Ll/tow;->u:I

    .line 92
    .line 93
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v6, ",visualHeight:"

    .line 97
    .line 98
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 102
    .line 103
    iget v6, v6, Ll/tow;->v:I

    .line 104
    .line 105
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v6, ",encodeWidth:"

    .line 109
    .line 110
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 114
    .line 115
    iget v6, v6, Ll/tow;->m:I

    .line 116
    .line 117
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v6, ",encodeHeight:"

    .line 121
    .line 122
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 126
    .line 127
    iget v6, v6, Ll/tow;->n:I

    .line 128
    .line 129
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v6, ",videoBitrate:"

    .line 133
    .line 134
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 138
    .line 139
    iget v6, v6, Ll/tow;->H:I

    .line 140
    .line 141
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string v6, ",audioBitrate:"

    .line 145
    .line 146
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 150
    .line 151
    iget v6, v6, Ll/tow;->S:I

    .line 152
    .line 153
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v6, ",videoFPS:"

    .line 157
    .line 158
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    iget-object v6, p0, Ll/wc4;->g:Ll/tow;

    .line 162
    .line 163
    iget v6, v6, Ll/tow;->F:I

    .line 164
    .line 165
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v6, ",targetWidth"

    .line 169
    .line 170
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-virtual {v6}, Ll/erf0;->b()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string v6, ",targetHeight"

    .line 185
    .line 186
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p2}, Ll/erf0;->a()I

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string p2, ", mCurrentDegree"

    .line 201
    .line 202
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string p1, ", renderFps"

    .line 209
    .line 210
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    iget-object p1, p0, Ll/wc4;->k:Ll/row;

    .line 214
    .line 215
    invoke-virtual {p1}, Ll/row;->h()I

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    invoke-virtual {v3, v5, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    new-instance p1, Ll/erf0;

    .line 230
    .line 231
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 232
    .line 233
    iget v3, p2, Ll/tow;->e:I

    .line 234
    .line 235
    iget p2, p2, Ll/tow;->f:I

    .line 236
    .line 237
    invoke-direct {p1, v3, p2}, Ll/erf0;-><init>(II)V

    .line 238
    .line 239
    .line 240
    new-instance p2, Ll/erf0;

    .line 241
    .line 242
    const/16 v3, 0x9

    .line 243
    .line 244
    const/16 v4, 0x10

    .line 245
    .line 246
    invoke-direct {p2, v3, v4}, Ll/erf0;-><init>(II)V

    .line 247
    .line 248
    .line 249
    iget-object v3, p0, Ll/wc4;->f:Ll/ja4;

    .line 250
    .line 251
    invoke-virtual {v3}, Ll/ja4;->g()I

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    invoke-static {p1, p2, v3}, Lcom/core/glcore/util/CameraUtil;->reScaleSize(Ll/erf0;Ll/erf0;I)Ll/erf0;

    .line 256
    .line 257
    .line 258
    iget-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 259
    .line 260
    if-eqz p1, :cond_2

    .line 261
    .line 262
    iget-object p1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 263
    .line 264
    if-eqz p1, :cond_1

    .line 265
    .line 266
    const/4 p2, 0x0

    .line 267
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 268
    .line 269
    .line 270
    :cond_1
    iget-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 271
    .line 272
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 273
    .line 274
    .line 275
    new-instance p1, Landroid/os/HandlerThread;

    .line 276
    .line 277
    const-string p2, "HaniPreviewDataProcess"

    .line 278
    .line 279
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    iput-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 283
    .line 284
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 285
    .line 286
    .line 287
    new-instance p1, Landroid/os/Handler;

    .line 288
    .line 289
    iget-object p2, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 290
    .line 291
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 296
    .line 297
    .line 298
    iput-object p1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 299
    .line 300
    :cond_2
    iget-object p1, p0, Ll/wc4;->g:Ll/tow;

    .line 301
    .line 302
    iget p1, p1, Ll/tow;->s:I

    .line 303
    .line 304
    div-int/lit8 p1, p1, 0xc

    .line 305
    .line 306
    iput p1, p0, Ll/wc4;->v:I

    .line 307
    .line 308
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 309
    .line 310
    invoke-virtual {p1}, Ll/ja4;->m()Z

    .line 311
    .line 312
    .line 313
    move-result p1

    .line 314
    iget-object p2, p0, Ll/wc4;->f:Ll/ja4;

    .line 315
    .line 316
    if-eqz p1, :cond_3

    .line 317
    .line 318
    invoke-virtual {p2}, Ll/ja4;->g()I

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    rsub-int p1, p1, 0x168

    .line 323
    .line 324
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 325
    .line 326
    .line 327
    const/4 p1, 0x2

    .line 328
    invoke-virtual {p0, p1}, Ll/gb20;->flipPosition(I)V

    .line 329
    .line 330
    .line 331
    goto :goto_0

    .line 332
    :cond_3
    invoke-virtual {p2}, Ll/ja4;->g()I

    .line 333
    .line 334
    .line 335
    move-result p1

    .line 336
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 337
    .line 338
    .line 339
    invoke-virtual {p0, v1}, Ll/gb20;->flipPosition(I)V

    .line 340
    .line 341
    .line 342
    :goto_0
    iput-boolean v0, p0, Ll/wc4;->r:Z

    .line 343
    .line 344
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 345
    .line 346
    iget-object p2, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 347
    .line 348
    invoke-virtual {p1, p2}, Ll/ja4;->B(Landroid/graphics/SurfaceTexture;)Z

    .line 349
    .line 350
    .line 351
    move-result p1

    .line 352
    if-nez p1, :cond_4

    .line 353
    .line 354
    iget-object p1, p0, Ll/wc4;->m:Ll/q210$a;

    .line 355
    .line 356
    if-eqz p1, :cond_4

    .line 357
    .line 358
    const/4 p2, -0x1

    .line 359
    invoke-interface {p1, v2, p2, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 360
    .line 361
    .line 362
    :cond_4
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 367
    .line 368
    invoke-virtual {p0}, Ll/ja4;->m()Z

    .line 369
    .line 370
    .line 371
    move-result p0

    .line 372
    invoke-virtual {p1, p0}, Ll/u6y;->X(I)V

    .line 373
    .line 374
    .line 375
    return-void
.end method

.method public E1(ILl/row;)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "startPreview"

    .line 6
    .line 7
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 8
    .line 9
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Ll/wc4;->q:Z

    .line 14
    .line 15
    iput-object p2, p0, Ll/wc4;->k:Ll/row;

    .line 16
    .line 17
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/ja4;->f()Ll/xpl;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 26
    .line 27
    iget-object v3, p0, Ll/wc4;->g:Ll/tow;

    .line 28
    .line 29
    invoke-virtual {v1, v3, v0}, Ll/ja4;->l(Ll/tow;Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 33
    .line 34
    invoke-virtual {v1, p0}, Ll/ja4;->z(Ll/xpl$d;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v4, "startPreview(int degree, MRConfig mrConfig)\r\nvideoWidth:"

    .line 44
    .line 45
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 49
    .line 50
    iget v4, v4, Ll/tow;->s:I

    .line 51
    .line 52
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v4, ",videoHeight:"

    .line 56
    .line 57
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 61
    .line 62
    iget v4, v4, Ll/tow;->t:I

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v4, ",visualWidth:"

    .line 68
    .line 69
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 73
    .line 74
    iget v4, v4, Ll/tow;->u:I

    .line 75
    .line 76
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v4, ",visualHeight:"

    .line 80
    .line 81
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 85
    .line 86
    iget v4, v4, Ll/tow;->v:I

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v4, ",encodeWidth:"

    .line 92
    .line 93
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 97
    .line 98
    iget v4, v4, Ll/tow;->m:I

    .line 99
    .line 100
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v4, ",encodeHeight:"

    .line 104
    .line 105
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 109
    .line 110
    iget v4, v4, Ll/tow;->n:I

    .line 111
    .line 112
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v4, ",videoBitrate:"

    .line 116
    .line 117
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 121
    .line 122
    iget v4, v4, Ll/tow;->H:I

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v4, ",audioBitrate:"

    .line 128
    .line 129
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 133
    .line 134
    iget v4, v4, Ll/tow;->S:I

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v4, ",videoFPS:"

    .line 140
    .line 141
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v4, p0, Ll/wc4;->g:Ll/tow;

    .line 145
    .line 146
    iget v4, v4, Ll/tow;->F:I

    .line 147
    .line 148
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v4, ",targetWidth"

    .line 152
    .line 153
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v4}, Ll/erf0;->b()I

    .line 161
    .line 162
    .line 163
    move-result v4

    .line 164
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v4, ",targetHeight"

    .line 168
    .line 169
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2}, Ll/row;->f()Ll/erf0;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    invoke-virtual {v4}, Ll/erf0;->a()I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v4, ", mCurrentDegree"

    .line 184
    .line 185
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    const-string v4, ", renderFps"

    .line 192
    .line 193
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    iget-object v4, p0, Ll/wc4;->k:Ll/row;

    .line 197
    .line 198
    invoke-virtual {v4}, Ll/row;->h()I

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iput p1, p0, Ll/wc4;->J:I

    .line 213
    .line 214
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    new-instance v3, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    const-string v4, "startPreview degree:"

    .line 221
    .line 222
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v1, v2, v3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 236
    .line 237
    sget-object v2, Ll/l26;->a:Landroid/content/Context;

    .line 238
    .line 239
    invoke-virtual {v1, v2}, Ll/ja4;->u(Landroid/content/Context;)V

    .line 240
    .line 241
    .line 242
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 243
    .line 244
    invoke-virtual {v1, p1, p2}, Ll/ja4;->p(ILl/row;)Z

    .line 245
    .line 246
    .line 247
    move-result p1

    .line 248
    if-nez p1, :cond_2

    .line 249
    .line 250
    const-string p1, "Camera prepare Failed!"

    .line 251
    .line 252
    invoke-static {p1}, Lcom/core/glcore/util/Log4Cam;->e(Ljava/lang/String;)I

    .line 253
    .line 254
    .line 255
    iget-object p1, p0, Ll/wc4;->m:Ll/q210$a;

    .line 256
    .line 257
    if-eqz p1, :cond_1

    .line 258
    .line 259
    const/16 p2, 0x4100

    .line 260
    .line 261
    const/4 v1, -0x4

    .line 262
    invoke-interface {p1, p2, v1, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    :cond_1
    return v0

    .line 266
    :cond_2
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 267
    .line 268
    new-instance p2, Ll/wc4$f;

    .line 269
    .line 270
    invoke-direct {p2, p0}, Ll/wc4$f;-><init>(Ll/wc4;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, p2}, Ll/ja4;->x(Ll/ciw$h;)V

    .line 274
    .line 275
    .line 276
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 277
    .line 278
    new-instance p2, Ll/wc4$g;

    .line 279
    .line 280
    invoke-direct {p2, p0}, Ll/wc4$g;-><init>(Ll/wc4;)V

    .line 281
    .line 282
    .line 283
    invoke-virtual {p1, p2}, Ll/ja4;->y(Landroid/hardware/Camera$ErrorCallback;)V

    .line 284
    .line 285
    .line 286
    iget-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 287
    .line 288
    if-eqz p1, :cond_4

    .line 289
    .line 290
    iget-object p1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 291
    .line 292
    if-eqz p1, :cond_3

    .line 293
    .line 294
    const/4 p2, 0x0

    .line 295
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 296
    .line 297
    .line 298
    :cond_3
    iget-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 299
    .line 300
    invoke-virtual {p1}, Landroid/os/HandlerThread;->quit()Z

    .line 301
    .line 302
    .line 303
    :cond_4
    new-instance p1, Landroid/os/HandlerThread;

    .line 304
    .line 305
    const-string p2, "HaniPreviewDataProcess"

    .line 306
    .line 307
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 308
    .line 309
    .line 310
    iput-object p1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 311
    .line 312
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 313
    .line 314
    .line 315
    new-instance p1, Landroid/os/Handler;

    .line 316
    .line 317
    iget-object p2, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 318
    .line 319
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 320
    .line 321
    .line 322
    move-result-object p2

    .line 323
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 324
    .line 325
    .line 326
    iput-object p1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 327
    .line 328
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 329
    .line 330
    invoke-virtual {p1, p0}, Ll/ja4;->v(Ll/ja4$a;)V

    .line 331
    .line 332
    .line 333
    iget-object p1, p0, Ll/wc4;->g:Ll/tow;

    .line 334
    .line 335
    iget p1, p1, Ll/tow;->s:I

    .line 336
    .line 337
    div-int/lit8 p1, p1, 0xc

    .line 338
    .line 339
    iput p1, p0, Ll/wc4;->v:I

    .line 340
    .line 341
    invoke-virtual {p0}, Ll/wc4;->o2()Landroid/graphics/SurfaceTexture;

    .line 342
    .line 343
    .line 344
    new-instance p1, Ll/erf0;

    .line 345
    .line 346
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 347
    .line 348
    iget v1, p2, Ll/tow;->e:I

    .line 349
    .line 350
    iget p2, p2, Ll/tow;->f:I

    .line 351
    .line 352
    invoke-direct {p1, v1, p2}, Ll/erf0;-><init>(II)V

    .line 353
    .line 354
    .line 355
    new-instance p2, Ll/erf0;

    .line 356
    .line 357
    const/16 v1, 0x9

    .line 358
    .line 359
    const/16 v2, 0x10

    .line 360
    .line 361
    invoke-direct {p2, v1, v2}, Ll/erf0;-><init>(II)V

    .line 362
    .line 363
    .line 364
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 365
    .line 366
    invoke-virtual {v1}, Ll/ja4;->g()I

    .line 367
    .line 368
    .line 369
    move-result v1

    .line 370
    invoke-static {p1, p2, v1}, Lcom/core/glcore/util/CameraUtil;->reScaleSize(Ll/erf0;Ll/erf0;I)Ll/erf0;

    .line 371
    .line 372
    .line 373
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 374
    .line 375
    invoke-virtual {p1}, Ll/ja4;->m()Z

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    iget-object p2, p0, Ll/wc4;->f:Ll/ja4;

    .line 380
    .line 381
    const/4 v1, 0x1

    .line 382
    if-eqz p1, :cond_5

    .line 383
    .line 384
    invoke-virtual {p2}, Ll/ja4;->g()I

    .line 385
    .line 386
    .line 387
    move-result p1

    .line 388
    rsub-int p1, p1, 0x168

    .line 389
    .line 390
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 391
    .line 392
    .line 393
    const/4 p1, 0x2

    .line 394
    invoke-virtual {p0, p1}, Ll/gb20;->flipPosition(I)V

    .line 395
    .line 396
    .line 397
    goto :goto_0

    .line 398
    :cond_5
    invoke-virtual {p2}, Ll/ja4;->g()I

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    invoke-virtual {p0, p1}, Ll/gb20;->changeCurRotation(I)V

    .line 403
    .line 404
    .line 405
    invoke-virtual {p0, v1}, Ll/gb20;->flipPosition(I)V

    .line 406
    .line 407
    .line 408
    :goto_0
    iput-boolean v0, p0, Ll/wc4;->r:Z

    .line 409
    .line 410
    iget-object p1, p0, Ll/wc4;->f:Ll/ja4;

    .line 411
    .line 412
    iget-object p2, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 413
    .line 414
    invoke-virtual {p1, p2}, Ll/ja4;->B(Landroid/graphics/SurfaceTexture;)Z

    .line 415
    .line 416
    .line 417
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 418
    .line 419
    .line 420
    move-result-object p1

    .line 421
    iget-object p2, p0, Ll/wc4;->f:Ll/ja4;

    .line 422
    .line 423
    invoke-virtual {p2}, Ll/ja4;->m()Z

    .line 424
    .line 425
    .line 426
    move-result p2

    .line 427
    invoke-virtual {p1, p2}, Ll/u6y;->X(I)V

    .line 428
    .line 429
    .line 430
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 431
    .line 432
    .line 433
    move-result-object p1

    .line 434
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 435
    .line 436
    iget-object p2, p2, Ll/tow;->k0:Ljava/util/List;

    .line 437
    .line 438
    invoke-virtual {p1, p2}, Ll/u6y;->Y(Ljava/util/List;)V

    .line 439
    .line 440
    .line 441
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 442
    .line 443
    .line 444
    move-result-object p1

    .line 445
    iget-object p2, p0, Ll/wc4;->g:Ll/tow;

    .line 446
    .line 447
    iget v0, p2, Ll/tow;->U:I

    .line 448
    .line 449
    iget p2, p2, Ll/tow;->T:I

    .line 450
    .line 451
    invoke-virtual {p1, v0, p2}, Ll/u6y;->o0(II)V

    .line 452
    .line 453
    .line 454
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    iget-object p0, p0, Ll/wc4;->g:Ll/tow;

    .line 459
    .line 460
    iget-boolean p0, p0, Ll/tow;->g0:Z

    .line 461
    .line 462
    invoke-virtual {p1, p0}, Ll/u6y;->q0(I)V

    .line 463
    .line 464
    .line 465
    return v1
.end method

.method public G()V
    .locals 0

    .line 1
    return-void
.end method

.method public I(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->z(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I0()J
    .locals 2

    .line 1
    iget p0, p0, Ll/wc4;->s:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public J1(Ll/v94;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    return-void
.end method

.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4;->i:Ll/g510;

    .line 2
    .line 3
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    return-void
.end method

.method public N()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "pausePreview >>>> 1"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ja4;->o()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public Q(Ll/ib4$l;)V
    .locals 0

    .line 1
    return-void
.end method

.method public R(Ll/nx3;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wc4;->D:Ll/nx3;

    .line 2
    .line 3
    return-void
.end method

.method public S(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->B(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->u(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Landroid/hardware/Camera;)V
    .locals 0

    .line 1
    return-void
.end method

.method public Z(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wc4;->I:I

    .line 2
    .line 3
    return-void
.end method

.method public a()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ll/wc4;->l:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :try_start_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    const-string v4, "Pipeline_Normal_pip->PIPLINE"

    .line 15
    .line 16
    const-string v5, "stopPreview"

    .line 17
    .line 18
    invoke-virtual {v3, v4, v5}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v3, p0, Ll/wc4;->f:Ll/ja4;

    .line 22
    .line 23
    invoke-virtual {v3}, Ll/ja4;->r()I

    .line 24
    .line 25
    .line 26
    iput v1, p0, Ll/wc4;->s:I

    .line 27
    .line 28
    iget-object v3, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    iget-object v3, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 33
    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    invoke-virtual {v3, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    iput-object v2, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    iget-object v3, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/os/HandlerThread;->quit()Z

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 50
    .line 51
    :cond_1
    monitor-exit v0

    .line 52
    goto :goto_2

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    throw p0

    .line 55
    :cond_2
    :goto_2
    iget-object v0, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 56
    .line 57
    if-eqz v0, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/momocv/videoprocessor/VideoProcessor;->Release()V

    .line 60
    .line 61
    .line 62
    const-string v0, "live_mmcv"

    .line 63
    .line 64
    const-string v3, "stopPreview: VideoProcessor.Release"

    .line 65
    .line 66
    invoke-static {v0, v3}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iput-object v2, p0, Ll/wc4;->y:Lcom/momocv/videoprocessor/VideoProcessor;

    .line 70
    .line 71
    :cond_3
    invoke-static {}, Lcom/core/glcore/util/BodyLandHelper;->release()V

    .line 72
    .line 73
    .line 74
    iput-boolean v1, p0, Ll/wc4;->B:Z

    .line 75
    .line 76
    invoke-direct {p0}, Ll/wc4;->r2()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public a1()Ll/v94;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ja4;->A(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->j()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->h()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gb20;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->k()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;uniform sampler2D SamplerY;uniform sampler2D SamplerUV;varying mediump vec2 coordinate;void main(){vec3 rgb;vec3 yuv;yuv.r = texture2D(SamplerY, coordinate).r - (16.0/255.0);\nyuv.g = texture2D(SamplerUV, coordinate).a - 0.5;\nyuv.b = texture2D(SamplerUV, coordinate).r - 0.5;\n mat3 colorConvertion = mat3(1.164, 1.164, 1.164,\n                             0.0, -0.392, 2.017,\n                             1.596, -0.813, 0.0);\n rgb = colorConvertion * yuv;   gl_FragColor = vec4(rgb, 1.0);\n}"

    .line 2
    .line 3
    return-object p0
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ja4;->i()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public initShaderHandles()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/gb20;->initShaderHandles()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->v(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->y(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    if-gez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/v94;->r(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public o2()Landroid/graphics/SurfaceTexture;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget v0, p0, Ll/wc4;->G:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_0
    new-instance v0, Ll/wc4$l;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/wc4$l;-><init>(Ll/wc4;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/wc4;->F:Ll/wc4$l;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/wc4$l;->f()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/wc4;->H:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    return-object p0
.end method

.method public onData([B)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ja4;->f()Ll/xpl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/u6y;->N()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    new-instance v1, Ll/wc4$h;

    .line 28
    .line 29
    invoke-direct {v1, p0, p1}, Ll/wc4$h;-><init>(Ll/wc4;[B)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public onDrawFrame()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ll/gb20;->onDrawFrame()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->E(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v2, "releaseCamera >>>> 1"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/wc4;->l:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter v0

    .line 15
    :try_start_0
    iget-object v1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iput-object v2, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quit()Z

    .line 35
    .line 36
    .line 37
    iput-object v2, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 38
    .line 39
    :cond_1
    iget-object v1, p0, Ll/wc4;->f:Ll/ja4;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/ja4;->r()I

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/wc4;->r2()V

    .line 45
    .line 46
    .line 47
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    throw p0
.end method

.method public s(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->x(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s1(Ll/ylg;Ll/yuf;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/wc4;->n:Landroid/os/HandlerThread;

    .line 10
    .line 11
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/wc4;->o:Landroid/os/Handler;

    .line 18
    .line 19
    new-instance v1, Ll/wc4$b;

    .line 20
    .line 21
    invoke-direct {v1, p0, p1, p2}, Ll/wc4$b;-><init>(Ll/wc4;Ll/ylg;Ll/yuf;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iput-object p2, p0, Ll/wc4;->E:Ll/yuf;

    .line 29
    .line 30
    return-void
.end method

.method public setExposureCompensation(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ja4;->w(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setWarpType(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/v94;->F(I)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    if-lt p1, v0, :cond_0

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    if-gt p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Ll/v94;->D(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public u(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->A(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->t(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    return-wide v0
.end method

.method public w(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wc4;->C:Ll/v94;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/v94;->w(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x(II)Ll/erf0;
    .locals 3

    .line 1
    new-instance v0, Ll/erf0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wc4;->g:Ll/tow;

    .line 4
    .line 5
    iget v2, v1, Ll/tow;->e:I

    .line 6
    .line 7
    iget v1, v1, Ll/tow;->f:I

    .line 8
    .line 9
    invoke-direct {v0, v2, v1}, Ll/erf0;-><init>(II)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ja4;->g()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    new-instance v1, Ll/erf0;

    .line 19
    .line 20
    invoke-direct {v1, p1, p2}, Ll/erf0;-><init>(II)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, p0, v1}, Lcom/core/glcore/util/CameraUtil;->rescalAspectRatio(Ll/erf0;ILl/erf0;)Ll/erf0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public z()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "resumePreview line 628:videoWidth:"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 13
    .line 14
    iget v2, v2, Ll/tow;->s:I

    .line 15
    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v2, ",videoHeight:"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 25
    .line 26
    iget v2, v2, Ll/tow;->t:I

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ",visualWidth:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 37
    .line 38
    iget v2, v2, Ll/tow;->u:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ",visualHeight:"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 49
    .line 50
    iget v2, v2, Ll/tow;->v:I

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v2, ",encodeWidth:"

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 61
    .line 62
    iget v2, v2, Ll/tow;->m:I

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v2, ",encodeHeight:"

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 73
    .line 74
    iget v2, v2, Ll/tow;->n:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v2, ",videoBitrate:"

    .line 80
    .line 81
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 85
    .line 86
    iget v2, v2, Ll/tow;->H:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v2, ",audioBitrate:"

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 97
    .line 98
    iget v2, v2, Ll/tow;->S:I

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    const-string v2, ",videoFPS:"

    .line 104
    .line 105
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    iget-object v2, p0, Ll/wc4;->g:Ll/tow;

    .line 109
    .line 110
    iget v2, v2, Ll/tow;->F:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v2, ",targetWidth"

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-object v2, p0, Ll/wc4;->k:Ll/row;

    .line 121
    .line 122
    invoke-virtual {v2}, Ll/row;->f()Ll/erf0;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v2}, Ll/erf0;->b()I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v2, ",targetHeight"

    .line 134
    .line 135
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-object v2, p0, Ll/wc4;->k:Ll/row;

    .line 139
    .line 140
    invoke-virtual {v2}, Ll/row;->f()Ll/erf0;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-virtual {v2}, Ll/erf0;->a()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, ", renderFps"

    .line 152
    .line 153
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Ll/wc4;->k:Ll/row;

    .line 157
    .line 158
    invoke-virtual {v2}, Ll/row;->h()I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const-string v2, ", degree"

    .line 166
    .line 167
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    iget v2, p0, Ll/wc4;->J:I

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 180
    .line 181
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const-string v1, "resumePreview"

    .line 189
    .line 190
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    iget-object v0, p0, Ll/wc4;->f:Ll/ja4;

    .line 194
    .line 195
    invoke-virtual {v0}, Ll/ja4;->f()Ll/xpl;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    if-eqz v0, :cond_0

    .line 200
    .line 201
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    const-string v1, "resumePreview >>>> 1"

    .line 206
    .line 207
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Ll/wc4;->f:Ll/ja4;

    .line 211
    .line 212
    invoke-virtual {p0}, Ll/ja4;->t()V

    .line 213
    .line 214
    .line 215
    return-void

    .line 216
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    const-string v1, "resumePreview >>>> 2"

    .line 221
    .line 222
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iget v0, p0, Ll/wc4;->J:I

    .line 226
    .line 227
    iget-object v1, p0, Ll/wc4;->k:Ll/row;

    .line 228
    .line 229
    invoke-virtual {p0, v0, v1}, Ll/wc4;->E1(ILl/row;)Z

    .line 230
    .line 231
    .line 232
    return-void
.end method
