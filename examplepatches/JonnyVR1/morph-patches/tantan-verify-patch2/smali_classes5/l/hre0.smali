.class public Ll/hre0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/content/Context;

.field public g:Lv/VImage;

.field public h:Lv/VButton;

.field public i:Ll/l4g0;

.field public j:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/agc0;->c:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/hre0;->f:Landroid/content/Context;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "p_marriage_user_complete_profile"

    .line 17
    .line 18
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/hre0;->i:Ll/l4g0;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic A(Ll/hre0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hre0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C()V
    .locals 0

    .line 1
    invoke-static {}, Ll/gw90;->d()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gw90;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private D()V
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
    sget v2, Ll/adc0;->q2:I

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
    sget v3, Ll/dbc0;->bo:I

    .line 31
    .line 32
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/hre0$a;

    .line 36
    .line 37
    invoke-direct {v1, p0, v2}, Ll/hre0$a;-><init>(Ll/hre0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    new-instance p0, Ll/ere0;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Ll/ere0;-><init>(Landroid/view/Window;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private E()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hre0;->f:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/kec0;->Ub:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/hre0;->j:Landroid/view/View;

    .line 15
    .line 16
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 20
    .line 21
    .line 22
    iget-object v1, p0, Ll/hre0;->j:Landroid/view/View;

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/hre0;->j:Landroid/view/View;

    .line 28
    .line 29
    sget v1, Ll/adc0;->A1:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Lv/VImage;

    .line 36
    .line 37
    iput-object v0, p0, Ll/hre0;->g:Lv/VImage;

    .line 38
    .line 39
    iget-object v0, p0, Ll/hre0;->j:Landroid/view/View;

    .line 40
    .line 41
    sget v1, Ll/adc0;->m4:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lv/VButton;

    .line 48
    .line 49
    iput-object v0, p0, Ll/hre0;->h:Lv/VButton;

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/hre0;->g:Lv/VImage;

    .line 56
    .line 57
    new-instance v1, Ll/cre0;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/cre0;-><init>(Ll/hre0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/hre0;->h:Lv/VButton;

    .line 66
    .line 67
    new-instance v1, Ll/dre0;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/dre0;-><init>(Ll/hre0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private synthetic F()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hre0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_marriage_user_compelete_profile"

    .line 2
    .line 3
    const-string v0, "p_marriage_user_complete_profile"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/hre0;->f:Landroid/content/Context;

    .line 9
    .line 10
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_SERIOUS_DIALOG:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "serious_purpose_dialog"

    .line 29
    .line 30
    const/4 v3, 0x0

    .line 31
    invoke-static {p1, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)Landroid/content/Intent;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iget-object v0, p0, Ll/hre0;->f:Landroid/content/Context;

    .line 36
    .line 37
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    const/16 v1, 0xdac

    .line 40
    .line 41
    invoke-virtual {v0, p1, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/hre0;->f:Landroid/content/Context;

    .line 45
    .line 46
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 47
    .line 48
    sget v0, Ll/x7c0;->y:I

    .line 49
    .line 50
    sget v1, Ll/x7c0;->q:I

    .line 51
    .line 52
    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ll/hre0;->dismiss()V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-void
.end method

.method private J()V
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

.method public static synthetic x(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/agc0;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic y(Ll/hre0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hre0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/hre0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hre0;->F()V

    return-void
.end method


# virtual methods
.method public final I()V
    .locals 0

    .line 1
    new-instance p0, Ll/gre0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gre0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hre0;->i:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/hre0;->i:Ll/l4g0;

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
    sget v1, Ll/agc0;->a:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    new-instance v0, Ll/fre0;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/fre0;-><init>(Ll/hre0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hre0;->E()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ll/hre0;->J()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hre0;->I()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onStart()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onStart()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/hre0;->i:Ll/l4g0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/l4g0;->c()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/hre0;->i:Ll/l4g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/hre0;->j:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->getState()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x3

    .line 31
    if-eq v0, v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hre0;->D()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
