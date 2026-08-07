.class public Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;
.super Lv/VLinear;
.source "SourceFile"

# interfaces
.implements Ll/v3m;


# instance fields
.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

.field public f:Z

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/pcj;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->S(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/pcj;Landroid/view/View;)V

    return-void
.end method

.method private R()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->h:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "from_picks"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->h:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "from_meet_picks_feed"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->h:Ljava/lang/String;

    .line 22
    .line 23
    const-string v0, "from_new_meet_picks_feed"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/data/User;ZLl/y20;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/User;",
            "Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    move-object p2, p5

    .line 2
    move-object p5, p4

    .line 3
    move-object p4, p3

    .line 4
    move-object p3, p1

    .line 5
    move-object p1, p0

    .line 6
    new-instance p0, Ll/g0b0;

    .line 7
    .line 8
    invoke-direct/range {p0 .. p5}, Ll/g0b0;-><init>(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/pcj;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public I(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->e:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 10
    .line 11
    const/high16 v0, 0x41200000    # 10.0f

    .line 12
    .line 13
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->e:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/h0b0;->a(Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/y20;Ll/pcj;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->R()Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    const-string v0, "liked_users"

    .line 6
    .line 7
    if-eqz p5, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/joa;->H3()Z

    .line 10
    .line 11
    .line 12
    move-result p5

    .line 13
    if-nez p5, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/ela;->r3()I

    .line 16
    .line 17
    .line 18
    move-result p5

    .line 19
    if-gtz p5, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->g:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-interface {p2, p0, p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Mc(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-static {}, Ll/joa;->M3()Z

    .line 36
    .line 37
    .line 38
    move-result p5

    .line 39
    const-string v1, "p_profile,letter"

    .line 40
    .line 41
    const-string v2, "p_navigation_ilike,card_button_pull"

    .line 42
    .line 43
    if-nez p5, :cond_2

    .line 44
    .line 45
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->g:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->liked_user:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 54
    .line 55
    invoke-static {p0, v2, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->letter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 60
    .line 61
    invoke-static {p0, v1, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->n1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-static {}, Ll/a5i0;->G()Z

    .line 66
    .line 67
    .line 68
    move-result p5

    .line 69
    if-nez p5, :cond_4

    .line 70
    .line 71
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-eqz p2, :cond_3

    .line 76
    .line 77
    move-object v1, v2

    .line 78
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->g:Lcom/p1/mobile/android/app/Act;

    .line 79
    .line 80
    invoke-static {p0, v1}, Ll/a5i0;->s1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->g:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result p5

    .line 90
    invoke-static {p0, p2, p3, p5}, Ll/bdr;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/y20;Z)V

    .line 91
    .line 92
    .line 93
    :goto_0
    invoke-static {}, Ll/joa;->M3()Z

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    if-eqz p0, :cond_6

    .line 98
    .line 99
    invoke-static {}, Ll/joa;->E3()Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_5

    .line 104
    .line 105
    invoke-static {}, Ll/a5i0;->G()Z

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    if-eqz p0, :cond_6

    .line 110
    .line 111
    :cond_5
    const/4 p0, 0x1

    .line 112
    goto :goto_1

    .line 113
    :cond_6
    const/4 p0, 0x0

    .line 114
    :goto_1
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_7

    .line 119
    .line 120
    const-string p1, "e_iliked_letter"

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_7
    const-string p1, "e_letter_bar"

    .line 124
    .line 125
    :goto_2
    invoke-interface {p4}, Ll/pcj;->call()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    check-cast p2, Ljava/lang/String;

    .line 130
    .line 131
    const-string p3, "is_privileged"

    .line 132
    .line 133
    invoke-static {p0}, Ll/gul0;->e(Z)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {p3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    filled-new-array {p0}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public getEnvelopSayHai()Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->c:Landroid/widget/TextView;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->Q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/data/User;Ll/pcj;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/User;",
            "Ll/pcj<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->h:Ljava/lang/String;

    .line 4
    .line 5
    const-string p1, "impress_signal"

    .line 6
    .line 7
    invoke-static {p2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->d:Landroid/widget/TextView;

    .line 19
    .line 20
    sget p2, Lcom/p1/mobile/putong/core/R$string;->W2:I

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_2

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->c:Landroid/widget/TextView;

    .line 32
    .line 33
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->d:Landroid/widget/TextView;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/greet/ProfileSendLetterView;->c:Landroid/widget/TextView;

    .line 44
    .line 45
    iget-object p1, p3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 46
    .line 47
    const-string p2, "female"

    .line 48
    .line 49
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    sget p1, Lcom/p1/mobile/putong/core/R$string;->R2:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget p1, Lcom/p1/mobile/putong/core/R$string;->S2:I

    .line 59
    .line 60
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    return-void
.end method
