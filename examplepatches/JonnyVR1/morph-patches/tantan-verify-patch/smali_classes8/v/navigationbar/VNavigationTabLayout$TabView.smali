.class public final Lv/navigationbar/VNavigationTabLayout$TabView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lv/navigationbar/VNavigationTabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "TabView"
.end annotation


# instance fields
.field public a:Lv/navigationbar/VNavigationTabLayout$f;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/ImageView;

.field public d:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public e:Lcom/google/android/material/badge/BadgeDrawable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public f:Landroid/view/View;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public g:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Landroid/widget/ImageView;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i:Landroid/graphics/drawable/Drawable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:I

.field public k:Landroid/animation/ValueAnimator;

.field public l:Landroid/animation/ArgbEvaluator;

.field public final synthetic m:Lv/navigationbar/VNavigationTabLayout;


# direct methods
.method public constructor <init>(Lv/navigationbar/VNavigationTabLayout;Landroid/content/Context;)V
    .locals 3
    .param p1    # Lv/navigationbar/VNavigationTabLayout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->j:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->l:Landroid/animation/ArgbEvaluator;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->J(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    iget p2, p1, Lv/navigationbar/VNavigationTabLayout;->e:I

    .line 16
    .line 17
    iget v0, p1, Lv/navigationbar/VNavigationTabLayout;->f:I

    .line 18
    .line 19
    iget v1, p1, Lv/navigationbar/VNavigationTabLayout;->g:I

    .line 20
    .line 21
    iget v2, p1, Lv/navigationbar/VNavigationTabLayout;->h:I

    .line 22
    .line 23
    invoke-static {p0, p2, v0, v1, v2}, Ll/kkl0;->z0(Landroid/view/View;IIII)V

    .line 24
    .line 25
    .line 26
    const/16 p2, 0x11

    .line 27
    .line 28
    invoke-virtual {p0, p2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 29
    .line 30
    .line 31
    iget-boolean p1, p1, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 32
    .line 33
    const/4 p2, 0x1

    .line 34
    xor-int/2addr p1, p2

    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p2}, Landroid/view/View;->setClickable(Z)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    const/16 p2, 0x3ea

    .line 46
    .line 47
    invoke-static {p1, p2}, Ll/ni80;->b(Landroid/content/Context;I)Ll/ni80;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p0, p1}, Ll/kkl0;->A0(Landroid/view/View;Ll/ni80;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static bridge synthetic a(Lv/navigationbar/VNavigationTabLayout$TabView;)Lcom/google/android/material/badge/BadgeDrawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    return-object p0
.end method

.method public static bridge synthetic b(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public static bridge synthetic c(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    return-object p0
.end method

.method public static bridge synthetic d(Lv/navigationbar/VNavigationTabLayout$TabView;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic e(Lv/navigationbar/VNavigationTabLayout$TabView;F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->l(F)V

    return-void
.end method

.method public static bridge synthetic f(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->p(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public static bridge synthetic g(Lv/navigationbar/VNavigationTabLayout$TabView;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->x()Z

    move-result p0

    return p0
.end method

.method private getBadge()Lcom/google/android/material/badge/BadgeDrawable;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 2
    .line 3
    return-object p0
.end method

.method private getContentWidth()I
    .locals 8

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 4
    .line 5
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 6
    .line 7
    const/4 v2, 0x3

    .line 8
    new-array v3, v2, [Landroid/view/View;

    .line 9
    .line 10
    const/4 v4, 0x0

    .line 11
    aput-object v0, v3, v4

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    aput-object v1, v3, v0

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    aput-object p0, v3, v1

    .line 18
    .line 19
    move p0, v4

    .line 20
    move v1, p0

    .line 21
    move v5, v1

    .line 22
    :goto_0
    if-ge v4, v2, :cond_3

    .line 23
    .line 24
    aget-object v6, v3, v4

    .line 25
    .line 26
    if-eqz v6, :cond_2

    .line 27
    .line 28
    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    .line 29
    .line 30
    .line 31
    move-result v7

    .line 32
    if-nez v7, :cond_2

    .line 33
    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 37
    .line 38
    .line 39
    move-result v7

    .line 40
    invoke-static {v1, v7}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_0
    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    :goto_1
    if-eqz v5, :cond_1

    .line 50
    .line 51
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-static {p0, v5}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    :goto_2
    move v5, v0

    .line 65
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    sub-int/2addr p0, v1

    .line 69
    return p0
.end method

.method private getOrCreateBadge()Lcom/google/android/material/badge/BadgeDrawable;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/google/android/material/badge/BadgeDrawable;->create(Landroid/content/Context;)Lcom/google/android/material/badge/BadgeDrawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->G()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "Unable to create badge"

    .line 24
    .line 25
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public static bridge synthetic h(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->H(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->J(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 10
    .line 11
    iget v2, v1, Lv/navigationbar/VNavigationTabLayout;->v:I

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 16
    .line 17
    :cond_0
    iget v1, v1, Lv/navigationbar/VNavigationTabLayout;->w:I

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpl-float v0, v0, v1

    .line 7
    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 17
    .line 18
    iget v1, v1, Lv/navigationbar/VNavigationTabLayout;->o:F

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    iget v3, v2, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 32
    .line 33
    iget v2, v2, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 34
    .line 35
    sub-int/2addr v3, v2

    .line 36
    int-to-float v2, v3

    .line 37
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 38
    .line 39
    iget v3, v3, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iget v3, v0, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 53
    .line 54
    iget v0, v0, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 55
    .line 56
    sub-int/2addr v3, v0

    .line 57
    int-to-float v0, v3

    .line 58
    sub-float/2addr p1, v1

    .line 59
    const/high16 v1, 0x40000000    # 2.0f

    .line 60
    .line 61
    div-float/2addr p1, v1

    .line 62
    const/high16 v3, 0x3f000000    # 0.5f

    .line 63
    .line 64
    add-float/2addr p1, v3

    .line 65
    float-to-int p1, p1

    .line 66
    sub-float/2addr v0, v2

    .line 67
    div-float/2addr v0, v1

    .line 68
    add-float/2addr v0, v3

    .line 69
    float-to-int v0, v0

    .line 70
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p0, p1, v0, p1, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method

.method public C()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->setTab(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->setSelected(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public D(IF)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    const/4 p1, 0x0

    .line 22
    cmpl-float p1, p2, p1

    .line 23
    .line 24
    if-eqz p1, :cond_3

    .line 25
    .line 26
    const/high16 p1, 0x3f800000    # 1.0f

    .line 27
    .line 28
    cmpl-float p1, p2, p1

    .line 29
    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    invoke-virtual {p0, p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->l(F)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->I()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->J(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 48
    .line 49
    if-eqz p1, :cond_4

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_4

    .line 56
    .line 57
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 64
    .line 65
    .line 66
    :cond_4
    :goto_1
    return-void
.end method

.method public final E(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->n(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->w(Landroid/view/View;)Landroid/widget/FrameLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, p1, v1}, Lcom/google/android/material/badge/BadgeUtils;->attachBadgeDrawable(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public final F()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->n(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->w(Landroid/view/View;)Landroid/widget/FrameLayout;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v1, v0, v2}, Lcom/google/android/material/badge/BadgeUtils;->detachBadgeDrawable(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 23
    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public final G()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->F()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 17
    .line 18
    if-eqz v0, :cond_3

    .line 19
    .line 20
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 21
    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 31
    .line 32
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 33
    .line 34
    if-eq v0, v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->F()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->E(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->H(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 50
    .line 51
    if-eqz v0, :cond_5

    .line 52
    .line 53
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 54
    .line 55
    if-eqz v0, :cond_5

    .line 56
    .line 57
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->g()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    const/4 v1, 0x1

    .line 62
    if-ne v0, v1, :cond_5

    .line 63
    .line 64
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 65
    .line 66
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 67
    .line 68
    if-eq v0, v1, :cond_4

    .line 69
    .line 70
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->F()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->E(Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    return-void

    .line 79
    :cond_4
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->H(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_5
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->F()V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public final H(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->d:Landroid/view/View;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->w(Landroid/view/View;)Landroid/widget/FrameLayout;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p1, p0}, Lcom/google/android/material/badge/BadgeUtils;->setBadgeDrawableBounds(Lcom/google/android/material/badge/BadgeDrawable;Landroid/view/View;Landroid/widget/FrameLayout;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final I()V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->d()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v2, v1

    .line 12
    :goto_0
    if-eqz v2, :cond_6

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    if-eq v3, p0, :cond_2

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    check-cast v3, Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    iput-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 31
    .line 32
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 33
    .line 34
    const/16 v4, 0x8

    .line 35
    .line 36
    if-eqz v3, :cond_3

    .line 37
    .line 38
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 42
    .line 43
    if-eqz v3, :cond_4

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 49
    .line 50
    invoke-virtual {v3, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    const v3, 0x1020014

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Landroid/widget/TextView;

    .line 61
    .line 62
    iput-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->g:Landroid/widget/TextView;

    .line 63
    .line 64
    if-eqz v3, :cond_5

    .line 65
    .line 66
    invoke-static {v3}, Ll/msi0;->d(Landroid/widget/TextView;)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    iput v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->j:I

    .line 71
    .line 72
    :cond_5
    const v3, 0x1020006

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Landroid/widget/ImageView;

    .line 80
    .line 81
    iput-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_6
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 85
    .line 86
    if-eqz v2, :cond_7

    .line 87
    .line 88
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 92
    .line 93
    :cond_7
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->g:Landroid/widget/TextView;

    .line 94
    .line 95
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 96
    .line 97
    :goto_1
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 98
    .line 99
    if-nez v2, :cond_d

    .line 100
    .line 101
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 102
    .line 103
    if-nez v2, :cond_8

    .line 104
    .line 105
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->y()V

    .line 106
    .line 107
    .line 108
    :cond_8
    if-eqz v0, :cond_9

    .line 109
    .line 110
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    if-eqz v2, :cond_9

    .line 115
    .line 116
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-static {v1}, Ll/oce;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    :cond_9
    if-eqz v1, :cond_a

    .line 129
    .line 130
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 131
    .line 132
    iget-object v2, v2, Lv/navigationbar/VNavigationTabLayout;->k:Landroid/content/res/ColorStateList;

    .line 133
    .line 134
    invoke-static {v1, v2}, Ll/oce;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 135
    .line 136
    .line 137
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 138
    .line 139
    iget-object v2, v2, Lv/navigationbar/VNavigationTabLayout;->n:Landroid/graphics/PorterDuff$Mode;

    .line 140
    .line 141
    if-eqz v2, :cond_a

    .line 142
    .line 143
    invoke-static {v1, v2}, Ll/oce;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 144
    .line 145
    .line 146
    :cond_a
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 147
    .line 148
    if-nez v1, :cond_b

    .line 149
    .line 150
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->z()V

    .line 151
    .line 152
    .line 153
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 154
    .line 155
    invoke-static {v1}, Ll/msi0;->d(Landroid/widget/TextView;)I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    iput v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->j:I

    .line 160
    .line 161
    :cond_b
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 162
    .line 163
    iget-object v1, v1, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 164
    .line 165
    if-eqz v1, :cond_c

    .line 166
    .line 167
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 168
    .line 169
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 170
    .line 171
    .line 172
    :cond_c
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 173
    .line 174
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 175
    .line 176
    invoke-virtual {p0, v1, v2}, Lv/navigationbar/VNavigationTabLayout$TabView;->M(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->G()V

    .line 180
    .line 181
    .line 182
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 183
    .line 184
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->j(Landroid/view/View;)V

    .line 185
    .line 186
    .line 187
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 188
    .line 189
    invoke-virtual {p0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->j(Landroid/view/View;)V

    .line 190
    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_d
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->g:Landroid/widget/TextView;

    .line 194
    .line 195
    if-nez v1, :cond_e

    .line 196
    .line 197
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 198
    .line 199
    if-eqz v2, :cond_f

    .line 200
    .line 201
    :cond_e
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 202
    .line 203
    invoke-virtual {p0, v1, v2}, Lv/navigationbar/VNavigationTabLayout$TabView;->M(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 204
    .line 205
    .line 206
    :cond_f
    :goto_2
    if-eqz v0, :cond_10

    .line 207
    .line 208
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout$f;->a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-nez v1, :cond_10

    .line 217
    .line 218
    invoke-static {v0}, Lv/navigationbar/VNavigationTabLayout$f;->a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {p0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 223
    .line 224
    .line 225
    :cond_10
    if-eqz v0, :cond_11

    .line 226
    .line 227
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->i()Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_11

    .line 232
    .line 233
    const/4 v0, 0x1

    .line 234
    goto :goto_3

    .line 235
    :cond_11
    const/4 v0, 0x0

    .line 236
    :goto_3
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->setSelected(Z)V

    .line 237
    .line 238
    .line 239
    return-void
.end method

.method public final J(Landroid/content/Context;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->y:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {p1, v1}, Ll/tu0;->b(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    if-eqz p1, :cond_5

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_5

    .line 22
    .line 23
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 30
    .line 31
    .line 32
    goto :goto_3

    .line 33
    :cond_0
    iget p1, v0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    iget p1, v0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iput-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    goto :goto_3

    .line 45
    :cond_2
    :goto_0
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 46
    .line 47
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 51
    .line 52
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    move v1, v2

    .line 58
    :goto_1
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_4
    move v0, v2

    .line 64
    :goto_2
    invoke-static {v1, v0}, Lv/navigationbar/VNavigationTabLayout;->b(II)Landroid/content/res/ColorStateList;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 72
    .line 73
    :cond_5
    :goto_3
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 74
    .line 75
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 82
    .line 83
    iget-object v0, v0, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 84
    .line 85
    if-eqz v0, :cond_8

    .line 86
    .line 87
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 88
    .line 89
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 90
    .line 91
    .line 92
    const v1, 0x3727c5ac    # 1.0E-5f

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 96
    .line 97
    .line 98
    const/4 v1, -0x1

    .line 99
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 100
    .line 101
    .line 102
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 103
    .line 104
    iget-object v1, v1, Lv/navigationbar/VNavigationTabLayout;->l:Landroid/content/res/ColorStateList;

    .line 105
    .line 106
    invoke-static {v1}, Lcom/google/android/material/ripple/RippleUtils;->convertToRippleDrawableColor(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    new-instance v2, Landroid/graphics/drawable/RippleDrawable;

    .line 111
    .line 112
    iget-object v4, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 113
    .line 114
    iget-boolean v4, v4, Lv/navigationbar/VNavigationTabLayout;->M:Z

    .line 115
    .line 116
    if-eqz v4, :cond_6

    .line 117
    .line 118
    move-object p1, v3

    .line 119
    :cond_6
    if-eqz v4, :cond_7

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_7
    move-object v3, v0

    .line 123
    :goto_4
    invoke-direct {v2, v1, p1, v3}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 124
    .line 125
    .line 126
    move-object p1, v2

    .line 127
    :cond_8
    invoke-static {p0, p1}, Ll/kkl0;->m0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 131
    .line 132
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public final K(ZZI)V
    .locals 1

    .line 1
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$TabView$b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Lv/navigationbar/VNavigationTabLayout$TabView$b;-><init>(Lv/navigationbar/VNavigationTabLayout$TabView;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    new-instance p1, Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-direct {p1}, Landroid/animation/ValueAnimator;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 14
    .line 15
    sget-object p2, Lcom/google/android/material/animation/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/animation/TimeInterpolator;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    int-to-long p2, p3

    .line 23
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    const/4 p2, 0x2

    .line 29
    new-array p2, p2, [F

    .line 30
    .line 31
    fill-array-data p2, :array_0

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    new-instance p2, Lv/navigationbar/VNavigationTabLayout$TabView$c;

    .line 45
    .line 46
    invoke-direct {p2, p0}, Lv/navigationbar/VNavigationTabLayout$TabView$c;-><init>(Lv/navigationbar/VNavigationTabLayout$TabView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 59
    .line 60
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->removeAllUpdateListeners()V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final L()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget-boolean v0, v0, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 4
    .line 5
    xor-int/lit8 v0, v0, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->g:Landroid/widget/TextView;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 20
    .line 21
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 22
    .line 23
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->M(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    :goto_0
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->h:Landroid/widget/ImageView;

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Lv/navigationbar/VNavigationTabLayout$TabView;->M(Landroid/widget/TextView;Landroid/widget/ImageView;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final M(Landroid/widget/TextView;Landroid/widget/ImageView;)V
    .locals 6
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/widget/ImageView;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RestrictedApi"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 13
    .line 14
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->e()Landroid/graphics/drawable/Drawable;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Ll/oce;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object v0, v1

    .line 28
    :goto_0
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 29
    .line 30
    if-eqz v2, :cond_1

    .line 31
    .line 32
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout$f;->h()Ljava/lang/CharSequence;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move-object v2, v1

    .line 38
    :goto_1
    const/16 v3, 0x8

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    if-eqz p2, :cond_3

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    invoke-virtual {p2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    :goto_2
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz p1, :cond_6

    .line 66
    .line 67
    if-nez v0, :cond_5

    .line 68
    .line 69
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 73
    .line 74
    invoke-static {v2}, Lv/navigationbar/VNavigationTabLayout$f;->b(Lv/navigationbar/VNavigationTabLayout$f;)I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    const/4 v5, 0x1

    .line 79
    if-ne v2, v5, :cond_4

    .line 80
    .line 81
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    goto :goto_3

    .line 85
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 86
    .line 87
    .line 88
    :goto_3
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 89
    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_5
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    :cond_6
    :goto_4
    if-eqz p2, :cond_9

    .line 99
    .line 100
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 105
    .line 106
    if-nez v0, :cond_7

    .line 107
    .line 108
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    if-nez v2, :cond_7

    .line 113
    .line 114
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-static {v2, v3}, Lcom/google/android/material/internal/ViewUtils;->dpToPx(Landroid/content/Context;I)F

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    float-to-int v2, v2

    .line 123
    goto :goto_5

    .line 124
    :cond_7
    move v2, v4

    .line 125
    :goto_5
    iget-object v3, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 126
    .line 127
    iget-boolean v3, v3, Lv/navigationbar/VNavigationTabLayout;->K:Z

    .line 128
    .line 129
    if-eqz v3, :cond_8

    .line 130
    .line 131
    invoke-static {p1}, Ll/pxw;->a(Landroid/view/ViewGroup$MarginLayoutParams;)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eq v2, v3, :cond_9

    .line 136
    .line 137
    invoke-static {p1, v2}, Ll/pxw;->c(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 138
    .line 139
    .line 140
    iput v4, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 141
    .line 142
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2}, Landroid/view/View;->requestLayout()V

    .line 146
    .line 147
    .line 148
    goto :goto_6

    .line 149
    :cond_8
    iget v3, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 150
    .line 151
    if-eq v2, v3, :cond_9

    .line 152
    .line 153
    iput v2, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 154
    .line 155
    invoke-static {p1, v4}, Ll/pxw;->c(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Landroid/view/View;->requestLayout()V

    .line 162
    .line 163
    .line 164
    :cond_9
    :goto_6
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 165
    .line 166
    if-eqz p1, :cond_a

    .line 167
    .line 168
    invoke-static {p1}, Lv/navigationbar/VNavigationTabLayout$f;->a(Lv/navigationbar/VNavigationTabLayout$f;)Ljava/lang/CharSequence;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    goto :goto_7

    .line 173
    :cond_a
    move-object p1, v1

    .line 174
    :goto_7
    if-nez v0, :cond_b

    .line 175
    .line 176
    goto :goto_8

    .line 177
    :cond_b
    move-object v1, p1

    .line 178
    :goto_8
    invoke-static {p0, v1}, Ll/h2j0;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    return-void
.end method

.method public drawableStateChanged()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getDrawableState()[I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    :goto_0
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public getIconView()Landroid/widget/ImageView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTab()Lv/navigationbar/VNavigationTabLayout$f;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextView()Landroid/widget/TextView;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final j(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Lv/navigationbar/VNavigationTabLayout$TabView$a;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView$a;-><init>(Lv/navigationbar/VNavigationTabLayout$TabView;Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k(ZI)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

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
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    invoke-virtual {p0, v0, p1, p2}, Lv/navigationbar/VNavigationTabLayout$TabView;->K(ZZI)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, -0x1

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->u(F)F

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    cmpl-float v4, v3, v1

    .line 12
    .line 13
    if-ltz v4, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->v(F)I

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eq v3, v2, :cond_1

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 31
    .line 32
    if-eqz v0, :cond_4

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->s(F)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eq v3, v2, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {v4}, Ll/oce;->r(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    const/4 v4, 0x0

    .line 60
    :goto_0
    if-eqz v4, :cond_3

    .line 61
    .line 62
    invoke-static {v3, v3}, Lv/navigationbar/VNavigationTabLayout;->b(II)Landroid/content/res/ColorStateList;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v4, v3}, Ll/oce;->o(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->t(F)F

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    cmpl-float v1, v3, v1

    .line 74
    .line 75
    if-ltz v1, :cond_4

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleX(F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v3}, Landroid/view/View;->setScaleY(F)V

    .line 81
    .line 82
    .line 83
    :cond_4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 84
    .line 85
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 86
    .line 87
    if-eqz v1, :cond_6

    .line 88
    .line 89
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 90
    .line 91
    if-eq v1, v0, :cond_6

    .line 92
    .line 93
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->q(F)I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eq p1, v2, :cond_6

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    instance-of v1, v0, Landroid/graphics/drawable/GradientDrawable;

    .line 104
    .line 105
    if-nez v1, :cond_5

    .line 106
    .line 107
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 108
    .line 109
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 110
    .line 111
    .line 112
    :cond_5
    move-object v1, v0

    .line 113
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 114
    .line 115
    invoke-static {p1, p1}, Lv/navigationbar/VNavigationTabLayout;->b(II)Landroid/content/res/ColorStateList;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p0, v0}, Ll/kkl0;->m0(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    .line 123
    .line 124
    .line 125
    :cond_6
    return-void
.end method

.method public final m(Landroid/text/Layout;IF)F
    .locals 0
    .param p1    # Landroid/text/Layout;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Landroid/text/Layout;->getLineWidth(I)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-virtual {p1}, Landroid/text/Layout;->getPaint()Landroid/text/TextPaint;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    div-float/2addr p3, p1

    .line 14
    mul-float/2addr p0, p3

    .line 15
    return p0
.end method

.method public final n(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Landroid/view/ViewGroup;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final o()Landroid/widget/FrameLayout;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    const/4 v1, -0x2

    .line 13
    invoke-direct {p0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 7
    .param p1    # Landroid/view/accessibility/AccessibilityNodeInfo;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getContentDescription()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, ", "

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/google/android/material/badge/BadgeDrawable;->getContentDescription()Ljava/lang/CharSequence;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {p1}, Ll/bc;->T0(Landroid/view/accessibility/AccessibilityNodeInfo;)Ll/bc;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 52
    .line 53
    invoke-virtual {v0}, Lv/navigationbar/VNavigationTabLayout$f;->f()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v5, 0x0

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 59
    .line 60
    .line 61
    move-result v6

    .line 62
    const/4 v1, 0x0

    .line 63
    const/4 v2, 0x1

    .line 64
    const/4 v4, 0x1

    .line 65
    invoke-static/range {v1 .. v6}, Ll/bc$f;->a(IIIIZZ)Ll/bc$f;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ll/bc;->r0(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    if-eqz p0, :cond_1

    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    invoke-virtual {p1, p0}, Ll/bc;->p0(Z)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Ll/bc$a;->i:Ll/bc$a;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/bc;->f0(Ll/bc$a;)Z

    .line 85
    .line 86
    .line 87
    :cond_1
    const-string p0, "Tab"

    .line 88
    .line 89
    invoke-virtual {p1, p0}, Ll/bc;->I0(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->k:Landroid/animation/ValueAnimator;

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
    const/4 p1, -0x1

    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-virtual {p0, p2, p2, p1}, Lv/navigationbar/VNavigationTabLayout$TabView;->K(ZZI)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 7

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Lv/navigationbar/VNavigationTabLayout;->getTabMaxWidth()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-lez v2, :cond_1

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    if-le v0, v2, :cond_1

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 22
    .line 23
    iget p1, p1, Lv/navigationbar/VNavigationTabLayout;->B:I

    .line 24
    .line 25
    const/high16 v0, -0x80000000

    .line 26
    .line 27
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 35
    .line 36
    if-eqz v0, :cond_7

    .line 37
    .line 38
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 39
    .line 40
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->o:F

    .line 41
    .line 42
    iget v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->j:I

    .line 43
    .line 44
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    if-eqz v2, :cond_2

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    move v1, v3

    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 58
    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    invoke-virtual {v2}, Landroid/widget/TextView;->getLineCount()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-le v2, v3, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 68
    .line 69
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->q:F

    .line 70
    .line 71
    :cond_3
    :goto_0
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-virtual {v2}, Landroid/widget/TextView;->getTextSize()F

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    iget-object v4, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroid/widget/TextView;->getLineCount()I

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    iget-object v5, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-static {v5}, Ll/msi0;->d(Landroid/widget/TextView;)I

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    cmpl-float v2, v0, v2

    .line 90
    .line 91
    if-nez v2, :cond_4

    .line 92
    .line 93
    if-ltz v5, :cond_7

    .line 94
    .line 95
    if-eq v1, v5, :cond_7

    .line 96
    .line 97
    :cond_4
    iget-object v5, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 98
    .line 99
    iget v5, v5, Lv/navigationbar/VNavigationTabLayout;->J:I

    .line 100
    .line 101
    const/4 v6, 0x0

    .line 102
    if-ne v5, v3, :cond_6

    .line 103
    .line 104
    if-lez v2, :cond_6

    .line 105
    .line 106
    if-ne v4, v3, :cond_6

    .line 107
    .line 108
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 109
    .line 110
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    if-eqz v2, :cond_5

    .line 115
    .line 116
    invoke-virtual {p0, v2, v6, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->m(Landroid/text/Layout;IF)F

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 121
    .line 122
    .line 123
    move-result v3

    .line 124
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    sub-int/2addr v3, v4

    .line 129
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    sub-int/2addr v3, v4

    .line 134
    int-to-float v3, v3

    .line 135
    cmpl-float v2, v2, v3

    .line 136
    .line 137
    if-lez v2, :cond_6

    .line 138
    .line 139
    :cond_5
    return-void

    .line 140
    :cond_6
    iget-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 141
    .line 142
    invoke-virtual {v2, v6, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 148
    .line 149
    .line 150
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 151
    .line 152
    .line 153
    :cond_7
    return-void
.end method

.method public final p(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->i:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public performClick()Z
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->performClick()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->playSoundEffect(I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 16
    .line 17
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$f;->k()V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_1
    return v0
.end method

.method public q(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->A:I

    .line 4
    .line 5
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->z:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->r(FII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final r(FII)I
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    const/4 v0, -0x1

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->l:Landroid/animation/ArgbEvaluator;

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    new-instance v1, Landroid/animation/ArgbEvaluator;

    .line 10
    .line 11
    invoke-direct {v1}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->l:Landroid/animation/ArgbEvaluator;

    .line 15
    .line 16
    :cond_1
    iget-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 17
    .line 18
    iget-object v1, v1, Lv/navigationbar/VNavigationTabLayout;->j:Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->l:Landroid/animation/ArgbEvaluator;

    .line 23
    .line 24
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p0, p1, p2, p3}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    return p0

    .line 43
    :cond_2
    return v0
.end method

.method public s(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->t:I

    .line 4
    .line 5
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->u:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->r(FII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public setSelected(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->f:Landroid/view/View;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public setTab(Lv/navigationbar/VNavigationTabLayout$f;)V
    .locals 1
    .param p1    # Lv/navigationbar/VNavigationTabLayout$f;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->a:Lv/navigationbar/VNavigationTabLayout$f;

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->I()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public t(F)F
    .locals 1

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->w:I

    .line 4
    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->v:I

    .line 8
    .line 9
    if-lez v0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->x:F

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    cmpg-float v0, p0, v0

    .line 15
    .line 16
    if-gtz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    sub-float v0, p0, v0

    .line 22
    .line 23
    mul-float/2addr p1, v0

    .line 24
    sub-float/2addr p0, p1

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/high16 p0, -0x40800000    # -1.0f

    .line 27
    .line 28
    return p0
.end method

.method public u(F)F
    .locals 2

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v0, p0, Lv/navigationbar/VNavigationTabLayout;->p:F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    cmpg-float v1, v0, v1

    .line 7
    .line 8
    if-gtz v1, :cond_0

    .line 9
    .line 10
    const/high16 p0, -0x40800000    # -1.0f

    .line 11
    .line 12
    return p0

    .line 13
    :cond_0
    iget p0, p0, Lv/navigationbar/VNavigationTabLayout;->o:F

    .line 14
    .line 15
    div-float v1, v0, p0

    .line 16
    .line 17
    div-float/2addr v0, p0

    .line 18
    const/high16 p0, 0x3f800000    # 1.0f

    .line 19
    .line 20
    sub-float/2addr v0, p0

    .line 21
    mul-float/2addr p1, v0

    .line 22
    sub-float/2addr v1, p1

    .line 23
    return v1
.end method

.method public v(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->m:Lv/navigationbar/VNavigationTabLayout;

    .line 2
    .line 3
    iget v1, v0, Lv/navigationbar/VNavigationTabLayout;->r:I

    .line 4
    .line 5
    iget v0, v0, Lv/navigationbar/VNavigationTabLayout;->s:I

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1, v0}, Lv/navigationbar/VNavigationTabLayout$TabView;->r(FII)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final w(Landroid/view/View;)Landroid/widget/FrameLayout;
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 7
    .line 8
    if-eq p1, p0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    sget-boolean p0, Lcom/google/android/material/badge/BadgeUtils;->USE_COMPAT_PARENT:Z

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/widget/FrameLayout;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    return-object v1
.end method

.method public final x()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->e:Lcom/google/android/material/badge/BadgeDrawable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final y()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/google/android/material/badge/BadgeUtils;->USE_COMPAT_PARENT:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->o()Landroid/widget/FrameLayout;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v0, p0

    .line 15
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    sget v3, Ll/gec0;->z:I

    .line 24
    .line 25
    invoke-virtual {v2, v3, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Landroid/widget/ImageView;

    .line 30
    .line 31
    iput-object v2, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->c:Landroid/widget/ImageView;

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final z()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/google/android/material/badge/BadgeUtils;->USE_COMPAT_PARENT:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lv/navigationbar/VNavigationTabLayout$TabView;->o()Landroid/widget/FrameLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move-object v0, p0

    .line 14
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    sget v2, Ll/gec0;->A:I

    .line 23
    .line 24
    const/4 v3, 0x0

    .line 25
    invoke-virtual {v1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Landroid/widget/TextView;

    .line 30
    .line 31
    iput-object v1, p0, Lv/navigationbar/VNavigationTabLayout$TabView;->b:Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
