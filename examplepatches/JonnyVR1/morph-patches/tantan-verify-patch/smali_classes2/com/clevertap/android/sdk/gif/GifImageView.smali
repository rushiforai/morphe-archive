.class public Lcom/clevertap/android/sdk/gif/GifImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/gif/GifImageView$c;,
        Lcom/clevertap/android/sdk/gif/GifImageView$d;,
        Lcom/clevertap/android/sdk/gif/GifImageView$e;
    }
.end annotation


# instance fields
.field private c:Z

.field private d:Lcom/clevertap/android/sdk/gif/GifImageView$c;

.field private e:Ljava/lang/Thread;

.field private f:J

.field private g:Lcom/clevertap/android/sdk/gif/a;

.field private final h:Landroid/os/Handler;

.field private i:Z

.field private j:Z

.field private k:Landroid/graphics/Bitmap;

.field private final l:Ljava/lang/Runnable;

.field private final m:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 37
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 38
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->d:Lcom/clevertap/android/sdk/gif/GifImageView$c;

    const-wide/16 v0, -0x1

    .line 39
    iput-wide v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->f:J

    .line 40
    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->h:Landroid/os/Handler;

    .line 41
    new-instance p1, Lcom/clevertap/android/sdk/gif/GifImageView$a;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/gif/GifImageView$a;-><init>(Lcom/clevertap/android/sdk/gif/GifImageView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->l:Ljava/lang/Runnable;

    .line 42
    new-instance p1, Lcom/clevertap/android/sdk/gif/GifImageView$b;

    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/gif/GifImageView$b;-><init>(Lcom/clevertap/android/sdk/gif/GifImageView;)V

    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->m:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->d:Lcom/clevertap/android/sdk/gif/GifImageView$c;

    .line 6
    .line 7
    const-wide/16 p1, -0x1

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->f:J

    .line 10
    .line 11
    new-instance p1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->h:Landroid/os/Handler;

    .line 21
    .line 22
    new-instance p1, Lcom/clevertap/android/sdk/gif/GifImageView$a;

    .line 23
    .line 24
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/gif/GifImageView$a;-><init>(Lcom/clevertap/android/sdk/gif/GifImageView;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->l:Ljava/lang/Runnable;

    .line 28
    .line 29
    new-instance p1, Lcom/clevertap/android/sdk/gif/GifImageView$b;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/clevertap/android/sdk/gif/GifImageView$b;-><init>(Lcom/clevertap/android/sdk/gif/GifImageView;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->m:Ljava/lang/Runnable;

    .line 35
    .line 36
    return-void
.end method

.method public static synthetic d(Lcom/clevertap/android/sdk/gif/GifImageView;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/clevertap/android/sdk/gif/GifImageView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->k:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Lcom/clevertap/android/sdk/gif/GifImageView;Lcom/clevertap/android/sdk/gif/a;)Lcom/clevertap/android/sdk/gif/a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic h(Lcom/clevertap/android/sdk/gif/GifImageView;Ljava/lang/Thread;)Ljava/lang/Thread;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Lcom/clevertap/android/sdk/gif/GifImageView;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->j:Z

    .line 2
    .line 3
    return p1
.end method

.method private j()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->i:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private o()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->j()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ljava/lang/Thread;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method


# virtual methods
.method public getFrameCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->g()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getFramesDisplayDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->f:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGifHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->i()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getGifWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/a;->m()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOnAnimationStop()Lcom/clevertap/android/sdk/gif/GifImageView$d;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getOnFrameAvailable()Lcom/clevertap/android/sdk/gif/GifImageView$e;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->i:Z

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->j:Z

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->p()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->h:Landroid/os/Handler;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->l:Ljava/lang/Runnable;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public l(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/a;->e()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    sub-int/2addr p1, v1

    .line 14
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/gif/a;->w(I)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-boolean p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->i:Z

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->o()V

    .line 27
    .line 28
    .line 29
    :cond_1
    :goto_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->d:Lcom/clevertap/android/sdk/gif/GifImageView$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/clevertap/android/sdk/gif/GifImageView$c;->onAnimationStart()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->i:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/a;->a()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-wide/16 v1, 0x0

    .line 24
    .line 25
    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    iget-object v5, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 30
    .line 31
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/gif/a;->l()Landroid/graphics/Bitmap;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iput-object v5, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->k:Landroid/graphics/Bitmap;

    .line 36
    .line 37
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 38
    .line 39
    .line 40
    move-result-wide v5

    .line 41
    sub-long/2addr v5, v3

    .line 42
    const-wide/32 v3, 0xf4240

    .line 43
    .line 44
    .line 45
    div-long/2addr v5, v3
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :try_start_1
    iget-object v3, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->h:Landroid/os/Handler;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->m:Ljava/lang/Runnable;

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-wide v5, v1

    .line 55
    :catch_1
    :goto_0
    const/4 v3, 0x0

    .line 56
    iput-boolean v3, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->i:Z

    .line 57
    .line 58
    iget-boolean v4, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 59
    .line 60
    if-eqz v4, :cond_5

    .line 61
    .line 62
    if-nez v0, :cond_2

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    :try_start_2
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/gif/a;->k()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    int-to-long v3, v0

    .line 72
    sub-long/2addr v3, v5

    .line 73
    long-to-int v0, v3

    .line 74
    if-lez v0, :cond_4

    .line 75
    .line 76
    iget-wide v3, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->f:J

    .line 77
    .line 78
    cmp-long v1, v3, v1

    .line 79
    .line 80
    if-lez v1, :cond_3

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_3
    int-to-long v3, v0

    .line 84
    :goto_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2

    .line 85
    .line 86
    .line 87
    :catch_2
    :cond_4
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 88
    .line 89
    if-nez v0, :cond_0

    .line 90
    .line 91
    goto :goto_3

    .line 92
    :cond_5
    :goto_2
    iput-boolean v3, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 93
    .line 94
    :goto_3
    iget-boolean v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->j:Z

    .line 95
    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    iget-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->h:Landroid/os/Handler;

    .line 99
    .line 100
    iget-object v1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->l:Ljava/lang/Runnable;

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 103
    .line 104
    .line 105
    :cond_6
    const/4 v0, 0x0

    .line 106
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->e:Ljava/lang/Thread;

    .line 107
    .line 108
    return-void
.end method

.method public setBytes([B)V
    .locals 1

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/gif/a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/clevertap/android/sdk/gif/a;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 7
    .line 8
    :try_start_0
    invoke-virtual {v0, p1}, Lcom/clevertap/android/sdk/gif/a;->n([B)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->c:Z

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/clevertap/android/sdk/gif/GifImageView;->o()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/gif/GifImageView;->l(I)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    const/4 p1, 0x0

    .line 25
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->g:Lcom/clevertap/android/sdk/gif/a;

    .line 26
    .line 27
    return-void
.end method

.method public setFramesDisplayDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->f:J

    .line 2
    .line 3
    return-void
.end method

.method public setOnAnimationStart(Lcom/clevertap/android/sdk/gif/GifImageView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/gif/GifImageView;->d:Lcom/clevertap/android/sdk/gif/GifImageView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOnAnimationStop(Lcom/clevertap/android/sdk/gif/GifImageView$d;)V
    .locals 0

    return-void
.end method

.method public setOnFrameAvailable(Lcom/clevertap/android/sdk/gif/GifImageView$e;)V
    .locals 0

    return-void
.end method
