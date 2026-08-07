.class public Ll/n55;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Ljava/lang/String;

.field public h:Ll/l4g0;

.field public i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

.field public j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

.field public k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

.field public l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VImage;

.field public q:I

.field public r:I

.field public s:Lcom/p1/mobile/putong/core/data/CityCData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public t:Lcom/p1/mobile/putong/core/data/CityCBanner;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
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
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/n55;->q:I

    .line 8
    .line 9
    iput v0, p0, Ll/n55;->r:I

    .line 10
    .line 11
    iput-object p1, p0, Ll/n55;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/n55;->g:Ljava/lang/String;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCancelable(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A(Ll/n55;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/n55;->I(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static bridge synthetic C(Ll/n55;)Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n55;->f:Lcom/p1/mobile/android/app/Act;

    return-object p0
.end method

.method public static bridge synthetic D(Ll/n55;)Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    return-object p0
.end method

.method public static bridge synthetic E(Ll/n55;ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/n55;->L(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V

    return-void
.end method

.method public static bridge synthetic F(Ll/n55;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n55;->N()V

    return-void
.end method

.method private G()V
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
    const/4 v3, 0x3

    .line 31
    invoke-virtual {v2, v3}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 32
    .line 33
    .line 34
    sget v3, Ll/dbc0;->v5:I

    .line 35
    .line 36
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ll/n55$f;

    .line 40
    .line 41
    invoke-direct {v1, p0, v2}, Ll/n55$f;-><init>(Ll/n55;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    new-instance p0, Ll/m55;

    .line 48
    .line 49
    invoke-direct {p0, v0}, Ll/m55;-><init>(Landroid/view/Window;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
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

.method public static synthetic x(Ll/n55;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/n55;->H()V

    return-void
.end method

.method public static synthetic y(Landroid/view/Window;)V
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

.method public static synthetic z(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "pay_confirm_result"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_city_cover_before_pay_confirm"

    .line 12
    .line 13
    const-string v1, "p_city_cover_before_pay"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic H()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/n55;->dismiss()V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/s75;->l()Ll/s75;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/s75;->o()V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ll/p55;

    .line 18
    .line 19
    iget-object p0, p0, Ll/n55;->f:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    const-string v0, ""

    .line 22
    .line 23
    invoke-direct {p1, p0, v0}, Ll/p55;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Ll/p55;->show()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public K(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;)V
    .locals 1
    .param p2    # Lcom/p1/mobile/putong/core/data/CityCData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/data/CityCBanner;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Ll/n55;->L(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final L(ILcom/p1/mobile/putong/core/data/CityCData;Lcom/p1/mobile/putong/core/data/CityCBanner;Z)V
    .locals 2
    .param p2    # Lcom/p1/mobile/putong/core/data/CityCData;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/data/CityCBanner;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    if-eqz p4, :cond_0

    .line 5
    .line 6
    invoke-direct {p0}, Ll/n55;->G()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput p1, p0, Ll/n55;->q:I

    .line 10
    .line 11
    iput-object p2, p0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 12
    .line 13
    iput-object p3, p0, Ll/n55;->t:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 14
    .line 15
    const/4 p3, 0x1

    .line 16
    const/4 p4, 0x3

    .line 17
    const/4 v0, 0x2

    .line 18
    if-ne p1, p3, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/n55;->O()V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    if-ne p1, v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/n55;->Q()V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    if-ne p1, p4, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/n55;->P()V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_3
    const/4 p3, 0x4

    .line 37
    if-ne p1, p3, :cond_4

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/n55;->N()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_4
    const/4 p3, 0x5

    .line 44
    if-ne p1, p3, :cond_5

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/n55;->M()V

    .line 47
    .line 48
    .line 49
    :cond_5
    :goto_0
    iget p1, p0, Ll/n55;->q:I

    .line 50
    .line 51
    const-string p3, "city_cover_uid"

    .line 52
    .line 53
    if-ne p1, v0, :cond_6

    .line 54
    .line 55
    iget-object p1, p0, Ll/n55;->h:Ll/l4g0;

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-interface {p2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    filled-new-array {p2}, [Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_6
    iget-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 78
    .line 79
    const-string v1, ""

    .line 80
    .line 81
    if-ne p1, p4, :cond_8

    .line 82
    .line 83
    if-eqz p2, :cond_7

    .line 84
    .line 85
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/CityCData;->userId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_7
    invoke-static {p3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    filled-new-array {p1}, [Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_8
    invoke-static {v1, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    filled-new-array {p1}, [Ll/pf60;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {v0, p1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 108
    .line 109
    .line 110
    :goto_1
    iget-object p1, p0, Ll/n55;->h:Ll/l4g0;

    .line 111
    .line 112
    invoke-virtual {p1}, Ll/l4g0;->c()V

    .line 113
    .line 114
    .line 115
    iget-object p0, p0, Ll/n55;->h:Ll/l4g0;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public final M()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n55;->p:Lv/VImage;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 34
    .line 35
    new-instance v1, Ll/k55;

    .line 36
    .line 37
    invoke-direct {v1}, Ll/k55;-><init>()V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/l55;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/l55;-><init>(Ll/n55;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;->t(Ll/y20;Ll/y20;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/n55;->o:Lv/VText;

    .line 49
    .line 50
    const-string v1, "\u57ce\u5e02\u5c01\u9762"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "p_city_cover_before_pay"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 70
    .line 71
    return-void
.end method

.method public final N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/n55;->p:Lv/VImage;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/n55;->o:Lv/VText;

    .line 34
    .line 35
    const-string v1, "\u529f\u80fd\u8bf4\u660e"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Ll/s75;->i()I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-gtz v0, :cond_0

    .line 45
    .line 46
    const v0, 0xc350

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Ll/n55;->n:Lv/VText;

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "1\u3001\u767b\u9876\u57ce\u5e02\u5c01\u9762\u540e\uff0c24\u5c0f\u65f6\u5185\u5168\u57ce\u5973\u6027\u767b\u5f55\u63a2\u63a2\u770b\u5230\u7684\u9996\u5361\u90fd\u662f\u4f60\uff1b\n2\u3001\u57ce\u5e02\u5c01\u9762\u7528\u6237\u5c06\u4ee5\u4e13\u5c5e\u540d\u7247\u7f6e\u9876\u51fa\u73b0\u5728\u540c\u57ce\u5973\u6027\u7684\u6d88\u606f\u9875\u9876\u90e8\uff0c\u72ec\u4eab\u5168\u57ce\u805a\u5149\u706f\uff1b\n3\u3001\u767b\u98761\u6b21\u57ce\u5e02\u5c01\u9762\u9700\u82b1\u8d39%s\u63a2\u63a2\u5e01\uff1b\n4\u3001\u672c\u529f\u80fd\u5f53\u524d\u5904\u4e8e\u5185\u6d4b\u9636\u6bb5\uff0c\u540e\u7eed\u5c06\u9010\u6b65\u5f00\u653e\uff1b\n5\u3001\u57ce\u5e02\u5c01\u9762\u8d2d\u4e70\u540e\u7acb\u5373\u751f\u6548\uff0c\u6682\u4e0d\u652f\u6301\u9000\u6b3e\u3002\u5982\u6709\u4efb\u4f55\u8d2d\u4e70\u6216\u4f53\u9a8c\u95ee\u9898\uff0c\u8bf7\u8054\u7cfb\u63a2\u63a2\u5ba2\u670d\uff08\u5165\u53e3\uff1a\u6211-\u66f4\u591a-\u6211\u7684\u5ba2\u670d\uff09\u3002"

    .line 60
    .line 61
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final O()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n55;->p:Lv/VImage;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/n55;->o:Lv/VText;

    .line 34
    .line 35
    const-string v1, "\u57ce\u5e02\u5c01\u9762"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 41
    .line 42
    iget-object v1, p0, Ll/n55;->t:Lcom/p1/mobile/putong/core/data/CityCBanner;

    .line 43
    .line 44
    new-instance v2, Ll/n55$c;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/n55$c;-><init>(Ll/n55;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->j(Lcom/p1/mobile/putong/core/data/CityCBanner;Ll/x20;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "p_city_cover_feature_show"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 67
    .line 68
    return-void
.end method

.method public final P()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n55;->p:Lv/VImage;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/n55;->o:Lv/VText;

    .line 34
    .line 35
    const-string v1, "\u57ce\u5e02\u5c01\u9762"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 41
    .line 42
    iget-object v1, p0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 43
    .line 44
    new-instance v2, Ll/n55$d;

    .line 45
    .line 46
    invoke-direct {v2, p0}, Ll/n55$d;-><init>(Ll/n55;)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Ll/n55$e;

    .line 50
    .line 51
    invoke-direct {v3, p0}, Ll/n55$e;-><init>(Ll/n55;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;->b(Lcom/p1/mobile/putong/core/data/CityCData;Ll/x20;Ll/x20;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "p_city_cover_desc_show_someone"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 72
    .line 73
    return-void
.end method

.method public final Q()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/n55;->p:Lv/VImage;

    .line 24
    .line 25
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/n55;->o:Lv/VText;

    .line 34
    .line 35
    const-string v1, "\u57ce\u5e02\u5c01\u9762"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 41
    .line 42
    iget-object v1, p0, Ll/n55;->s:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;->setData(Lcom/p1/mobile/putong/core/data/CityCData;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;->d()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "p_city_cover_desc_show_someone"

    .line 61
    .line 62
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iput-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 67
    .line 68
    return-void
.end method

.method public dismiss()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/n55;->h:Ll/l4g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l4g0;->k()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/n55;->h:Ll/l4g0;

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
    new-instance v0, Ll/j55;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/j55;-><init>(Ll/n55;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;->h()V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;->c()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/n55;->f:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Ll/kec0;->p1:I

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Ll/n55;->J()V

    .line 28
    .line 29
    .line 30
    sget p1, Ll/adc0;->A1:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/n55$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/n55$a;-><init>(Ll/n55;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 42
    .line 43
    .line 44
    sget p1, Ll/adc0;->M5:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Ll/n55$b;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/n55$b;-><init>(Ll/n55;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    sget p1, Ll/adc0;->c3:I

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lv/VText;

    .line 65
    .line 66
    iput-object p1, p0, Ll/n55;->o:Lv/VText;

    .line 67
    .line 68
    sget p1, Ll/adc0;->M5:I

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lv/VImage;

    .line 75
    .line 76
    iput-object p1, p0, Ll/n55;->p:Lv/VImage;

    .line 77
    .line 78
    sget p1, Ll/adc0;->s1:I

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 85
    .line 86
    iput-object p1, p0, Ll/n55;->i:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView1;

    .line 87
    .line 88
    sget p1, Ll/adc0;->t1:I

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 95
    .line 96
    iput-object p1, p0, Ll/n55;->j:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView2;

    .line 97
    .line 98
    sget p1, Ll/adc0;->u1:I

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    check-cast p1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 105
    .line 106
    iput-object p1, p0, Ll/n55;->k:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView3;

    .line 107
    .line 108
    sget p1, Ll/adc0;->v1:I

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 115
    .line 116
    iput-object p1, p0, Ll/n55;->l:Lcom/p1/mobile/putong/core/ui/dlg/views/CityCoverView4;

    .line 117
    .line 118
    sget p1, Ll/adc0;->J4:I

    .line 119
    .line 120
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    check-cast p1, Landroid/widget/FrameLayout;

    .line 125
    .line 126
    iput-object p1, p0, Ll/n55;->m:Landroid/widget/FrameLayout;

    .line 127
    .line 128
    sget p1, Ll/adc0;->K4:I

    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lv/VText;

    .line 135
    .line 136
    iput-object p1, p0, Ll/n55;->n:Lv/VText;

    .line 137
    .line 138
    iget-object p0, p0, Ll/n55;->o:Lv/VText;

    .line 139
    .line 140
    const/4 p1, 0x3

    .line 141
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const/4 v0, 0x1

    .line 146
    invoke-virtual {p0, p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 147
    .line 148
    .line 149
    return-void
.end method

.method public show()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    return-void
.end method
