.class public Lcom/tencent/liteav/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/b$a;,
        Lcom/tencent/liteav/b$b;
    }
.end annotation


# static fields
.field private static final a:Ljava/lang/String; = "b"


# instance fields
.field private b:I

.field private c:J

.field private d:Lcom/tencent/liteav/b$a;

.field private e:Landroid/os/HandlerThread;

.field private f:Z

.field private g:Ljava/nio/ByteBuffer;

.field private h:Landroid/graphics/Bitmap;

.field private i:I

.field private j:I

.field private k:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/b$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/liteav/b$b;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12c

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/liteav/b;->b:I

    .line 7
    .line 8
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/liteav/b;->c:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/tencent/liteav/b;->f:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Lcom/tencent/liteav/b;->g:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/b;->h:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    iput v0, p0, Lcom/tencent/liteav/b;->i:I

    .line 21
    .line 22
    iput v0, p0, Lcom/tencent/liteav/b;->j:I

    .line 23
    .line 24
    iput-object v1, p0, Lcom/tencent/liteav/b;->k:Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/tencent/liteav/b;->k:Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/b;)V
    .locals 0

    .line 127
    invoke-direct {p0}, Lcom/tencent/liteav/b;->f()V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/b;Z)Z
    .locals 0

    .line 118
    iput-boolean p1, p0, Lcom/tencent/liteav/b;->f:Z

    return p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/b;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/tencent/liteav/b;->k:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method private b(II)V
    .locals 4

    .line 1
    if-lez p1, :cond_2

    .line 2
    .line 3
    const/16 v0, 0x14

    .line 4
    .line 5
    if-lt p1, v0, :cond_0

    .line 6
    .line 7
    :goto_0
    move p1, v0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    const/4 v0, 0x5

    .line 10
    if-gt p1, v0, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    :goto_1
    const/16 v0, 0x3e8

    .line 14
    .line 15
    div-int/2addr v0, p1

    .line 16
    iput v0, p0, Lcom/tencent/liteav/b;->b:I

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_2
    const/16 p1, 0xc8

    .line 20
    .line 21
    iput p1, p0, Lcom/tencent/liteav/b;->b:I

    .line 22
    .line 23
    :goto_2
    int-to-long v0, p2

    .line 24
    if-lez p2, :cond_3

    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide p1

    .line 30
    const-wide/16 v2, 0x3e8

    .line 31
    .line 32
    mul-long/2addr v0, v2

    .line 33
    add-long/2addr p1, v0

    .line 34
    iput-wide p1, p0, Lcom/tencent/liteav/b;->c:J

    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    if-nez p2, :cond_4

    .line 38
    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 40
    .line 41
    .line 42
    move-result-wide p1

    .line 43
    const-wide/32 v0, 0x493e0

    .line 44
    .line 45
    .line 46
    add-long/2addr p1, v0

    .line 47
    iput-wide p1, p0, Lcom/tencent/liteav/b;->c:J

    .line 48
    .line 49
    return-void

    .line 50
    :cond_4
    const-wide/16 p1, -0x1

    .line 51
    .line 52
    iput-wide p1, p0, Lcom/tencent/liteav/b;->c:J

    .line 53
    .line 54
    return-void
.end method

.method public static synthetic c()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic c(Lcom/tencent/liteav/b;)Z
    .locals 0

    .line 4
    iget-boolean p0, p0, Lcom/tencent/liteav/b;->f:Z

    return p0
.end method

.method private d()V
    .locals 8

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/b;->e()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/HandlerThread;

    .line 5
    .line 6
    const-string v1, "TXImageCapturer"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/liteav/b;->e:Landroid/os/HandlerThread;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    new-instance v2, Lcom/tencent/liteav/b$a;

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/liteav/b;->e:Landroid/os/HandlerThread;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    iget v5, p0, Lcom/tencent/liteav/b;->b:I

    .line 25
    .line 26
    iget-wide v6, p0, Lcom/tencent/liteav/b;->c:J

    .line 27
    .line 28
    move-object v3, p0

    .line 29
    invoke-direct/range {v2 .. v7}, Lcom/tencent/liteav/b$a;-><init>(Lcom/tencent/liteav/b;Landroid/os/Looper;IJ)V

    .line 30
    .line 31
    .line 32
    iput-object v2, v3, Lcom/tencent/liteav/b;->d:Lcom/tencent/liteav/b$a;

    .line 33
    .line 34
    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/b;->d:Lcom/tencent/liteav/b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/tencent/liteav/b;->d:Lcom/tencent/liteav/b$a;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/b;->e:Landroid/os/HandlerThread;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/liteav/b;->e:Landroid/os/HandlerThread;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private f()V
    .locals 8

    .line 1
    const-string v0, "*"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/b;->k:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz v2, :cond_1

    .line 7
    .line 8
    iget-boolean v3, p0, Lcom/tencent/liteav/b;->f:Z

    .line 9
    .line 10
    if-eqz v3, :cond_1

    .line 11
    .line 12
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/tencent/liteav/b$b;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Lcom/tencent/liteav/b;->h:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    iget-object v4, p0, Lcom/tencent/liteav/b;->g:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    if-nez v4, :cond_0

    .line 25
    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_2

    .line 32
    :try_start_1
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    mul-int v5, v4, v1

    .line 37
    .line 38
    mul-int/lit8 v5, v5, 0x4

    .line 39
    .line 40
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v3, v5}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 48
    .line 49
    .line 50
    iput-object v5, p0, Lcom/tencent/liteav/b;->g:Ljava/nio/ByteBuffer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 51
    .line 52
    move v7, v4

    .line 53
    move v4, v1

    .line 54
    move v1, v7

    .line 55
    goto :goto_0

    .line 56
    :catch_0
    move v7, v4

    .line 57
    move v4, v1

    .line 58
    move v1, v7

    .line 59
    goto :goto_1

    .line 60
    :catch_1
    move v7, v4

    .line 61
    move v4, v1

    .line 62
    move v1, v7

    .line 63
    goto :goto_2

    .line 64
    :catch_2
    move v4, v1

    .line 65
    goto :goto_1

    .line 66
    :catch_3
    move v4, v1

    .line 67
    goto :goto_2

    .line 68
    :cond_0
    move-object v5, v4

    .line 69
    move v4, v1

    .line 70
    :goto_0
    if-eqz v3, :cond_1

    .line 71
    .line 72
    if-eqz v5, :cond_1

    .line 73
    .line 74
    :try_start_2
    iget v6, p0, Lcom/tencent/liteav/b;->i:I

    .line 75
    .line 76
    iget p0, p0, Lcom/tencent/liteav/b;->j:I

    .line 77
    .line 78
    invoke-interface {v2, v3, v5, v6, p0}, Lcom/tencent/liteav/b$b;->a(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;II)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_4

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :catch_4
    :goto_1
    sget-object p0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 83
    .line 84
    new-instance v2, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v3, "bkgpush: generate bitmap pixel error "

    .line 87
    .line 88
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    goto :goto_3

    .line 108
    :catch_5
    :goto_2
    sget-object p0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 109
    .line 110
    new-instance v2, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v3, "bkgpush: generate bitmap pixel exception "

    .line 113
    .line 114
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    :cond_1
    :goto_3
    return-void
.end method


# virtual methods
.method public a(II)V
    .locals 4

    .line 119
    iget-boolean v0, p0, Lcom/tencent/liteav/b;->f:Z

    if-eqz v0, :cond_0

    .line 120
    sget-object p0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    const-string p1, "bkgpush: start background publish return when started"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 121
    iput-boolean v0, p0, Lcom/tencent/liteav/b;->f:Z

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/b;->b(II)V

    .line 123
    invoke-direct {p0}, Lcom/tencent/liteav/b;->d()V

    .line 124
    iget-object p1, p0, Lcom/tencent/liteav/b;->d:Lcom/tencent/liteav/b$a;

    if-eqz p1, :cond_1

    .line 125
    iget p2, p0, Lcom/tencent/liteav/b;->b:I

    int-to-long v0, p2

    const/16 p2, 0x3e9

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 126
    :cond_1
    sget-object p1, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "bkgpush: start background publish with time:"

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/tencent/liteav/b;->c:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, ", interval:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/tencent/liteav/b;->b:I

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public a(IILandroid/graphics/Bitmap;II)V
    .locals 5

    .line 1
    const-string v0, "bkgpush: generate bitmap "

    .line 2
    .line 3
    const-string v1, "bkgpush: background publish img is empty, add default img "

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/tencent/liteav/b;->f:Z

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-string p1, "bkgpush: start background publish return when started"

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v2, "save bitmap failed."

    .line 18
    .line 19
    const-string v3, "*"

    .line 20
    .line 21
    if-nez p3, :cond_1

    .line 22
    .line 23
    :try_start_0
    sget-object p3, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v4, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {p3, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance p3, Landroid/graphics/drawable/ColorDrawable;

    .line 47
    .line 48
    const/high16 v1, -0x1000000

    .line 49
    .line 50
    invoke-direct {p3, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 51
    .line 52
    .line 53
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 54
    .line 55
    invoke-static {p4, p5, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v4, Landroid/graphics/Canvas;

    .line 60
    .line 61
    invoke-direct {v4, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p3, v4}, Landroid/graphics/drawable/ColorDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 65
    .line 66
    .line 67
    move-object p3, v1

    .line 68
    goto :goto_0

    .line 69
    :catch_0
    move-exception p3

    .line 70
    goto :goto_1

    .line 71
    :catch_1
    move-exception p3

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    :goto_0
    sget-object v1, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 74
    .line 75
    new-instance v4, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v4, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iput-object p3, p0, Lcom/tencent/liteav/b;->h:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    goto :goto_3

    .line 99
    :goto_1
    sget-object v0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v0, v2, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    .line 103
    .line 104
    goto :goto_3

    .line 105
    :goto_2
    sget-object v0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {v0, v2, p3}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    :goto_3
    iput p4, p0, Lcom/tencent/liteav/b;->i:I

    .line 111
    .line 112
    iput p5, p0, Lcom/tencent/liteav/b;->j:I

    .line 113
    .line 114
    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/b;->a(II)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public a()Z
    .locals 0

    .line 128
    iget-boolean p0, p0, Lcom/tencent/liteav/b;->f:Z

    return p0
.end method

.method public b()V
    .locals 2

    const/4 v0, 0x0

    .line 55
    iput-boolean v0, p0, Lcom/tencent/liteav/b;->f:Z

    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Lcom/tencent/liteav/b;->g:Ljava/nio/ByteBuffer;

    .line 57
    iput-object v0, p0, Lcom/tencent/liteav/b;->h:Landroid/graphics/Bitmap;

    .line 58
    sget-object v0, Lcom/tencent/liteav/b;->a:Ljava/lang/String;

    const-string v1, "bkgpush: stop background publish"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-direct {p0}, Lcom/tencent/liteav/b;->e()V

    return-void
.end method
