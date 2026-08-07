.class public Ll/prr$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/prr;->h(Landroid/animation/ValueAnimator;Ll/grr;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/prr;


# direct methods
.method public constructor <init>(Ll/prr;Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 2
    .line 3
    iput-object p2, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 2
    .line 3
    invoke-static {p1}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 12
    .line 13
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 23
    .line 24
    iget-object v0, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-virtual {p1, v0, v1, v1, v2}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 33
    .line 34
    invoke-virtual {p1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 38
    .line 39
    invoke-virtual {p0, v2}, Landroid/view/View;->setScaleY(F)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 2
    .line 3
    iget-object v0, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p1, v0, v1, v1, v1}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/prr$b;->a:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 20
    .line 21
    invoke-static {p1}, Ll/prr;->r(Ll/prr;)Landroid/widget/FrameLayout;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 30
    .line 31
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->d:Landroid/view/View;

    .line 36
    .line 37
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/prr$b;->b:Ll/prr;

    .line 41
    .line 42
    invoke-static {p1}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    const/high16 v2, 0x42200000    # 40.0f

    .line 49
    .line 50
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    int-to-float v2, v2

    .line 55
    const/high16 v3, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1, v2, v3}, Ll/prr;->A(Landroid/view/View;FFF)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/prr$b;->b:Ll/prr;

    .line 61
    .line 62
    invoke-static {p0}, Ll/prr;->q(Ll/prr;)Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryAll;->h:Landroid/widget/LinearLayout;

    .line 67
    .line 68
    const/high16 p1, 0x41200000    # 10.0f

    .line 69
    .line 70
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
