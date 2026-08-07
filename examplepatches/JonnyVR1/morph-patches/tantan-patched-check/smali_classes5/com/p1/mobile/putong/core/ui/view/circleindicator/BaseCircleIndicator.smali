.class Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;,
        Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$b;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:Landroid/content/res/ColorStateList;

.field public g:Landroid/content/res/ColorStateList;

.field public h:Landroid/animation/Animator;

.field public i:Landroid/animation/Animator;

.field public j:Landroid/animation/Animator;

.field public k:Landroid/animation/Animator;

.field public l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 21
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, -0x1

    .line 25
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 26
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 27
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 28
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .line 30
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p3, -0x1

    .line 31
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 32
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 33
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 34
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 3

    .line 1
    new-instance v0, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->generateDefaultLayoutParams()Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 15
    .line 16
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 17
    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 19
    .line 20
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 21
    .line 22
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 27
    .line 28
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 32
    .line 33
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 34
    .line 35
    :goto_0
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public b(I)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 40
    .line 41
    .line 42
    :cond_2
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 43
    .line 44
    if-ltz v0, :cond_3

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e:I

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g:Landroid/content/res/ColorStateList;

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 60
    .line 61
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->d:I

    .line 76
    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f:Landroid/content/res/ColorStateList;

    .line 78
    .line 79
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 88
    .line 89
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 90
    .line 91
    .line 92
    :cond_4
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 93
    .line 94
    return-void
.end method

.method public final c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # Landroid/content/res/ColorStateList;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p2}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ll/oce;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0, p3}, Ll/oce;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/kkl0;->m0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public d()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_1

    .line 18
    .line 19
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->d:I

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f:Landroid/content/res/ColorStateList;

    .line 22
    .line 23
    invoke-virtual {p0, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 24
    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e:I

    .line 28
    .line 29
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g:Landroid/content/res/ColorStateList;

    .line 30
    .line 31
    invoke-virtual {p0, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 32
    .line 33
    .line 34
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    :goto_2
    return-void
.end method

.method public e(Ll/rv5;)Landroid/animation/Animator;
    .locals 1

    .line 1
    iget v0, p1, Ll/rv5;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p1, p1, Ll/rv5;->d:I

    .line 10
    .line 11
    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$b;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$b;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 21
    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget p1, p1, Ll/rv5;->e:I

    .line 29
    .line 30
    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public f(Ll/rv5;)Landroid/animation/Animator;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p1, p1, Ll/rv5;->d:I

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public g(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    const/4 v1, 0x0

    .line 42
    if-ge p1, v0, :cond_2

    .line 43
    .line 44
    sub-int/2addr v0, p1

    .line 45
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    if-le p1, v0, :cond_3

    .line 50
    .line 51
    sub-int v0, p1, v0

    .line 52
    .line 53
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getOrientation()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    move v3, v1

    .line 58
    :goto_0
    if-ge v3, v0, :cond_3

    .line 59
    .line 60
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a(I)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_3
    :goto_1
    if-ge v1, p1, :cond_5

    .line 67
    .line 68
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-ne p2, v1, :cond_4

    .line 73
    .line 74
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->d:I

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f:Landroid/content/res/ColorStateList;

    .line 77
    .line 78
    invoke-virtual {p0, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 82
    .line 83
    invoke-virtual {v2, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_4
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e:I

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g:Landroid/content/res/ColorStateList;

    .line 100
    .line 101
    invoke-virtual {p0, v0, v2, v3}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c(Landroid/view/View;ILandroid/content/res/ColorStateList;)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 105
    .line 106
    invoke-virtual {v2, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 110
    .line 111
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 115
    .line 116
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 117
    .line 118
    .line 119
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_5
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->l:I

    .line 123
    .line 124
    return-void
.end method

.method public final h(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/rv5;
    .locals 2

    .line 1
    new-instance p0, Ll/rv5;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/rv5;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    sget-object v0, Ll/phc0;->b:[I

    .line 10
    .line 11
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/phc0;->k:I

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    iput p2, p0, Ll/rv5;->a:I

    .line 23
    .line 24
    sget p2, Ll/phc0;->h:I

    .line 25
    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, p0, Ll/rv5;->b:I

    .line 31
    .line 32
    sget p2, Ll/phc0;->i:I

    .line 33
    .line 34
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iput p2, p0, Ll/rv5;->c:I

    .line 39
    .line 40
    sget p2, Ll/phc0;->c:I

    .line 41
    .line 42
    sget v1, Ll/d8c0;->a:I

    .line 43
    .line 44
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iput p2, p0, Ll/rv5;->d:I

    .line 49
    .line 50
    sget p2, Ll/phc0;->d:I

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput p2, p0, Ll/rv5;->e:I

    .line 58
    .line 59
    sget p2, Ll/phc0;->e:I

    .line 60
    .line 61
    sget v1, Ll/jbc0;->wb:I

    .line 62
    .line 63
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput p2, p0, Ll/rv5;->f:I

    .line 68
    .line 69
    sget v1, Ll/phc0;->f:I

    .line 70
    .line 71
    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    iput p2, p0, Ll/rv5;->g:I

    .line 76
    .line 77
    sget p2, Ll/phc0;->j:I

    .line 78
    .line 79
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    iput p2, p0, Ll/rv5;->h:I

    .line 84
    .line 85
    sget p2, Ll/phc0;->g:I

    .line 86
    .line 87
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    iput p2, p0, Ll/rv5;->i:I

    .line 92
    .line 93
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 94
    .line 95
    .line 96
    return-object p0
.end method

.method public final i(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h(Landroid/content/Context;Landroid/util/AttributeSet;)Ll/rv5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j(Ll/rv5;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x3

    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public j(Ll/rv5;)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/high16 v2, 0x40a00000    # 5.0f

    .line 11
    .line 12
    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v2, 0x3f000000    # 0.5f

    .line 17
    .line 18
    add-float/2addr v0, v2

    .line 19
    float-to-int v0, v0

    .line 20
    iget v2, p1, Ll/rv5;->a:I

    .line 21
    .line 22
    if-gez v2, :cond_0

    .line 23
    .line 24
    move v2, v0

    .line 25
    :cond_0
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->b:I

    .line 26
    .line 27
    iget v2, p1, Ll/rv5;->b:I

    .line 28
    .line 29
    if-gez v2, :cond_1

    .line 30
    .line 31
    move v2, v0

    .line 32
    :cond_1
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->c:I

    .line 33
    .line 34
    iget v2, p1, Ll/rv5;->c:I

    .line 35
    .line 36
    if-gez v2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    move v0, v2

    .line 40
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->a:I

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f(Ll/rv5;)Landroid/animation/Animator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->h:Landroid/animation/Animator;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f(Ll/rv5;)Landroid/animation/Animator;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->j:Landroid/animation/Animator;

    .line 53
    .line 54
    const-wide/16 v2, 0x0

    .line 55
    .line 56
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e(Ll/rv5;)Landroid/animation/Animator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->i:Landroid/animation/Animator;

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e(Ll/rv5;)Landroid/animation/Animator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->k:Landroid/animation/Animator;

    .line 70
    .line 71
    invoke-virtual {v0, v2, v3}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 72
    .line 73
    .line 74
    iget v0, p1, Ll/rv5;->f:I

    .line 75
    .line 76
    if-nez v0, :cond_3

    .line 77
    .line 78
    sget v2, Ll/jbc0;->wb:I

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move v2, v0

    .line 82
    :goto_1
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->d:I

    .line 83
    .line 84
    iget v2, p1, Ll/rv5;->g:I

    .line 85
    .line 86
    if-nez v2, :cond_4

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_4
    move v0, v2

    .line 90
    :goto_2
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->e:I

    .line 91
    .line 92
    iget v0, p1, Ll/rv5;->h:I

    .line 93
    .line 94
    if-ne v0, v1, :cond_5

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_5
    const/4 v1, 0x0

    .line 98
    :goto_3
    invoke-virtual {p0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 99
    .line 100
    .line 101
    iget p1, p1, Ll/rv5;->i:I

    .line 102
    .line 103
    if-ltz p1, :cond_6

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_6
    const/16 p1, 0x11

    .line 107
    .line 108
    :goto_4
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public k(II)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->f:Landroid/content/res/ColorStateList;

    .line 6
    .line 7
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->g:Landroid/content/res/ColorStateList;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator;->d()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setIndicatorCreatedListener(Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/ui/view/circleindicator/BaseCircleIndicator$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method
