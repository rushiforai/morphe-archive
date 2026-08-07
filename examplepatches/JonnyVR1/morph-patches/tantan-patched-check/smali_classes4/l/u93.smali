.class public Ll/u93;
.super Ll/n63;
.source "SourceFile"


# instance fields
.field public e:Ll/kcg0;

.field public f:Ljava/lang/Runnable;

.field public final g:Ll/x20;

.field public h:I

.field public i:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/sa3;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/sa3;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/n63;-><init>(Lcom/p1/mobile/android/app/Act;Ll/sa3;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/u93;->h:I

    .line 6
    .line 7
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersAct;

    .line 8
    .line 9
    new-instance v0, Ll/o93;

    .line 10
    .line 11
    invoke-direct {v0, p1, p2}, Ll/o93;-><init>(ZLl/sa3;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/u93;->g:Ll/x20;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic q(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic r(Landroid/view/View;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;[I)V
    .locals 3

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p2, p1}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v1, p3, Ll/bnl0$g;->a:I

    .line 10
    .line 11
    iget v2, p3, Ll/bnl0$g;->c:I

    .line 12
    .line 13
    div-int/lit8 v2, v2, 0x2

    .line 14
    .line 15
    add-int/2addr v1, v2

    .line 16
    iget v2, p3, Ll/bnl0$g;->b:I

    .line 17
    .line 18
    iget p3, p3, Ll/bnl0$g;->d:I

    .line 19
    .line 20
    div-int/lit8 p3, p3, 0x2

    .line 21
    .line 22
    add-int/2addr v2, p3

    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    sub-int/2addr v1, p3

    .line 28
    iget p3, v0, Ll/bnl0$g;->c:I

    .line 29
    .line 30
    div-int/lit8 p3, p3, 0x2

    .line 31
    .line 32
    sub-int/2addr v1, p3

    .line 33
    int-to-float p3, v1

    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    sub-int/2addr v2, p1

    .line 39
    iget p1, v0, Ll/bnl0$g;->d:I

    .line 40
    .line 41
    div-int/lit8 p1, p1, 0x2

    .line 42
    .line 43
    sub-int/2addr v2, p1

    .line 44
    int-to-float p1, v2

    .line 45
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;->l(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public static synthetic s(ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/oa3;->e(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic t(Ll/u93;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u93;->y(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/u93;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u93;->x(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic v(ZLl/sa3;)V
    .locals 1

    .line 1
    invoke-static {p0}, Ll/oa3;->f(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/sa3;->i()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/s93;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/s93;-><init>(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private w()V
    .locals 2

    .line 1
    invoke-static {}, Ll/y63;->j()Ll/y63;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/t93;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/t93;-><init>(Ll/u93;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/y63;->p(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/u93;->e:Ll/kcg0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public d()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/u93;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/u93;->f:Ljava/lang/Runnable;

    .line 8
    .line 9
    iget-object v1, p0, Ll/u93;->e:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/u93;->e:Ll/kcg0;

    .line 15
    .line 16
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n63;->b:Ll/sa3;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/sa3;->b()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Ll/p93;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/p93;-><init>(Ll/u93;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    instance-of v1, v0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/ui/home/BounceButton;

    .line 26
    .line 27
    new-instance v1, Ll/u93$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/u93$a;-><init>(Ll/u93;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/home/BounceButton;->setLongPressingListener(Lcom/p1/mobile/putong/core/ui/a$d;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/u93;->w()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k(Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/u93;->i:Ll/pcj;

    .line 2
    .line 3
    return-void
.end method

.method public m(Landroid/widget/FrameLayout;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/pec0;->e:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;

    .line 15
    .line 16
    const-string v0, "BoostRemainingOpt"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 29
    .line 30
    const/4 v1, -0x2

    .line 31
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/q93;

    .line 38
    .line 39
    invoke-direct {v0, p2, p1, p0}, Ll/q93;-><init>(Landroid/view/View;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/view/boost/view/BoostRemainingCountViewOpt;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/x20;",
            "Ll/pcj<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1, p2, p3}, Ll/ma3;->g(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/pcj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 21
    .line 22
    iget-object v3, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    invoke-direct {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    const/high16 v3, 0x40000000    # 2.0f

    .line 28
    .line 29
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/ui/bubble/a;->B(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iget-object v3, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    const/4 v4, 0x1

    .line 40
    if-le v0, v4, :cond_1

    .line 41
    .line 42
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->V0:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->U0:I

    .line 46
    .line 47
    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v2, v0}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/high16 v2, 0x40e00000    # 7.0f

    .line 64
    .line 65
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->l(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const/16 v2, 0x4b

    .line 74
    .line 75
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->p(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/high16 v2, 0x41500000    # 13.0f

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    sget v2, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 86
    .line 87
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v1, v0, p1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object p0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    new-instance v0, Ll/r93;

    .line 98
    .line 99
    invoke-direct {v0, p1}, Ll/r93;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-wide/16 v1, 0x3e8

    .line 103
    .line 104
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public p(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u93;->i:Ll/pcj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/String;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, ""

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iget-object p0, p0, Ll/u93;->g:Ll/x20;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    invoke-static {v1, p1, p0, v2, v0}, Ll/ma3;->h(Lcom/p1/mobile/android/app/Act;ZLl/x20;ZLjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic x(Landroid/util/Pair;)V
    .locals 3

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Ll/n63;->b:Ll/sa3;

    .line 21
    .line 22
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 23
    .line 24
    move-object v2, v1

    .line 25
    check-cast v2, Ll/bkj0;

    .line 26
    .line 27
    iget-object v2, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v2, Ljava/lang/CharSequence;

    .line 30
    .line 31
    check-cast v1, Ll/bkj0;

    .line 32
    .line 33
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v1, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v2, v1}, Ll/sa3;->l(Ljava/lang/CharSequence;I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    iget-object v0, p0, Ll/n63;->b:Ll/sa3;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/sa3;->k()V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget v0, p0, Ll/u93;->h:I

    .line 51
    .line 52
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast v1, Ljava/lang/Integer;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eq v0, v1, :cond_1

    .line 61
    .line 62
    iget-object v0, p0, Ll/n63;->d:Ll/na3;

    .line 63
    .line 64
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    iget-object v0, p0, Ll/n63;->d:Ll/na3;

    .line 71
    .line 72
    iget v1, p0, Ll/u93;->h:I

    .line 73
    .line 74
    invoke-interface {v0, v1}, Ll/na3;->b(I)V

    .line 75
    .line 76
    .line 77
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 78
    .line 79
    check-cast p1, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    iput p1, p0, Ll/u93;->h:I

    .line 86
    .line 87
    iget-object p0, p0, Ll/n63;->d:Ll/na3;

    .line 88
    .line 89
    invoke-interface {p0, p1}, Ll/na3;->a(I)V

    .line 90
    .line 91
    .line 92
    :cond_1
    return-void
.end method

.method public final synthetic y(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/m27;->F3()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {p0}, Ll/b83;->k(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/t450;->j()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_4

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Ll/joa;->D3()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object v0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 51
    .line 52
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->he(Lcom/p1/mobile/android/app/Act;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_2

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->zi(Lcom/p1/mobile/android/app/Act;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_2

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iget-object p0, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Ue(Lcom/p1/mobile/android/app/Act;Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iget-object p1, p0, Ll/n63;->a:Lcom/p1/mobile/android/app/Act;

    .line 90
    .line 91
    invoke-static {p1}, Ll/oa3;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Ll/n63;->j()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-eqz p1, :cond_3

    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    const/4 p1, 0x0

    .line 102
    invoke-virtual {p0, p1}, Ll/u93;->p(Z)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 111
    .line 112
    .line 113
    return-void
.end method
