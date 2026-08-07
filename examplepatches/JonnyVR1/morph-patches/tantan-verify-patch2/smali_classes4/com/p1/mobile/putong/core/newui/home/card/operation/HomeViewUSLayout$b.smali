.class public Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->s(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->a:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 37
    .line 38
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->a:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 17
    .line 18
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p0, v2}, Landroid/view/View;->setClickable(Z)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 37
    .line 38
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->q:Lv/VLinear;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->j:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout$b;->b:Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/operation/HomeViewUSLayout;->b:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
