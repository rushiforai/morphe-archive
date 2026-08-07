.class public Lcom/p1/mobile/putong/core/ui/PlayerView$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ie80$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/PlayerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/PlayerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/PlayerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->N()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 7
    .line 8
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/ie80$b;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ll/ie80$b;->a(Ljava/lang/Exception;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->i(Lcom/p1/mobile/putong/core/ui/PlayerView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    int-to-float v0, p1

    .line 10
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 11
    .line 12
    div-float/2addr v0, v1

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->o(Lcom/p1/mobile/putong/core/ui/PlayerView;)Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 20
    .line 21
    div-float/2addr v0, v1

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getMax()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    int-to-float v1, v1

    .line 31
    mul-float/2addr v0, v1

    .line 32
    float-to-int v0, v0

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 36
    .line 37
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/PlayerView;->f:Lv/VProgressBar;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 48
    .line 49
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->e:Lv/VText;

    .line 50
    .line 51
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->s(Lcom/p1/mobile/putong/core/ui/PlayerView;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/ie80$b;

    .line 79
    .line 80
    invoke-interface {v0, p1}, Ll/ie80$b;->b(I)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    sget v1, Ll/edc0;->S1:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->r(Lcom/p1/mobile/putong/core/ui/PlayerView;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/high16 v1, 0x3f800000    # 1.0f

    .line 17
    .line 18
    cmpg-float v0, v0, v1

    .line 19
    .line 20
    if-gez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-wide/16 v1, 0xc8

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 41
    .line 42
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 53
    .line 54
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/ie80$b;

    .line 73
    .line 74
    invoke-interface {v0}, Ll/ie80$b;->c()V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->e()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ll/ie80$b;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/ie80$b;->d()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void
.end method

.method public e()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->p(Lcom/p1/mobile/putong/core/ui/PlayerView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 8
    .line 9
    sget v2, Ll/edc0;->k3:I

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/ui/PlayerView;->r(Lcom/p1/mobile/putong/core/ui/PlayerView;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v3, 0xc8

    .line 29
    .line 30
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 35
    .line 36
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->b:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 63
    .line 64
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 75
    .line 76
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->i(Lcom/p1/mobile/putong/core/ui/PlayerView;)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 83
    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 90
    .line 91
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->f:Lv/VProgressBar;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 97
    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 99
    .line 100
    const/16 v1, 0x8

    .line 101
    .line 102
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;->d:Lv/VLinear;

    .line 108
    .line 109
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    :cond_0
    return-void
.end method

.method public f()Lcom/p1/mobile/putong/data/Video;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->o(Lcom/p1/mobile/putong/core/ui/PlayerView;)Lcom/p1/mobile/putong/data/Video;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public g()V
    .locals 0

    .line 1
    return-void
.end method

.method public getSurface()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->m(Lcom/p1/mobile/putong/core/ui/PlayerView;)Landroid/view/Surface;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->g(Lcom/p1/mobile/putong/core/ui/PlayerView;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->L(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->p(Lcom/p1/mobile/putong/core/ui/PlayerView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 8
    .line 9
    sget v2, Ll/edc0;->k3:I

    .line 10
    .line 11
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/ui/PlayerView;->r(Lcom/p1/mobile/putong/core/ui/PlayerView;I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-wide/16 v2, 0xc8

    .line 29
    .line 30
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 35
    .line 36
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->i(Lcom/p1/mobile/putong/core/ui/PlayerView;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->d:Lv/VLinear;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 64
    .line 65
    const/16 v1, 0x8

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 71
    .line 72
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_1

    .line 85
    .line 86
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Ll/ie80$b;

    .line 91
    .line 92
    invoke-interface {v0}, Ll/ie80$b;->onPause()V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    sget v1, Ll/edc0;->U2:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->r(Lcom/p1/mobile/putong/core/ui/PlayerView;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v2, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->b:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    cmpl-float v0, v0, v1

    .line 48
    .line 49
    if-lez v0, :cond_0

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->b:Lv/VDraweeView;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 68
    .line 69
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 77
    .line 78
    .line 79
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 80
    .line 81
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->i(Lcom/p1/mobile/putong/core/ui/PlayerView;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_1

    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->c:Lv/VProgressBar;

    .line 90
    .line 91
    const/4 v1, 0x0

    .line 92
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->d:Lv/VLinear;

    .line 98
    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 102
    .line 103
    .line 104
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 105
    .line 106
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Ll/ie80$b;

    .line 125
    .line 126
    invoke-interface {v0}, Ll/ie80$b;->onResume()V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_2
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PlayerView$d;->a:Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->f(Lcom/p1/mobile/putong/core/ui/PlayerView;)Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ie80$b;

    .line 22
    .line 23
    invoke-interface {v0}, Ll/ie80$b;->onStart()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method
