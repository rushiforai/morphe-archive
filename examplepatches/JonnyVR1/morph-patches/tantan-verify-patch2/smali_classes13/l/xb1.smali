.class public Ll/xb1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xb1$b;
    }
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:Landroid/media/AudioTrack;

.field private f:I

.field private g:Ll/ra1;

.field private h:I

.field private i:Z

.field private j:I

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:Lcom/immomo/mediacore/audio/AudioProcess;

.field private o:Ll/yb1;

.field private p:Ll/xb1$b;

.field private q:Z

.field private r:Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/immomo/mediacore/audio/AudioProcess;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xb1;->a:I

    .line 6
    .line 7
    iput v0, p0, Ll/xb1;->b:I

    .line 8
    .line 9
    iput v0, p0, Ll/xb1;->c:I

    .line 10
    .line 11
    iput v0, p0, Ll/xb1;->d:I

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Ll/xb1;->e:Landroid/media/AudioTrack;

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    iput v2, p0, Ll/xb1;->f:I

    .line 18
    .line 19
    const/16 v2, 0xc8

    .line 20
    .line 21
    iput v2, p0, Ll/xb1;->h:I

    .line 22
    .line 23
    iput-boolean v0, p0, Ll/xb1;->i:Z

    .line 24
    .line 25
    const/4 v2, 0x2

    .line 26
    iput v2, p0, Ll/xb1;->j:I

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/xb1;->k:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/xb1;->l:Z

    .line 31
    .line 32
    const/4 v2, 0x1

    .line 33
    iput-boolean v2, p0, Ll/xb1;->m:Z

    .line 34
    .line 35
    iput-object v1, p0, Ll/xb1;->o:Ll/yb1;

    .line 36
    .line 37
    iput-object v1, p0, Ll/xb1;->p:Ll/xb1$b;

    .line 38
    .line 39
    iput-boolean v0, p0, Ll/xb1;->q:Z

    .line 40
    .line 41
    const/16 v0, 0x800

    .line 42
    .line 43
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    iput-object p1, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 50
    .line 51
    new-instance p1, Ll/ra1;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/ra1;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Ll/xb1;->g:Ll/ra1;

    .line 57
    .line 58
    return-void
.end method

.method public static synthetic a(Ll/xb1;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xb1;->e:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/xb1;Landroid/media/AudioTrack;)Landroid/media/AudioTrack;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xb1;->e:Landroid/media/AudioTrack;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Ll/xb1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xb1;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d(Ll/xb1;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xb1;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Ll/xb1;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/xb1;->l:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic f(Ll/xb1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xb1;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic g(Ll/xb1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xb1;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ll/xb1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xb1;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ll/xb1;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/xb1;->d:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Ll/xb1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xb1;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ll/xb1;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/xb1;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ll/xb1;)Ll/ra1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xb1;->g:Ll/ra1;

    .line 2
    .line 3
    return-object p0
.end method

.method public static v([BI)[B
    .locals 5

    .line 1
    div-int/lit8 v0, p1, 0x2

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    div-int/lit8 v2, p1, 0x4

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    mul-int/lit8 v2, v1, 0x2

    .line 11
    .line 12
    mul-int/lit8 v3, v1, 0x4

    .line 13
    .line 14
    aget-byte v4, p0, v3

    .line 15
    .line 16
    aput-byte v4, v0, v2

    .line 17
    .line 18
    add-int/lit8 v2, v2, 0x1

    .line 19
    .line 20
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    aget-byte v3, p0, v3

    .line 23
    .line 24
    aput-byte v3, v0, v2

    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-object v0
.end method


# virtual methods
.method public m(ILjava/lang/String;JJZZ)Z
    .locals 9

    .line 1
    iget-object v0, p0, Ll/xb1;->g:Ll/ra1;

    .line 2
    .line 3
    move v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-wide v3, p3

    .line 6
    move-wide v5, p5

    .line 7
    move/from16 v7, p7

    .line 8
    .line 9
    move/from16 v8, p8

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v8}, Ll/ra1;->a(ILjava/lang/String;JJZZ)Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_1

    .line 16
    .line 17
    iget-object p4, p0, Ll/xb1;->o:Ll/yb1;

    .line 18
    .line 19
    if-eqz p4, :cond_0

    .line 20
    .line 21
    invoke-virtual {p4, p1, p2}, Ll/yb1;->a(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Ll/xb1;->e:Landroid/media/AudioTrack;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/media/AudioTrack;->getPlayState()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x3

    .line 31
    if-eq p1, p2, :cond_1

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xb1;->u()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return p3
.end method

.method public n(J)J
    .locals 2

    .line 1
    long-to-float p1, p1

    .line 2
    const/high16 p2, 0x3f800000    # 1.0f

    .line 3
    .line 4
    mul-float/2addr p1, p2

    .line 5
    iget p2, p0, Ll/xb1;->a:I

    .line 6
    .line 7
    int-to-float p2, p2

    .line 8
    mul-float/2addr p1, p2

    .line 9
    const/high16 p2, 0x447a0000    # 1000.0f

    .line 10
    .line 11
    div-float/2addr p1, p2

    .line 12
    float-to-long p1, p1

    .line 13
    iget p0, p0, Ll/xb1;->b:I

    .line 14
    .line 15
    int-to-long v0, p0

    .line 16
    mul-long/2addr p1, v0

    .line 17
    const-wide/16 v0, 0x2

    .line 18
    .line 19
    mul-long/2addr p1, v0

    .line 20
    return-wide p1
.end method

.method public o(III)Z
    .locals 10
    .annotation build Landroid/annotation/TargetApi;
        value = 0x3
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    if-eqz p2, :cond_3

    .line 5
    .line 6
    if-nez p3, :cond_0

    .line 7
    .line 8
    goto :goto_4

    .line 9
    :cond_0
    iput p1, p0, Ll/xb1;->a:I

    .line 10
    .line 11
    iput p2, p0, Ll/xb1;->c:I

    .line 12
    .line 13
    iput p3, p0, Ll/xb1;->b:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne p3, v1, :cond_1

    .line 17
    .line 18
    const/16 v2, 0xc

    .line 19
    .line 20
    :goto_0
    move v6, v2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const/4 v2, 0x4

    .line 23
    goto :goto_0

    .line 24
    :goto_1
    const/16 v2, 0x10

    .line 25
    .line 26
    if-ne p2, v2, :cond_2

    .line 27
    .line 28
    :goto_2
    move v7, v1

    .line 29
    goto :goto_3

    .line 30
    :cond_2
    const/4 v1, 0x3

    .line 31
    goto :goto_2

    .line 32
    :goto_3
    :try_start_0
    invoke-static {p1, v6, v7}, Landroid/media/AudioTrack;->getMinBufferSize(III)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, p0, Ll/xb1;->d:I

    .line 37
    .line 38
    new-instance v3, Landroid/media/AudioTrack;

    .line 39
    .line 40
    iget v4, p0, Ll/xb1;->f:I

    .line 41
    .line 42
    iget v5, p0, Ll/xb1;->a:I

    .line 43
    .line 44
    iget v8, p0, Ll/xb1;->d:I

    .line 45
    .line 46
    const/4 v9, 0x1

    .line 47
    invoke-direct/range {v3 .. v9}, Landroid/media/AudioTrack;-><init>(IIIIII)V

    .line 48
    .line 49
    .line 50
    iput-object v3, p0, Ll/xb1;->e:Landroid/media/AudioTrack;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    new-instance v0, Lcom/immomo/mediabase/AudioParameter;

    .line 53
    .line 54
    invoke-direct {v0}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, p3}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, p2}, Lcom/immomo/mediabase/AudioParameter;->setSampleBits(I)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, p1}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/xb1;->g:Ll/ra1;

    .line 67
    .line 68
    const/4 p1, 0x1

    .line 69
    invoke-virtual {p0, p1, v0}, Ll/ra1;->i(ZLcom/immomo/mediabase/AudioParameter;)V

    .line 70
    .line 71
    .line 72
    return p1

    .line 73
    :catch_0
    const/4 p1, 0x0

    .line 74
    iput-object p1, p0, Ll/xb1;->e:Landroid/media/AudioTrack;

    .line 75
    .line 76
    :cond_3
    :goto_4
    return v0
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xb1;->g:Ll/ra1;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ra1;->f()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xb1;->w()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public q(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xb1;->g:Ll/ra1;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/ra1;->g(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/xb1;->o:Ll/yb1;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/yb1;->j(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ll/xb1;->g:Ll/ra1;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/ra1;->d()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-gtz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/xb1;->w()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public r(Ljava/nio/ByteBuffer;)V
    .locals 13

    .line 1
    iget-object v0, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_1

    .line 6
    .line 7
    :cond_0
    iget-boolean v1, p0, Ll/xb1;->k:Z

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iput-boolean v2, p0, Ll/xb1;->k:Z

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundExtraFrames2()V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 20
    .line 21
    .line 22
    :cond_1
    iget-boolean v0, p0, Ll/xb1;->i:Z

    .line 23
    .line 24
    const-wide/16 v3, 0x3e8

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    const/16 v5, 0x800

    .line 28
    .line 29
    if-eqz v0, :cond_4

    .line 30
    .line 31
    iget-boolean v0, p0, Ll/xb1;->m:Z

    .line 32
    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-static {v6, v2}, Ljava/util/Arrays;->fill([BB)V

    .line 44
    .line 45
    .line 46
    iget v6, p0, Ll/xb1;->h:I

    .line 47
    .line 48
    int-to-long v6, v6

    .line 49
    invoke-virtual {p0, v6, v7}, Ll/xb1;->n(J)J

    .line 50
    .line 51
    .line 52
    move-result-wide v6

    .line 53
    iget v8, p0, Ll/xb1;->j:I

    .line 54
    .line 55
    if-ne v8, v1, :cond_2

    .line 56
    .line 57
    const-wide/16 v8, 0x2

    .line 58
    .line 59
    div-long/2addr v6, v8

    .line 60
    :cond_2
    new-instance v8, Ll/oxd0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 67
    .line 68
    .line 69
    move-result-wide v9

    .line 70
    div-long/2addr v9, v3

    .line 71
    iget v11, p0, Ll/xb1;->b:I

    .line 72
    .line 73
    invoke-direct {v8, v0, v9, v10, v11}, Ll/oxd0;-><init>([BJI)V

    .line 74
    .line 75
    .line 76
    move v0, v2

    .line 77
    :goto_0
    int-to-long v9, v0

    .line 78
    const-wide/16 v11, 0x800

    .line 79
    .line 80
    div-long v11, v6, v11

    .line 81
    .line 82
    cmp-long v9, v9, v11

    .line 83
    .line 84
    if-gez v9, :cond_3

    .line 85
    .line 86
    iget-object v9, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 87
    .line 88
    invoke-virtual {v9, v8}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData2(Ll/oxd0;)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_3
    iput-boolean v2, p0, Ll/xb1;->i:Z

    .line 95
    .line 96
    :cond_4
    iget-boolean v0, p0, Ll/xb1;->m:Z

    .line 97
    .line 98
    if-eqz v0, :cond_7

    .line 99
    .line 100
    iget v0, p0, Ll/xb1;->j:I

    .line 101
    .line 102
    if-ne v0, v1, :cond_6

    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-static {p1, v5}, Ll/xb1;->v([BI)[B

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object v0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    const/16 v1, 0x400

    .line 119
    .line 120
    if-lt v0, v1, :cond_5

    .line 121
    .line 122
    iget-object v0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 123
    .line 124
    invoke-virtual {v0, p1, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 125
    .line 126
    .line 127
    :cond_5
    iget-object p1, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 128
    .line 129
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-gtz p1, :cond_7

    .line 134
    .line 135
    iget-object p1, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 138
    .line 139
    .line 140
    new-array p1, v5, [B

    .line 141
    .line 142
    iget-object v0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 143
    .line 144
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0, v2, p1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 152
    .line 153
    new-instance v1, Ll/oxd0;

    .line 154
    .line 155
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 156
    .line 157
    .line 158
    move-result-wide v5

    .line 159
    div-long/2addr v5, v3

    .line 160
    iget v2, p0, Ll/xb1;->j:I

    .line 161
    .line 162
    invoke-direct {v1, p1, v5, v6, v2}, Ll/oxd0;-><init>([BJI)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData2(Ll/oxd0;)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/xb1;->r:Ljava/nio/ByteBuffer;

    .line 169
    .line 170
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 171
    .line 172
    .line 173
    return-void

    .line 174
    :cond_6
    iget-object v0, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 175
    .line 176
    new-instance v1, Ll/oxd0;

    .line 177
    .line 178
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 183
    .line 184
    .line 185
    move-result-wide v5

    .line 186
    div-long/2addr v5, v3

    .line 187
    iget p0, p0, Ll/xb1;->b:I

    .line 188
    .line 189
    invoke-direct {v1, p1, v5, v6, p0}, Ll/oxd0;-><init>([BJI)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->putSurroundExtraData2(Ll/oxd0;)V

    .line 193
    .line 194
    .line 195
    :cond_7
    :goto_1
    return-void
.end method

.method public s(Ll/yb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xb1;->o:Ll/yb1;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xb1;->g:Ll/ra1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/ra1;->h(Ll/yb1;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public t(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/xb1;->f:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ll/xb1;->f:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/xb1;->l:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xb1;->p:Ll/xb1$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/xb1;->q:Z

    .line 7
    .line 8
    new-instance v0, Ll/xb1$b;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, p0, v1}, Ll/xb1$b;-><init>(Ll/xb1;Ll/xb1$a;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/xb1;->p:Ll/xb1$b;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/xb1;->o:Ll/yb1;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/yb1;->h()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/xb1;->q:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/xb1;->p:Ll/xb1$b;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catch_0
    move-exception v0

    .line 13
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 14
    .line 15
    .line 16
    :goto_0
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Ll/xb1;->p:Ll/xb1$b;

    .line 18
    .line 19
    iget-object p0, p0, Ll/xb1;->o:Ll/yb1;

    .line 20
    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/yb1;->f()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public x(Lcom/immomo/mediacore/audio/AudioProcess;I)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/xb1;->j:I

    .line 8
    .line 9
    if-eq p2, v0, :cond_1

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundExtraFrames()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/xb1;->n:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 15
    .line 16
    iput p2, p0, Ll/xb1;->j:I

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Ll/xb1;->k:Z

    .line 20
    .line 21
    :cond_1
    return-void
.end method
