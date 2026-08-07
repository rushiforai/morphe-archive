.class public Ll/pkm;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/gam;


# instance fields
.field private a:Z

.field private b:J

.field private c:J

.field d:Ll/okm;

.field e:Ll/nhm;

.field private f:Ljava/lang/String;

.field private g:Ljava/lang/String;

.field private i:Ljava/lang/String;

.field private j:Z

.field private k:Landroid/graphics/Bitmap;

.field private l:Landroid/graphics/Bitmap;

.field private m:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/pkm;->a:Z

    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/pkm;->b:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/pkm;->c:J

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ll/pkm;->j:Z

    .line 15
    .line 16
    new-instance v0, Ll/nhm;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/nhm;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/pkm;->e:Ll/nhm;

    .line 22
    .line 23
    new-instance v0, Ll/okm;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/okm;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/pkm;->d:Ll/okm;

    .line 29
    .line 30
    iget-object v1, p0, Ll/pkm;->e:Ll/nhm;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ll/pkm;->d:Ll/okm;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/pkm;->e:Ll/nhm;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/pkm;->d:Ll/okm;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 48
    .line 49
    .line 50
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


# virtual methods
.method public declared-synchronized R1()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, -0x1

    .line 3
    .line 4
    :try_start_0
    iput-wide v0, p0, Ll/pkm;->b:J

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/pkm;->a:Z

    .line 8
    .line 9
    iget-object v1, p0, Ll/pkm;->d:Ll/okm;

    .line 10
    .line 11
    const/high16 v2, 0x3f800000    # 1.0f

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ll/okm;->R1(F)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/pkm;->e:Ll/nhm;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-virtual {v1, v2}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/pkm;->e:Ll/nhm;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-virtual {v1, v2}, Ll/nhm;->setIntensity(F)V

    .line 26
    .line 27
    .line 28
    iput-boolean v0, p0, Ll/pkm;->j:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

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

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Ll/pkm;->k:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/pkm;->k:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/pkm;->k:Landroid/graphics/Bitmap;

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
    iget-object v0, p0, Ll/pkm;->l:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/pkm;->l:Landroid/graphics/Bitmap;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/pkm;->l:Landroid/graphics/Bitmap;

    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Ll/pkm;->m:Landroid/graphics/Bitmap;

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_2

    .line 52
    .line 53
    iget-object v0, p0, Ll/pkm;->m:Landroid/graphics/Bitmap;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ll/pkm;->m:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    .line 60
    :cond_2
    monitor-exit p0

    .line 61
    return-void

    .line 62
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    throw v0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 9

    .line 1
    iget-wide v0, p0, Ll/pkm;->b:J

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
    iget-wide v0, p0, Ll/pkm;->c:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/pkm;->b:J

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Ll/pkm;->a:Z

    .line 14
    .line 15
    if-eqz v0, :cond_5

    .line 16
    .line 17
    iget-wide v0, p0, Ll/pkm;->c:J

    .line 18
    .line 19
    iget-wide v2, p0, Ll/pkm;->b:J

    .line 20
    .line 21
    sub-long/2addr v0, v2

    .line 22
    const-wide/16 v2, 0x3e8

    .line 23
    .line 24
    cmp-long v2, v0, v2

    .line 25
    .line 26
    iget-object v3, p0, Ll/pkm;->d:Ll/okm;

    .line 27
    .line 28
    const/high16 v4, 0x3f800000    # 1.0f

    .line 29
    .line 30
    if-lez v2, :cond_1

    .line 31
    .line 32
    const v5, 0x3f6d097b

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3, v5}, Ll/okm;->R1(F)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    long-to-float v5, v0

    .line 40
    const/high16 v6, 0x447a0000    # 1000.0f

    .line 41
    .line 42
    div-float/2addr v5, v6

    .line 43
    const v6, 0x3da3d70a    # 0.08f

    .line 44
    .line 45
    .line 46
    mul-float/2addr v5, v6

    .line 47
    add-float/2addr v5, v4

    .line 48
    div-float v5, v4, v5

    .line 49
    .line 50
    invoke-virtual {v3, v5}, Ll/okm;->R1(F)V

    .line 51
    .line 52
    .line 53
    :goto_0
    const-wide/16 v5, 0x12c

    .line 54
    .line 55
    cmp-long v3, v0, v5

    .line 56
    .line 57
    if-lez v3, :cond_2

    .line 58
    .line 59
    iget-boolean v7, p0, Ll/pkm;->j:Z

    .line 60
    .line 61
    if-eqz v7, :cond_2

    .line 62
    .line 63
    iget-object v7, p0, Ll/pkm;->k:Landroid/graphics/Bitmap;

    .line 64
    .line 65
    if-eqz v7, :cond_2

    .line 66
    .line 67
    iget-object v8, p0, Ll/pkm;->e:Ll/nhm;

    .line 68
    .line 69
    invoke-virtual {v8, v7}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 70
    .line 71
    .line 72
    iget-object v7, p0, Ll/pkm;->e:Ll/nhm;

    .line 73
    .line 74
    const/4 v8, 0x0

    .line 75
    invoke-virtual {v7, v8}, Ll/nhm;->setIntensity(F)V

    .line 76
    .line 77
    .line 78
    const/4 v7, 0x0

    .line 79
    iput-boolean v7, p0, Ll/pkm;->j:Z

    .line 80
    .line 81
    :cond_2
    if-lez v3, :cond_3

    .line 82
    .line 83
    if-gtz v2, :cond_3

    .line 84
    .line 85
    iget-boolean v2, p0, Ll/pkm;->j:Z

    .line 86
    .line 87
    if-nez v2, :cond_3

    .line 88
    .line 89
    iget-object v2, p0, Ll/pkm;->e:Ll/nhm;

    .line 90
    .line 91
    sub-long v5, v0, v5

    .line 92
    .line 93
    long-to-float v3, v5

    .line 94
    const/high16 v5, 0x442f0000    # 700.0f

    .line 95
    .line 96
    div-float/2addr v3, v5

    .line 97
    invoke-virtual {v2, v3}, Ll/nhm;->setIntensity(F)V

    .line 98
    .line 99
    .line 100
    :cond_3
    const-wide/16 v2, 0x44c

    .line 101
    .line 102
    cmp-long v2, v0, v2

    .line 103
    .line 104
    if-lez v2, :cond_4

    .line 105
    .line 106
    iget-object v2, p0, Ll/pkm;->l:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    if-eqz v2, :cond_4

    .line 109
    .line 110
    iget-object v3, p0, Ll/pkm;->e:Ll/nhm;

    .line 111
    .line 112
    invoke-virtual {v3, v2}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Ll/pkm;->e:Ll/nhm;

    .line 116
    .line 117
    invoke-virtual {v2, v4}, Ll/nhm;->setIntensity(F)V

    .line 118
    .line 119
    .line 120
    :cond_4
    const-wide/16 v2, 0x7d0

    .line 121
    .line 122
    cmp-long v0, v0, v2

    .line 123
    .line 124
    if-lez v0, :cond_5

    .line 125
    .line 126
    iget-object v0, p0, Ll/pkm;->m:Landroid/graphics/Bitmap;

    .line 127
    .line 128
    if-eqz v0, :cond_5

    .line 129
    .line 130
    iget-object v1, p0, Ll/pkm;->e:Ll/nhm;

    .line 131
    .line 132
    invoke-virtual {v1, v0}, Ll/nhm;->setLookupBitmap(Landroid/graphics/Bitmap;)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Ll/pkm;->e:Ll/nhm;

    .line 136
    .line 137
    invoke-virtual {v0, v4}, Ll/nhm;->setIntensity(F)V

    .line 138
    .line 139
    .line 140
    :cond_5
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public declared-synchronized setLookupPath(Ljava/lang/String;)V
    .locals 2

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
    const-string v1, "/lookup1.jpg"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/pkm;->f:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "/lookup2.jpg"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iput-object v0, p0, Ll/pkm;->g:Ljava/lang/String;

    .line 39
    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p1, "/lookup3.jpg"

    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Ll/pkm;->i:Ljava/lang/String;

    .line 58
    .line 59
    iget-object p1, p0, Ll/pkm;->f:Ljava/lang/String;

    .line 60
    .line 61
    invoke-direct {p0, p1}, Ll/pkm;->Q1(Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    iget-object p1, p0, Ll/pkm;->f:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Ll/pkm;->k:Landroid/graphics/Bitmap;

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :catchall_0
    move-exception p1

    .line 77
    goto :goto_1

    .line 78
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/pkm;->g:Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {p0, p1}, Ll/pkm;->Q1(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    if-eqz p1, :cond_1

    .line 85
    .line 86
    iget-object p1, p0, Ll/pkm;->g:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Ll/pkm;->l:Landroid/graphics/Bitmap;

    .line 93
    .line 94
    :cond_1
    iget-object p1, p0, Ll/pkm;->i:Ljava/lang/String;

    .line 95
    .line 96
    invoke-direct {p0, p1}, Ll/pkm;->Q1(Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    iget-object p1, p0, Ll/pkm;->i:Ljava/lang/String;

    .line 103
    .line 104
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iput-object p1, p0, Ll/pkm;->m:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    .line 110
    :cond_2
    monitor-exit p0

    .line 111
    return-void

    .line 112
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    throw p1
.end method

.method public setTimeStamp(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/pkm;->c:J

    .line 2
    .line 3
    return-void
.end method
