.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:J

.field public d:F

.field public e:Landroid/animation/ValueAnimator;

.field public f:Landroid/animation/ValueAnimator;

.field public g:Landroid/animation/ValueAnimator;

.field public h:Landroid/animation/ValueAnimator;

.field public i:I

.field public j:I

.field public k:J

.field public l:I

.field public m:Landroid/graphics/Bitmap;

.field public n:Landroid/graphics/Bitmap;

.field public o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

.field public final p:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 23
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->i:I

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->j:I

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 11
    .line 12
    new-instance p2, Landroid/graphics/RectF;

    .line 13
    .line 14
    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->p:Landroid/graphics/RectF;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->A()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->u()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->y()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->s()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->x(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->v(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->z(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method private getCurrentCenterBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->m:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    sget v0, Ll/obc0;->g2:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l(I)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->m:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->m:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    return-object p0
.end method

.method private getProgressStrokeBitmap()Landroid/graphics/Bitmap;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->n:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    :cond_0
    sget v0, Ll/obc0;->i2:I

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l(I)Landroid/graphics/Bitmap;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->n:Landroid/graphics/Bitmap;

    .line 18
    .line 19
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->n:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->H()V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->w()V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->r(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->t(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->m:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->C(Landroid/graphics/Bitmap;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->n:Landroid/graphics/Bitmap;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->C(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final C(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public D()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 13
    .line 14
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-static {p0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final E()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->H()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 5
    .line 6
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->b()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final F()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 7
    .line 8
    const/4 v1, 0x2

    .line 9
    new-array v1, v1, [F

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    aput v0, v1, v2

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/4 v2, 0x1

    .line 16
    aput v0, v1, v2

    .line 17
    .line 18
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-wide/16 v1, 0xb4

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/jk5;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/jk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/ak5;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/ak5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 51
    .line 52
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->c()V

    .line 53
    .line 54
    .line 55
    const/4 v0, 0x4

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 57
    .line 58
    return-void
.end method

.method public final G()V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/high16 v0, 0x42540000    # 53.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x42400000    # 48.0f

    .line 17
    .line 18
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    filled-new-array {v2, v0, v1}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    const-wide/16 v1, 0x258

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    new-instance v1, Ll/ek5;

    .line 52
    .line 53
    invoke-direct {v1, p0}, Ll/ek5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    new-instance v1, Ll/fk5;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/fk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 67
    .line 68
    .line 69
    const/4 v0, 0x0

    .line 70
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->d(Z)V

    .line 81
    .line 82
    .line 83
    const/4 v0, 0x4

    .line 84
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 85
    .line 86
    return-void
.end method

.method public final H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->c:J

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->q(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    new-instance v1, Ll/zj5;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/zj5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 30
    .line 31
    new-instance v1, Ll/bk5;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/bk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x2

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 46
    .line 47
    return-void
.end method

.method public final I()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    const-wide/16 v1, 0xb4

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    new-instance v1, Ll/ck5;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/ck5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    new-instance v1, Ll/dk5;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/dk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 51
    .line 52
    .line 53
    const/4 v0, 0x3

    .line 54
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 55
    .line 56
    return-void

    .line 57
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public J()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->L()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 v1, 0x2

    .line 14
    if-ne v0, v1, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->H()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_2
    const/4 v1, 0x3

    .line 21
    if-ne v0, v1, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->g:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->L()V

    .line 29
    .line 30
    .line 31
    :cond_3
    :goto_0
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->G()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const/4 v1, 0x2

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->F()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public final L()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/high16 v0, 0x42540000    # 53.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/high16 v2, 0x42400000    # 48.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    filled-new-array {v1, v0, v2}, [I

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    const-wide/16 v2, 0x258

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 34
    .line 35
    const/4 v2, 0x0

    .line 36
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    new-instance v2, Ll/gk5;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/gk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    new-instance v2, Ll/hk5;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Ll/hk5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Ll/ik5;

    .line 57
    .line 58
    invoke-direct {v3, p0}, Ll/ik5;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v0, v2, v3}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->f:Landroid/animation/ValueAnimator;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 73
    .line 74
    invoke-interface {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->d(Z)V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x1

    .line 78
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 79
    .line 80
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-interface {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->a()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->D()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final l(I)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->b:Landroid/graphics/Paint;

    .line 12
    .line 13
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->b:Landroid/graphics/Paint;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->i:I

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->j:I

    .line 26
    .line 27
    sub-int v2, v0, v1

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    sub-int v3, v0, v1

    .line 31
    .line 32
    int-to-float v3, v3

    .line 33
    add-int v4, v0, v1

    .line 34
    .line 35
    int-to-float v4, v4

    .line 36
    add-int/2addr v0, v1

    .line 37
    int-to-float v0, v0

    .line 38
    invoke-virtual {p0, v2, v3, v4, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->p(FFFF)Landroid/graphics/RectF;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->getCurrentCenterBitmap()Landroid/graphics/Bitmap;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x0

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->b:Landroid/graphics/Paint;

    .line 48
    .line 49
    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final n(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v5, v0

    .line 10
    int-to-float v6, v1

    .line 11
    const/4 v7, 0x0

    .line 12
    const/16 v8, 0x1f

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x0

    .line 16
    move-object v2, p1

    .line 17
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    move-object v0, v2

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 23
    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    new-instance v1, Landroid/graphics/Paint;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    .line 30
    .line 31
    .line 32
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 33
    .line 34
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->i:I

    .line 45
    .line 46
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->j:I

    .line 47
    .line 48
    sub-int v3, v1, v2

    .line 49
    .line 50
    int-to-float v3, v3

    .line 51
    sub-int v4, v1, v2

    .line 52
    .line 53
    int-to-float v4, v4

    .line 54
    add-int v5, v1, v2

    .line 55
    .line 56
    int-to-float v5, v5

    .line 57
    add-int/2addr v1, v2

    .line 58
    int-to-float v1, v1

    .line 59
    invoke-virtual {p0, v3, v4, v5, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->p(FFFF)Landroid/graphics/RectF;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 64
    .line 65
    const/high16 v3, 0x43b40000    # 360.0f

    .line 66
    .line 67
    mul-float/2addr v2, v3

    .line 68
    sub-float/2addr v3, v2

    .line 69
    const/4 v4, 0x1

    .line 70
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 71
    .line 72
    const/high16 v2, -0x3d4c0000    # -90.0f

    .line 73
    .line 74
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 75
    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 78
    .line 79
    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    .line 80
    .line 81
    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 82
    .line 83
    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 87
    .line 88
    .line 89
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->getProgressStrokeBitmap()Landroid/graphics/Bitmap;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->a:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {p0, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 2
    .line 3
    const/4 v1, 0x5

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->E()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v1, 0x4

    .line 11
    if-ne v0, v1, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->h:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    invoke-static {v0}, Ll/it0;->A(Landroid/animation/Animator;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->E()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->i:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->i:I

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->m(Landroid/graphics/Canvas;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->n(Landroid/graphics/Canvas;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final p(FFFF)Landroid/graphics/RectF;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->p:Landroid/graphics/RectF;

    .line 2
    .line 3
    iput p1, p0, Landroid/graphics/RectF;->left:F

    .line 4
    .line 5
    iput p2, p0, Landroid/graphics/RectF;->top:F

    .line 6
    .line 7
    iput p3, p0, Landroid/graphics/RectF;->right:F

    .line 8
    .line 9
    iput p4, p0, Landroid/graphics/RectF;->bottom:F

    .line 10
    .line 11
    return-object p0
.end method

.method public final q(J)Landroid/animation/ValueAnimator;
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->k:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    sub-long/2addr p1, v0

    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    cmp-long p0, p1, v0

    .line 12
    .line 13
    if-gez p0, :cond_0

    .line 14
    .line 15
    const-wide/16 p1, 0xbb8

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x2

    .line 18
    new-array p0, p0, [F

    .line 19
    .line 20
    fill-array-data p0, :array_0

    .line 21
    .line 22
    .line 23
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0, p1, p2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 36
    .line 37
    .line 38
    return-object p0

    .line 39
    :array_0
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data
.end method

.method public final synthetic r(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic s()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 3
    .line 4
    return-void
.end method

.method public setCountdownTime(J)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->k:J

    .line 6
    .line 7
    iput-wide p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->c:J

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->e:Landroid/animation/ValueAnimator;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setOnCountDownListener(Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->j:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/high16 v0, 0x42c80000    # 100.0f

    .line 12
    .line 13
    div-float/2addr p1, v0

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->d:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic w()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->I()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->o:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView$a;->a()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final synthetic x(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic y()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->l:I

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic z(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/countdown/CommonGiftCountDownView;->j:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
