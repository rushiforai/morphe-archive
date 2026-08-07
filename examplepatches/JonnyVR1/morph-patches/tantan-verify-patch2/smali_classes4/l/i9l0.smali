.class public Ll/i9l0;
.super Ll/f6l;
.source "SourceFile"


# instance fields
.field public f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VImage;


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

.method public static synthetic D(Ll/i9l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i9l0;->M()V

    return-void
.end method

.method public static synthetic E(Ll/i9l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i9l0;->J()V

    return-void
.end method

.method public static synthetic F(Ll/i9l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i9l0;->L()V

    return-void
.end method

.method public static synthetic G(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_avatarverification_banner_click"

    .line 2
    .line 3
    const-string v0, "p_suggest_user_profile_info_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic H(Ll/i9l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/i9l0;->K()V

    return-void
.end method


# virtual methods
.method public B(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Lcom/p1/mobile/putong/data/User;III)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 22
    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Ll/i9l0;->N(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_0
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 44
    .line 45
    new-instance v4, Ll/d9l0;

    .line 46
    .line 47
    invoke-direct {v4, p0}, Ll/d9l0;-><init>(Ll/i9l0;)V

    .line 48
    .line 49
    .line 50
    iget-object v5, p0, Ll/i9l0;->h:Lv/VText;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget v3, Lcom/p1/mobile/putong/core/R$string;->bs:I

    .line 57
    .line 58
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const/4 v2, 0x0

    .line 63
    const/4 v3, 0x1

    .line 64
    move-object v0, p0

    .line 65
    invoke-virtual/range {v0 .. v6}, Ll/i9l0;->O(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 70
    .line 71
    new-instance v4, Ll/e9l0;

    .line 72
    .line 73
    invoke-direct {v4, p0}, Ll/e9l0;-><init>(Ll/i9l0;)V

    .line 74
    .line 75
    .line 76
    iget-object v5, p0, Ll/i9l0;->h:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sget v3, Lcom/p1/mobile/putong/core/R$string;->cs:I

    .line 83
    .line 84
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v6

    .line 88
    const/4 v2, 0x0

    .line 89
    const/4 v3, 0x1

    .line 90
    move-object v0, p0

    .line 91
    invoke-virtual/range {v0 .. v6}, Ll/i9l0;->O(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/j9l0;->a(Ll/i9l0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic J()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic K()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic L()V
    .locals 2

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
    const/4 v1, 0x0

    .line 10
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic M()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 9

    .line 1
    const-string v2, "verified"

    .line 2
    .line 3
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    const/4 v7, 0x0

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 11
    .line 12
    invoke-static {v0, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v2, "pending"

    .line 17
    .line 18
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const/4 v8, 0x1

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 26
    .line 27
    invoke-static {v1, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 31
    .line 32
    new-instance v4, Ll/g9l0;

    .line 33
    .line 34
    invoke-direct {v4, p0}, Ll/g9l0;-><init>(Ll/i9l0;)V

    .line 35
    .line 36
    .line 37
    iget-object v5, p0, Ll/i9l0;->h:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Zr:I

    .line 44
    .line 45
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const/4 v2, 0x0

    .line 50
    const/4 v3, 0x1

    .line 51
    move-object v0, p0

    .line 52
    invoke-virtual/range {v0 .. v6}, Ll/i9l0;->O(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/i9l0;->i:Lv/VImage;

    .line 56
    .line 57
    invoke-static {v0, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    const-string v2, "rejected"

    .line 62
    .line 63
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    sget v2, Lcom/p1/mobile/putong/core/R$string;->as:I

    .line 74
    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    :goto_0
    move-object v6, v1

    .line 80
    goto :goto_1

    .line 81
    :cond_2
    invoke-virtual {p0}, Ll/f6l;->w()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bs:I

    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    goto :goto_0

    .line 92
    :goto_1
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 93
    .line 94
    invoke-static {v1, v8}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/i9l0;->f:Lcom/p1/mobile/putong/core/ui/roundcorners/view/RoundFrameLayout;

    .line 98
    .line 99
    new-instance v4, Ll/h9l0;

    .line 100
    .line 101
    invoke-direct {v4, p0}, Ll/h9l0;-><init>(Ll/i9l0;)V

    .line 102
    .line 103
    .line 104
    iget-object v5, p0, Ll/i9l0;->h:Lv/VText;

    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    const/4 v3, 0x1

    .line 108
    move-object v0, p0

    .line 109
    invoke-virtual/range {v0 .. v6}, Ll/i9l0;->O(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/i9l0;->i:Lv/VImage;

    .line 113
    .line 114
    invoke-static {v0, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public O(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 8
    .line 9
    .line 10
    new-instance p0, Ll/f9l0;

    .line 11
    .line 12
    invoke-direct {p0, p4}, Ll/f9l0;-><init>(Ll/x20;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-virtual {p5, p6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/dmf;->g(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/i9l0;->I(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
