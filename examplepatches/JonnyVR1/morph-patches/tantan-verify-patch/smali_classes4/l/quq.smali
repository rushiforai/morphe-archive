.class public Ll/quq;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/quq$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/quq$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/quq;->a:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 2

    .line 1
    new-instance p1, Ll/guq;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/guq;-><init>()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x320

    .line 7
    .line 8
    invoke-static {p0, p1, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic B(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "verification_center"

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Ll/x5l0;->m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v0, "verified"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0
.end method

.method public static synthetic D(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/of7;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "e_do_verification"

    .line 9
    .line 10
    const-string v1, "p_verify_to_like_more_popup"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/gra;->e()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Ll/aw90;->w0(Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    const-string v1, "button"

    .line 27
    .line 28
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Z1(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 33
    .line 34
    .line 35
    :goto_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic E(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_start_see_verified_trial"

    .line 2
    .line 3
    const-string v0, "p_inform_trial_popup"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {p1, p0}, Ll/quq;->P(Lcom/p1/mobile/android/app/Act;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v0, "verified"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0
.end method

.method public static H(Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

    .line 14
    .line 15
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static I()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->c3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/jj40;->f()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    return v0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    return v0
.end method

.method public static J(Ll/dvl;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->c3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/jj40;->f()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x2

    .line 12
    if-lt v0, v1, :cond_0

    .line 13
    .line 14
    invoke-interface {p0}, Ll/dvl;->e()Lv/VFrame;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public static K()Z
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const/4 v0, 0x0

    .line 25
    return v0
.end method

.method public static L()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->Y3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "diamond_valid"

    .line 8
    .line 9
    return-object v0

    .line 10
    :cond_0
    invoke-static {}, Ll/joa;->f4()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "svip_valid"

    .line 17
    .line 18
    return-object v0

    .line 19
    :cond_1
    invoke-static {}, Ll/dk90;->i()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const-string v0, "vip_valid"

    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_2
    invoke-static {}, Ll/joa;->Z3()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    const-string v0, "diamond_invalid"

    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_3
    invoke-static {}, Ll/joa;->g4()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    const-string v0, "svip_invalid"

    .line 44
    .line 45
    return-object v0

    .line 46
    :cond_4
    invoke-static {}, Ll/dk90;->i()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPUsed()Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const-string v0, "vip_invalid"

    .line 67
    .line 68
    return-object v0

    .line 69
    :cond_5
    const-string v0, "no_membership"

    .line 70
    .line 71
    return-object v0
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;Lv/VFrame;Ll/dvl;Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;)V
    .locals 6

    .line 1
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/spl0;->A()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-static {}, Ll/spl0;->B()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v1, Ll/kec0;->i6:I

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    sget v1, Ll/kec0;->j6:I

    .line 22
    .line 23
    :goto_1
    const/4 v2, 0x0

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;

    .line 29
    .line 30
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 31
    .line 32
    const/4 v2, -0x2

    .line 33
    const/4 v3, -0x1

    .line 34
    invoke-direct {v1, v3, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 35
    .line 36
    .line 37
    const/high16 v2, 0x42580000    # 54.0f

    .line 38
    .line 39
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 44
    .line 45
    const/high16 v4, 0x41000000    # 8.0f

    .line 46
    .line 47
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v4

    .line 51
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 52
    .line 53
    iput v4, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 54
    .line 55
    const/4 v4, 0x0

    .line 56
    invoke-virtual {p1, v0, v4, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Ll/spl0;->A()Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    invoke-static {}, Ll/spl0;->B()Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    invoke-interface {p2}, Ll/dvl;->n()Landroid/view/ViewStub;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    check-cast p2, Ll/wvl;

    .line 81
    .line 82
    invoke-interface {p2, p0}, Ll/wvl;->a(Lcom/p1/mobile/android/app/Act;)V

    .line 83
    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_3
    :goto_2
    invoke-interface {p2}, Ll/dvl;->a()Landroid/view/ViewStub;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p2}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    check-cast p2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;

    .line 95
    .line 96
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->o(Lcom/p1/mobile/android/app/Act;)V

    .line 97
    .line 98
    .line 99
    :goto_3
    new-instance p2, Landroid/widget/FrameLayout;

    .line 100
    .line 101
    invoke-direct {p2, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 102
    .line 103
    .line 104
    const/16 v1, 0x8

    .line 105
    .line 106
    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 107
    .line 108
    .line 109
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 110
    .line 111
    const/high16 v4, 0x42700000    # 60.0f

    .line 112
    .line 113
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v4

    .line 117
    const/high16 v5, 0x42480000    # 50.0f

    .line 118
    .line 119
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    invoke-direct {v1, v4, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 124
    .line 125
    .line 126
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 131
    .line 132
    const/high16 v2, 0x41a00000    # 20.0f

    .line 133
    .line 134
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->rightMargin:I

    .line 139
    .line 140
    const/4 v2, 0x5

    .line 141
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 142
    .line 143
    invoke-virtual {p1, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->h(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    .line 147
    .line 148
    .line 149
    new-instance p2, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;

    .line 150
    .line 151
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;-><init>(Landroid/content/Context;)V

    .line 152
    .line 153
    .line 154
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 155
    .line 156
    invoke-direct {v1, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealTransAvatarLayout;->f(Lcom/p1/mobile/android/app/Act;)V

    .line 163
    .line 164
    .line 165
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 168
    .line 169
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->F3()Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    new-instance p2, Ll/otq;

    .line 178
    .line 179
    invoke-direct {p2, v0}, Ll/otq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->D()Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    new-instance p1, Ll/ptq;

    .line 198
    .line 199
    invoke-direct {p1, v0}, Ll/ptq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;)V

    .line 200
    .line 201
    .line 202
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;Ll/dvl;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ll/dvl;->d()Lv/VIcon;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 18
    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 22
    .line 23
    if-ne v0, v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget v0, Ll/dbc0;->cd:I

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    sget v0, Ll/dbc0;->dd:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->F3()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    new-instance v0, Ll/quq$b;

    .line 50
    .line 51
    invoke-direct {v0, p1}, Ll/quq$b;-><init>(Lv/VIcon;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static O()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    const-string v1, "pending"

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    return v0

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    return v0
.end method

.method public static P(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/quq;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->q3()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->v3()V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 47
    .line 48
    if-eq p0, p1, :cond_2

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 59
    .line 60
    if-ne p0, v0, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 90
    .line 91
    if-eq v0, v1, :cond_7

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 102
    .line 103
    if-ne v0, v2, :cond_4

    .line 104
    .line 105
    goto :goto_3

    .line 106
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {v0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 128
    .line 129
    if-ne p1, v0, :cond_5

    .line 130
    .line 131
    const/4 p1, 0x1

    .line 132
    goto :goto_1

    .line 133
    :cond_5
    const/4 p1, 0x0

    .line 134
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 139
    .line 140
    .line 141
    sget-object v0, Ll/quq;->a:Ljava/lang/Runnable;

    .line 142
    .line 143
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 144
    .line 145
    .line 146
    sget-object v0, Ll/quq;->a:Ljava/lang/Runnable;

    .line 147
    .line 148
    if-eqz p1, :cond_6

    .line 149
    .line 150
    const-wide/16 v1, 0x12c

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :cond_6
    const-wide/16 v1, 0x0

    .line 154
    .line 155
    :goto_2
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_7
    :goto_3
    invoke-static {}, Ll/quq;->O()Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-eqz v0, :cond_8

    .line 164
    .line 165
    const-string p0, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d\uff0c\u5ba1\u6838\u901a\u8fc7\u540e\u53ef\u8bbe\u7f6e\u53ea\u770b\u8ba4\u8bc1\u7528\u6237"

    .line 166
    .line 167
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    const-string p0, "waiting"

    .line 171
    .line 172
    invoke-static {p0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 177
    .line 178
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 187
    .line 188
    .line 189
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 190
    .line 191
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 192
    .line 193
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->d0:Ll/jxd0;

    .line 194
    .line 195
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Ljava/lang/Boolean;

    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-nez p1, :cond_9

    .line 206
    .line 207
    invoke-static {p0}, Ll/quq;->U(Lcom/p1/mobile/android/app/Act;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_9
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->n3()I

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-gtz p1, :cond_a

    .line 220
    .line 221
    invoke-static {p0}, Ll/quq;->T(Lcom/p1/mobile/android/app/Act;)V

    .line 222
    .line 223
    .line 224
    return-void

    .line 225
    :cond_a
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 226
    .line 227
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 228
    .line 229
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 230
    .line 231
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 232
    .line 233
    .line 234
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 235
    .line 236
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 237
    .line 238
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->S8()V

    .line 239
    .line 240
    .line 241
    return-void
.end method

.method public static Q(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/quq;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->q3()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->v3()V

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 47
    .line 48
    if-eq p0, p1, :cond_2

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 59
    .line 60
    if-ne p0, v0, :cond_1

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 90
    .line 91
    if-eq v0, v1, :cond_5

    .line 92
    .line 93
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->FINISH:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 102
    .line 103
    if-ne v0, v2, :cond_4

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 122
    .line 123
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    :goto_1
    invoke-static {}, Ll/quq;->O()Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    const-string p0, "\u8ba4\u8bc1\u5ba1\u6838\u4e2d\uff0c\u5ba1\u6838\u901a\u8fc7\u540e\u53ef\u8bbe\u7f6e\u53ea\u770b\u8ba4\u8bc1\u7528\u6237"

    .line 134
    .line 135
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    const-string p0, "waiting"

    .line 139
    .line 140
    invoke-static {p0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->status:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v0, p1}, Ll/quq;->Z(Ljava/lang/String;Z)V

    .line 155
    .line 156
    .line 157
    invoke-static {p0}, Ll/quq;->T(Lcom/p1/mobile/android/app/Act;)V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public static R(Lcom/p1/mobile/putong/data/User;IIFFFFF)V
    .locals 8

    .line 1
    const/high16 v0, 0x43340000    # 180.0f

    .line 2
    .line 3
    div-float/2addr p7, v0

    .line 4
    float-to-double v0, p7

    .line 5
    const-wide v2, 0x400921fb54442d18L    # Math.PI

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    mul-double/2addr v0, v2

    .line 11
    double-to-float p7, v0

    .line 12
    const/high16 v0, 0x3f800000    # 1.0f

    .line 13
    .line 14
    mul-float/2addr p7, v0

    .line 15
    div-int/lit8 p1, p1, 0x2

    .line 16
    .line 17
    int-to-float p1, p1

    .line 18
    sub-float/2addr p1, p3

    .line 19
    div-int/lit8 p2, p2, 0x2

    .line 20
    .line 21
    int-to-float p2, p2

    .line 22
    sub-float/2addr p2, p4

    .line 23
    float-to-double v0, p1

    .line 24
    float-to-double v2, p7

    .line 25
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 26
    .line 27
    .line 28
    move-result-wide v4

    .line 29
    mul-double/2addr v4, v0

    .line 30
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 31
    .line 32
    .line 33
    move-result-wide v6

    .line 34
    float-to-double p1, p2

    .line 35
    mul-double/2addr v6, p1

    .line 36
    sub-double/2addr v4, v6

    .line 37
    invoke-static {v2, v3}, Ljava/lang/Math;->sin(D)D

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    mul-double/2addr v0, v6

    .line 42
    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    .line 43
    .line 44
    .line 45
    move-result-wide v2

    .line 46
    mul-double/2addr v2, p1

    .line 47
    add-double/2addr v0, v2

    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 51
    .line 52
    float-to-double p2, p3

    .line 53
    add-double/2addr v4, p2

    .line 54
    double-to-int p2, v4

    .line 55
    const/high16 p3, 0x41f00000    # 30.0f

    .line 56
    .line 57
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p7

    .line 61
    sub-int/2addr p2, p7

    .line 62
    int-to-float p2, p2

    .line 63
    add-float/2addr p2, p5

    .line 64
    float-to-double p4, p4

    .line 65
    add-double/2addr v0, p4

    .line 66
    double-to-int p4, v0

    .line 67
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result p3

    .line 71
    sub-int/2addr p4, p3

    .line 72
    int-to-float p3, p4

    .line 73
    add-float/2addr p3, p6

    .line 74
    invoke-virtual {p1, p0, p2, p3}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->B3(Lcom/p1/mobile/putong/data/User;FF)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static S(Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/jl80;)V
    .locals 6

    .line 1
    new-instance v0, Ll/bm5;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, p0, v1}, Ll/bm5;-><init>(Landroid/content/Context;I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/huq;

    .line 8
    .line 9
    invoke-direct {v1, p0, p2, v0}, Ll/huq;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/bm5;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/bm5;->D(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->B6:I

    .line 20
    .line 21
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->t5:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Landroid/text/SpannableStringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    sget v5, Ll/c9c0;->I:I

    .line 49
    .line 50
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    const/4 v5, 0x3

    .line 55
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    invoke-static {v1, v3, v4, v5}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v2, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 64
    .line 65
    .line 66
    new-instance v3, Ll/quq$f;

    .line 67
    .line 68
    invoke-direct {v3, v0, p0}, Ll/quq$f;-><init>(Ll/bm5;Lcom/p1/mobile/android/app/Act;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    invoke-virtual {v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    add-int/2addr v1, p2

    .line 84
    const/16 p2, 0x21

    .line 85
    .line 86
    invoke-virtual {v2, v3, v0, v1, p2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    sget p2, Ll/c9c0;->V1:I

    .line 104
    .line 105
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHighlightColor(I)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public static T(Lcom/p1/mobile/android/app/Act;)V
    .locals 12

    .line 1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->F8:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sget v1, Ll/adc0;->ub:I

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lv/VText;

    .line 19
    .line 20
    sget v2, Ll/adc0;->va:I

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Lv/VButton;

    .line 27
    .line 28
    sget v3, Ll/adc0;->ua:I

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Lv/VButton;

    .line 35
    .line 36
    sget v4, Ll/adc0;->ta:I

    .line 37
    .line 38
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    check-cast v4, Landroid/widget/TextView;

    .line 43
    .line 44
    const/4 v5, 0x1

    .line 45
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 50
    .line 51
    .line 52
    sget v6, Ll/adc0;->F6:I

    .line 53
    .line 54
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    check-cast v6, Landroid/widget/ImageView;

    .line 59
    .line 60
    sget v7, Ll/adc0;->A1:I

    .line 61
    .line 62
    invoke-virtual {v0, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    check-cast v7, Lv/VImage;

    .line 67
    .line 68
    invoke-static {}, Ll/gra;->c3()Z

    .line 69
    .line 70
    .line 71
    move-result v8

    .line 72
    if-eqz v8, :cond_1

    .line 73
    .line 74
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 77
    .line 78
    invoke-virtual {v8}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    if-eqz v8, :cond_0

    .line 87
    .line 88
    sget v8, Ll/dbc0;->k2:I

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    sget v8, Ll/dbc0;->h2:I

    .line 92
    .line 93
    :goto_0
    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 94
    .line 95
    .line 96
    goto :goto_3

    .line 97
    :cond_1
    invoke-static {}, Ll/gra;->z()Z

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    if-eqz v8, :cond_3

    .line 102
    .line 103
    sget v8, Ll/dbc0;->R:I

    .line 104
    .line 105
    invoke-virtual {v2, v8}, Landroid/view/View;->setBackgroundResource(I)V

    .line 106
    .line 107
    .line 108
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 111
    .line 112
    invoke-virtual {v8}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    .line 115
    move-result-object v8

    .line 116
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 117
    .line 118
    .line 119
    move-result v8

    .line 120
    if-eqz v8, :cond_2

    .line 121
    .line 122
    sget v8, Ll/dbc0;->Oh:I

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_2
    sget v8, Ll/dbc0;->Nh:I

    .line 126
    .line 127
    :goto_1
    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 128
    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_3
    sget-object v8, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 132
    .line 133
    iget-object v8, v8, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 134
    .line 135
    invoke-virtual {v8}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 136
    .line 137
    .line 138
    move-result-object v8

    .line 139
    invoke-virtual {v8}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 140
    .line 141
    .line 142
    move-result v8

    .line 143
    if-eqz v8, :cond_4

    .line 144
    .line 145
    sget v8, Ll/dbc0;->j2:I

    .line 146
    .line 147
    goto :goto_2

    .line 148
    :cond_4
    sget v8, Ll/dbc0;->g2:I

    .line 149
    .line 150
    :goto_2
    invoke-virtual {v6, v8}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 151
    .line 152
    .line 153
    :goto_3
    sget v6, Ll/adc0;->f1:I

    .line 154
    .line 155
    invoke-virtual {v0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    check-cast v6, Landroid/widget/CheckBox;

    .line 160
    .line 161
    const-class v8, Ll/g6e;

    .line 162
    .line 163
    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    const-string v9, "p_only_show_verified_ask_popup"

    .line 168
    .line 169
    invoke-static {v9, v8}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    invoke-static {v8}, Ll/w1e;->f(Ll/l4g0;)V

    .line 174
    .line 175
    .line 176
    new-instance v10, Ll/jl80$a;

    .line 177
    .line 178
    invoke-direct {v10, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v10, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    const/4 v10, 0x0

    .line 186
    invoke-virtual {v0, v10}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {v0, v10}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {}, Ll/gra;->c3()Z

    .line 199
    .line 200
    .line 201
    move-result v11

    .line 202
    if-eqz v11, :cond_5

    .line 203
    .line 204
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 205
    .line 206
    .line 207
    invoke-static {v7, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 208
    .line 209
    .line 210
    invoke-static {v4, v10}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    new-instance v5, Ll/quq$d;

    .line 214
    .line 215
    invoke-direct {v5, p0, v0}, Ll/quq$d;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 216
    .line 217
    .line 218
    invoke-static {v3, v5}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 219
    .line 220
    .line 221
    const-string v3, "e_only_show_verified_buy_svip"

    .line 222
    .line 223
    invoke-static {v3, v9}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    new-instance v3, Ll/ltq;

    .line 227
    .line 228
    invoke-direct {v3, v0}, Ll/ltq;-><init>(Ll/jl80;)V

    .line 229
    .line 230
    .line 231
    invoke-static {v7, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    :cond_5
    new-instance v3, Ll/quq$e;

    .line 235
    .line 236
    invoke-direct {v3, v8}, Ll/quq$e;-><init>(Ll/l4g0;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0, v3}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 240
    .line 241
    .line 242
    invoke-static {p0, v1, v0}, Ll/quq;->S(Lcom/p1/mobile/android/app/Act;Lv/VText;Ll/jl80;)V

    .line 243
    .line 244
    .line 245
    new-instance v1, Ll/mtq;

    .line 246
    .line 247
    invoke-direct {v1, v6, p0, v0}, Ll/mtq;-><init>(Landroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 248
    .line 249
    .line 250
    invoke-static {v2, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 251
    .line 252
    .line 253
    new-instance v1, Ll/ntq;

    .line 254
    .line 255
    invoke-direct {v1, v0, p0}, Ll/ntq;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v4, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public static U(Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->d0:Ll/jxd0;

    .line 6
    .line 7
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    const-class v0, Ll/g6e;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "p_inform_trial_popup"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    sget v2, Ll/kec0;->E8:I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget v2, Ll/adc0;->xa:I

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lv/VText;

    .line 45
    .line 46
    sget v3, Ll/adc0;->va:I

    .line 47
    .line 48
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Lv/VButton;

    .line 53
    .line 54
    sget v4, Ll/adc0;->F6:I

    .line 55
    .line 56
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    check-cast v4, Landroid/widget/ImageView;

    .line 61
    .line 62
    invoke-static {}, Ll/gra;->z()Z

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    if-eqz v5, :cond_0

    .line 67
    .line 68
    sget v5, Ll/dbc0;->R:I

    .line 69
    .line 70
    invoke-virtual {v3, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 71
    .line 72
    .line 73
    :cond_0
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 74
    .line 75
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 76
    .line 77
    invoke-virtual {v5}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-eqz v5, :cond_1

    .line 86
    .line 87
    sget v5, Ll/dbc0;->i2:I

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    sget v5, Ll/dbc0;->f2:I

    .line 91
    .line 92
    :goto_0
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 93
    .line 94
    .line 95
    sget v4, Ll/adc0;->ta:I

    .line 96
    .line 97
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v4, Landroid/widget/TextView;

    .line 102
    .line 103
    const/4 v5, 0x1

    .line 104
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 105
    .line 106
    .line 107
    move-result-object v6

    .line 108
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 109
    .line 110
    .line 111
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 112
    .line 113
    .line 114
    move-result-object v6

    .line 115
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v5}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 123
    .line 124
    .line 125
    new-instance v2, Ll/jl80$a;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    const/4 v2, 0x0

    .line 135
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v1, v2}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    new-instance v2, Ll/jtq;

    .line 148
    .line 149
    invoke-direct {v2, v1, p0}, Ll/jtq;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v3, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 153
    .line 154
    .line 155
    new-instance p0, Ll/ktq;

    .line 156
    .line 157
    invoke-direct {p0, v1}, Ll/ktq;-><init>(Ll/jl80;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v4, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    new-instance p0, Ll/quq$c;

    .line 164
    .line 165
    invoke-direct {p0, v0}, Ll/quq$c;-><init>(Ll/l4g0;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public static V(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->i3()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    sget v2, Ll/kec0;->g6:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealSuccessLayout;

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealSuccessLayout;->b(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 33
    .line 34
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x2

    .line 38
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 43
    .line 44
    const/high16 v1, 0x42700000    # 60.0f

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, -0x2

    .line 51
    invoke-direct {v0, v2, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->y(Landroid/view/ViewGroup$LayoutParams;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const/16 v0, 0x1b58

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->JUST_REAL_SUCCESS:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance v0, Ll/quq$g;

    .line 71
    .line 72
    invoke-direct {v0}, Ll/quq$g;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->F(Ll/x20;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static W(Lcom/p1/mobile/android/app/Act;)V
    .locals 7

    .line 1
    const-class v0, Ll/g6e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_verify_to_like_more_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/jl80$a;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    invoke-static {}, Ll/gra;->z()Z

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    sget v3, Ll/dbc0;->Mh:I

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    sget v3, Ll/dbc0;->e2:I

    .line 31
    .line 32
    :goto_0
    invoke-virtual {v2, v3}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {}, Ll/gra;->z()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    sget v3, Ll/dbc0;->R:I

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/4 v3, -0x1

    .line 46
    :goto_1
    invoke-virtual {v2, v3}, Ll/jl80$a;->d0(I)Ll/jl80$a;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {v2, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {v2, v3}, Ll/jl80$a;->M(Z)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-static {}, Ll/gra;->c3()Z

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    const/4 v4, 0x1

    .line 64
    const-string v5, "\u5ba1\u6838\u4e2d"

    .line 65
    .line 66
    const/16 v6, 0xa

    .line 67
    .line 68
    if-nez v3, :cond_5

    .line 69
    .line 70
    invoke-static {}, Ll/gra;->e()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_2

    .line 75
    .line 76
    goto :goto_3

    .line 77
    :cond_2
    const-string v1, "\u8ba4\u8bc1\u540e\uff0c\u7ee7\u7eed\u53d1\u51fa\u66f4\u591a\u559c\u6b22"

    .line 78
    .line 79
    invoke-virtual {v2, v1}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {}, Ll/gra;->a3()Lcom/p1/mobile/putong/core/data/SwipeVerifiedConfig;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    invoke-static {}, Ll/gra;->a3()Lcom/p1/mobile/putong/core/data/SwipeVerifiedConfig;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    iget v6, v2, Lcom/p1/mobile/putong/core/data/SwipeVerifiedConfig;->verified_user_additional_like_count:I

    .line 98
    .line 99
    :cond_3
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    const-string v3, "\u4eca\u5929\u53f3\u6ed1\u6570\u91cf\u8fbe\u5230\u4e0a\u9650\uff0c\u5b8c\u6210\u771f\u4eba\u8ba4\u8bc1\u540e\uff0c\u6bcf\u5929\u80fd\u591a\u53d1\u51fa%d\u6b21\u559c\u6b22"

    .line 108
    .line 109
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-static {}, Ll/of7;->s()Z

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-eqz v2, :cond_4

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_4
    const-string v5, "\u53bb\u8ba4\u8bc1"

    .line 125
    .line 126
    :goto_2
    invoke-virtual {v1, v5}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    const-string v2, "\u53d6\u6d88"

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ll/jl80$a;->W(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {v1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    goto/16 :goto_7

    .line 141
    .line 142
    :cond_5
    :goto_3
    invoke-static {}, Ll/gra;->b3()Lcom/p1/mobile/putong/core/data/NonExpansionCardSwipeVerifiedConfig;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-eqz v3, :cond_6

    .line 151
    .line 152
    invoke-static {}, Ll/gra;->b3()Lcom/p1/mobile/putong/core/data/NonExpansionCardSwipeVerifiedConfig;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    iget v6, v3, Lcom/p1/mobile/putong/core/data/NonExpansionCardSwipeVerifiedConfig;->verified_user_additional_like_count:I

    .line 157
    .line 158
    :cond_6
    invoke-static {}, Ll/of7;->s()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_7

    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_7
    invoke-static {}, Ll/bnl0;->y0()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    const v5, 0x43bb8000    # 375.0f

    .line 170
    .line 171
    .line 172
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 173
    .line 174
    .line 175
    move-result v5

    .line 176
    if-ge v3, v5, :cond_8

    .line 177
    .line 178
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v3

    .line 186
    const-string v5, "\u53bb\u8ba4\u8bc1\uff0c\u53f3\u6ed1+%s\u6b21"

    .line 187
    .line 188
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v5

    .line 192
    goto :goto_4

    .line 193
    :cond_8
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    const-string v5, "\u53bb\u8ba4\u8bc1\uff0c\u6bcf\u5929\u53f3\u6ed1+%s\u6b21"

    .line 202
    .line 203
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    :goto_4
    const-string v3, "\u7ee7\u7eed\u53d1\u51fa\u66f4\u591a\u559c\u6b22"

    .line 208
    .line 209
    invoke-virtual {v2, v3}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-static {}, Ll/spl0;->m()Z

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    if-eqz v3, :cond_9

    .line 218
    .line 219
    const-string v3, "\u4f1a\u5458"

    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_9
    const-string v3, "VIP"

    .line 223
    .line 224
    :goto_5
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    const-string v6, "\u4eca\u5929\u53f3\u6ed1\u6570\u91cf\u5df2\u7528\u5b8c\uff0c\u5b8c\u6210\u771f\u4eba\u8ba4\u8bc1\u6216\u5f00\u901a%s\uff0c\u6bcf\u5929\u53d1\u51fa\u66f4\u591a\u559c\u6b22"

    .line 229
    .line 230
    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    invoke-virtual {v2, v3}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    invoke-virtual {v2, v5}, Ll/jl80$a;->b0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {v2, v4}, Ll/jl80$a;->p0(Z)Ll/jl80$a;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    new-instance v3, Ll/nuq;

    .line 247
    .line 248
    invoke-direct {v3, p0}, Ll/nuq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v2, v3}, Ll/jl80$a;->m0(Ljava/lang/Runnable;)Ll/jl80$a;

    .line 252
    .line 253
    .line 254
    move-result-object v2

    .line 255
    invoke-static {}, Ll/spl0;->m()Z

    .line 256
    .line 257
    .line 258
    move-result v3

    .line 259
    if-eqz v3, :cond_a

    .line 260
    .line 261
    const-string v3, "\u5f00\u901a\u4f1a\u5458\uff0c\u65e0\u9650\u53f3\u6ed1"

    .line 262
    .line 263
    goto :goto_6

    .line 264
    :cond_a
    const-string v3, "\u5f00\u901aVIP\uff0c\u6bcf\u5929\u65e0\u9650\u53f3\u6ed1"

    .line 265
    .line 266
    :goto_6
    invoke-virtual {v2, v3}, Ll/jl80$a;->j0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    invoke-virtual {v2}, Ll/jl80$a;->r0()Ll/jl80;

    .line 271
    .line 272
    .line 273
    move-result-object v2

    .line 274
    new-instance v3, Ll/quq$h;

    .line 275
    .line 276
    invoke-direct {v3, v2, p0}, Ll/quq$h;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v2, v3}, Ll/jl80;->X(Ljava/lang/Runnable;)V

    .line 280
    .line 281
    .line 282
    const-string v3, "e_verify_add_likes_buy_vip"

    .line 283
    .line 284
    invoke-static {v3, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    move-object v1, v2

    .line 288
    :goto_7
    new-instance v2, Ll/ouq;

    .line 289
    .line 290
    invoke-direct {v2, p0, v1}, Ll/ouq;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v1, v2}, Ll/jl80;->W(Ljava/lang/Runnable;)V

    .line 294
    .line 295
    .line 296
    new-instance p0, Ll/quq$i;

    .line 297
    .line 298
    invoke-direct {p0, v0}, Ll/quq$i;-><init>(Ll/l4g0;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 302
    .line 303
    .line 304
    new-instance p0, Ll/puq;

    .line 305
    .line 306
    invoke-direct {p0, v1}, Ll/puq;-><init>(Ll/jl80;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v1, p0}, Ll/jl80;->V(Ljava/lang/Runnable;)V

    .line 310
    .line 311
    .line 312
    invoke-static {}, Ll/gra;->K1()Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_b

    .line 317
    .line 318
    invoke-static {}, Ll/gra;->c3()Z

    .line 319
    .line 320
    .line 321
    move-result p0

    .line 322
    if-eqz p0, :cond_c

    .line 323
    .line 324
    :cond_b
    invoke-static {}, Ll/of7;->s()Z

    .line 325
    .line 326
    .line 327
    move-result p0

    .line 328
    if-nez p0, :cond_c

    .line 329
    .line 330
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 331
    .line 332
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 333
    .line 334
    iget-object p0, p0, Ll/dkb;->B5:Ll/vxd0;

    .line 335
    .line 336
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v0

    .line 340
    check-cast v0, Ljava/lang/Integer;

    .line 341
    .line 342
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    add-int/2addr v0, v4

    .line 347
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    :cond_c
    return-void
.end method

.method public static X(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 25
    .line 26
    const-string v1, "svip"

    .line 27
    .line 28
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    new-instance v1, Ll/qtq;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/qtq;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/rtq;

    .line 50
    .line 51
    invoke-direct {v1}, Ll/rtq;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v2, Ll/stq;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/stq;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ll/utq;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/utq;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/vtq;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/vtq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 111
    .line 112
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->T:Lrx/subjects/b;

    .line 113
    .line 114
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    new-instance v1, Ll/wtq;

    .line 119
    .line 120
    invoke-direct {v1, p0}, Ll/wtq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 121
    .line 122
    .line 123
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 128
    .line 129
    .line 130
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 133
    .line 134
    invoke-virtual {v0}, Ll/dx6;->h3()Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/xtq;

    .line 139
    .line 140
    invoke-direct {v1}, Ll/xtq;-><init>()V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v1, Ll/ytq;

    .line 156
    .line 157
    invoke-direct {v1}, Ll/ytq;-><init>()V

    .line 158
    .line 159
    .line 160
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 165
    .line 166
    .line 167
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 168
    .line 169
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    new-instance v1, Ll/ztq;

    .line 180
    .line 181
    invoke-direct {v1}, Ll/ztq;-><init>()V

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    new-instance v0, Ll/auq;

    .line 193
    .line 194
    invoke-direct {v0}, Ll/auq;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 202
    .line 203
    .line 204
    return-void
.end method

.method public static Y(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 4
    .line 5
    const-string v1, "svip"

    .line 6
    .line 7
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/joa;->v3(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/itq;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/itq;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/ttq;

    .line 33
    .line 34
    invoke-direct {v1}, Ll/ttq;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/euq;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/euq;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/dx6;->h3()Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/juq;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/juq;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/kuq;

    .line 75
    .line 76
    invoke-direct {v1}, Ll/kuq;-><init>()V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ll/luq;

    .line 99
    .line 100
    invoke-direct {v1}, Ll/luq;-><init>()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v0, Ll/muq;

    .line 112
    .line 113
    invoke-direct {v0}, Ll/muq;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public static Z(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 5
    .line 6
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    const-string p1, "1"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string p1, "0"

    .line 22
    .line 23
    :goto_0
    const-string v0, "function_status"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "has_verified"

    .line 30
    .line 31
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "membership_status"

    .line 36
    .line 37
    invoke-static {}, Ll/quq;->L()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    filled-new-array {p0, p1, v0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "e_only_show_verified_user"

    .line 50
    .line 51
    const-string v0, "p_suggest_users_home_view"

    .line 52
    .line 53
    invoke-static {p1, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->E2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->U3()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/buq;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/buq;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/cuq;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/cuq;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public static synthetic d(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/gra;->E2()Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->U3()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance p1, Ll/duq;

    .line 23
    .line 24
    invoke-direct {p1}, Ll/duq;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance p2, Ll/fuq;

    .line 28
    .line 29
    invoke-direct {p2}, Ll/fuq;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public static synthetic e(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/quq;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 16
    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 28
    .line 29
    if-ne v0, v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 35
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget-object v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 50
    .line 51
    if-ne v2, v3, :cond_2

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 65
    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 69
    .line 70
    .line 71
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    xor-int/2addr p0, v0

    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L5()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 95
    .line 96
    if-eq p0, v0, :cond_6

    .line 97
    .line 98
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 107
    .line 108
    if-ne p0, v0, :cond_5

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    return-void

    .line 112
    :cond_6
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 119
    .line 120
    .line 121
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L5()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public static synthetic f(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/joa;->f4()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 22
    .line 23
    if-eq p0, v0, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 34
    .line 35
    if-ne p0, v0, :cond_1

    .line 36
    .line 37
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->v3()V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public static synthetic g(Ll/jl80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Landroid/widget/CheckBox;Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p3, "e_do_verification"

    .line 2
    .line 3
    const-string v0, "p_only_show_verified_ask_popup"

    .line 4
    .line 5
    invoke-static {p3, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Bs:I

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const/4 p0, 0x1

    .line 29
    const-string p3, "verification_center"

    .line 30
    .line 31
    invoke-static {p1, p0, p3}, Ll/x5l0;->m(Lcom/p1/mobile/android/app/Act;ILjava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    invoke-static {p1, p3}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    invoke-virtual {p2}, Ll/g1e;->dismiss()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic i(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/VerificationCenter;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v0, "verified"

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->F0:Ll/dx6;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dx6;->q3()Lrx/c;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic l(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/quq;->K()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 16
    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 28
    .line 29
    if-ne v0, v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v0, 0x0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 35
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_3

    .line 40
    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 44
    .line 45
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget-object v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 50
    .line 51
    if-ne v2, v3, :cond_2

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 65
    .line 66
    sget-object v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 69
    .line 70
    .line 71
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    xor-int/2addr p0, v0

    .line 76
    if-eqz p0, :cond_5

    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L5()V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_4
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 95
    .line 96
    if-eq p0, v0, :cond_6

    .line 97
    .line 98
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 107
    .line 108
    if-ne p0, v0, :cond_5

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    return-void

    .line 112
    :cond_6
    :goto_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 117
    .line 118
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 119
    .line 120
    .line 121
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L5()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public static synthetic m(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

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
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/util/Collection;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    new-instance p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->QuestionOfNotVerify:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 29
    .line 30
    const-string v0, "VirtualCard"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic n(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V
    .locals 3

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p1, v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->g(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    move v1, v2

    .line 23
    :goto_0
    invoke-virtual {p0, v2, v1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;->g(ZZ)V

    .line 24
    .line 25
    .line 26
    :cond_2
    return-void
.end method

.method public static synthetic p(Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pf60;->b:Ljava/lang/Object;

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
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/pf60;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ljava/util/Collection;

    .line 14
    .line 15
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    new-instance p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 24
    .line 25
    .line 26
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->QuestionOfNotVerify:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 29
    .line 30
    const-string v0, "VirtualCard"

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 44
    .line 45
    .line 46
    :cond_0
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/joa;->U3(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/joa;->U3(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic s()V
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->FemaleVerificationGuideCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 9
    .line 10
    const-string v1, "VirtualCard"

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->LEFT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->w6(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)Lrx/c;

    .line 24
    .line 25
    .line 26
    const-string v0, "e_trial_end_card"

    .line 27
    .line 28
    const-string v1, "p_suggest_users_home_view"

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHeadLayout;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->G6()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->PRE_START:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 26
    .line 27
    if-ne p0, p1, :cond_1

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->l3()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    invoke-static {}, Ll/spl0;->A()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    invoke-static {}, Ll/spl0;->B()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/data/AdvancedSettings;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AdvancedSettings;->realFace:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/bm5;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    new-instance p3, Ll/iuq;

    .line 8
    .line 9
    invoke-direct {p3, p0, p1}, Ll/iuq;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v0, 0xc8

    .line 13
    .line 14
    invoke-static {p0, p3, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2}, Ll/bm5;->dismiss()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic w(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/quq;->K()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 22
    .line 23
    if-eq p0, v0, :cond_0

    .line 24
    .line 25
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 34
    .line 35
    if-ne p0, v0, :cond_1

    .line 36
    .line 37
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->IDLE:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->z3(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public static synthetic y(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_4

    .line 20
    .line 21
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->w3()V

    .line 26
    .line 27
    .line 28
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast p1, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_5

    .line 37
    .line 38
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->TRIALING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 55
    .line 56
    if-ne v0, v1, :cond_1

    .line 57
    .line 58
    const/4 v0, 0x1

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/4 v0, 0x0

    .line 61
    :goto_0
    invoke-static {p0}, Ll/quq;->V(Lcom/p1/mobile/android/app/Act;)V

    .line 62
    .line 63
    .line 64
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->h3()V

    .line 69
    .line 70
    .line 71
    if-eqz p1, :cond_4

    .line 72
    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    sget-object p1, Ll/quq;->a:Ljava/lang/Runnable;

    .line 76
    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    const-wide/16 v0, 0x12c

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    const-wide/16 v0, 0x0

    .line 83
    .line 84
    :goto_1
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_3
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->S8()V

    .line 93
    .line 94
    .line 95
    :cond_4
    return-void

    .line 96
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->i3()Ljava/util/List;

    .line 101
    .line 102
    .line 103
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->h3()V

    .line 108
    .line 109
    .line 110
    return-void
.end method
