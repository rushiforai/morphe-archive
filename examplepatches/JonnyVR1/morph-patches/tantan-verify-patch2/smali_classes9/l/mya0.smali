.class public Ll/mya0;
.super Ll/bo90;
.source "SourceFile"


# instance fields
.field public A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

.field public v:Landroid/widget/RelativeLayout;

.field public w:Lv/VImage;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Ll/g4b0;


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
    iput-object p1, p0, Ll/mya0;->z:Ll/g4b0;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic W(Ll/mya0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mya0;->c0()V

    return-void
.end method

.method public static synthetic X(Ll/mya0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mya0;->a0()V

    return-void
.end method

.method public static synthetic Y(Ll/mya0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mya0;->b0()V

    return-void
.end method

.method public static synthetic Z(Ll/mya0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mya0;->d0()V

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
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iput-object v2, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-interface {v2}, Ll/t3m;->P1()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x0

    .line 36
    const/4 v4, 0x1

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_0

    .line 46
    .line 47
    iget-object v0, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 62
    .line 63
    const-string v0, "verified"

    .line 64
    .line 65
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-eqz p0, :cond_0

    .line 70
    .line 71
    return v3

    .line 72
    :cond_0
    return v4

    .line 73
    :cond_1
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-nez p0, :cond_2

    .line 84
    .line 85
    return v4

    .line 86
    :cond_2
    return v3
.end method

.method public final synthetic a0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

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

.method public final synthetic b0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

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
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {v0, p0}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic d0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hxf;->n()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

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
    iget-object v0, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

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
    const/4 v3, 0x1

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 26
    .line 27
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 31
    .line 32
    new-instance v4, Ll/kya0;

    .line 33
    .line 34
    invoke-direct {v4, p0}, Ll/kya0;-><init>(Ll/mya0;)V

    .line 35
    .line 36
    .line 37
    iget-object v5, p0, Ll/mya0;->y:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Zr:I

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    const/4 v2, 0x0

    .line 56
    const/4 v3, 0x1

    .line 57
    move-object v0, p0

    .line 58
    invoke-virtual/range {v0 .. v6}, Ll/bo90;->U(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/mya0;->x:Lv/VImage;

    .line 62
    .line 63
    const/16 v2, 0x8

    .line 64
    .line 65
    invoke-virtual {p0, v1, v2}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    const-string v2, "rejected"

    .line 70
    .line 71
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    sget v2, Lcom/p1/mobile/putong/core/R$string;->as:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    :goto_0
    move-object v6, v1

    .line 94
    goto :goto_1

    .line 95
    :cond_2
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bs:I

    .line 106
    .line 107
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    goto :goto_0

    .line 112
    :goto_1
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 113
    .line 114
    invoke-static {v1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 115
    .line 116
    .line 117
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 118
    .line 119
    new-instance v4, Ll/lya0;

    .line 120
    .line 121
    invoke-direct {v4, p0}, Ll/lya0;-><init>(Ll/mya0;)V

    .line 122
    .line 123
    .line 124
    iget-object v5, p0, Ll/mya0;->y:Lv/VText;

    .line 125
    .line 126
    const/4 v2, 0x0

    .line 127
    const/4 v3, 0x1

    .line 128
    move-object v0, p0

    .line 129
    invoke-virtual/range {v0 .. v6}, Ll/bo90;->U(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/mya0;->x:Lv/VImage;

    .line 133
    .line 134
    invoke-virtual {p0, v1, v7}, Ll/ep90;->Q(Landroid/view/View;I)V

    .line 135
    .line 136
    .line 137
    return-void
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

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
    if-nez p1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Ll/mya0;->w:Lv/VImage;

    .line 15
    .line 16
    sget p1, Ll/dbc0;->Ut:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/mya0;->z:Ll/g4b0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

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
    iget-object v0, p0, Ll/mya0;->z:Ll/g4b0;

    .line 16
    .line 17
    iget-object v1, v0, Ll/g4b0;->a:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    iput-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    iget-object v1, v0, Ll/g4b0;->b:Lv/VImage;

    .line 22
    .line 23
    iput-object v1, p0, Ll/mya0;->w:Lv/VImage;

    .line 24
    .line 25
    iget-object v1, v0, Ll/g4b0;->c:Lv/VImage;

    .line 26
    .line 27
    iput-object v1, p0, Ll/mya0;->x:Lv/VImage;

    .line 28
    .line 29
    iget-object v0, v0, Ll/g4b0;->d:Lv/VText;

    .line 30
    .line 31
    iput-object v0, p0, Ll/mya0;->y:Lv/VText;

    .line 32
    .line 33
    return-object p1
.end method

.method public t()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    iget-object v1, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 22
    .line 23
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    iget-object v1, p0, Ll/mya0;->A:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 30
    .line 31
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/mya0;->e0(Lcom/p1/mobile/putong/data/StudentVerificationStatus;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 46
    .line 47
    new-instance v4, Ll/iya0;

    .line 48
    .line 49
    invoke-direct {v4, p0}, Ll/iya0;-><init>(Ll/mya0;)V

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Ll/mya0;->y:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    sget v3, Lcom/p1/mobile/putong/core/R$string;->bs:I

    .line 65
    .line 66
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    const/4 v2, 0x0

    .line 71
    const/4 v3, 0x1

    .line 72
    move-object v0, p0

    .line 73
    invoke-virtual/range {v0 .. v6}, Ll/bo90;->U(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    iget-object v1, p0, Ll/mya0;->v:Landroid/widget/RelativeLayout;

    .line 78
    .line 79
    new-instance v4, Ll/jya0;

    .line 80
    .line 81
    invoke-direct {v4, p0}, Ll/jya0;-><init>(Ll/mya0;)V

    .line 82
    .line 83
    .line 84
    iget-object v5, p0, Ll/mya0;->y:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/mya0;->O()Ll/t3m;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v2}, Ll/nol;->act()Landroid/app/Activity;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 95
    .line 96
    sget v3, Lcom/p1/mobile/putong/core/R$string;->cs:I

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v6

    .line 102
    const/4 v2, 0x0

    .line 103
    const/4 v3, 0x1

    .line 104
    move-object v0, p0

    .line 105
    invoke-virtual/range {v0 .. v6}, Ll/bo90;->U(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method
