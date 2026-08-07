.class public Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;,
        Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Xfermode;

.field public b:Landroid/graphics/Xfermode;

.field public c:Landroid/graphics/Paint;

.field public d:F

.field public e:Landroid/graphics/Path;

.field public f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

.field public g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

.field public h:I

.field public i:I

.field public j:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    .line 7
    .line 8
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->a:Landroid/graphics/Xfermode;

    .line 12
    .line 13
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    .line 14
    .line 15
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    .line 16
    .line 17
    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b:Landroid/graphics/Xfermode;

    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 24
    .line 25
    const/4 p1, -0x1

    .line 26
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 27
    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->a:Landroid/graphics/Xfermode;

    .line 36
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b:Landroid/graphics/Xfermode;

    const/4 p1, 0x0

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    const/4 p1, -0x1

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->a:Landroid/graphics/Xfermode;

    .line 42
    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object p2, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b:Landroid/graphics/Xfermode;

    const/4 p1, 0x0

    .line 43
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    const/4 p1, -0x1

    .line 44
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    return-void
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    new-array v0, v0, [F

    .line 20
    .line 21
    fill-array-data v0, :array_0

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 31
    .line 32
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->b(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)J

    .line 33
    .line 34
    .line 35
    move-result-wide v1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 40
    .line 41
    new-instance v1, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;-><init>(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 52
    .line 53
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->c(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)Landroid/animation/TimeInterpolator;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 63
    .line 64
    invoke-static {v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->f(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final c()V
    .locals 9

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 2
    .line 3
    if-lez v0, :cond_2

    .line 4
    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 6
    .line 7
    if-gtz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 11
    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    new-instance v3, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 21
    .line 22
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 23
    .line 24
    iget v7, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 25
    .line 26
    iget-object v8, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 27
    .line 28
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;-><init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;IILandroid/graphics/Paint;)V

    .line 29
    .line 30
    .line 31
    iput-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 35
    .line 36
    if-nez v3, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 39
    .line 40
    invoke-virtual {v2, p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;II)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public final d()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 3
    .line 4
    .line 5
    new-instance v0, Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 17
    .line 18
    const v1, 0xffffff

    .line 19
    .line 20
    .line 21
    const v2, -0x66000001

    .line 22
    .line 23
    .line 24
    filled-new-array {v1, v2, v1}, [I

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;-><init>([I[F)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 33
    .line 34
    new-instance v0, Landroid/graphics/Path;

    .line 35
    .line 36
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 40
    .line 41
    return-void
.end method

.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 7
    .line 8
    if-eqz v1, :cond_5

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto/16 :goto_3

    .line 15
    .line 16
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    int-to-float v4, v1

    .line 21
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    int-to-float v5, v1

    .line 26
    const/4 v6, 0x0

    .line 27
    const/16 v7, 0x1f

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    const/4 v3, 0x0

    .line 31
    move-object/from16 v1, p1

    .line 32
    .line 33
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 38
    .line 39
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->i(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x1

    .line 44
    const/4 v5, 0x0

    .line 45
    if-ne v3, v4, :cond_1

    .line 46
    .line 47
    invoke-super/range {p0 .. p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 51
    .line 52
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->a:Landroid/graphics/Xfermode;

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 61
    .line 62
    .line 63
    :goto_0
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 64
    .line 65
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 66
    .line 67
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;)Landroid/graphics/Shader;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 72
    .line 73
    .line 74
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 75
    .line 76
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->k()Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    const/4 v4, 0x0

    .line 81
    if-eqz v3, :cond_2

    .line 82
    .line 83
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 88
    .line 89
    iget v7, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 90
    .line 91
    iget v6, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 92
    .line 93
    sub-float/2addr v6, v7

    .line 94
    iget v8, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 95
    .line 96
    mul-float/2addr v6, v8

    .line 97
    add-float/2addr v7, v6

    .line 98
    invoke-virtual {v1, v7, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 99
    .line 100
    .line 101
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 102
    .line 103
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 104
    .line 105
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 106
    .line 107
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 111
    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 119
    .line 120
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 121
    .line 122
    .line 123
    move-result v6

    .line 124
    cmpl-float v6, v6, v4

    .line 125
    .line 126
    if-ltz v6, :cond_3

    .line 127
    .line 128
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 129
    .line 130
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    .line 135
    .line 136
    .line 137
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 138
    .line 139
    iget v7, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 140
    .line 141
    iget v6, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 142
    .line 143
    sub-float/2addr v6, v7

    .line 144
    iget v8, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 145
    .line 146
    mul-float/2addr v6, v8

    .line 147
    add-float/2addr v7, v6

    .line 148
    invoke-virtual {v1, v7, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 149
    .line 150
    .line 151
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 152
    .line 153
    iget-object v6, v6, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 154
    .line 155
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 156
    .line 157
    invoke-virtual {v1, v6, v7}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_3
    iget v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 162
    .line 163
    int-to-float v6, v6

    .line 164
    invoke-virtual {v1, v4, v6}, Landroid/graphics/Canvas;->translate(FF)V

    .line 165
    .line 166
    .line 167
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 168
    .line 169
    invoke-static {v6}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 170
    .line 171
    .line 172
    move-result v6

    .line 173
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->rotate(F)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 177
    .line 178
    .line 179
    move-result v6

    .line 180
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 181
    .line 182
    iget v8, v7, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 183
    .line 184
    iget v7, v7, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 185
    .line 186
    sub-float/2addr v7, v8

    .line 187
    iget v9, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 188
    .line 189
    mul-float/2addr v7, v9

    .line 190
    add-float/2addr v8, v7

    .line 191
    invoke-virtual {v1, v8, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 192
    .line 193
    .line 194
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 195
    .line 196
    iget-object v7, v7, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 197
    .line 198
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 199
    .line 200
    invoke-virtual {v1, v7, v8}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v1, v6}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 204
    .line 205
    .line 206
    :goto_1
    invoke-virtual {v1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 207
    .line 208
    .line 209
    :goto_2
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 210
    .line 211
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    cmpl-float v3, v3, v4

    .line 216
    .line 217
    if-lez v3, :cond_4

    .line 218
    .line 219
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 220
    .line 221
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 222
    .line 223
    .line 224
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 225
    .line 226
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 227
    .line 228
    .line 229
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 230
    .line 231
    sget-object v4, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    .line 232
    .line 233
    invoke-virtual {v3, v4}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    .line 234
    .line 235
    .line 236
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 237
    .line 238
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 239
    .line 240
    add-int/lit8 v3, v3, 0x2

    .line 241
    .line 242
    int-to-float v8, v3

    .line 243
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 244
    .line 245
    add-int/lit8 v3, v3, 0x2

    .line 246
    .line 247
    int-to-float v9, v3

    .line 248
    sget-object v17, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 249
    .line 250
    const/high16 v6, -0x40000000    # -2.0f

    .line 251
    .line 252
    move v7, v6

    .line 253
    move-object/from16 v10, v17

    .line 254
    .line 255
    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Path;->addRect(FFFFLandroid/graphics/Path$Direction;)V

    .line 256
    .line 257
    .line 258
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 259
    .line 260
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b:Landroid/graphics/Xfermode;

    .line 261
    .line 262
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 263
    .line 264
    .line 265
    iget-object v10, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 266
    .line 267
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 268
    .line 269
    int-to-float v13, v3

    .line 270
    iget v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 271
    .line 272
    int-to-float v14, v3

    .line 273
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 274
    .line 275
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 276
    .line 277
    .line 278
    move-result v15

    .line 279
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 280
    .line 281
    invoke-static {v3}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->e(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 282
    .line 283
    .line 284
    move-result v16

    .line 285
    const/4 v11, 0x0

    .line 286
    const/4 v12, 0x0

    .line 287
    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Path;->addRoundRect(FFFFFFLandroid/graphics/Path$Direction;)V

    .line 288
    .line 289
    .line 290
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 291
    .line 292
    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    .line 293
    .line 294
    .line 295
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e:Landroid/graphics/Path;

    .line 296
    .line 297
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c:Landroid/graphics/Paint;

    .line 298
    .line 299
    invoke-virtual {v1, v3, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 300
    .line 301
    .line 302
    :cond_4
    invoke-virtual {v1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 303
    .line 304
    .line 305
    :cond_5
    :goto_3
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 12
    .line 13
    :cond_1
    :goto_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->j:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->f()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 17
    .line 18
    if-eq p2, v0, :cond_1

    .line 19
    .line 20
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->h:I

    .line 21
    .line 22
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->i:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e()V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public setShimmerConfig(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->g:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->e()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->c()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setShimmerProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->d:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
