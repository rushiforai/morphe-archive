.class public Ll/pyi0;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:Ll/h6j;

.field private b:Ll/h6j;

.field private c:Ll/okm;

.field private d:Ll/nhm;

.field private e:Ll/nae;

.field private f:Z

.field private g:J

.field private i:J

.field private j:F

.field private k:F

.field private final l:F

.field private final m:F

.field private n:Ljava/lang/String;

.field private o:Z

.field private p:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pyi0;->f:Z

    .line 6
    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    iput-wide v1, p0, Ll/pyi0;->g:J

    .line 10
    .line 11
    iput-wide v1, p0, Ll/pyi0;->i:J

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Ll/pyi0;->j:F

    .line 15
    .line 16
    iput v1, p0, Ll/pyi0;->k:F

    .line 17
    .line 18
    const/high16 v1, 0x44160000    # 600.0f

    .line 19
    .line 20
    iput v1, p0, Ll/pyi0;->l:F

    .line 21
    .line 22
    const v1, 0x3eaa7efa    # 0.333f

    .line 23
    .line 24
    .line 25
    iput v1, p0, Ll/pyi0;->m:F

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    iput-boolean v1, p0, Ll/pyi0;->o:Z

    .line 29
    .line 30
    new-instance v2, Ll/h6j;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/h6j;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Ll/pyi0;->a:Ll/h6j;

    .line 36
    .line 37
    new-instance v2, Ll/h6j;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/h6j;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v2, p0, Ll/pyi0;->b:Ll/h6j;

    .line 43
    .line 44
    new-instance v2, Ll/nae;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/nae;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v2, p0, Ll/pyi0;->e:Ll/nae;

    .line 50
    .line 51
    new-instance v2, Ll/nhm;

    .line 52
    .line 53
    invoke-direct {v2}, Ll/nhm;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v2, p0, Ll/pyi0;->d:Ll/nhm;

    .line 57
    .line 58
    new-instance v2, Ll/okm;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/okm;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Ll/pyi0;->c:Ll/okm;

    .line 64
    .line 65
    iget-object v3, p0, Ll/pyi0;->a:Ll/h6j;

    .line 66
    .line 67
    invoke-virtual {v3, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/pyi0;->c:Ll/okm;

    .line 71
    .line 72
    iget-object v3, p0, Ll/pyi0;->d:Ll/nhm;

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Ll/pyi0;->d:Ll/nhm;

    .line 78
    .line 79
    iget-object v3, p0, Ll/pyi0;->e:Ll/nae;

    .line 80
    .line 81
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Ll/pyi0;->b:Ll/h6j;

    .line 85
    .line 86
    iget-object v3, p0, Ll/pyi0;->e:Ll/nae;

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Ll/pyi0;->e:Ll/nae;

    .line 92
    .line 93
    iget-object v3, p0, Ll/pyi0;->d:Ll/nhm;

    .line 94
    .line 95
    invoke-virtual {v2, v3, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 99
    .line 100
    iget-object v2, p0, Ll/pyi0;->b:Ll/h6j;

    .line 101
    .line 102
    invoke-virtual {v0, v2, v1}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 106
    .line 107
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 111
    .line 112
    const v1, 0x3e4ccccd    # 0.2f

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ll/nae;->R1(F)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/pyi0;->c:Ll/okm;

    .line 119
    .line 120
    const v1, 0x3f6d097b

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Ll/okm;->R1(F)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ll/pyi0;->a:Ll/h6j;

    .line 127
    .line 128
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/pyi0;->b:Ll/h6j;

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 137
    .line 138
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method private Q1(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance p0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private declared-synchronized S1()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, -0x1

    .line 3
    .line 4
    :try_start_0
    iput-wide v0, p0, Ll/pyi0;->g:J

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/pyi0;->f:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 10
    .line 11
    iget v1, p0, Ll/pyi0;->j:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/nae;->S1(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 17
    .line 18
    const v1, 0x3e4ccccd    # 0.2f

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/nae;->R1(F)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Ll/nae;->S1(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    .line 30
    monitor-exit p0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw v0
.end method


# virtual methods
.method public R1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pyi0;->a:Ll/h6j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/pyi0;->b:Ll/h6j;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/pyi0;->b:Ll/h6j;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Ll/pyi0;->S1()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public declared-synchronized destroy()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/pyi0;->p:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/pyi0;->p:Landroid/graphics/Bitmap;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/pyi0;->p:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw v0
.end method

.method public declared-synchronized newTextureReady(ILl/gfj;Z)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/pyi0;->p:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    const/high16 v1, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-boolean v2, p0, Ll/pyi0;->o:Z

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Ll/pyi0;->d:Ll/nhm;

    .line 13
    .line 14
    invoke-virtual {v2, v0}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/pyi0;->d:Ll/nhm;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/nhm;->setIntensity(F)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/pyi0;->o:Z

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_3

    .line 28
    :cond_0
    :goto_0
    iget-wide v2, p0, Ll/pyi0;->g:J

    .line 29
    .line 30
    const-wide/16 v4, -0x1

    .line 31
    .line 32
    cmp-long v0, v2, v4

    .line 33
    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-wide v2, p0, Ll/pyi0;->i:J

    .line 37
    .line 38
    iput-wide v2, p0, Ll/pyi0;->g:J

    .line 39
    .line 40
    :cond_1
    iget-boolean v0, p0, Ll/pyi0;->f:Z

    .line 41
    .line 42
    if-eqz v0, :cond_5

    .line 43
    .line 44
    iget-wide v2, p0, Ll/pyi0;->i:J

    .line 45
    .line 46
    iget-wide v4, p0, Ll/pyi0;->g:J

    .line 47
    .line 48
    sub-long/2addr v2, v4

    .line 49
    const-wide/16 v4, 0x5dc

    .line 50
    .line 51
    cmp-long v0, v2, v4

    .line 52
    .line 53
    const v4, 0x44bb8000    # 1500.0f

    .line 54
    .line 55
    .line 56
    if-gez v0, :cond_2

    .line 57
    .line 58
    long-to-float v0, v2

    .line 59
    div-float/2addr v0, v4

    .line 60
    iput v0, p0, Ll/pyi0;->j:F

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iput v1, p0, Ll/pyi0;->j:F

    .line 64
    .line 65
    :goto_1
    const-wide/16 v5, 0xc8

    .line 66
    .line 67
    cmp-long v0, v2, v5

    .line 68
    .line 69
    const v7, 0x3e4ccccd    # 0.2f

    .line 70
    .line 71
    .line 72
    if-gez v0, :cond_3

    .line 73
    .line 74
    iput v7, p0, Ll/pyi0;->k:F

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_3
    sub-long/2addr v2, v5

    .line 78
    long-to-float v0, v2

    .line 79
    div-float/2addr v0, v4

    .line 80
    add-float/2addr v0, v7

    .line 81
    iput v0, p0, Ll/pyi0;->k:F

    .line 82
    .line 83
    :goto_2
    iget v0, p0, Ll/pyi0;->k:F

    .line 84
    .line 85
    cmpl-float v0, v0, v1

    .line 86
    .line 87
    if-lez v0, :cond_4

    .line 88
    .line 89
    iput v1, p0, Ll/pyi0;->k:F

    .line 90
    .line 91
    :cond_4
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 92
    .line 93
    iget v1, p0, Ll/pyi0;->j:F

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ll/nae;->S1(F)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/pyi0;->e:Ll/nae;

    .line 99
    .line 100
    iget v1, p0, Ll/pyi0;->k:F

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Ll/nae;->R1(F)V

    .line 103
    .line 104
    .line 105
    :cond_5
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    .line 107
    .line 108
    monitor-exit p0

    .line 109
    return-void

    .line 110
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    throw p1
.end method

.method public declared-synchronized setLookupPath(Ljava/lang/String;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 8
    .line 9
    .line 10
    const-string p1, "/lookup3.jpg"

    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/pyi0;->n:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/pyi0;->Q1(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/pyi0;->n:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/pyi0;->p:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p1
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/pyi0;->i:J

    .line 2
    .line 3
    return-void
.end method
