.class public Ll/m2b0;
.super Ll/bo90;
.source "SourceFile"


# instance fields
.field public A:Ll/g4b0;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VImage;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/core/data/VerificationCenter;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/bo90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/g4b0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/g4b0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/m2b0;->A:Ll/g4b0;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic W(Ll/x20;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_id_verification_banner_click"

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

.method public static synthetic X(Ll/m2b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m2b0;->b0()V

    return-void
.end method

.method public static synthetic Y(Ll/m2b0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/m2b0;->a0()V

    return-void
.end method

.method public static synthetic Z(Ll/m2b0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m2b0;->c0()V

    return-void
.end method

.method private synthetic a0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/on2;->c:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll/t3m;

    .line 4
    .line 5
    return-object p0
.end method

.method public S()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->g3()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    const/4 v2, 0x1

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 57
    .line 58
    const-string v3, "verified"

    .line 59
    .line 60
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    return v1

    .line 67
    :cond_1
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 68
    .line 69
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 82
    .line 83
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    return v2

    .line 90
    :cond_2
    return v1

    .line 91
    :cond_3
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_4

    .line 104
    .line 105
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-interface {p0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_4

    .line 118
    .line 119
    return v2

    .line 120
    :cond_4
    return v1
.end method

.method public final synthetic b0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic c0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v0, p0}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public d0(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ep90;->Q(Landroid/view/View;I)V

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
    new-instance p0, Ll/l2b0;

    .line 11
    .line 12
    invoke-direct {p0, p4}, Ll/l2b0;-><init>(Ll/x20;)V

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

.method public final e0(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V
    .locals 8

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
    iget-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 11
    .line 12
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_0
    const-string v2, "pending"

    .line 18
    .line 19
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x1

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    new-instance v4, Ll/j2b0;

    .line 34
    .line 35
    invoke-direct {v4, p0}, Ll/j2b0;-><init>(Ll/m2b0;)V

    .line 36
    .line 37
    .line 38
    iget-object v5, p0, Ll/m2b0;->y:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    sget v3, Lcom/p1/mobile/putong/core/R$string;->s8:I

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    const/4 v2, 0x0

    .line 57
    const/4 v3, 0x1

    .line 58
    move-object v0, p0

    .line 59
    invoke-virtual/range {v0 .. v6}, Ll/m2b0;->d0(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/m2b0;->x:Lv/VImage;

    .line 63
    .line 64
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v1, p0, Ll/m2b0;->x:Lv/VImage;

    .line 68
    .line 69
    const/16 v2, 0x8

    .line 70
    .line 71
    invoke-virtual {p0, v1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_1
    const-string v2, "rejected"

    .line 76
    .line 77
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 92
    .line 93
    sget v2, Lcom/p1/mobile/putong/core/R$string;->r8:I

    .line 94
    .line 95
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    :goto_0
    move-object v6, v1

    .line 100
    goto :goto_1

    .line 101
    :cond_2
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 110
    .line 111
    sget v2, Lcom/p1/mobile/putong/core/R$string;->q8:I

    .line 112
    .line 113
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    goto :goto_0

    .line 118
    :goto_1
    iget-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 119
    .line 120
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 124
    .line 125
    new-instance v4, Ll/k2b0;

    .line 126
    .line 127
    invoke-direct {v4, p0}, Ll/k2b0;-><init>(Ll/m2b0;)V

    .line 128
    .line 129
    .line 130
    iget-object v5, p0, Ll/m2b0;->y:Lv/VText;

    .line 131
    .line 132
    const/4 v2, 0x0

    .line 133
    const/4 v3, 0x1

    .line 134
    move-object v0, p0

    .line 135
    invoke-virtual/range {v0 .. v6}, Ll/m2b0;->d0(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Ll/m2b0;->x:Lv/VImage;

    .line 139
    .line 140
    invoke-virtual {p0, v1, v7}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 141
    .line 142
    .line 143
    :goto_2
    invoke-virtual {p0}, Ll/m2b0;->f0()V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public final f0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->D2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object v1, p0, Ll/m2b0;->w:Lv/VImage;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v2, Ll/dbc0;->ir:I

    .line 32
    .line 33
    invoke-static {v0, v2}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    sget v0, Ll/dbc0;->Kq:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget v0, Ll/dbc0;->hr:I

    .line 57
    .line 58
    invoke-static {p0, v0}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v1, p0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    iget-object v0, p0, Ll/m2b0;->w:Lv/VImage;

    .line 67
    .line 68
    sget v1, Ll/dbc0;->z8:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 74
    .line 75
    sget v0, Ll/dbc0;->Kq:I

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ll/t3m;->D2()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    sget p1, Ll/dbc0;->Cu:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m2b0;->A:Ll/g4b0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1, p1}, Ll/g4b0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/m2b0;->A:Ll/g4b0;

    .line 16
    .line 17
    iget-object v1, v0, Ll/g4b0;->a:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    iput-object v1, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    iget-object v1, v0, Ll/g4b0;->b:Lv/VImage;

    .line 22
    .line 23
    iput-object v1, p0, Ll/m2b0;->w:Lv/VImage;

    .line 24
    .line 25
    iget-object v1, v0, Ll/g4b0;->c:Lv/VImage;

    .line 26
    .line 27
    iput-object v1, p0, Ll/m2b0;->x:Lv/VImage;

    .line 28
    .line 29
    iget-object v0, v0, Ll/g4b0;->d:Lv/VText;

    .line 30
    .line 31
    iput-object v0, p0, Ll/m2b0;->y:Lv/VText;

    .line 32
    .line 33
    return-object p1
.end method

.method public t()V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/m2b0;->z:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Ll/m2b0;->e0(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    iget-object v0, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-virtual {p0, v0, v1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 43
    .line 44
    .line 45
    iget-object v3, p0, Ll/m2b0;->v:Landroid/widget/RelativeLayout;

    .line 46
    .line 47
    new-instance v6, Ll/i2b0;

    .line 48
    .line 49
    invoke-direct {v6, p0}, Ll/i2b0;-><init>(Ll/m2b0;)V

    .line 50
    .line 51
    .line 52
    iget-object v7, p0, Ll/m2b0;->y:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/m2b0;->O()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    sget v2, Lcom/p1/mobile/putong/core/R$string;->p8:I

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v8

    .line 70
    const/4 v4, 0x0

    .line 71
    const/4 v5, 0x1

    .line 72
    move-object v2, p0

    .line 73
    invoke-virtual/range {v2 .. v8}, Ll/m2b0;->d0(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, v2, Ll/m2b0;->x:Lv/VImage;

    .line 77
    .line 78
    invoke-virtual {v2, p0, v1}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ll/m2b0;->f0()V

    .line 82
    .line 83
    .line 84
    return-void
.end method
