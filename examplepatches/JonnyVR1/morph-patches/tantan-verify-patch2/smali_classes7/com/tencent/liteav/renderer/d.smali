.class public Lcom/tencent/liteav/renderer/d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Landroid/view/TextureView;

.field private b:Landroid/os/Handler;

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private i:I

.field private j:I

.field private k:F

.field private l:I


# direct methods
.method public constructor <init>(Landroid/view/TextureView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 8
    .line 9
    const/16 v1, 0x280

    .line 10
    .line 11
    iput v1, p0, Lcom/tencent/liteav/renderer/d;->e:I

    .line 12
    .line 13
    const/16 v1, 0x1e0

    .line 14
    .line 15
    iput v1, p0, Lcom/tencent/liteav/renderer/d;->f:I

    .line 16
    .line 17
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 18
    .line 19
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    iput v1, p0, Lcom/tencent/liteav/renderer/d;->i:I

    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->j:I

    .line 25
    .line 26
    const/high16 v1, 0x3f800000    # 1.0f

    .line 27
    .line 28
    iput v1, p0, Lcom/tencent/liteav/renderer/d;->k:F

    .line 29
    .line 30
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->l:I

    .line 31
    .line 32
    iput-object p1, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 45
    .line 46
    new-instance v0, Landroid/os/Handler;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/tencent/liteav/renderer/d;->b:Landroid/os/Handler;

    .line 60
    .line 61
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/d;)I
    .locals 0

    .line 41
    iget p0, p0, Lcom/tencent/liteav/renderer/d;->e:I

    return p0
.end method

.method private a()V
    .locals 2

    .line 39
    :try_start_0
    new-instance v0, Lcom/tencent/liteav/renderer/d$3;

    invoke-direct {v0, p0}, Lcom/tencent/liteav/renderer/d$3;-><init>(Lcom/tencent/liteav/renderer/d;)V

    invoke-direct {p0, v0}, Lcom/tencent/liteav/renderer/d;->a(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 40
    const-string v0, "TXCTextureViewWrapper"

    const-string v1, "adjust video size failed."

    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/renderer/d;II)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/renderer/d;->c(II)V

    return-void
.end method

.method private a(Ljava/lang/Runnable;)V
    .locals 2

    .line 42
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 43
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void

    .line 44
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/renderer/d;->b:Landroid/os/Handler;

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/renderer/d;)I
    .locals 0

    .line 131
    iget p0, p0, Lcom/tencent/liteav/renderer/d;->f:I

    return p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/renderer/d;)I
    .locals 0

    .line 91
    iget p0, p0, Lcom/tencent/liteav/renderer/d;->i:I

    return p0
.end method

.method private c(II)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 11
    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    iget v1, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    int-to-double v2, p2

    .line 20
    int-to-double p1, p1

    .line 21
    div-double/2addr v2, p1

    .line 22
    int-to-double p1, v0

    .line 23
    mul-double/2addr p1, v2

    .line 24
    double-to-int p1, p1

    .line 25
    if-le v1, p1, :cond_2

    .line 26
    .line 27
    iput v0, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 28
    .line 29
    int-to-double p1, v0

    .line 30
    mul-double/2addr p1, v2

    .line 31
    double-to-int p1, p1

    .line 32
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    int-to-double p1, v1

    .line 36
    div-double/2addr p1, v2

    .line 37
    double-to-int p1, p1

    .line 38
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 39
    .line 40
    iput v1, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 41
    .line 42
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 43
    .line 44
    sub-int p2, v0, p1

    .line 45
    .line 46
    int-to-float p2, p2

    .line 47
    const/high16 v2, 0x40000000    # 2.0f

    .line 48
    .line 49
    div-float/2addr p2, v2

    .line 50
    iget v3, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 51
    .line 52
    sub-int v4, v1, v3

    .line 53
    .line 54
    int-to-float v4, v4

    .line 55
    div-float/2addr v4, v2

    .line 56
    int-to-float p1, p1

    .line 57
    int-to-float v0, v0

    .line 58
    div-float/2addr p1, v0

    .line 59
    int-to-float v0, v3

    .line 60
    int-to-float v1, v1

    .line 61
    div-float/2addr v0, v1

    .line 62
    new-instance v1, Landroid/graphics/Matrix;

    .line 63
    .line 64
    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 68
    .line 69
    invoke-virtual {v2, v1}, Landroid/view/TextureView;->getTransform(Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, p1, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p2, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic d(Lcom/tencent/liteav/renderer/d;)I
    .locals 0

    .line 139
    iget p0, p0, Lcom/tencent/liteav/renderer/d;->j:I

    return p0
.end method


# virtual methods
.method public a(I)V
    .locals 2

    .line 37
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d;->b:Landroid/os/Handler;

    new-instance v1, Lcom/tencent/liteav/renderer/d$1;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/renderer/d$1;-><init>(Lcom/tencent/liteav/renderer/d;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 38
    const-string p1, "TXCTextureViewWrapper"

    const-string v0, "set render mode failed"

    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public a(II)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "vrender: set view size:"

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
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "TXCTextureViewWrapper"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 29
    .line 30
    iput p2, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/d;->a()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public b(I)V
    .locals 7

    .line 1
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->i:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 4
    .line 5
    if-eqz v0, :cond_b

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    const/16 v2, 0x5a

    .line 9
    .line 10
    const/16 v3, 0x10e

    .line 11
    .line 12
    const/16 v4, 0xb4

    .line 13
    .line 14
    const/high16 v5, 0x3f800000    # 1.0f

    .line 15
    .line 16
    if-ne p1, v1, :cond_4

    .line 17
    .line 18
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->j:I

    .line 19
    .line 20
    if-eqz p1, :cond_9

    .line 21
    .line 22
    if-ne p1, v4, :cond_0

    .line 23
    .line 24
    goto :goto_2

    .line 25
    :cond_0
    if-eq p1, v3, :cond_1

    .line 26
    .line 27
    if-ne p1, v2, :cond_9

    .line 28
    .line 29
    :cond_1
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 30
    .line 31
    if-eqz p1, :cond_b

    .line 32
    .line 33
    iget v1, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    goto :goto_3

    .line 38
    :cond_2
    iget v2, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 39
    .line 40
    int-to-float v2, v2

    .line 41
    int-to-float p1, p1

    .line 42
    div-float/2addr v2, p1

    .line 43
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 44
    .line 45
    int-to-float p1, p1

    .line 46
    int-to-float v1, v1

    .line 47
    div-float/2addr p1, v1

    .line 48
    cmpl-float v1, v2, p1

    .line 49
    .line 50
    if-lez v1, :cond_3

    .line 51
    .line 52
    :goto_0
    move v5, p1

    .line 53
    goto :goto_2

    .line 54
    :cond_3
    move v5, v2

    .line 55
    goto :goto_2

    .line 56
    :cond_4
    if-nez p1, :cond_9

    .line 57
    .line 58
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 59
    .line 60
    if-eqz p1, :cond_b

    .line 61
    .line 62
    iget v1, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 63
    .line 64
    if-nez v1, :cond_5

    .line 65
    .line 66
    goto :goto_3

    .line 67
    :cond_5
    iget v6, p0, Lcom/tencent/liteav/renderer/d;->j:I

    .line 68
    .line 69
    if-eqz v6, :cond_8

    .line 70
    .line 71
    if-ne v6, v4, :cond_6

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_6
    if-eq v6, v3, :cond_7

    .line 75
    .line 76
    if-ne v6, v2, :cond_9

    .line 77
    .line 78
    :cond_7
    iget v2, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    int-to-float p1, p1

    .line 82
    div-float/2addr v2, p1

    .line 83
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 84
    .line 85
    int-to-float p1, p1

    .line 86
    int-to-float v1, v1

    .line 87
    div-float/2addr p1, v1

    .line 88
    cmpg-float v1, v2, p1

    .line 89
    .line 90
    if-gez v1, :cond_3

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_8
    :goto_1
    iget v2, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 94
    .line 95
    int-to-float v2, v2

    .line 96
    int-to-float v1, v1

    .line 97
    div-float/2addr v2, v1

    .line 98
    iget v1, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 99
    .line 100
    int-to-float v1, v1

    .line 101
    int-to-float p1, p1

    .line 102
    div-float/2addr v1, p1

    .line 103
    cmpg-float p1, v2, v1

    .line 104
    .line 105
    if-gez p1, :cond_3

    .line 106
    .line 107
    move v5, v1

    .line 108
    :cond_9
    :goto_2
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->k:F

    .line 109
    .line 110
    const/4 v1, 0x0

    .line 111
    cmpg-float p1, p1, v1

    .line 112
    .line 113
    if-gez p1, :cond_a

    .line 114
    .line 115
    neg-float v5, v5

    .line 116
    :cond_a
    invoke-virtual {v0, v5}, Landroid/view/View;->setScaleX(F)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 120
    .line 121
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 126
    .line 127
    .line 128
    iput v5, p0, Lcom/tencent/liteav/renderer/d;->k:F

    .line 129
    .line 130
    :cond_b
    :goto_3
    return-void
.end method

.method public b(II)V
    .locals 2

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "vrender: set video size:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCTextureViewWrapper"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->e:I

    .line 134
    iput p2, p0, Lcom/tencent/liteav/renderer/d;->f:I

    .line 135
    invoke-direct {p0}, Lcom/tencent/liteav/renderer/d;->a()V

    return-void
.end method

.method public c(I)V
    .locals 2

    .line 89
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d;->b:Landroid/os/Handler;

    new-instance v1, Lcom/tencent/liteav/renderer/d$2;

    invoke-direct {v1, p0, p1}, Lcom/tencent/liteav/renderer/d$2;-><init>(Lcom/tencent/liteav/renderer/d;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 90
    const-string p1, "TXCTextureViewWrapper"

    const-string v0, "set render rotation failed."

    invoke-static {p1, v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public d(I)V
    .locals 4

    .line 1
    rem-int/lit16 p1, p1, 0x168

    .line 2
    .line 3
    iput p1, p0, Lcom/tencent/liteav/renderer/d;->j:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 6
    .line 7
    if-eqz v0, :cond_b

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    const/high16 v2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-eqz p1, :cond_5

    .line 13
    .line 14
    const/16 v3, 0xb4

    .line 15
    .line 16
    if-ne p1, v3, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    const/16 v3, 0x10e

    .line 20
    .line 21
    if-eq p1, v3, :cond_1

    .line 22
    .line 23
    const/16 v3, 0x5a

    .line 24
    .line 25
    if-ne p1, v3, :cond_9

    .line 26
    .line 27
    :cond_1
    iget v3, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 28
    .line 29
    if-eqz v3, :cond_b

    .line 30
    .line 31
    iget v3, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 32
    .line 33
    if-nez v3, :cond_2

    .line 34
    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_2
    rsub-int p1, p1, 0x168

    .line 38
    .line 39
    int-to-float p1, p1

    .line 40
    invoke-virtual {v0, p1}, Landroid/view/View;->setRotation(F)V

    .line 41
    .line 42
    .line 43
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 44
    .line 45
    int-to-float p1, p1

    .line 46
    iget v0, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 47
    .line 48
    int-to-float v0, v0

    .line 49
    div-float/2addr p1, v0

    .line 50
    iget v0, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 51
    .line 52
    int-to-float v0, v0

    .line 53
    iget v3, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 54
    .line 55
    int-to-float v3, v3

    .line 56
    div-float/2addr v0, v3

    .line 57
    iget v3, p0, Lcom/tencent/liteav/renderer/d;->i:I

    .line 58
    .line 59
    if-ne v3, v1, :cond_4

    .line 60
    .line 61
    cmpl-float v1, p1, v0

    .line 62
    .line 63
    if-lez v1, :cond_3

    .line 64
    .line 65
    :goto_0
    move v2, v0

    .line 66
    goto :goto_2

    .line 67
    :cond_3
    move v2, p1

    .line 68
    goto :goto_2

    .line 69
    :cond_4
    if-nez v3, :cond_9

    .line 70
    .line 71
    cmpg-float v1, p1, v0

    .line 72
    .line 73
    if-gez v1, :cond_3

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_5
    :goto_1
    rsub-int p1, p1, 0x168

    .line 77
    .line 78
    int-to-float p1, p1

    .line 79
    invoke-virtual {v0, p1}, Landroid/view/View;->setRotation(F)V

    .line 80
    .line 81
    .line 82
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->i:I

    .line 83
    .line 84
    if-ne p1, v1, :cond_6

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_6
    if-nez p1, :cond_9

    .line 88
    .line 89
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->g:I

    .line 90
    .line 91
    if-eqz p1, :cond_b

    .line 92
    .line 93
    iget v0, p0, Lcom/tencent/liteav/renderer/d;->h:I

    .line 94
    .line 95
    if-nez v0, :cond_7

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_7
    iget v1, p0, Lcom/tencent/liteav/renderer/d;->d:I

    .line 99
    .line 100
    int-to-float v1, v1

    .line 101
    int-to-float v0, v0

    .line 102
    div-float/2addr v1, v0

    .line 103
    iget v0, p0, Lcom/tencent/liteav/renderer/d;->c:I

    .line 104
    .line 105
    int-to-float v0, v0

    .line 106
    int-to-float p1, p1

    .line 107
    div-float/2addr v0, p1

    .line 108
    cmpg-float p1, v1, v0

    .line 109
    .line 110
    if-gez p1, :cond_8

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_8
    move v2, v1

    .line 114
    :cond_9
    :goto_2
    iget p1, p0, Lcom/tencent/liteav/renderer/d;->k:F

    .line 115
    .line 116
    const/4 v0, 0x0

    .line 117
    cmpg-float p1, p1, v0

    .line 118
    .line 119
    if-gez p1, :cond_a

    .line 120
    .line 121
    neg-float v2, v2

    .line 122
    :cond_a
    iget-object p1, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 123
    .line 124
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/tencent/liteav/renderer/d;->a:Landroid/view/TextureView;

    .line 128
    .line 129
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleY(F)V

    .line 134
    .line 135
    .line 136
    iput v2, p0, Lcom/tencent/liteav/renderer/d;->k:F

    .line 137
    .line 138
    :cond_b
    :goto_3
    return-void
.end method
