.class public Ll/qmc0;
.super Ll/pej0;
.source "SourceFile"


# instance fields
.field public f:Lv/VLinear;

.field public g:Landroid/widget/ImageView;

.field public h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

.field public l:Ll/l4g0;

.field public final m:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
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
    const-string p1, "p_messages_verify_popup"

    .line 7
    .line 8
    iput-object p1, p0, Ll/qmc0;->m:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A(Ll/qmc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qmc0;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic C(Ll/qmc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qmc0;->I(Landroid/view/View;)V

    return-void
.end method

.method private E()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/qmc0;->f:Lv/VLinear;

    .line 6
    .line 7
    new-instance v2, Ll/pmc0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/pmc0;-><init>(Ll/qmc0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x3

    .line 20
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    const/4 v1, -0x1

    .line 30
    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setLayout(II)V

    .line 31
    .line 32
    .line 33
    const v1, 0x3e99999a    # 0.3f

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDimAmount(F)V

    .line 37
    .line 38
    .line 39
    const v1, 0x1020002

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sget v1, Ll/odc0;->p:I

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Landroid/widget/FrameLayout;

    .line 53
    .line 54
    sget v1, Ll/tbc0;->a0:I

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/qmc0$a;

    .line 64
    .line 65
    invoke-direct {v1, p0, v0}, Ll/qmc0$a;-><init>(Ll/qmc0;Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method private synthetic F()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->getBehavior()Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/qmc0;->f:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_verify_upper_button"

    .line 2
    .line 3
    const-string v0, "p_messages_verify_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->s()Landroid/app/Activity;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {p1}, Ll/aw90;->w0(Lcom/p1/mobile/android/app/Act;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p1, "e_verify_svip_button"

    .line 2
    .line 3
    const-string v0, "p_messages_verify_popup"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ll/pej0;->m()Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "p_messages,verify_popup"

    .line 21
    .line 22
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 23
    .line 24
    invoke-interface {p1, v0, v1, v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic x(Ll/qmc0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qmc0;->J(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic y(Ll/qmc0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qmc0;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z(Ll/qmc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qmc0;->F()V

    return-void
.end method


# virtual methods
.method public D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rmc0;->b(Ll/qmc0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic J(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qmc0;->l:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pej0;->s()Landroid/app/Activity;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p0, p1, v0}, Ll/qmc0;->D(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/qmc0;->h:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 21
    .line 22
    const-string v0, "\u4e3a\u4e86\u4fdd\u62a4\u771f\u5b9e\u7528\u6237\u4f53\u9a8c\uff0c\u672a\u8ba4\u8bc1\u7528\u6237\u9650\u5236\u914d\u5bf9\u6b21\u6570"

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/qmc0;->i:Lv/VText;

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "\u6bcf\u65e5\u914d\u5bf9\u4e0a\u9650"

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/gra;->Q0()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, "\u6b21\uff0c\u8ba4\u8bc1\u540e\u914d\u5bf9\u65e0\u4e0a\u9650"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/qmc0;->g:Landroid/widget/ImageView;

    .line 56
    .line 57
    new-instance v0, Ll/lmc0;

    .line 58
    .line 59
    invoke-direct {v0, p0}, Ll/lmc0;-><init>(Ll/qmc0;)V

    .line 60
    .line 61
    .line 62
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/qmc0;->j:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 66
    .line 67
    new-instance v0, Ll/mmc0;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/mmc0;-><init>(Ll/qmc0;)V

    .line 70
    .line 71
    .line 72
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Ll/qmc0;->k:Lcom/p1/mobile/putong/core/ui/VText_Medium;

    .line 76
    .line 77
    new-instance v0, Ll/nmc0;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/nmc0;-><init>(Ll/qmc0;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 83
    .line 84
    .line 85
    const/4 p1, 0x1

    .line 86
    invoke-virtual {p0, p1}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/qmc0;->l:Ll/l4g0;

    .line 90
    .line 91
    if-nez p1, :cond_0

    .line 92
    .line 93
    const-class p1, Ll/qmc0;

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    const-string v0, "p_messages_verify_popup"

    .line 100
    .line 101
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    iput-object p1, p0, Ll/qmc0;->l:Ll/l4g0;

    .line 106
    .line 107
    :cond_0
    iget-object p1, p0, Ll/qmc0;->l:Ll/l4g0;

    .line 108
    .line 109
    invoke-static {p1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Ll/omc0;

    .line 113
    .line 114
    invoke-direct {p1, p0}, Ll/omc0;-><init>(Ll/qmc0;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public show()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Dialog;->show()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/qmc0;->E()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
