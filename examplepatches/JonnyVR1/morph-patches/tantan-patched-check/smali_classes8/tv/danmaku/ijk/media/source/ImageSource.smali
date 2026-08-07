.class public Ltv/danmaku/ijk/media/source/ImageSource;
.super Ltv/danmaku/ijk/media/source/SourceBase;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;
    }
.end annotation


# instance fields
.field private a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field public b:Z

.field private c:Z

.field protected d:Lcom/immomo/mediacore/strinf/VideoQuality;

.field protected e:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private f:Lcom/immomo/mediacore/strinf/NotifyCenter;

.field private g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

.field private h:Ljava/lang/Thread;

.field public i:Ljava/lang/Object;

.field private j:Landroid/graphics/Bitmap;

.field private k:I

.field private l:J

.field m:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/streamer/MomoSurface;Lcom/immomo/mediacore/strinf/NotifyCenter;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/SourceBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->b:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->c:Z

    .line 8
    .line 9
    sget-object v0, Lcom/immomo/mediacore/strinf/VideoQuality;->DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->d:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->i:Ljava/lang/Object;

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->j:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    iput v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->k:I

    .line 35
    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    iput-wide v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->l:J

    .line 39
    .line 40
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 41
    .line 42
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 43
    .line 44
    iput-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 45
    .line 46
    return-void
.end method

.method public static synthetic S(Ltv/danmaku/ijk/media/source/ImageSource;III)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/source/ImageSource;->Y(III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic T(Ltv/danmaku/ijk/media/source/ImageSource;III)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/source/ImageSource;->a0(III)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic U(Ltv/danmaku/ijk/media/source/ImageSource;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/ImageSource;->Z(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic V(Ltv/danmaku/ijk/media/source/ImageSource;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ltv/danmaku/ijk/media/source/ImageSource;->X(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic W(Ltv/danmaku/ijk/media/source/ImageSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->k:I

    .line 2
    .line 3
    return p0
.end method

.method private X(I)I
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x280

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    div-int/lit8 p1, p1, 0x2

    .line 7
    .line 8
    mul-int/lit8 p1, p1, 0x2

    .line 9
    .line 10
    const/16 p0, 0x20

    .line 11
    .line 12
    if-ge p1, p0, :cond_1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    return p1
.end method

.method private Y(III)I
    .locals 0

    .line 1
    mul-int/2addr p3, p2

    .line 2
    div-int/2addr p3, p1

    .line 3
    return p3
.end method

.method private Z(I)I
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x160

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    div-int/lit8 p1, p1, 0x10

    .line 7
    .line 8
    mul-int/lit8 p1, p1, 0x10

    .line 9
    .line 10
    const/16 p0, 0xb0

    .line 11
    .line 12
    if-ge p1, p0, :cond_1

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    return p1
.end method

.method private a0(III)I
    .locals 0

    .line 1
    mul-int/2addr p3, p1

    .line 2
    div-int/2addr p3, p2

    .line 3
    return p3
.end method

.method private b0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 6
    .line 7
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->j:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->j:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->j:Landroid/graphics/Bitmap;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->i:Ljava/lang/Object;

    .line 29
    .line 30
    monitor-enter v0

    .line 31
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    :try_start_1
    invoke-virtual {v2}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :catch_0
    move-exception v2

    .line 42
    :try_start_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;

    .line 46
    .line 47
    :cond_2
    monitor-exit v0

    .line 48
    return-void

    .line 49
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 50
    throw p0
.end method


# virtual methods
.method public F(I)V
    .locals 1

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/16 p1, 0xf

    .line 4
    .line 5
    :cond_0
    const/16 v0, 0x1e

    .line 6
    .line 7
    if-le p1, v0, :cond_1

    .line 8
    .line 9
    move p1, v0

    .line 10
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 11
    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    const/16 v0, 0x3e8

    .line 15
    .line 16
    div-int/2addr v0, p1

    .line 17
    invoke-static {p0, v0}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->a(Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;I)V

    .line 18
    .line 19
    .line 20
    :cond_2
    return-void
.end method

.method public J(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V
    .locals 9

    .line 1
    const-string p1, "ImageStream"

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    :cond_0
    move-object v2, p2

    .line 20
    goto/16 :goto_3

    .line 21
    .line 22
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    iput-wide v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->l:J

    .line 27
    .line 28
    const-string v0, "----startCaptureImage: begin..."

    .line 29
    .line 30
    invoke-static {p1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    new-instance v0, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-direct {v0, p0, v1}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;-><init>(Ltv/danmaku/ijk/media/source/ImageSource;Ltv/danmaku/ijk/media/source/ImageSource$1;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 40
    .line 41
    new-instance v0, Ljava/lang/Thread;

    .line 42
    .line 43
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 44
    .line 45
    const-string v3, "live-media-ImageSource"

    .line 46
    .line 47
    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;

    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 53
    .line 54
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->e(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 60
    .line 61
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->f(Lcom/immomo/mediacore/strinf/NotifyCenter;)V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 67
    .line 68
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/4 v1, 0x1

    .line 73
    if-nez v0, :cond_3

    .line 74
    .line 75
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    rem-int/lit8 v0, v0, 0x2

    .line 80
    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/lit8 v5, v0, -0x1

    .line 88
    .line 89
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 90
    .line 91
    .line 92
    move-result v6

    .line 93
    const/4 v7, 0x0

    .line 94
    const/4 v8, 0x0

    .line 95
    const/4 v3, 0x0

    .line 96
    const/4 v4, 0x0

    .line 97
    move-object v2, p2

    .line 98
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iput-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 103
    .line 104
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    move-object v2, p2

    .line 109
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 110
    .line 111
    :cond_3
    :goto_0
    if-ne p6, v1, :cond_6

    .line 112
    .line 113
    if-ltz p4, :cond_5

    .line 114
    .line 115
    if-gez p5, :cond_4

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 119
    .line 120
    invoke-virtual {p2, p4, p5}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->g(II)V

    .line 121
    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    :goto_1
    new-instance p2, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    const-string p6, "----startCaptureImage: input params error:"

    .line 127
    .line 128
    invoke-direct {p2, p6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string p4, ","

    .line 135
    .line 136
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {p1, p2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    :cond_6
    :goto_2
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 150
    .line 151
    if-eqz p2, :cond_7

    .line 152
    .line 153
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 154
    .line 155
    .line 156
    move-result p2

    .line 157
    if-nez p2, :cond_7

    .line 158
    .line 159
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 160
    .line 161
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 162
    .line 163
    invoke-virtual {p2, p4, p3, v1}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h(Landroid/graphics/Bitmap;IZ)V

    .line 164
    .line 165
    .line 166
    :cond_7
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;

    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 169
    .line 170
    .line 171
    new-instance p2, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    const-string p3, "----startCaptureImage: end... time:"

    .line 174
    .line 175
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 176
    .line 177
    .line 178
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 179
    .line 180
    .line 181
    move-result-wide p3

    .line 182
    iget-wide p5, p0, Ltv/danmaku/ijk/media/source/ImageSource;->l:J

    .line 183
    .line 184
    sub-long/2addr p3, p5

    .line 185
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    const-string p0, "ms"

    .line 189
    .line 190
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :goto_3
    new-instance p2, Ljava/lang/StringBuilder;

    .line 202
    .line 203
    const-string p3, "----startCaptureImage: mFakeSurface="

    .line 204
    .line 205
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    iget-object p3, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 209
    .line 210
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string p3, "; mNotify="

    .line 214
    .line 215
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 219
    .line 220
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string p0, ";bitmap="

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    .line 237
    .line 238
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->h:Ljava/lang/Thread;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 6
    .line 7
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q(Landroid/graphics/Bitmap;III)V
    .locals 9

    .line 1
    const-string p3, "ImageStream"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-nez p4, :cond_0

    .line 10
    .line 11
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 12
    .line 13
    if-eqz p4, :cond_0

    .line 14
    .line 15
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 16
    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 20
    .line 21
    if-nez p4, :cond_1

    .line 22
    .line 23
    :cond_0
    move-object v2, p1

    .line 24
    goto/16 :goto_1

    .line 25
    .line 26
    :cond_1
    new-instance p4, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v0, "----updateCaptureImage: begin..."

    .line 29
    .line 30
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v0, "; time:"

    .line 37
    .line 38
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    iget-wide v3, p0, Ltv/danmaku/ijk/media/source/ImageSource;->l:J

    .line 46
    .line 47
    sub-long/2addr v1, v3

    .line 48
    invoke-virtual {p4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, "ms"

    .line 52
    .line 53
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    invoke-static {p3, p4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 64
    .line 65
    .line 66
    move-result p4

    .line 67
    if-nez p4, :cond_3

    .line 68
    .line 69
    const/4 p4, 0x0

    .line 70
    iput-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 73
    .line 74
    .line 75
    move-result p4

    .line 76
    rem-int/lit8 p4, p4, 0x2

    .line 77
    .line 78
    if-eqz p4, :cond_2

    .line 79
    .line 80
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 81
    .line 82
    .line 83
    move-result p4

    .line 84
    add-int/lit8 v5, p4, -0x1

    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 87
    .line 88
    .line 89
    move-result v6

    .line 90
    const/4 v7, 0x0

    .line 91
    const/4 v8, 0x0

    .line 92
    const/4 v3, 0x0

    .line 93
    const/4 v4, 0x0

    .line 94
    move-object v2, p1

    .line 95
    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 100
    .line 101
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    move-object v2, p1

    .line 106
    iput-object v2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 107
    .line 108
    :cond_3
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 109
    .line 110
    if-eqz p1, :cond_4

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-nez p1, :cond_4

    .line 117
    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string p4, "----updateCaptureImage: end..."

    .line 121
    .line 122
    invoke-direct {p1, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iget-object p4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 126
    .line 127
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 134
    .line 135
    .line 136
    move-result-wide v2

    .line 137
    iget-wide v4, p0, Ltv/danmaku/ijk/media/source/ImageSource;->l:J

    .line 138
    .line 139
    sub-long/2addr v2, v4

    .line 140
    invoke-virtual {p1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-static {p3, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    iget-object p1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->g:Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;

    .line 154
    .line 155
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->m:Landroid/graphics/Bitmap;

    .line 156
    .line 157
    const/4 p3, 0x0

    .line 158
    invoke-virtual {p1, p0, p2, p3}, Ltv/danmaku/ijk/media/source/ImageSource$ImageRunnable;->h(Landroid/graphics/Bitmap;IZ)V

    .line 159
    .line 160
    .line 161
    :cond_4
    return-void

    .line 162
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    const-string p2, "----updateCaptureImage: mFakeSurface="

    .line 165
    .line 166
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object p2, p0, Ltv/danmaku/ijk/media/source/ImageSource;->a:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 170
    .line 171
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string p2, "; mNotify="

    .line 175
    .line 176
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->f:Lcom/immomo/mediacore/strinf/NotifyCenter;

    .line 180
    .line 181
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const-string p0, ";bitmap="

    .line 185
    .line 186
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {p3, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    return-void
.end method

.method public n()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getVideoQuality: width"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";heigh:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "ImageStream"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->e:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    return-object p0
.end method

.method public q()V
    .locals 2

    .line 1
    const-string v0, "ImageStream"

    .line 2
    .line 3
    const-string v1, "----release:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/ImageSource;->b0()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/ImageSource;->b:Z

    .line 13
    .line 14
    return-void
.end method
