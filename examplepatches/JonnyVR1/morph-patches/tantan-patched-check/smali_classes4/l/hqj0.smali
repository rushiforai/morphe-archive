.class public Ll/hqj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Landroid/view/View;

.field public b:Ll/f1g0;

.field public c:Landroid/animation/Animator;

.field public d:Lv/VImage;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/f1g0;Lv/VFrame;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/hqj0;->b:Ll/f1g0;

    .line 5
    .line 6
    new-instance p2, Lv/VImage;

    .line 7
    .line 8
    invoke-direct {p2, p1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleX(F)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Landroid/view/View;->setScaleY(F)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    const/high16 p2, 0x42c00000    # 96.0f

    .line 25
    .line 26
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-direct {p1, v0, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    const/16 p2, 0x11

    .line 38
    .line 39
    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 40
    .line 41
    iget-object p2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 42
    .line 43
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_0

    .line 52
    .line 53
    iget-object p2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 54
    .line 55
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    check-cast p2, Landroid/view/ViewGroup;

    .line 60
    .line 61
    iget-object v0, p0, Ll/hqj0;->d:Lv/VImage;

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 67
    .line 68
    invoke-virtual {p3, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/hqj0;->d:Lv/VImage;

    .line 72
    .line 73
    const/4 p1, 0x0

    .line 74
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static synthetic a(Ll/hqj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hqj0;->d()V

    return-void
.end method


# virtual methods
.method public final b(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hqj0;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/hqj0;->b:Ll/f1g0;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {v0, v1}, Ll/f1g0;->c(Z)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    sget-object v0, Ll/hqj0$a;->a:[I

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    aget p1, v0, p1

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-eq p1, v0, :cond_4

    .line 30
    .line 31
    const/4 v0, 0x2

    .line 32
    if-eq p1, v0, :cond_3

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    if-eq p1, v0, :cond_2

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    iget-object p1, p0, Ll/hqj0;->d:Lv/VImage;

    .line 39
    .line 40
    sget v0, Ll/dbc0;->kv:I

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_3
    iget-object p1, p0, Ll/hqj0;->d:Lv/VImage;

    .line 47
    .line 48
    sget v0, Ll/dbc0;->Wq:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_4
    iget-object p1, p0, Ll/hqj0;->d:Lv/VImage;

    .line 55
    .line 56
    sget v0, Ll/dbc0;->lv:I

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    :goto_1
    invoke-virtual {p0}, Ll/hqj0;->c()Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iput-object p1, p0, Ll/hqj0;->c:Landroid/animation/Animator;

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final c()Landroid/animation/Animator;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/hqj0;->d:Lv/VImage;

    .line 2
    .line 3
    const/high16 v1, 0x42400000    # 48.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotX(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/hqj0;->d:Lv/VImage;

    .line 14
    .line 15
    const/high16 v1, 0x42c00000    # 96.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setPivotY(F)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 26
    .line 27
    sget-object v3, Landroid/view/View;->SCALE_X:Landroid/util/Property;

    .line 28
    .line 29
    const/4 v0, 0x5

    .line 30
    new-array v9, v0, [F

    .line 31
    .line 32
    fill-array-data v9, :array_0

    .line 33
    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    const-wide/16 v6, 0x1f4

    .line 38
    .line 39
    const/4 v8, 0x0

    .line 40
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, p0, Ll/hqj0;->d:Lv/VImage;

    .line 45
    .line 46
    sget-object v3, Landroid/view/View;->SCALE_Y:Landroid/util/Property;

    .line 47
    .line 48
    new-array v9, v0, [F

    .line 49
    .line 50
    fill-array-data v9, :array_1

    .line 51
    .line 52
    .line 53
    invoke-static/range {v2 .. v9}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {v1, v0}, [Landroid/animation/Animator;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    new-instance v1, Ll/gqj0;

    .line 66
    .line 67
    invoke-direct {v1, p0}, Ll/gqj0;-><init>(Ll/hqj0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    return-object v0

    .line 74
    nop

    .line 75
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic d()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hqj0;->d:Lv/VImage;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hqj0;->c:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hqj0;->c:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iput-object p1, p0, Ll/hqj0;->a:Landroid/view/View;

    .line 19
    .line 20
    iget-object p1, p0, Ll/hqj0;->d:Lv/VImage;

    .line 21
    .line 22
    const/4 v0, 0x1

    .line 23
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ll/hqj0;->b(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
