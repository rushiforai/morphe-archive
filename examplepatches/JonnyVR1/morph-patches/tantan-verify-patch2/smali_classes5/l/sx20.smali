.class public Ll/sx20;
.super Ll/pej0;
.source "SourceFile"


# static fields
.field public static n:Ljava/lang/String; = "from_boost_guide_red_dot"


# instance fields
.field public f:Ll/vy20;

.field public g:Ll/gz20;

.field public h:I

.field public i:Lcom/p1/mobile/android/app/Act;

.field public j:Landroid/view/ViewGroup;

.field public k:Ll/l4g0;

.field public l:Ljava/lang/String;

.field public m:Ll/x20;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, v0}, Ll/sx20;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/egc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    const-string v0, "user_click"

    .line 7
    .line 8
    iput-object v0, p0, Ll/sx20;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput p2, p0, Ll/sx20;->h:I

    .line 11
    .line 12
    iput-object p1, p0, Ll/sx20;->i:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {p0}, Ll/sx20;->A()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "p_advanced_filter_page"

    .line 30
    .line 31
    invoke-static {p2, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Ll/sx20;->k:Ll/l4g0;

    .line 36
    .line 37
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    new-instance v0, Ll/vy20;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sx20;->i:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/vy20;-><init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/sx20;->f:Ll/vy20;

    .line 9
    .line 10
    new-instance v0, Ll/gz20;

    .line 11
    .line 12
    iget-object v1, p0, Ll/sx20;->i:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/gz20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/sx20;->g:Ll/gz20;

    .line 18
    .line 19
    iget-object p0, p0, Ll/sx20;->f:Ll/vy20;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/ij2;->C(Ll/iam;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private C()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sx20;->f:Ll/vy20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/vy20;->S()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic D()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private G()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, -0x1

    .line 6
    invoke-virtual {p0, v0, v0}, Landroid/view/Window;->setLayout(II)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static I(Lcom/p1/mobile/android/app/Act;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/sx20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/sx20;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/sx20;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sx20;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/sx20;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/sx20;->H(Ljava/lang/String;)Ll/sx20;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p2}, Ll/sx20;->F(Ll/x20;)Ll/sx20;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/sx20;->show()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private K()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/sx20;->g:Ll/gz20;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/gz20;->R()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic x(Ll/sx20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/sx20;->D()V

    return-void
.end method

.method public static synthetic y(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/egc0;->c:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private z()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const v1, 0x1020002

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sget v2, Ll/gdc0;->m:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    sget v3, Ll/tbc0;->X:I

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/sx20$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/sx20$a;-><init>(Ll/sx20;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/rx20;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/rx20;-><init>(Landroid/view/Window;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method


# virtual methods
.method public final E()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/sx20;->g:Ll/gz20;

    .line 2
    .line 3
    iget p0, p0, Ll/sx20;->h:I

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/gz20;->M(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F(Ll/x20;)Ll/sx20;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sx20;->m:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Ljava/lang/String;)Ll/sx20;
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object p1, p0, Ll/sx20;->l:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/egc0;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/qx20;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/qx20;-><init>(Ll/sx20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/sx20;->f:Ll/vy20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/vy20;->g0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/sx20;->g:Ll/gz20;

    .line 5
    .line 6
    iget-object v0, p0, Ll/sx20;->i:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v0, v1}, Ll/gz20;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    iput-object p1, p0, Ll/sx20;->j:Landroid/view/ViewGroup;

    .line 20
    .line 21
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 22
    .line 23
    const/4 v0, -0x1

    .line 24
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/sx20;->j:Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    const/high16 v0, 0x41200000    # 10.0f

    .line 33
    .line 34
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 39
    .line 40
    invoke-direct {p0}, Ll/sx20;->G()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onStart()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "is_privileged"

    .line 23
    .line 24
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "filter_page_show_from"

    .line 29
    .line 30
    iget-object v3, p0, Ll/sx20;->l:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 44
    .line 45
    const-string v1, "filter_page"

    .line 46
    .line 47
    const-string v2, "p_suggest_users_home_view"

    .line 48
    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    filled-new-array {v1}, [Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 61
    .line 62
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/sx20;->k:Ll/l4g0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0}, Ll/sx20;->C()V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/sx20;->j:Landroid/view/ViewGroup;

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Landroid/view/ViewGroup;

    .line 80
    .line 81
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    const/4 v1, 0x3

    .line 90
    if-eq v0, v1, :cond_0

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 93
    .line 94
    .line 95
    :cond_0
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sx20;->f:Ll/vy20;

    .line 2
    .line 3
    iget-object v1, p0, Ll/sx20;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/vy20;->j0(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/sx20;->f:Ll/vy20;

    .line 9
    .line 10
    iget-object v1, p0, Ll/sx20;->m:Ll/x20;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/vy20;->i0(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Ll/sx20;->z()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/sx20;->E()V

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Ll/sx20;->K()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
