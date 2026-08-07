.class public Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/view/View;

.field public final c:Landroid/widget/TextView;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Landroid/view/animation/Animation;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/yec0;->tb:I

    .line 5
    .line 6
    invoke-static {p1, v0, p0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/mdc0;->v1:I

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->a:Landroid/view/View;

    .line 17
    .line 18
    sget v0, Ll/mdc0;->w1:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 25
    .line 26
    sget v0, Ll/mdc0;->u1:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Landroid/widget/TextView;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->c:Landroid/widget/TextView;

    .line 35
    .line 36
    const-string p0, "\u9000\u51fa\u7fa4\u804a"

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->f(FLandroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->e(FLandroid/view/View;Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public c()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->g:Z

    .line 3
    .line 4
    sget v1, Ll/mdc0;->v1:I

    .line 5
    .line 6
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    const/4 v3, 0x2

    .line 18
    new-array v3, v3, [F

    .line 19
    .line 20
    aput v2, v3, v0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const/4 v4, 0x1

    .line 24
    aput v0, v3, v4

    .line 25
    .line 26
    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    new-instance v3, Ll/cm50;

    .line 33
    .line 34
    invoke-direct {v3, p0, v2, v1}, Ll/cm50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->g:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic e(FLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    div-float v0, p3, p1

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    sub-float/2addr p3, p1

    .line 20
    float-to-int p1, p3

    .line 21
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic f(FLandroid/view/View;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    check-cast p3, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    div-float v0, p3, p1

    .line 12
    .line 13
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 18
    .line 19
    sub-float/2addr p3, p1

    .line 20
    float-to-int p1, p3

    .line 21
    iput p1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const v0, 0x1020002

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Landroid/view/ViewGroup;

    .line 20
    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    sget v1, Ll/bnl0;->e:I

    .line 27
    .line 28
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    sget p1, Ll/mdc0;->v1:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 51
    .line 52
    int-to-float v0, v0

    .line 53
    const/4 v2, 0x2

    .line 54
    new-array v2, v2, [F

    .line 55
    .line 56
    const/4 v3, 0x0

    .line 57
    aput v3, v2, v1

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    aput v0, v2, v1

    .line 61
    .line 62
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    new-instance v3, Ll/dm50;

    .line 69
    .line 70
    invoke-direct {v3, p0, v0, p1}, Ll/dm50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;FLandroid/view/View;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->d:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    .line 79
    .line 80
    .line 81
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->g:Z

    .line 82
    .line 83
    return-void
.end method

.method public getExitAreaView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->a:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->f:Z

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->e:Landroid/view/animation/Animation;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sget v1, Ll/r7c0;->b:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->e:Landroid/view/animation/Animation;

    .line 31
    .line 32
    const-wide/16 v1, 0x64

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->e:Landroid/view/animation/Animation;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->e:Landroid/view/animation/Animation;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/animation/Animation;->cancel()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->b:Landroid/view/View;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->f:Z

    .line 18
    .line 19
    return-void
.end method

.method public setExitText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/voicewindow/OnExitPopupView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
