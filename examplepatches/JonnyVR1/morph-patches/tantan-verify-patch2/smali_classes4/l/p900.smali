.class public Ll/p900;
.super Lcom/p1/mobile/android/app/Act$w;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/android/app/Act$w<",
        "Lcom/p1/mobile/android/app/Act;",
        "Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Act$w;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Ll/p900;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p900;->l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic c(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/p900;->j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic d(Ljava/lang/Object;Ljava/lang/Object;)Landroid/animation/Animator;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/p900;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)Landroid/animation/Animator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/p900;->m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)Landroid/animation/Animator;
    .locals 3

    .line 1
    iget-object p1, p0, Ll/p900;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v0, Landroid/animation/ArgbEvaluator;

    .line 4
    .line 5
    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "#ffFFFFFF"

    .line 9
    .line 10
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "#00FFFFFF"

    .line 19
    .line 20
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "backgroundColor"

    .line 33
    .line 34
    invoke-static {p1, v2, v0, v1}, Landroid/animation/ObjectAnimator;->ofObject(Ljava/lang/Object;Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ObjectAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-wide/16 v0, 0x1f4

    .line 39
    .line 40
    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget-object v0, Ll/gt0;->b:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Ll/o900;

    .line 50
    .line 51
    invoke-direct {v0, p0, p2}, Ll/o900;-><init>(Ll/p900;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 52
    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    return-object p1
.end method

.method public k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)Landroid/animation/Animator;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Ll/qzz;->i:Landroid/widget/FrameLayout;

    .line 6
    .line 7
    iget-object p0, p0, Ll/p900;->a:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/android/app/Act$w;->h(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/view/View;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/p900;->a:Landroid/view/View;

    .line 10
    .line 11
    const v0, 0xffffff

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->y2()Ll/qzz;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p1, p1, Ll/qzz;->i:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iget-object p0, p0, Ll/p900;->a:Landroid/view/View;

    .line 24
    .line 25
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v0, -0x1

    .line 28
    invoke-direct {p2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
