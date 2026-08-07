.class public Ll/zfp;
.super Ll/q27;
.source "SourceFile"


# instance fields
.field public g:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public h:Lv/VImage;

.field public i:Lv/VImage;

.field public j:Lv/VText_NoTopPadding;

.field public k:Lv/VText_NoTopPadding;

.field public l:Lv/VText_NoTopPadding;

.field public m:Lv/VText_NoTopPadding;

.field public final n:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q27;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zfp;->n:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic I(Ll/zfp;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zfp;->P(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/zfp;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/zfp;->N(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/zfp;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zfp;->O(ZLandroid/view/View;)V

    return-void
.end method

.method private M()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zfp;->n:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/zfp;->L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->q4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 26
    .line 27
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 28
    .line 29
    :cond_0
    const-string v0, "pending"

    .line 30
    .line 31
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iget-object v1, p0, Ll/zfp;->l:Lv/VText_NoTopPadding;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->f0:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->x1:I

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Ll/zfp;->l:Lv/VText_NoTopPadding;

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    sget v2, Ll/gbc0;->Y:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    sget v2, Ll/gbc0;->a0:I

    .line 55
    .line 56
    :goto_1
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Ll/zfp;->l:Lv/VText_NoTopPadding;

    .line 60
    .line 61
    const/4 v2, -0x1

    .line 62
    const/high16 v3, -0x1000000

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    move v4, v3

    .line 67
    goto :goto_2

    .line 68
    :cond_3
    move v4, v2

    .line 69
    :goto_2
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 70
    .line 71
    .line 72
    iget-object v1, p0, Ll/zfp;->m:Lv/VText_NoTopPadding;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->w1:I

    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_4
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->f0:I

    .line 80
    .line 81
    :goto_3
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(I)V

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Ll/zfp;->m:Lv/VText_NoTopPadding;

    .line 85
    .line 86
    if-eqz v0, :cond_5

    .line 87
    .line 88
    sget v4, Ll/gbc0;->Z:I

    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_5
    sget v4, Ll/gbc0;->Y:I

    .line 92
    .line 93
    :goto_4
    invoke-virtual {v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/zfp;->m:Lv/VText_NoTopPadding;

    .line 97
    .line 98
    if-eqz v0, :cond_6

    .line 99
    .line 100
    goto :goto_5

    .line 101
    :cond_6
    move v2, v3

    .line 102
    :goto_5
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p0, Ll/zfp;->l:Lv/VText_NoTopPadding;

    .line 106
    .line 107
    new-instance v2, Ll/wfp;

    .line 108
    .line 109
    invoke-direct {v2, p0, v0}, Ll/wfp;-><init>(Ll/zfp;Z)V

    .line 110
    .line 111
    .line 112
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object v1, p0, Ll/zfp;->m:Lv/VText_NoTopPadding;

    .line 116
    .line 117
    new-instance v2, Ll/xfp;

    .line 118
    .line 119
    invoke-direct {v2, p0, v0}, Ll/xfp;-><init>(Ll/zfp;Z)V

    .line 120
    .line 121
    .line 122
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/zfp;->h:Lv/VImage;

    .line 126
    .line 127
    new-instance v1, Ll/yfp;

    .line 128
    .line 129
    invoke-direct {v1, p0}, Ll/yfp;-><init>(Ll/zfp;)V

    .line 130
    .line 131
    .line 132
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method private synthetic N(ZLandroid/view/View;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p2, p0, Ll/zfp;->n:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    const-string v0, "certified"

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 16
    .line 17
    invoke-interface {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 18
    .line 19
    .line 20
    const-string p1, "e_intl_tribe_verification_premium_click"

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/zfp;->F()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string p1, "e_intl_tribe_verification_start_click"

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/zfp;->F()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p2, p0, Ll/zfp;->n:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-interface {p1, p2}, Ll/r97;->J0(Lcom/p1/mobile/android/app/Act;)V

    .line 50
    .line 51
    .line 52
    :goto_0
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method private synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public F()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_intl_tribe_verification_pop"

    .line 2
    .line 3
    return-object p0
.end method

.method public G()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zfp;->g:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public H()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public L(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/agp;->b(Ll/zfp;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic O(ZLandroid/view/View;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "e_intl_tribe_verification_start_click"

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zfp;->F()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/core/member/R$string;->L:I

    .line 13
    .line 14
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p2, p0, Ll/zfp;->n:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    const-string v0, "certified"

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->tribe:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 31
    .line 32
    invoke-interface {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->pr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 33
    .line 34
    .line 35
    const-string p1, "e_intl_tribe_verification_premium_click"

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/zfp;->F()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {p1, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/q27;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/zfp;->M()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
