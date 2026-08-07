.class Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/navigationbar/VNavigationTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SlidingTabIndicator"
.end annotation


# instance fields
.field public a:I

.field public final b:Landroid/graphics/Paint;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final c:Landroid/graphics/drawable/GradientDrawable;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public d:I

.field public e:F

.field public f:I

.field public g:I

.field public h:I

.field public i:Landroid/animation/ValueAnimator;

.field public j:I

.field public k:I

.field public final synthetic l:Lv/navigationbar/VNavigationTabLayout;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 8
    .line 9
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f:I

    .line 10
    .line 11
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 12
    .line 13
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 14
    .line 15
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j:I

    .line 16
    .line 17
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k:I

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 21
    .line 22
    .line 23
    new-instance p1, Landroid/graphics/Paint;

    .line 24
    .line 25
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b:Landroid/graphics/Paint;

    .line 29
    .line 30
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    return-void
.end method

.method public static bridge synthetic a(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j:I

    return p0
.end method

.method public static bridge synthetic b(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;)I
    .locals 0

    .line 1
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k:I

    return p0
.end method


# virtual methods
.method public c(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0, p1, p2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k(ZII)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final d(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/RectF;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$TabView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    add-int/2addr p0, v0

    .line 10
    div-int/lit8 p0, p0, 0x2

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    sub-int/2addr v0, p1

    .line 21
    div-int/lit8 v0, v0, 0x4

    .line 22
    .line 23
    sub-int p1, p0, v0

    .line 24
    .line 25
    add-int/2addr p0, v0

    .line 26
    int-to-float p1, p1

    .line 27
    const/4 v0, 0x0

    .line 28
    int-to-float p0, p0

    .line 29
    invoke-virtual {p2, p1, v0, p0, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 5
    .line 6
    iget-object v0, v0, Lv/navigationbar/VNavigationTabLayout;->m:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    move v0, v1

    .line 17
    :goto_0
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a:I

    .line 18
    .line 19
    if-ltz v2, :cond_1

    .line 20
    .line 21
    move v0, v2

    .line 22
    :cond_1
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 23
    .line 24
    iget v2, v2, Lv/navigationbar/VNavigationTabLayout;->I:I

    .line 25
    .line 26
    if-eqz v2, :cond_4

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    const/4 v4, 0x2

    .line 30
    if-eq v2, v3, :cond_3

    .line 31
    .line 32
    if-eq v2, v4, :cond_5

    .line 33
    .line 34
    const/4 v0, 0x3

    .line 35
    if-eq v2, v0, :cond_2

    .line 36
    .line 37
    move v0, v1

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    goto :goto_1

    .line 44
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    sub-int/2addr v1, v0

    .line 49
    div-int/2addr v1, v4

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v2, v0

    .line 55
    div-int/lit8 v0, v2, 0x2

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    sub-int/2addr v1, v0

    .line 63
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    :cond_5
    :goto_1
    iget v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 68
    .line 69
    if-ltz v2, :cond_8

    .line 70
    .line 71
    iget v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 72
    .line 73
    if-le v3, v2, :cond_8

    .line 74
    .line 75
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 76
    .line 77
    iget-object v2, v2, Lv/navigationbar/VNavigationTabLayout;->m:Landroid/graphics/drawable/Drawable;

    .line 78
    .line 79
    if-eqz v2, :cond_6

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_6
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->c:Landroid/graphics/drawable/GradientDrawable;

    .line 83
    .line 84
    :goto_2
    invoke-static {v2}, Ll/oce;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 93
    .line 94
    iget v4, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 95
    .line 96
    invoke-virtual {v2, v3, v1, v4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b:Landroid/graphics/Paint;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    invoke-static {v2, p0}, Ll/oce;->n(Landroid/graphics/drawable/Drawable;I)V

    .line 108
    .line 109
    .line 110
    :cond_7
    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 111
    .line 112
    .line 113
    :cond_8
    return-void
.end method

.method public e()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-gtz v3, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    return v1
.end method

.method public f(II)V
    .locals 1

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 2
    .line 3
    if-ne p1, v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 6
    .line 7
    if-eq p2, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 12
    .line 13
    iput p2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 14
    .line 15
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g(IF)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 17
    .line 18
    iput p2, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->e:F

    .line 19
    .line 20
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public h(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eq v0, p1, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public i(I)V
    .locals 1

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->a:I

    .line 6
    .line 7
    invoke-static {p0}, Ll/kkl0;->a0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 9

    .line 1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-lez v1, :cond_3

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 24
    .line 25
    iget-boolean v4, v3, Lv/navigationbar/VNavigationTabLayout;->L:Z

    .line 26
    .line 27
    if-nez v4, :cond_0

    .line 28
    .line 29
    instance-of v4, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 30
    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 34
    .line 35
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/RectF;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 43
    .line 44
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 49
    .line 50
    float-to-int v1, v0

    .line 51
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 52
    .line 53
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 58
    .line 59
    float-to-int v2, v0

    .line 60
    :cond_0
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->e:F

    .line 61
    .line 62
    const/4 v3, 0x0

    .line 63
    cmpl-float v0, v0, v3

    .line 64
    .line 65
    if-lez v0, :cond_4

    .line 66
    .line 67
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    add-int/lit8 v3, v3, -0x1

    .line 74
    .line 75
    if-ge v0, v3, :cond_4

    .line 76
    .line 77
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 78
    .line 79
    add-int/lit8 v0, v0, 0x1

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    iget-object v5, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 94
    .line 95
    iget-boolean v6, v5, Lv/navigationbar/VNavigationTabLayout;->L:Z

    .line 96
    .line 97
    if-nez v6, :cond_1

    .line 98
    .line 99
    instance-of v6, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 100
    .line 101
    if-eqz v6, :cond_1

    .line 102
    .line 103
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 104
    .line 105
    invoke-static {v5}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {p0, v0, v3}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/RectF;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 113
    .line 114
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 119
    .line 120
    float-to-int v3, v0

    .line 121
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 122
    .line 123
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 128
    .line 129
    float-to-int v4, v0

    .line 130
    :cond_1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->e:F

    .line 131
    .line 132
    float-to-double v5, v0

    .line 133
    const-wide/high16 v7, 0x3fe0000000000000L    # 0.5

    .line 134
    .line 135
    cmpl-double v5, v5, v7

    .line 136
    .line 137
    const/high16 v6, 0x40000000    # 2.0f

    .line 138
    .line 139
    if-ltz v5, :cond_2

    .line 140
    .line 141
    int-to-float v5, v1

    .line 142
    const/high16 v7, 0x3f000000    # 0.5f

    .line 143
    .line 144
    sub-float/2addr v0, v7

    .line 145
    mul-float/2addr v0, v6

    .line 146
    sub-int/2addr v3, v1

    .line 147
    int-to-float v1, v3

    .line 148
    mul-float/2addr v0, v1

    .line 149
    add-float/2addr v5, v0

    .line 150
    float-to-int v1, v5

    .line 151
    sub-int/2addr v4, v2

    .line 152
    add-int/2addr v2, v4

    .line 153
    goto :goto_0

    .line 154
    :cond_2
    int-to-float v3, v2

    .line 155
    mul-float/2addr v0, v6

    .line 156
    sub-int/2addr v4, v2

    .line 157
    int-to-float v2, v4

    .line 158
    mul-float/2addr v0, v2

    .line 159
    add-float/2addr v3, v0

    .line 160
    float-to-int v0, v3

    .line 161
    move v2, v0

    .line 162
    goto :goto_0

    .line 163
    :cond_3
    const/4 v1, -0x1

    .line 164
    move v2, v1

    .line 165
    :cond_4
    :goto_0
    invoke-virtual {p0, v1, v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->f(II)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final k(ZII)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 20
    .line 21
    iget-boolean v4, v3, Lv/navigationbar/VNavigationTabLayout;->L:Z

    .line 22
    .line 23
    if-nez v4, :cond_1

    .line 24
    .line 25
    instance-of v4, v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 26
    .line 27
    if-eqz v4, :cond_1

    .line 28
    .line 29
    check-cast v0, Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 30
    .line 31
    invoke-static {v3}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/RectF;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 39
    .line 40
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget v0, v0, Landroid/graphics/RectF;->left:F

    .line 45
    .line 46
    float-to-int v1, v0

    .line 47
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 48
    .line 49
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout;->a(Lv/navigationbar/VNavigationTabLayout;)Landroid/graphics/RectF;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v0, v0, Landroid/graphics/RectF;->right:F

    .line 54
    .line 55
    float-to-int v2, v0

    .line 56
    :cond_1
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->g:I

    .line 57
    .line 58
    iget v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->h:I

    .line 59
    .line 60
    if-ne v0, v1, :cond_2

    .line 61
    .line 62
    if-ne v3, v2, :cond_2

    .line 63
    .line 64
    return-void

    .line 65
    :cond_2
    if-eqz p1, :cond_3

    .line 66
    .line 67
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j:I

    .line 68
    .line 69
    iput v3, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k:I

    .line 70
    .line 71
    :cond_3
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;

    .line 72
    .line 73
    invoke-direct {v0, p0, v1, v2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$a;-><init>(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;II)V

    .line 74
    .line 75
    .line 76
    if-eqz p1, :cond_4

    .line 77
    .line 78
    new-instance p1, Landroid/animation/ValueAnimator;

    .line 79
    .line 80
    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    sget-object v1, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 86
    .line 87
    invoke-virtual {p1, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 88
    .line 89
    .line 90
    int-to-long v1, p3

    .line 91
    invoke-virtual {p1, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 92
    .line 93
    .line 94
    const/4 p3, 0x2

    .line 95
    new-array p3, p3, [F

    .line 96
    .line 97
    fill-array-data p3, :array_0

    .line 98
    .line 99
    .line 100
    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 104
    .line 105
    .line 106
    new-instance p3, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;

    .line 107
    .line 108
    invoke-direct {p3, p0, p2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator$b;-><init>(Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {p1, p3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->i:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget p1, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->d:I

    .line 15
    .line 16
    const/4 p2, -0x1

    .line 17
    const/4 p3, 0x0

    .line 18
    invoke-virtual {p0, p3, p1, p2}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->k(ZII)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->j()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x40000000    # 2.0f

    .line 9
    .line 10
    if-eq v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_3

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 15
    .line 16
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eq v1, v3, :cond_1

    .line 21
    .line 22
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 23
    .line 24
    if-ne v0, v2, :cond_9

    .line 25
    .line 26
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    move v4, v1

    .line 32
    move v5, v4

    .line 33
    :goto_0
    if-ge v4, v0, :cond_3

    .line 34
    .line 35
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    if-nez v7, :cond_2

    .line 44
    .line 45
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v6

    .line 49
    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_3
    if-gtz v5, :cond_4

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    const/16 v6, 0x10

    .line 64
    .line 65
    invoke-static {v4, v6}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    float-to-int v4, v4

    .line 70
    mul-int v6, v5, v0

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    mul-int/2addr v4, v2

    .line 77
    sub-int/2addr v7, v4

    .line 78
    if-gt v6, v7, :cond_8

    .line 79
    .line 80
    move v2, v1

    .line 81
    :goto_1
    if-ge v1, v0, :cond_7

    .line 82
    .line 83
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    check-cast v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 92
    .line 93
    iget v6, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    if-ne v6, v5, :cond_5

    .line 97
    .line 98
    iget v6, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 99
    .line 100
    cmpl-float v6, v6, v7

    .line 101
    .line 102
    if-eqz v6, :cond_6

    .line 103
    .line 104
    :cond_5
    iput v5, v4, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 105
    .line 106
    iput v7, v4, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 107
    .line 108
    move v2, v3

    .line 109
    :cond_6
    add-int/lit8 v1, v1, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_7
    move v3, v2

    .line 113
    goto :goto_2

    .line 114
    :cond_8
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$SlidingTabIndicator;->l:Lv/navigationbar/VNavigationTabLayout;

    .line 115
    .line 116
    iput v1, v0, Lv/navigationbar/VNavigationTabLayout;->G:I

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout;->M(Z)V

    .line 119
    .line 120
    .line 121
    :goto_2
    if-eqz v3, :cond_9

    .line 122
    .line 123
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 124
    .line 125
    .line 126
    :cond_9
    :goto_3
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onRtlPropertiesChanged(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
