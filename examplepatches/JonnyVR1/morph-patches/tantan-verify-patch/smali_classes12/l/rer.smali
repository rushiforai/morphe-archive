.class public Ll/rer;
.super Ll/puf;
.source "SourceFile"

# interfaces
.implements Ll/bvb;


# instance fields
.field private final D:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

.field private E:I

.field private F:Z

.field private G:Z

.field private H:I

.field private I:Z

.field private J:Ll/dh4;

.field private K:Landroid/graphics/Rect;

.field private L:I

.field private M:I

.field private volatile N:Z

.field private O:Z

.field private final P:Z

.field private Q:J

.field private R:J

.field private volatile S:Z


# direct methods
.method public constructor <init>(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;)V
    .locals 1

    const/4 v0, 0x0

    .line 45
    invoke-direct {p0, p1, v0}, Ll/rer;-><init>(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/puf;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p2, 0x1

    .line 5
    iput p2, p0, Ll/rer;->E:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/rer;->F:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/rer;->G:Z

    .line 11
    .line 12
    iput v0, p0, Ll/rer;->H:I

    .line 13
    .line 14
    iput-boolean p2, p0, Ll/rer;->I:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Ll/rer;->J:Ll/dh4;

    .line 18
    .line 19
    iput-object v1, p0, Ll/rer;->K:Landroid/graphics/Rect;

    .line 20
    .line 21
    iput-boolean p2, p0, Ll/rer;->N:Z

    .line 22
    .line 23
    const-wide/16 v1, -0x1

    .line 24
    .line 25
    iput-wide v1, p0, Ll/rer;->Q:J

    .line 26
    .line 27
    iput-wide v1, p0, Ll/rer;->R:J

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/rer;->S:Z

    .line 30
    .line 31
    iput-object p1, p0, Ll/rer;->D:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 32
    .line 33
    invoke-static {}, Ll/lrw;->j()Ll/lrw;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Ll/lrw;->f()Ll/awl;

    .line 38
    .line 39
    .line 40
    iput-boolean p2, p0, Ll/rer;->P:Z

    .line 41
    .line 42
    iput-boolean v0, p0, Ll/rer;->O:Z

    .line 43
    .line 44
    return-void
.end method

.method public static synthetic P(Ll/rer;)Landroid/graphics/Rect;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rer;->K:Landroid/graphics/Rect;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/rer;->L:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/rer;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic U(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/rer;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic V(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W(Ll/rer;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xej;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic X(Ll/rer;)Ll/dh4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rer;->J:Ll/dh4;

    .line 2
    .line 3
    return-object p0
.end method

.method private h0(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/rer;->J:Ll/dh4;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/rer;->K:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget v2, v0, Landroid/graphics/Rect;->right:I

    .line 15
    .line 16
    iget v3, v0, Landroid/graphics/Rect;->left:I

    .line 17
    .line 18
    sub-int/2addr v2, v3

    .line 19
    iput v2, p0, Ll/rer;->L:I

    .line 20
    .line 21
    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    iget v0, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    sub-int/2addr v4, v0

    .line 26
    iput v4, p0, Ll/rer;->M:I

    .line 27
    .line 28
    iget v5, p0, Ll/xej;->m:I

    .line 29
    .line 30
    sub-int/2addr v5, v0

    .line 31
    sub-int/2addr v5, v4

    .line 32
    mul-int/2addr v2, v4

    .line 33
    mul-int/lit8 v2, v2, 0x4

    .line 34
    .line 35
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    invoke-virtual {v9, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 40
    .line 41
    .line 42
    move v4, v5

    .line 43
    iget v5, p0, Ll/rer;->L:I

    .line 44
    .line 45
    iget v6, p0, Ll/rer;->M:I

    .line 46
    .line 47
    const/16 v7, 0x1908

    .line 48
    .line 49
    const/16 v8, 0x1401

    .line 50
    .line 51
    invoke-static/range {v3 .. v9}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    mul-int/2addr v0, v2

    .line 64
    mul-int/lit8 v0, v0, 0x4

    .line 65
    .line 66
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    invoke-virtual {v8, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    const/16 v6, 0x1908

    .line 82
    .line 83
    const/16 v7, 0x1401

    .line 84
    .line 85
    const/4 v2, 0x0

    .line 86
    const/4 v3, 0x0

    .line 87
    invoke-static/range {v2 .. v8}, Landroid/opengl/GLES20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 88
    .line 89
    .line 90
    move-object v9, v8

    .line 91
    :goto_0
    invoke-virtual {v9, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 92
    .line 93
    .line 94
    iput-boolean v1, p0, Ll/rer;->F:Z

    .line 95
    .line 96
    iput-boolean v1, p0, Ll/rer;->G:Z

    .line 97
    .line 98
    new-instance v0, Ll/rer$a;

    .line 99
    .line 100
    invoke-direct {v0, p0, v9, p1}, Ll/rer$a;-><init>(Ll/rer;Ljava/nio/ByteBuffer;Z)V

    .line 101
    .line 102
    .line 103
    const/4 p0, 0x2

    .line 104
    invoke-static {p0, v0}, Ll/lyi0;->d(ILjava/lang/Runnable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method private declared-synchronized i0(Z)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method


# virtual methods
.method public F()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/rer;->F:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-boolean v1, p0, Ll/rer;->I:Z

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iput-boolean v2, p0, Ll/rer;->I:Z

    .line 11
    .line 12
    :goto_0
    iget-boolean v0, p0, Ll/rer;->I:Z

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/rer;->f0()V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Ll/rer;->G:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-direct {p0, v1}, Ll/rer;->h0(Z)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget v0, p0, Ll/xej;->l:I

    .line 27
    .line 28
    iget v1, p0, Ll/xej;->m:I

    .line 29
    .line 30
    invoke-static {v2, v2, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0xc11

    .line 34
    .line 35
    invoke-static {v0}, Landroid/opengl/GLES20;->glEnable(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/rer;->j0()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ll/rer;->c0()Z

    .line 48
    .line 49
    .line 50
    const/16 v1, 0xb44

    .line 51
    .line 52
    invoke-static {v1}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisable(I)V

    .line 56
    .line 57
    .line 58
    iget-boolean v0, p0, Ll/rer;->F:Z

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-boolean v0, p0, Ll/rer;->I:Z

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    invoke-direct {p0, v2}, Ll/rer;->h0(Z)V

    .line 67
    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public K()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/hfj;->x:Ll/mej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/mej;->c()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Ll/rer;->O:Z

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Ll/tej;->b()Ll/tej;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget v2, p0, Ll/rer;->E:I

    .line 21
    .line 22
    mul-int/2addr v1, v2

    .line 23
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    iget v3, p0, Ll/rer;->E:I

    .line 28
    .line 29
    mul-int/2addr v2, v3

    .line 30
    invoke-virtual {v0, v1, v2}, Ll/tej;->a(II)Ll/mej;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/hfj;->x:Ll/mej;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Ll/mej;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget v2, p0, Ll/rer;->E:I

    .line 44
    .line 45
    mul-int/2addr v1, v2

    .line 46
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    iget v3, p0, Ll/rer;->E:I

    .line 51
    .line 52
    mul-int/2addr v2, v3

    .line 53
    invoke-direct {v0, v1, v2}, Ll/mej;-><init>(II)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/hfj;->x:Ll/mej;

    .line 57
    .line 58
    :goto_0
    iget-boolean v0, p0, Ll/rer;->P:Z

    .line 59
    .line 60
    iget-object v1, p0, Ll/hfj;->x:Ll/mej;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    iget v2, p0, Ll/rer;->E:I

    .line 69
    .line 70
    mul-int/2addr v0, v2

    .line 71
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    iget v3, p0, Ll/rer;->E:I

    .line 76
    .line 77
    mul-int/2addr v2, v3

    .line 78
    invoke-virtual {v1, v0, v2}, Ll/mej;->a(II)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-virtual {p0}, Ll/xej;->r()I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget v2, p0, Ll/rer;->E:I

    .line 87
    .line 88
    mul-int/2addr v0, v2

    .line 89
    invoke-virtual {p0}, Ll/xej;->n()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    iget v3, p0, Ll/rer;->E:I

    .line 94
    .line 95
    mul-int/2addr v2, v3

    .line 96
    invoke-virtual {v1, v0, v2}, Ll/mej;->b(II)V

    .line 97
    .line 98
    .line 99
    :goto_1
    const v0, 0x8d40

    .line 100
    .line 101
    .line 102
    invoke-static {v0}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    const v1, 0x8cd5

    .line 107
    .line 108
    .line 109
    if-ne v0, v1, :cond_3

    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    .line 121
    .line 122
    .line 123
    move-result p0

    .line 124
    invoke-static {v1, v0, p0}, Ll/muf;->a(Ljava/lang/StringBuilder;II)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public O()V
    .locals 0

    .line 1
    return-void
.end method

.method public Y(Ll/g6x;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/g6x;->a()Ll/w80;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/g6x;->a()Ll/w80;

    .line 11
    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public Z(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public a0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public b0(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c0()Z
    .locals 5

    .line 1
    iget-wide v0, p0, Ll/rer;->Q:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    cmp-long p0, v0, v3

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    return v2
.end method

.method public d(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Ll/rer;->R:J

    .line 10
    .line 11
    const-wide/16 v4, -0x1

    .line 12
    .line 13
    cmp-long p1, v2, v4

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    cmp-long p1, v0, v2

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-boolean p1, p0, Ll/rer;->S:Z

    .line 22
    .line 23
    if-nez p1, :cond_2

    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Ll/rer;->D:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 26
    .line 27
    sget-object v2, Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;->PROCESS_PREVIEW_TYPE:Lcom/immomo/components/interfaces/IProcessOutput$ProcessType;

    .line 28
    .line 29
    if-ne p1, v2, :cond_1

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 p1, 0x0

    .line 34
    :goto_0
    invoke-direct {p0, p1}, Ll/rer;->i0(Z)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iput-wide v0, p0, Ll/rer;->R:J

    .line 38
    .line 39
    return-void
.end method

.method public d0()V
    .locals 0

    .line 1
    return-void
.end method

.method public e0()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/hfj;->f()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/rer;->S:Z

    .line 6
    .line 7
    return-void
.end method

.method public f0()V
    .locals 5

    .line 1
    iget v0, p0, Ll/xej;->l:I

    .line 2
    .line 3
    iget v1, p0, Ll/rer;->E:I

    .line 4
    .line 5
    mul-int/2addr v0, v1

    .line 6
    iget v2, p0, Ll/xej;->m:I

    .line 7
    .line 8
    mul-int/2addr v2, v1

    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v1, v1, v0, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xej;->l()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Ll/xej;->k()F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {p0}, Ll/xej;->j()F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    invoke-virtual {p0}, Ll/xej;->i()F

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-static {v0, v2, v3, v4}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    .line 30
    .line 31
    .line 32
    const/16 v0, 0x4100

    .line 33
    .line 34
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 35
    .line 36
    .line 37
    iget v0, p0, Ll/xej;->d:I

    .line 38
    .line 39
    invoke-static {v0}, Landroid/opengl/GLES20;->glUseProgram(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xej;->w()V

    .line 43
    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    const/4 v2, 0x4

    .line 47
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glDrawArrays(III)V

    .line 48
    .line 49
    .line 50
    iget v0, p0, Ll/xej;->f:I

    .line 51
    .line 52
    invoke-static {v0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 53
    .line 54
    .line 55
    iget p0, p0, Ll/xej;->g:I

    .line 56
    .line 57
    invoke-static {p0}, Landroid/opengl/GLES20;->glDisableVertexAttribArray(I)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public g0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rer;->N:Z

    .line 2
    .line 3
    return-void
.end method

.method public j0()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/rer;->Q:J

    .line 2
    .line 3
    const-wide/16 v2, -0x1

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    iput-wide v0, p0, Ll/rer;->Q:J

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public k0()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m0(Ll/dh4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rer;->J:Ll/dh4;

    .line 2
    .line 3
    return-void
.end method

.method public n0(Ljava/lang/String;F)V
    .locals 0

    .line 1
    return-void
.end method

.method public o0(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p0(F)V
    .locals 0

    .line 1
    return-void
.end method

.method public q0(Ljava/lang/String;F)V
    .locals 0

    .line 1
    return-void
.end method

.method public r0(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public s0(I)V
    .locals 0

    .line 1
    return-void
.end method
