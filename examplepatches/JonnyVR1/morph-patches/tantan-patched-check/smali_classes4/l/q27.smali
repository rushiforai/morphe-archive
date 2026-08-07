.class public abstract Ll/q27;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Ll/l4g0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/lgc0;->b:I

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/pej0;-><init>(Landroid/content/Context;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic D(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q27;->f:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic E()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/q27;->G()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic x(Ll/q27;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/q27;->E()V

    return-void
.end method

.method public static synthetic y(Ll/q27;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q27;->D(Landroid/content/DialogInterface;)V

    return-void
.end method


# virtual methods
.method public A()Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q27;->f:Ll/l4g0;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract C()Z
.end method

.method public abstract F()Ljava/lang/String;
.end method

.method public abstract G()Landroid/view/View;
.end method

.method public abstract H()Z
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/q27;->z()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/q27;->H()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/q27;->f:Ll/l4g0;

    .line 12
    .line 13
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/o27;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/o27;-><init>(Ll/q27;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/q27;->z()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Ll/zyf0;

    .line 31
    .line 32
    invoke-direct {p1}, Ll/zyf0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/pej0;->v(Ll/pej0$a;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public show()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/q27;->F()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-class v1, Lcom/p1/mobile/android/app/Dialog;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/q27;->f:Ll/l4g0;

    .line 16
    .line 17
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const v1, 0x3e99999a    # 0.3f

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/q27;->G()Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/p27;

    .line 35
    .line 36
    invoke-direct {v2, p0}, Ll/p27;-><init>(Ll/q27;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x3

    .line 47
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    const/4 v1, -0x1

    .line 57
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 58
    .line 59
    .line 60
    const v2, 0x1020002

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    sget v3, Ll/odc0;->p:I

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroid/widget/FrameLayout;

    .line 74
    .line 75
    sget v3, Ll/tbc0;->a0:I

    .line 76
    .line 77
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    invoke-static {v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    new-instance v3, Ll/q27$a;

    .line 85
    .line 86
    invoke-direct {v3, p0, v2}, Ll/q27$a;-><init>(Ll/q27;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/q27;->C()Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_0

    .line 97
    .line 98
    invoke-virtual {v0, v1}, Landroid/view/Window;->setNavigationBarColor(I)V

    .line 99
    .line 100
    .line 101
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 102
    .line 103
    const/16 v1, 0x1a

    .line 104
    .line 105
    if-lt p0, v1, :cond_0

    .line 106
    .line 107
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    or-int/lit8 v0, v0, 0x10

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 122
    .line 123
    .line 124
    :cond_0
    return-void
.end method

.method public abstract z()Z
.end method
