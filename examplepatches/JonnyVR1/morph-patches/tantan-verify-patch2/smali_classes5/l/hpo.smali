.class public Ll/hpo;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Ll/eqo;

.field public g:Ll/iqo;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Landroid/view/ViewGroup;

.field public j:Ll/l4g0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
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
    iput-object p1, p0, Ll/hpo;->h:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {p0}, Ll/hpo;->A()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const-string v0, "p_intl_swipe_setting"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/hpo;->j:Ll/l4g0;

    .line 30
    .line 31
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    new-instance v0, Ll/eqo;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hpo;->h:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1, p0}, Ll/eqo;-><init>(Lcom/p1/mobile/android/app/Act;Ll/s1e;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/hpo;->f:Ll/eqo;

    .line 9
    .line 10
    new-instance v0, Ll/iqo;

    .line 11
    .line 12
    iget-object v1, p0, Ll/hpo;->h:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Ll/iqo;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/hpo;->g:Ll/iqo;

    .line 18
    .line 19
    iget-object p0, p0, Ll/hpo;->f:Ll/eqo;

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
    iget-object p0, p0, Ll/hpo;->f:Ll/eqo;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/eqo;->I()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private E()V
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

.method public static F(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hpo;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/hpo;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/hpo;->show()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic x(Ll/hpo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hpo;->D()V

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
    new-instance v1, Ll/hpo$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/hpo$a;-><init>(Ll/hpo;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/gpo;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/gpo;-><init>(Landroid/view/Window;)V

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
.method public final synthetic D()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hpo;->j:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hpo;->j:Ll/l4g0;

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
    new-instance v0, Ll/fpo;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/fpo;-><init>(Ll/hpo;)V

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
    invoke-virtual {p0}, Ll/hpo;->dismiss()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/hpo;->g:Ll/iqo;

    .line 5
    .line 6
    iget-object v0, p0, Ll/hpo;->h:Lcom/p1/mobile/android/app/Act;

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
    invoke-virtual {p1, v0, v1}, Ll/iqo;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    iput-object p1, p0, Ll/hpo;->i:Landroid/view/ViewGroup;

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
    iget-object v0, p0, Ll/hpo;->i:Landroid/view/ViewGroup;

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
    invoke-direct {p0}, Ll/hpo;->E()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onStart()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hpo;->C()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hpo;->i:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    const/4 v2, 0x3

    .line 24
    if-eq v1, v2, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Ll/hpo;->j:Ll/l4g0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Ll/hpo;->j:Ll/l4g0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hpo;->z()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
