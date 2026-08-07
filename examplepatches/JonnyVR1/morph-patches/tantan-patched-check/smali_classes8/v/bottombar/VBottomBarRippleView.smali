.class public Lv/bottombar/VBottomBarRippleView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lv/bottombar/VBottomBarRippleView$c;,
        Lv/bottombar/VBottomBarRippleView$a;,
        Lv/bottombar/VBottomBarRippleView$b;
    }
.end annotation


# instance fields
.field public c:Lv/bottombar/VBottomBarRippleView$c;

.field public d:Lv/bottombar/VBottomBarRippleView$a;

.field public e:Lv/bottombar/VBottomBarRippleView$b;

.field public f:F

.field public g:F

.field public h:Z

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lv/bottombar/VBottomBarRippleView$c;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p1, v0}, Lv/bottombar/VBottomBarRippleView$c;-><init>(Ll/kok0;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 11
    .line 12
    new-instance p1, Lv/bottombar/VBottomBarRippleView$a;

    .line 13
    .line 14
    invoke-direct {p1, v0}, Lv/bottombar/VBottomBarRippleView$a;-><init>(Ll/kok0;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    .line 18
    .line 19
    const/high16 p1, 0x3f800000    # 1.0f

    .line 20
    .line 21
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->f:F

    .line 22
    .line 23
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->g:F

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Lv/bottombar/VBottomBarRippleView$c;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lv/bottombar/VBottomBarRippleView$c;-><init>(Ll/kok0;)V

    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 28
    new-instance p1, Lv/bottombar/VBottomBarRippleView$a;

    invoke-direct {p1, p2}, Lv/bottombar/VBottomBarRippleView$a;-><init>(Ll/kok0;)V

    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 29
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->f:F

    .line 30
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->g:F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    new-instance p1, Lv/bottombar/VBottomBarRippleView$c;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lv/bottombar/VBottomBarRippleView$c;-><init>(Ll/kok0;)V

    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 33
    new-instance p1, Lv/bottombar/VBottomBarRippleView$a;

    invoke-direct {p1, p2}, Lv/bottombar/VBottomBarRippleView$a;-><init>(Ll/kok0;)V

    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    const/high16 p1, 0x3f800000    # 1.0f

    .line 34
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->f:F

    .line 35
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->g:F

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lv/bottombar/VBottomBarRippleView$c;->a(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lv/bottombar/VBottomBarRippleView$c;->b(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    .line 8
    .line 9
    invoke-static {v1}, Lv/bottombar/VBottomBarRippleView$a;->a(Lv/bottombar/VBottomBarRippleView$a;)Landroid/graphics/RectF;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Lv/bottombar/VBottomBarRippleView$a;->c()Landroid/graphics/Paint;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const/16 v3, 0x1f

    .line 18
    .line 19
    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->saveLayer(Landroid/graphics/RectF;Landroid/graphics/Paint;I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    .line 27
    .line 28
    invoke-static {v2, p1, v0}, Lv/bottombar/VBottomBarRippleView$a;->b(Lv/bottombar/VBottomBarRippleView$a;Landroid/graphics/Canvas;F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 32
    .line 33
    .line 34
    const/high16 p1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    sub-float v1, p1, v0

    .line 37
    .line 38
    float-to-double v1, v1

    .line 39
    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    .line 40
    .line 41
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    .line 42
    .line 43
    .line 44
    move-result-wide v1

    .line 45
    const-wide v3, 0x4022d97c7f3321d2L    # 9.42477796076938

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    float-to-double v5, v0

    .line 51
    mul-double/2addr v5, v3

    .line 52
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    double-to-float v3, v3

    .line 57
    float-to-double v3, v3

    .line 58
    mul-double/2addr v1, v3

    .line 59
    double-to-float v1, v1

    .line 60
    const v2, 0x3ecccccd    # 0.4f

    .line 61
    .line 62
    .line 63
    mul-float/2addr v1, v2

    .line 64
    add-float/2addr v1, p1

    .line 65
    iget p1, p0, Lv/bottombar/VBottomBarRippleView;->f:F

    .line 66
    .line 67
    mul-float/2addr p1, v1

    .line 68
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 69
    .line 70
    .line 71
    iget p1, p0, Lv/bottombar/VBottomBarRippleView;->g:F

    .line 72
    .line 73
    mul-float/2addr p1, v1

    .line 74
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lv/bottombar/VBottomBarRippleView;->e:Lv/bottombar/VBottomBarRippleView$b;

    .line 78
    .line 79
    if-eqz p0, :cond_0

    .line 80
    .line 81
    invoke-interface {p0, v0, v1}, Lv/bottombar/VBottomBarRippleView$b;->a(FF)V

    .line 82
    .line 83
    .line 84
    :cond_0
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lv/bottombar/VBottomBarRippleView$c;->c(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(II)V
    .locals 0

    .line 1
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->j:I

    .line 2
    .line 3
    iput p2, p0, Lv/bottombar/VBottomBarRippleView;->i:I

    .line 4
    .line 5
    iget-boolean p1, p0, Lv/bottombar/VBottomBarRippleView;->h:Z

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lv/bottombar/VBottomBarRippleView;->setDarkMode(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public h(I[I[F)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p2    # [I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p3    # [F
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lv/bottombar/VBottomBarRippleView$a;->e(I[I[F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarRippleView;->c:Lv/bottombar/VBottomBarRippleView$c;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lv/bottombar/VBottomBarRippleView$c;->d(Lv/bottombar/VBottomBarRippleView$c;Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Lv/bottombar/VBottomBarRippleView;->d:Lv/bottombar/VBottomBarRippleView$a;

    .line 5
    .line 6
    invoke-static {p3}, Lv/bottombar/VBottomBarRippleView$a;->a(Lv/bottombar/VBottomBarRippleView$a;)Landroid/graphics/RectF;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    int-to-float p1, p1

    .line 11
    int-to-float p2, p2

    .line 12
    const/4 p4, 0x0

    .line 13
    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setDarkMode(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/bottombar/VBottomBarRippleView;->h:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lv/bottombar/VBottomBarRippleView;->i:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget p1, p0, Lv/bottombar/VBottomBarRippleView;->j:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setRippleListener(Lv/bottombar/VBottomBarRippleView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lv/bottombar/VBottomBarRippleView;->e:Lv/bottombar/VBottomBarRippleView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->f:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setScaleY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lv/bottombar/VBottomBarRippleView;->g:F

    .line 2
    .line 3
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
