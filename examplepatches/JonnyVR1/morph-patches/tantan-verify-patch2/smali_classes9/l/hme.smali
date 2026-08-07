.class public Ll/hme;
.super Ll/km90;
.source "SourceFile"


# instance fields
.field public z:Landroid/text/Spannable;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/km90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/text/SpannableString;

    .line 5
    .line 6
    const-string p2, ""

    .line 7
    .line 8
    invoke-direct {p1, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/hme;->z:Landroid/text/Spannable;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/on2;->p()Ll/ner;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/gme;

    .line 18
    .line 19
    invoke-direct {p2, p0}, Ll/gme;-><init>(Ll/hme;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p1, p2}, Ll/ner;->creates(Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic W(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X(Ll/hme;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hme;->g0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Ll/hme;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hme;->j0()V

    return-void
.end method

.method public static synthetic Z(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a0(Ll/hme;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/hme;->k0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic b0(Ll/hme;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hme;->h0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c0(Ll/hme;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hme;->i0()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Ll/hme;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hme;->l0([I)V

    return-void
.end method

.method private e0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

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
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/t3m;->S()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget v1, Ll/c9c0;->O1:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget-object v1, p0, Ll/km90;->x:Lv/VText;

    .line 43
    .line 44
    invoke-virtual {p0, v0, v1}, Ll/ep90;->C(ILandroid/widget/TextView;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method private synthetic k0(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p1}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p1, Landroid/text/SpannableString;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 23
    .line 24
    invoke-direct {p1, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Ll/hme;->z:Landroid/text/Spannable;

    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public O()Ll/t3m;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/t3m;

    .line 6
    .line 7
    return-object p0
.end method

.method public final f0()V
    .locals 15

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "ko"

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/km90;->w:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    new-instance v1, Ll/ame;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/ame;-><init>(Ll/hme;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const-class v0, Ll/w1e$b;

    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "p_edit_self_introduction_view"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "tooltips_trigger_mode"

    .line 57
    .line 58
    const-string v2, "active"

    .line 59
    .line 60
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    filled-new-array {v1}, [Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 69
    .line 70
    .line 71
    iget-object v3, p0, Ll/km90;->w:Landroid/widget/LinearLayout;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Hl:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 98
    .line 99
    sget v2, Lcom/p1/mobile/putong/core/R$string;->A:I

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v9

    .line 105
    new-instance v10, Ll/bme;

    .line 106
    .line 107
    invoke-direct {v10, p0}, Ll/bme;-><init>(Ll/hme;)V

    .line 108
    .line 109
    .line 110
    new-instance v11, Ll/cme;

    .line 111
    .line 112
    invoke-direct {v11, p0}, Ll/cme;-><init>(Ll/hme;)V

    .line 113
    .line 114
    .line 115
    new-instance v12, Ll/dme;

    .line 116
    .line 117
    invoke-direct {v12, v0}, Ll/dme;-><init>(Ll/l4g0;)V

    .line 118
    .line 119
    .line 120
    new-instance v13, Ll/eme;

    .line 121
    .line 122
    invoke-direct {v13, v0}, Ll/eme;-><init>(Ll/l4g0;)V

    .line 123
    .line 124
    .line 125
    new-instance v14, Ll/fme;

    .line 126
    .line 127
    invoke-direct {v14, p0}, Ll/fme;-><init>(Ll/hme;)V

    .line 128
    .line 129
    .line 130
    const/4 v4, 0x1

    .line 131
    const/4 v5, 0x1

    .line 132
    const/4 v7, 0x5

    .line 133
    const/16 v8, 0x1f4

    .line 134
    .line 135
    move-object v2, p0

    .line 136
    invoke-virtual/range {v2 .. v14}, Ll/ep90;->F(Landroid/view/View;ZZLjava/lang/String;IILjava/lang/String;Ll/y20;Ll/pcj;Ll/x20;Ll/x20;Ll/x20;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final synthetic g0(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/profile/EditAboutMeAct;->g2(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-interface {p1, p0, v0}, Ll/t3m;->startActivityForResult(Landroid/content/Intent;I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final synthetic h0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p1}, Ll/jyb;->k(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0}, Ll/t3m;->E()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic i0()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/km90;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/hme;->e0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/hme;->f0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic j0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/hme;->m0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/t3m;->m0()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic l0([I)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/km90;->x:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->getLineCount()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-le p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/km90;->x:Lv/VText;

    .line 11
    .line 12
    const/high16 p1, 0x41700000    # 15.0f

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public m0(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/km90;->x:Lv/VText;

    .line 8
    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroid/text/SpannableString;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/hme;->z:Landroid/text/Spannable;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hme;->f0()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p1}, Ll/t3m;->D2()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-interface {p1}, Ll/t3m;->S()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iget-object p1, p0, Ll/km90;->x:Lv/VText;

    .line 47
    .line 48
    new-instance v0, Ll/zle;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/zle;-><init>(Ll/hme;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public t()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hme;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/hme;->m0(Lcom/p1/mobile/putong/data/User;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
