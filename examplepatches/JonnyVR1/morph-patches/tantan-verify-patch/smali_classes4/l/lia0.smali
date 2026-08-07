.class public Ll/lia0;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VImage;

.field public j:Lv/VText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f6l;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Ll/lia0;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lia0;->V(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic E(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lia0;->X(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lia0;->R(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/lia0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lia0;->W(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic H(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/lia0;->P(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/lia0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lia0;->O(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic J(Ll/lia0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lia0;->U()V

    return-void
.end method

.method public static synthetic K(Ll/lia0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lia0;->Q(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic L(Ll/lia0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lia0;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lia0;->S(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p2}, Ll/lia0;->Z(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0, p2}, Ll/lia0;->a0(Lcom/p1/mobile/putong/data/User;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final N(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/mia0;->a(Ll/lia0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic O(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {}, Ll/joa;->k4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "ultraPremium"

    .line 16
    .line 17
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->ultra_premium_badge:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    const/4 v6, 0x0

    .line 45
    move-object v3, p1

    .line 46
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic P(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p3, Ll/jia0;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2}, Ll/jia0;-><init>(Ll/lia0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p3}, Ll/lia0;->Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic Q(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/joa;->f4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "svip"

    .line 16
    .line 17
    invoke-static {v0}, Ll/oql0;->a(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->c2(Landroid/content/Context;I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic R(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p3, Ll/gia0;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2}, Ll/gia0;-><init>(Ll/lia0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p3}, Ll/lia0;->Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic S(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p4, Ll/iia0;

    .line 2
    .line 3
    invoke-direct {p4, p0, p2, p3}, Ll/iia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p4}, Ll/lia0;->Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic U()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/vip/VipAct;->b2(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p2, Ll/kia0;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/kia0;-><init>(Ll/lia0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/lia0;->Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic W(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->I1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    new-instance p3, Ll/hia0;

    .line 2
    .line 3
    invoke-direct {p3, p0, p2}, Ll/hia0;-><init>(Ll/lia0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1, p3}, Ll/lia0;->Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final Y(Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string p1, "is_myself"

    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p1, "banner_privilege_type"

    .line 16
    .line 17
    const-string v0, ""

    .line 18
    .line 19
    invoke-static {p1, v0}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    filled-new-array {p0, p1}, [Ll/sfj0$a;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "e_vip_banner"

    .line 28
    .line 29
    const-string v0, "p_suggest_user_profile_info_view"

    .line 30
    .line 31
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p2}, Ll/x20;->call()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final Z(Lcom/p1/mobile/putong/data/User;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/lia0;->i:Lv/VImage;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/lia0;->j:Lv/VText;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/lia0;->h:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    sget v2, Lcom/p1/mobile/putong/core/R$string;->kc:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget v2, Lcom/p1/mobile/putong/core/R$string;->lc:I

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/d79;->V()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const-string v2, "p_suggest_user_profile_info_view,e_banner_button,click"

    .line 42
    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isUltraPremium()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_1

    .line 50
    .line 51
    iget-object v0, p0, Ll/lia0;->i:Lv/VImage;

    .line 52
    .line 53
    sget v1, Ll/dbc0;->C2:I

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Ll/lia0;->g:Lv/VImage;

    .line 59
    .line 60
    sget v1, Ll/dbc0;->p2:I

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 66
    .line 67
    const-string v1, "#F7E6FF"

    .line 68
    .line 69
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 77
    .line 78
    new-instance v1, Ll/dia0;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1, v2}, Ll/dia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    invoke-static {}, Ll/d79;->T()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-object v0, p0, Ll/lia0;->i:Lv/VImage;

    .line 100
    .line 101
    sget v1, Ll/dbc0;->q2:I

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/lia0;->g:Lv/VImage;

    .line 107
    .line 108
    sget v1, Ll/dbc0;->r2:I

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 114
    .line 115
    const-string v1, "#FFE8B1"

    .line 116
    .line 117
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 125
    .line 126
    new-instance v1, Ll/eia0;

    .line 127
    .line 128
    invoke-direct {v1, p0, p1, v2}, Ll/eia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 132
    .line 133
    .line 134
    return-void

    .line 135
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_3

    .line 140
    .line 141
    iget-object v1, p0, Ll/lia0;->i:Lv/VImage;

    .line 142
    .line 143
    sget v3, Ll/dbc0;->s2:I

    .line 144
    .line 145
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 146
    .line 147
    .line 148
    iget-object v1, p0, Ll/lia0;->g:Lv/VImage;

    .line 149
    .line 150
    sget v3, Ll/dbc0;->t2:I

    .line 151
    .line 152
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 156
    .line 157
    const-string v3, "#FFEDA3"

    .line 158
    .line 159
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v3

    .line 163
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 164
    .line 165
    .line 166
    iget-object v1, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 167
    .line 168
    new-instance v3, Ll/fia0;

    .line 169
    .line 170
    invoke-direct {v3, p0, p1, v0, v2}, Ll/fia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    :cond_3
    return-void
.end method

.method public final a0(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/lia0;->i:Lv/VImage;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/lia0;->j:Lv/VText;

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/lia0;->g:Lv/VImage;

    .line 22
    .line 23
    sget v2, Ll/dbc0;->t2:I

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 29
    .line 30
    const-string v2, "#FFEDA3"

    .line 31
    .line 32
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    iget-object v2, p0, Ll/lia0;->h:Lv/VText;

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    sget v0, Lcom/p1/mobile/putong/core/R$string;->bt:I

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 53
    .line 54
    new-instance v1, Ll/bia0;

    .line 55
    .line 56
    invoke-direct {v1, p0, p1}, Ll/bia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isVIPExpired()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ct:I

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->at:I

    .line 73
    .line 74
    :goto_0
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/lia0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 78
    .line 79
    new-instance v1, Ll/cia0;

    .line 80
    .line 81
    const-string v2, "p_suggest_user_profile_info_view,e_banner_button,click"

    .line 82
    .line 83
    invoke-direct {v1, p0, p1, v2}, Ll/cia0;-><init>(Ll/lia0;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/lia0;->N(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
