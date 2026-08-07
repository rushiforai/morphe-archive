.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->l(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->b(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[Landroid/widget/ImageView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v0, v0

    .line 12
    if-ge p1, v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->b(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[Landroid/widget/ImageView;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    aget-object v0, v0, p1

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->b(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[Landroid/widget/ImageView;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    aget-object v0, v0, p1

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[I

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    aget v1, v1, p1

    .line 45
    .line 46
    int-to-float v1, v1

    .line 47
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 57
    .line 58
    invoke-static {v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[I

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    aget v1, v1, p1

    .line 63
    .line 64
    int-to-float v1, v1

    .line 65
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    int-to-float v1, v1

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;->a:Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;

    .line 71
    .line 72
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;->b(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout;)[Landroid/widget/ImageView;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    aget-object v2, v2, p1

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/lang/Float;

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    mul-float/2addr v1, v2

    .line 89
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    sget-object v1, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b$a;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/ExplodeLayout$b;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    const-wide/16 v1, 0x3e8

    .line 109
    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 115
    .line 116
    .line 117
    add-int/lit8 p1, p1, 0x1

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    return-void
.end method
