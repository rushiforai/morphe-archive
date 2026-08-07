.class public Ll/gch0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Landroid/view/View;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VLinear;

.field public i:Landroid/widget/TextView;

.field public j:Lcom/p1/mobile/android/app/Act;

.field public k:Ll/l4g0;

.field public l:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

.field public m:Ll/x20;

.field public final n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/gch0$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/gch0$a;-><init>(Ll/gch0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/gch0;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 10
    .line 11
    invoke-direct {p0, p1}, Ll/gch0;->H(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic A(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u9886\u53d6\u5931\u8d25"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic D(Ll/gch0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gch0;->M(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static bridge synthetic E(Ll/gch0;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gch0;->l:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    return-object p0
.end method

.method private G()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_surprisebox"

    .line 2
    .line 3
    return-object p0
.end method

.method private H(Landroid/content/Context;)V
    .locals 1

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    iput-object v0, p0, Ll/gch0;->j:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/gch0;->F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private I()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/gch0;->f:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/bch0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bch0;-><init>(Ll/gch0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/gch0;->g:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    new-instance v1, Ll/cch0;

    .line 14
    .line 15
    invoke-direct {v1}, Ll/cch0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/gch0;->h:Lv/VLinear;

    .line 22
    .line 23
    new-instance v1, Ll/dch0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/dch0;-><init>(Ll/gch0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/gch0;->m:Ll/x20;

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
    iget-object p0, p0, Ll/gch0;->m:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gch0;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic M(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gch0;->k:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic x(Ll/gch0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gch0;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic y(Ll/gch0;Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/gch0;->L(Lcom/p1/mobile/putong/core/data/SurpriseGift;)V

    return-void
.end method

.method public static synthetic z(Ll/gch0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/gch0;->J(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public F(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lch0;->b(Ll/gch0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/core/data/SurpriseGift;)V
    .locals 2

    .line 1
    const-string v0, "e_surprisebox_click"

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gch0;->G()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_4

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/j7b;->i3()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/j7b;->j3()V

    .line 28
    .line 29
    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "matchUser"

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->matchUserId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v0, p1}, Ll/gch0;->P(ILjava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "greetingUser"

    .line 50
    .line 51
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    const/4 v0, 0x1

    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->matchUserId:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v0, p1}, Ll/gch0;->P(ILjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 65
    .line 66
    const-string v1, "cardExposure"

    .line 67
    .line 68
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/4 v1, 0x0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    const/4 p1, 0x3

    .line 76
    invoke-virtual {p0, p1, v1}, Ll/gch0;->P(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SurpriseGift;->surpriseGiftType:Ljava/lang/String;

    .line 81
    .line 82
    const-string v0, "boost"

    .line 83
    .line 84
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    const/4 p1, 0x2

    .line 91
    invoke-virtual {p0, p1, v1}, Ll/gch0;->P(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 95
    .line 96
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 97
    .line 98
    invoke-virtual {p1}, Ll/m27;->V3()Lrx/c;

    .line 99
    .line 100
    .line 101
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    const-string p0, "\u9886\u53d6\u5931\u8d25"

    .line 106
    .line 107
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k2:Ll/j7b;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/j7b;->o3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ech0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ech0;-><init>(Ll/gch0;)V

    .line 16
    .line 17
    .line 18
    new-instance p0, Ll/fch0;

    .line 19
    .line 20
    invoke-direct {p0}, Ll/fch0;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public O(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gch0;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final P(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ybh0$b;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ybh0$b;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/ybh0$b;->a(I)Ll/ybh0$b;

    .line 7
    .line 8
    .line 9
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p1, p2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {v0, p1}, Ll/ybh0$b;->b(Lcom/p1/mobile/putong/data/User;)Ll/ybh0$b;

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/gch0;->j:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ll/ybh0$b;->c(Lcom/p1/mobile/android/app/Act;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public show()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/vcc0;->E:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Landroid/widget/FrameLayout;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const/4 v2, -0x1

    .line 17
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 24
    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/gch0;->l:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/gch0;->l:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 37
    .line 38
    iget-object v1, p0, Ll/gch0;->n:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0}, Ll/gch0;->I()V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/gch0;->k:Ll/l4g0;

    .line 47
    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    invoke-direct {p0}, Ll/gch0;->G()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-class v1, Lcom/p1/mobile/putong/core/ui/profile/CityTopGreetDialog;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Ll/gch0;->k:Ll/l4g0;

    .line 65
    .line 66
    :cond_0
    iget-object v0, p0, Ll/gch0;->k:Ll/l4g0;

    .line 67
    .line 68
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/ach0;

    .line 72
    .line 73
    invoke-direct {v0, p0}, Ll/ach0;-><init>(Ll/gch0;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method
