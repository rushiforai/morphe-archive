.class public Ll/prr$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/prr;->j(Landroid/animation/ValueAnimator;Ll/grr;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/grr;

.field public final synthetic c:Ll/prr;


# direct methods
.method public constructor <init>(Ll/prr;Landroid/view/View;Ll/grr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 2
    .line 3
    iput-object p2, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Ll/prr$a;->b:Ll/grr;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 2
    .line 3
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    const/high16 v1, 0x42200000    # 40.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    int-to-float v1, v1

    .line 16
    const/4 v2, 0x0

    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p1, v0, v2, v1, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 23
    .line 24
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 29
    .line 30
    invoke-virtual {p1, v0, v2, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 34
    .line 35
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    const/high16 v0, 0x41200000    # 10.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 57
    .line 58
    iget-object v0, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p1, v0, v2, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 69
    .line 70
    invoke-virtual {p0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 2
    .line 3
    invoke-static {p1}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 12
    .line 13
    iget-object v0, p0, Ll/prr$a;->b:Ll/grr;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/grr;->f()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v1, 0x40800000    # 4.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v0, v1

    .line 26
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 27
    .line 28
    iget-object v0, p0, Ll/prr$a;->c:Ll/prr;

    .line 29
    .line 30
    invoke-static {v0}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 38
    .line 39
    invoke-static {p1}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 48
    .line 49
    invoke-static {p1}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const/4 v1, 0x1

    .line 54
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 58
    .line 59
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 64
    .line 65
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/prr$a;->c:Ll/prr;

    .line 69
    .line 70
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 80
    .line 81
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 85
    .line 86
    const/high16 v0, 0x3f800000    # 1.0f

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/view/View;->setScaleX(F)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p0, Ll/prr$a;->a:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {p0, v0}, Landroid/view/View;->setScaleY(F)V

    .line 94
    .line 95
    .line 96
    return-void
.end method
