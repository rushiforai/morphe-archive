.class public Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Bitmap;

.field public b:Landroid/graphics/Bitmap;

.field public c:I

.field public d:I

.field public e:F

.field public f:Landroid/graphics/Matrix;

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Canvas;

.field public i:Z

.field public j:Landroid/graphics/Rect;

.field public k:Landroid/graphics/RectF;

.field public l:Ll/kcg0;

.field public m:I

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const p1, 0x3dcccccd    # 0.1f

    .line 5
    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e:F

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->i:Z

    .line 11
    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 13
    .line 14
    const-string p2, ""

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->n:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p2, Landroid/graphics/Matrix;

    .line 19
    .line 20
    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->f:Landroid/graphics/Matrix;

    .line 24
    .line 25
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e:F

    .line 26
    .line 27
    invoke-virtual {p2, p3, p3}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 28
    .line 29
    .line 30
    new-instance p2, Landroid/graphics/Paint;

    .line 31
    .line 32
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->g:Landroid/graphics/Paint;

    .line 36
    .line 37
    const/4 p3, 0x1

    .line 38
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->g:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 44
    .line 45
    .line 46
    new-instance p2, Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-direct {p2, p1, p1, p1, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->j:Landroid/graphics/Rect;

    .line 52
    .line 53
    new-instance p1, Landroid/graphics/RectF;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    invoke-direct {p1, p2, p2, p2, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->k:Landroid/graphics/RectF;

    .line 60
    .line 61
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->g(Ll/pf60;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;Ljava/lang/String;)Ll/pf60;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->f(Ljava/lang/String;)Ll/pf60;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/pf60;)Ll/pf60;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/graphics/Bitmap;

    .line 4
    .line 5
    const/4 v1, 0x5

    .line 6
    const/4 v2, 0x0

    .line 7
    invoke-static {v0, v1, v2}, Ll/t43;->a(Landroid/graphics/Bitmap;IZ)Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method


# virtual methods
.method public final d(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/u43;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/u43;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/v43;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/v43;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ll/w43;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll/w43;-><init>(Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->l:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->i:Z

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->h:Landroid/graphics/Canvas;

    .line 19
    .line 20
    const/4 v2, -0x1

    .line 21
    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->h:Landroid/graphics/Canvas;

    .line 25
    .line 26
    invoke-super {p0, v0}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->l:Ll/kcg0;

    .line 30
    .line 31
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->n:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->d(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-ne v0, v1, :cond_1

    .line 43
    .line 44
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->b:Landroid/graphics/Bitmap;

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->j:Landroid/graphics/Rect;

    .line 49
    .line 50
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->k:Landroid/graphics/RectF;

    .line 51
    .line 52
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->g:Landroid/graphics/Paint;

    .line 53
    .line 54
    invoke-virtual {p1, v0, v1, v3, v4}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final e(II)V
    .locals 5

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->c:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->d:I

    .line 4
    .line 5
    int-to-float v0, p1

    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e:F

    .line 7
    .line 8
    mul-float v2, v0, v1

    .line 9
    .line 10
    float-to-int v2, v2

    .line 11
    int-to-float v3, p2

    .line 12
    mul-float/2addr v1, v3

    .line 13
    float-to-int v1, v1

    .line 14
    rem-int/lit8 v4, v2, 0x4

    .line 15
    .line 16
    sub-int/2addr v2, v4

    .line 17
    rem-int/lit8 v4, v1, 0x4

    .line 18
    .line 19
    sub-int/2addr v1, v4

    .line 20
    if-lez v2, :cond_1

    .line 21
    .line 22
    if-gtz v1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    sget-object p1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 26
    .line 27
    invoke-static {v2, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->a:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    invoke-static {v2, v1, p1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->b:Landroid/graphics/Bitmap;

    .line 38
    .line 39
    new-instance p1, Landroid/graphics/Canvas;

    .line 40
    .line 41
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->a:Landroid/graphics/Bitmap;

    .line 42
    .line 43
    invoke-direct {p1, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->h:Landroid/graphics/Canvas;

    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->f:Landroid/graphics/Matrix;

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->j:Landroid/graphics/Rect;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    invoke-virtual {p1, p2, p2, v2, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->k:Landroid/graphics/RectF;

    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    invoke-virtual {p0, p1, p1, v0, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    :goto_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 67
    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v2, "BlurCoverLayout w = "

    .line 71
    .line 72
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p1, "  h = "

    .line 79
    .line 80
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p1, "  scale = "

    .line 87
    .line 88
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e:F

    .line 92
    .line 93
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public final synthetic f(Ljava/lang/String;)Ll/pf60;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/pf60;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public final synthetic g(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->n:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 15
    .line 16
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Landroid/graphics/Bitmap;

    .line 19
    .line 20
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->b:Landroid/graphics/Bitmap;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public h(ZLjava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->b:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->c:I

    .line 12
    .line 13
    if-lez v0, :cond_0

    .line 14
    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->d:I

    .line 16
    .line 17
    if-lez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->n:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->c:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e:F

    .line 31
    .line 32
    mul-float/2addr v0, v1

    .line 33
    float-to-int v0, v0

    .line 34
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->d:I

    .line 35
    .line 36
    int-to-float v2, v2

    .line 37
    mul-float/2addr v2, v1

    .line 38
    float-to-int v1, v2

    .line 39
    rem-int/lit8 v2, v0, 0x4

    .line 40
    .line 41
    sub-int/2addr v0, v2

    .line 42
    rem-int/lit8 v2, v1, 0x4

    .line 43
    .line 44
    sub-int/2addr v1, v2

    .line 45
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 46
    .line 47
    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->b:Landroid/graphics/Bitmap;

    .line 52
    .line 53
    :cond_0
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->n:Ljava/lang/String;

    .line 54
    .line 55
    const/4 p2, 0x0

    .line 56
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->m:I

    .line 57
    .line 58
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->i:Z

    .line 59
    .line 60
    if-eq p1, p2, :cond_1

    .line 61
    .line 62
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->i:Z

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-lez p1, :cond_1

    .line 13
    .line 14
    if-lez p2, :cond_1

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->c:I

    .line 17
    .line 18
    if-ne p1, v0, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->d:I

    .line 21
    .line 22
    if-eq p2, v0, :cond_1

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/view/BlurCoverLayout;->e(II)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method
