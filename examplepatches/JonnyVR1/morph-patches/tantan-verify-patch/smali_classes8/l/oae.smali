.class public Ll/oae;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:Z

.field private b:J

.field private c:J

.field d:Ljava/lang/String;

.field e:Landroid/graphics/Bitmap;

.field private f:F

.field private g:Ll/h6j;

.field private i:Ll/h6j;

.field private j:Ll/nae;

.field private k:Ll/nhm;


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
    iput-boolean v0, p0, Ll/oae;->a:Z

    .line 6
    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    iput-wide v1, p0, Ll/oae;->b:J

    .line 10
    .line 11
    iput-wide v1, p0, Ll/oae;->c:J

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput v1, p0, Ll/oae;->f:F

    .line 15
    .line 16
    new-instance v1, Ll/nhm;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/nhm;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/oae;->k:Ll/nhm;

    .line 22
    .line 23
    new-instance v1, Ll/h6j;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/h6j;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/oae;->g:Ll/h6j;

    .line 29
    .line 30
    new-instance v1, Ll/h6j;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/h6j;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Ll/oae;->i:Ll/h6j;

    .line 36
    .line 37
    new-instance v1, Ll/nae;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/nae;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v1, p0, Ll/oae;->j:Ll/nae;

    .line 43
    .line 44
    const/4 v2, 0x1

    .line 45
    invoke-virtual {v1, v2}, Ll/nae;->Q1(Z)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/oae;->g:Ll/h6j;

    .line 49
    .line 50
    iget-object v3, p0, Ll/oae;->j:Ll/nae;

    .line 51
    .line 52
    invoke-virtual {v1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/oae;->i:Ll/h6j;

    .line 56
    .line 57
    iget-object v3, p0, Ll/oae;->k:Ll/nhm;

    .line 58
    .line 59
    invoke-virtual {v1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/oae;->k:Ll/nhm;

    .line 63
    .line 64
    iget-object v3, p0, Ll/oae;->j:Ll/nae;

    .line 65
    .line 66
    invoke-virtual {v1, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/oae;->j:Ll/nae;

    .line 70
    .line 71
    iget-object v3, p0, Ll/oae;->g:Ll/h6j;

    .line 72
    .line 73
    invoke-virtual {v1, v3, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/oae;->j:Ll/nae;

    .line 77
    .line 78
    iget-object v1, p0, Ll/oae;->k:Ll/nhm;

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ll/oae;->j:Ll/nae;

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/oae;->g:Ll/h6j;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ll/oae;->i:Ll/h6j;

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/oae;->j:Ll/nae;

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 101
    .line 102
    .line 103
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
    iput-wide v0, p0, Ll/oae;->b:J

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/oae;->a:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/oae;->k:Ll/nhm;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Ll/nhm;->setIntensity(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/oae;->j:Ll/nae;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ll/nae;->S1(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method


# virtual methods
.method public R1(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/oae;->g:Ll/h6j;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/oae;->i:Ll/h6j;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/oae;->i:Ll/h6j;

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ll/h6j;->R1(Landroid/graphics/Bitmap;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-direct {p0}, Ll/oae;->S1()V

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
    iget-object v0, p0, Ll/oae;->e:Landroid/graphics/Bitmap;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/oae;->e:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    invoke-super {p0}, Ll/ogk;->destroy()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw v0
.end method

.method public declared-synchronized newTextureReady(ILl/gfj;Z)V
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Ll/oae;->b:J

    .line 3
    .line 4
    const-wide/16 v2, -0x1

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-wide v0, p0, Ll/oae;->c:J

    .line 11
    .line 12
    iput-wide v0, p0, Ll/oae;->b:J

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    goto :goto_3

    .line 17
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ll/oae;->a:Z

    .line 18
    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    iget-wide v0, p0, Ll/oae;->c:J

    .line 22
    .line 23
    iget-wide v2, p0, Ll/oae;->b:J

    .line 24
    .line 25
    sub-long/2addr v0, v2

    .line 26
    const-wide/16 v2, 0x1f4

    .line 27
    .line 28
    cmp-long v2, v0, v2

    .line 29
    .line 30
    const/high16 v3, 0x3f800000    # 1.0f

    .line 31
    .line 32
    const/high16 v4, 0x43fa0000    # 500.0f

    .line 33
    .line 34
    if-gez v2, :cond_1

    .line 35
    .line 36
    long-to-float v2, v0

    .line 37
    div-float/2addr v2, v4

    .line 38
    iput v2, p0, Ll/oae;->f:F

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iput v3, p0, Ll/oae;->f:F

    .line 42
    .line 43
    :goto_1
    iget-object v2, p0, Ll/oae;->j:Ll/nae;

    .line 44
    .line 45
    iget v5, p0, Ll/oae;->f:F

    .line 46
    .line 47
    invoke-virtual {v2, v5}, Ll/nae;->S1(F)V

    .line 48
    .line 49
    .line 50
    const-wide/16 v5, 0x3e8

    .line 51
    .line 52
    cmp-long v2, v0, v5

    .line 53
    .line 54
    if-gez v2, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Ll/oae;->k:Ll/nhm;

    .line 57
    .line 58
    const/4 v1, 0x0

    .line 59
    invoke-virtual {v0, v1}, Ll/nhm;->setIntensity(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    const-wide/16 v7, 0x5dc

    .line 64
    .line 65
    cmp-long v2, v0, v7

    .line 66
    .line 67
    iget-object v7, p0, Ll/oae;->k:Ll/nhm;

    .line 68
    .line 69
    if-gez v2, :cond_3

    .line 70
    .line 71
    sub-long/2addr v0, v5

    .line 72
    long-to-float v0, v0

    .line 73
    div-float/2addr v0, v4

    .line 74
    :try_start_1
    invoke-virtual {v7, v0}, Ll/nhm;->setIntensity(F)V

    .line 75
    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    invoke-virtual {v7, v3}, Ll/nhm;->setIntensity(F)V

    .line 79
    .line 80
    .line 81
    :cond_4
    :goto_2
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    .line 83
    .line 84
    monitor-exit p0

    .line 85
    return-void

    .line 86
    :goto_3
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 87
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
    const-string p1, "/lookup2.jpg"

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
    iput-object p1, p0, Ll/oae;->d:Ljava/lang/String;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ll/oae;->Q1(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Ll/oae;->d:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Ll/oae;->e:Landroid/graphics/Bitmap;

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
    iget-object p1, p0, Ll/oae;->e:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object v0, p0, Ll/oae;->k:Ll/nhm;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/oae;->k:Ll/nhm;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p1, v0}, Ll/nhm;->setIntensity(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    .line 53
    :cond_1
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw p1
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/oae;->c:J

    .line 2
    .line 3
    return-void
.end method
