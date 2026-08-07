.class public Ll/v0t;
.super Landroid/widget/PopupWindow;
.source "SourceFile"


# instance fields
.field public a:Ll/x20;

.field public b:Ll/x20;

.field public c:Landroid/animation/Animator;

.field public d:Landroid/animation/Animator;

.field public final e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x2

    .line 6
    invoke-direct {p0, v0, v1}, Landroid/widget/PopupWindow;-><init>(II)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/v0t;->e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    sget p1, Ll/agc0;->H:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Ll/v0t;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v0t;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->g()V

    return-void
.end method

.method public static synthetic c(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->k()V

    return-void
.end method

.method public static synthetic d(Ll/v0t;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v0t;->l(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    return-void
.end method

.method public static synthetic e(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->j()V

    return-void
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 13
    .line 14
    new-instance v1, Ll/q0t;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/q0t;-><init>(Ll/v0t;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 13
    .line 14
    new-instance v1, Ll/u0t;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/u0t;-><init>(Ll/v0t;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic getContentView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p1, p0, Ll/v0t;->b:Ll/x20;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Ll/v0t;->b:Ll/x20;

    .line 17
    .line 18
    invoke-interface {p0}, Ll/x20;->call()V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v0t;->e:Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic j()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/PopupWindow;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v0t;->h(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/v0t;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/v0t;->a:Ll/x20;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/v0t;->a:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public n(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v0t;->a:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public o(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/v0t;->b:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/data/PushMessageCustom;IILandroid/animation/Animator;Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v0t;->c:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iput-object p5, p0, Ll/v0t;->c:Landroid/animation/Animator;

    .line 13
    .line 14
    iput-object p6, p0, Ll/v0t;->d:Landroid/animation/Animator;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 17
    .line 18
    .line 19
    move-result-object p6

    .line 20
    new-instance v0, Ll/r0t;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Ll/r0t;-><init>(Ll/v0t;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p6, v0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->setOnExitAction(Ll/x20;)V

    .line 26
    .line 27
    .line 28
    new-instance p2, Ll/s0t;

    .line 29
    .line 30
    invoke-direct {p2, p0}, Ll/s0t;-><init>(Ll/v0t;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p6, p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->setOnDismissAction(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;->a()Z

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    if-eqz p2, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/v0t;->i()Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    new-instance p6, Ll/t0t;

    .line 51
    .line 52
    invoke-direct {p6, p0}, Ll/t0t;-><init>(Ll/v0t;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p2, p6}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    invoke-virtual {p5}, Landroid/animation/Animator;->start()V

    .line 59
    .line 60
    .line 61
    const p2, 0x800033

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 65
    .line 66
    .line 67
    return-void
.end method
