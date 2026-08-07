.class public Ll/jl80;
.super Ll/g1e;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jl80$a;
    }
.end annotation


# instance fields
.field public final j:Ll/jl80$a;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lv/VButton;

.field public n:Lv/VButton;

.field public o:Lv/VButton;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Lv/VImage;

.field public s:Lv/VCheckBox;

.field public t:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/jl80$a;)V
    .locals 3

    .line 1
    invoke-static {p1}, Ll/jl80$a;->h(Ll/jl80$a;)Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {p1}, Ll/jl80;->M(Ll/jl80$a;)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    invoke-direct {p0, v0, v1, v2}, Ll/g1e;-><init>(Landroid/content/Context;ZI)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/jl80;->j:Ll/jl80$a;

    .line 14
    .line 15
    invoke-static {p1}, Ll/jl80$a;->h(Ll/jl80$a;)Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sget v1, Ll/gec0;->s:I

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/jl80;->t:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {p0, p1, v0}, Ll/jl80;->T(Ll/jl80$a;Landroid/view/View;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/g1e;->y()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/g1e;->x()V

    .line 35
    .line 36
    .line 37
    invoke-static {p1}, Ll/jl80$a;->B(Ll/jl80$a;)Landroid/content/DialogInterface$OnShowListener;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-static {p1}, Ll/jl80$a;->B(Ll/jl80$a;)Landroid/content/DialogInterface$OnShowListener;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {p0, v0}, Ll/g1e;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->e(Ll/jl80$a;)Landroid/content/DialogInterface$OnCancelListener;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-static {p1}, Ll/jl80$a;->e(Ll/jl80$a;)Landroid/content/DialogInterface$OnCancelListener;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-static {p1}, Ll/jl80$a;->j(Ll/jl80$a;)Landroid/content/DialogInterface$OnDismissListener;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    invoke-static {p1}, Ll/jl80$a;->j(Ll/jl80$a;)Landroid/content/DialogInterface$OnDismissListener;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0, v0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    invoke-static {p1}, Ll/jl80$a;->f(Ll/jl80$a;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->setCancelable(Z)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/jl80;->t:Landroid/view/View;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/g1e;->z(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static synthetic E(Ll/jl80;Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl80;->Q(Ll/jl80$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/jl80;Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl80;->R(Ll/jl80$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/jl80;Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl80;->P(Ll/jl80$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/jl80;Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl80;->O(Ll/jl80$a;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jl80;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/jl80;Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jl80;->S(Ll/jl80$a;Landroid/view/View;)V

    return-void
.end method

.method public static M(Ll/jl80$a;)I
    .locals 1

    .line 1
    invoke-static {p0}, Ll/jl80$a;->H(Ll/jl80$a;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/jl80$a;->H(Ll/jl80$a;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/16 v0, 0x438

    .line 17
    .line 18
    if-lt p0, v0, :cond_1

    .line 19
    .line 20
    sget p0, Ll/tgc0;->j:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    sget p0, Ll/tgc0;->i:I

    .line 24
    .line 25
    return p0
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->s:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public K()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->s:Lv/VCheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final L()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->j:Ll/jl80$a;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jl80$a;->i(Ll/jl80$a;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic O(Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jl80$a;->s(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/jl80$a;->s(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->a(Ll/jl80$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final synthetic P(Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jl80$a;->t(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/jl80$a;->t(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->a(Ll/jl80$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final synthetic Q(Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jl80$a;->r(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/jl80$a;->r(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->a(Ll/jl80$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final synthetic R(Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/jl80$a;->q(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p1}, Ll/jl80$a;->q(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic S(Ll/jl80$a;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/jl80$a;->u(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Ll/jl80$a;->u(Ll/jl80$a;)Ljava/lang/Runnable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->a(Ll/jl80$a;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final T(Ll/jl80$a;Landroid/view/View;)V
    .locals 7

    .line 1
    sget v0, Ll/vcc0;->z0:I

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1}, Ll/jl80$a;->H(Ll/jl80$a;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-static {p1}, Ll/jl80$a;->b(Ll/jl80$a;)Landroid/graphics/drawable/Drawable;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    sget v0, Ll/vcc0;->t0:I

    .line 26
    .line 27
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Ll/vcc0;->v0:I

    .line 32
    .line 33
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {p1}, Ll/jl80$a;->v(Ll/jl80$a;)Ll/cf60;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    const/4 v3, 0x1

    .line 42
    const/4 v4, -0x1

    .line 43
    const/4 v5, 0x0

    .line 44
    const/16 v6, 0x8

    .line 45
    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 52
    .line 53
    .line 54
    sget v0, Ll/vcc0;->u0:I

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VPager;

    .line 61
    .line 62
    sget v1, Ll/vcc0;->r0:I

    .line 63
    .line 64
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Lv/VPagerCircleIndicator;

    .line 69
    .line 70
    invoke-static {p1}, Ll/jl80$a;->v(Ll/jl80$a;)Ll/cf60;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    invoke-virtual {v1, v0, v2}, Lv/VPagerCircleIndicator;->c(Landroidx/viewpager/widget/ViewPager;I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_a

    .line 88
    .line 89
    :cond_1
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 93
    .line 94
    .line 95
    sget v0, Ll/vcc0;->q0:I

    .line 96
    .line 97
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lv/VImage;

    .line 102
    .line 103
    sget v1, Ll/vcc0;->C0:I

    .line 104
    .line 105
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Landroid/widget/Space;

    .line 110
    .line 111
    sget v2, Ll/vcc0;->B0:I

    .line 112
    .line 113
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    check-cast v2, Lv/VText;

    .line 118
    .line 119
    iput-object v2, p0, Ll/jl80;->k:Lv/VText;

    .line 120
    .line 121
    sget v2, Ll/vcc0;->A0:I

    .line 122
    .line 123
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lv/VText;

    .line 128
    .line 129
    iput-object v2, p0, Ll/jl80;->l:Lv/VText;

    .line 130
    .line 131
    invoke-static {p1}, Ll/jl80$a;->k(Ll/jl80$a;)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    if-eq v2, v4, :cond_2

    .line 136
    .line 137
    invoke-static {p1}, Ll/jl80$a;->k(Ll/jl80$a;)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_2
    invoke-static {p1}, Ll/jl80$a;->i(Ll/jl80$a;)Landroid/view/View;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    if-eqz v2, :cond_3

    .line 156
    .line 157
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 161
    .line 162
    .line 163
    sget v0, Ll/vcc0;->p0:I

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    check-cast v0, Lv/VFrame;

    .line 170
    .line 171
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 172
    .line 173
    const/4 v2, -0x2

    .line 174
    invoke-direct {v1, v4, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 175
    .line 176
    .line 177
    invoke-static {p1}, Ll/jl80$a;->i(Ll/jl80$a;)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    invoke-virtual {v0, v2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 182
    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_3
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 189
    .line 190
    .line 191
    :goto_1
    invoke-static {p1}, Ll/jl80$a;->I(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    iget-object v1, p0, Ll/jl80;->k:Lv/VText;

    .line 200
    .line 201
    if-nez v0, :cond_4

    .line 202
    .line 203
    const/4 v0, 0x3

    .line 204
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {v1, v0, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/jl80;->k:Lv/VText;

    .line 212
    .line 213
    invoke-static {p1}, Ll/jl80$a;->I(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Ll/jl80;->k:Lv/VText;

    .line 221
    .line 222
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 223
    .line 224
    .line 225
    goto :goto_2

    .line 226
    :cond_4
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 227
    .line 228
    .line 229
    :goto_2
    invoke-static {p1}, Ll/jl80$a;->C(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_c

    .line 238
    .line 239
    invoke-static {p1}, Ll/jl80$a;->n(Ll/jl80$a;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-eqz v0, :cond_6

    .line 244
    .line 245
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 246
    .line 247
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 252
    .line 253
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-le v1, v4, :cond_5

    .line 258
    .line 259
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    goto :goto_3

    .line 264
    :cond_5
    sget v1, Ll/qa00;->g:I

    .line 265
    .line 266
    :goto_3
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 267
    .line 268
    iget-object v1, p0, Ll/jl80;->l:Lv/VText;

    .line 269
    .line 270
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 271
    .line 272
    .line 273
    goto :goto_7

    .line 274
    :cond_6
    invoke-static {p1}, Ll/jl80$a;->k(Ll/jl80$a;)I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    if-ne v0, v4, :cond_9

    .line 279
    .line 280
    invoke-static {p1}, Ll/jl80$a;->v(Ll/jl80$a;)Ll/cf60;

    .line 281
    .line 282
    .line 283
    move-result-object v0

    .line 284
    if-nez v0, :cond_9

    .line 285
    .line 286
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 287
    .line 288
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 293
    .line 294
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    if-le v1, v4, :cond_7

    .line 299
    .line 300
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    goto :goto_4

    .line 305
    :cond_7
    sget v1, Ll/qa00;->o:I

    .line 306
    .line 307
    :goto_4
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 308
    .line 309
    invoke-static {p1}, Ll/jl80$a;->E(Ll/jl80$a;)I

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    if-le v1, v4, :cond_8

    .line 314
    .line 315
    invoke-static {p1}, Ll/jl80$a;->E(Ll/jl80$a;)I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    goto :goto_5

    .line 320
    :cond_8
    sget v1, Ll/qa00;->q:I

    .line 321
    .line 322
    :goto_5
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 323
    .line 324
    iget-object v1, p0, Ll/jl80;->l:Lv/VText;

    .line 325
    .line 326
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    .line 328
    .line 329
    goto :goto_7

    .line 330
    :cond_9
    invoke-static {p1}, Ll/jl80$a;->k(Ll/jl80$a;)I

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-eq v0, v4, :cond_b

    .line 335
    .line 336
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 337
    .line 338
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 343
    .line 344
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    if-le v1, v4, :cond_a

    .line 349
    .line 350
    invoke-static {p1}, Ll/jl80$a;->F(Ll/jl80$a;)I

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    goto :goto_6

    .line 355
    :cond_a
    sget v1, Ll/qa00;->e:I

    .line 356
    .line 357
    :goto_6
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 358
    .line 359
    iget-object v1, p0, Ll/jl80;->l:Lv/VText;

    .line 360
    .line 361
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 362
    .line 363
    .line 364
    :cond_b
    :goto_7
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 365
    .line 366
    invoke-static {p1}, Ll/jl80$a;->C(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 371
    .line 372
    .line 373
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 374
    .line 375
    invoke-static {p1}, Ll/jl80$a;->D(Ll/jl80$a;)I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 380
    .line 381
    .line 382
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 383
    .line 384
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 385
    .line 386
    .line 387
    goto :goto_9

    .line 388
    :cond_c
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 389
    .line 390
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 391
    .line 392
    .line 393
    invoke-static {p1}, Ll/jl80$a;->I(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    if-nez v0, :cond_e

    .line 402
    .line 403
    iget-object v0, p0, Ll/jl80;->k:Lv/VText;

    .line 404
    .line 405
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 410
    .line 411
    invoke-static {p1}, Ll/jl80$a;->k(Ll/jl80$a;)I

    .line 412
    .line 413
    .line 414
    move-result v1

    .line 415
    if-eq v1, v4, :cond_d

    .line 416
    .line 417
    sget v1, Ll/qa00;->c:I

    .line 418
    .line 419
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 420
    .line 421
    sget v1, Ll/qa00;->m:I

    .line 422
    .line 423
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 424
    .line 425
    goto :goto_8

    .line 426
    :cond_d
    sget v1, Ll/qa00;->n:I

    .line 427
    .line 428
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 429
    .line 430
    sget v1, Ll/qa00;->q:I

    .line 431
    .line 432
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 433
    .line 434
    :goto_8
    iget-object v1, p0, Ll/jl80;->k:Lv/VText;

    .line 435
    .line 436
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 437
    .line 438
    .line 439
    :cond_e
    :goto_9
    invoke-static {p1}, Ll/jl80$a;->G(Ll/jl80$a;)Landroid/text/method/MovementMethod;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    if-eqz v0, :cond_f

    .line 444
    .line 445
    iget-object v0, p0, Ll/jl80;->l:Lv/VText;

    .line 446
    .line 447
    invoke-static {p1}, Ll/jl80$a;->G(Ll/jl80$a;)Landroid/text/method/MovementMethod;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 452
    .line 453
    .line 454
    :cond_f
    invoke-static {p1}, Ll/jl80$a;->g(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 455
    .line 456
    .line 457
    move-result-object v0

    .line 458
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    if-nez v0, :cond_10

    .line 463
    .line 464
    sget v0, Ll/vcc0;->t:I

    .line 465
    .line 466
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    check-cast v0, Lv/VCheckBox;

    .line 471
    .line 472
    iput-object v0, p0, Ll/jl80;->s:Lv/VCheckBox;

    .line 473
    .line 474
    sget v0, Ll/vcc0;->u:I

    .line 475
    .line 476
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    check-cast v0, Landroid/view/ViewGroup;

    .line 481
    .line 482
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 483
    .line 484
    .line 485
    sget v1, Ll/vcc0;->D0:I

    .line 486
    .line 487
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v1

    .line 491
    check-cast v1, Landroid/widget/TextView;

    .line 492
    .line 493
    invoke-static {p1}, Ll/jl80$a;->g(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 494
    .line 495
    .line 496
    move-result-object v2

    .line 497
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 498
    .line 499
    .line 500
    new-instance v1, Ll/dl80;

    .line 501
    .line 502
    invoke-direct {v1, p0}, Ll/dl80;-><init>(Ll/jl80;)V

    .line 503
    .line 504
    .line 505
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 506
    .line 507
    .line 508
    :cond_10
    :goto_a
    sget v0, Ll/vcc0;->w0:I

    .line 509
    .line 510
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 511
    .line 512
    .line 513
    move-result-object v0

    .line 514
    check-cast v0, Lv/VButton;

    .line 515
    .line 516
    iput-object v0, p0, Ll/jl80;->m:Lv/VButton;

    .line 517
    .line 518
    sget v0, Ll/vcc0;->x0:I

    .line 519
    .line 520
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 521
    .line 522
    .line 523
    move-result-object v0

    .line 524
    check-cast v0, Lv/VButton;

    .line 525
    .line 526
    iput-object v0, p0, Ll/jl80;->n:Lv/VButton;

    .line 527
    .line 528
    sget v0, Ll/vcc0;->s0:I

    .line 529
    .line 530
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    check-cast v0, Lv/VText;

    .line 535
    .line 536
    iput-object v0, p0, Ll/jl80;->p:Lv/VText;

    .line 537
    .line 538
    sget v0, Ll/vcc0;->n0:I

    .line 539
    .line 540
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 541
    .line 542
    .line 543
    move-result-object v0

    .line 544
    check-cast v0, Landroid/widget/Space;

    .line 545
    .line 546
    sget v1, Ll/vcc0;->o0:I

    .line 547
    .line 548
    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 549
    .line 550
    .line 551
    move-result-object v1

    .line 552
    check-cast v1, Lv/VText;

    .line 553
    .line 554
    iput-object v1, p0, Ll/jl80;->q:Lv/VText;

    .line 555
    .line 556
    invoke-static {p1}, Ll/jl80$a;->x(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 557
    .line 558
    .line 559
    move-result-object v1

    .line 560
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 561
    .line 562
    .line 563
    move-result v1

    .line 564
    iget-object v2, p0, Ll/jl80;->m:Lv/VButton;

    .line 565
    .line 566
    if-nez v1, :cond_12

    .line 567
    .line 568
    invoke-static {p1}, Ll/jl80$a;->x(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 569
    .line 570
    .line 571
    move-result-object v1

    .line 572
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 573
    .line 574
    .line 575
    invoke-static {p1}, Ll/jl80$a;->w(Ll/jl80$a;)I

    .line 576
    .line 577
    .line 578
    move-result v1

    .line 579
    if-eq v1, v4, :cond_11

    .line 580
    .line 581
    iget-object v1, p0, Ll/jl80;->m:Lv/VButton;

    .line 582
    .line 583
    invoke-static {p1}, Ll/jl80$a;->w(Ll/jl80$a;)I

    .line 584
    .line 585
    .line 586
    move-result v2

    .line 587
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 588
    .line 589
    .line 590
    :cond_11
    iget-object v1, p0, Ll/jl80;->m:Lv/VButton;

    .line 591
    .line 592
    new-instance v2, Ll/el80;

    .line 593
    .line 594
    invoke-direct {v2, p0, p1}, Ll/el80;-><init>(Ll/jl80;Ll/jl80$a;)V

    .line 595
    .line 596
    .line 597
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 598
    .line 599
    .line 600
    iget-object v1, p0, Ll/jl80;->m:Lv/VButton;

    .line 601
    .line 602
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 603
    .line 604
    .line 605
    goto :goto_b

    .line 606
    :cond_12
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 607
    .line 608
    .line 609
    :goto_b
    invoke-static {p1}, Ll/jl80$a;->l(Ll/jl80$a;)Z

    .line 610
    .line 611
    .line 612
    move-result v1

    .line 613
    if-eqz v1, :cond_13

    .line 614
    .line 615
    iget-object v1, p0, Ll/jl80;->m:Lv/VButton;

    .line 616
    .line 617
    sget v2, Ll/abc0;->s:I

    .line 618
    .line 619
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 620
    .line 621
    .line 622
    :cond_13
    invoke-static {p1}, Ll/jl80$a;->z(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 627
    .line 628
    .line 629
    move-result v1

    .line 630
    iget-object v2, p0, Ll/jl80;->n:Lv/VButton;

    .line 631
    .line 632
    if-nez v1, :cond_15

    .line 633
    .line 634
    invoke-static {p1}, Ll/jl80$a;->z(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 639
    .line 640
    .line 641
    invoke-static {p1}, Ll/jl80$a;->y(Ll/jl80$a;)I

    .line 642
    .line 643
    .line 644
    move-result v1

    .line 645
    if-eq v1, v4, :cond_14

    .line 646
    .line 647
    iget-object v1, p0, Ll/jl80;->n:Lv/VButton;

    .line 648
    .line 649
    invoke-static {p1}, Ll/jl80$a;->y(Ll/jl80$a;)I

    .line 650
    .line 651
    .line 652
    move-result v2

    .line 653
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 654
    .line 655
    .line 656
    :cond_14
    iget-object v1, p0, Ll/jl80;->n:Lv/VButton;

    .line 657
    .line 658
    new-instance v2, Ll/fl80;

    .line 659
    .line 660
    invoke-direct {v2, p0, p1}, Ll/fl80;-><init>(Ll/jl80;Ll/jl80$a;)V

    .line 661
    .line 662
    .line 663
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 664
    .line 665
    .line 666
    iget-object v1, p0, Ll/jl80;->n:Lv/VButton;

    .line 667
    .line 668
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 669
    .line 670
    .line 671
    goto :goto_c

    .line 672
    :cond_15
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    .line 673
    .line 674
    .line 675
    :goto_c
    invoke-static {p1}, Ll/jl80$a;->o(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 680
    .line 681
    .line 682
    move-result v1

    .line 683
    if-nez v1, :cond_17

    .line 684
    .line 685
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 686
    .line 687
    invoke-static {p1}, Ll/jl80$a;->o(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 688
    .line 689
    .line 690
    move-result-object v2

    .line 691
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 692
    .line 693
    .line 694
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 695
    .line 696
    new-instance v2, Ll/gl80;

    .line 697
    .line 698
    invoke-direct {v2, p0, p1}, Ll/gl80;-><init>(Ll/jl80;Ll/jl80$a;)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 702
    .line 703
    .line 704
    invoke-static {p1}, Ll/jl80$a;->p(Ll/jl80$a;)I

    .line 705
    .line 706
    .line 707
    move-result v1

    .line 708
    if-eqz v1, :cond_16

    .line 709
    .line 710
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 711
    .line 712
    invoke-static {p1}, Ll/jl80$a;->p(Ll/jl80$a;)I

    .line 713
    .line 714
    .line 715
    move-result v2

    .line 716
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 717
    .line 718
    .line 719
    :cond_16
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 720
    .line 721
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 722
    .line 723
    .line 724
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 725
    .line 726
    .line 727
    goto :goto_d

    .line 728
    :cond_17
    invoke-static {p1}, Ll/jl80$a;->i(Ll/jl80$a;)Landroid/view/View;

    .line 729
    .line 730
    .line 731
    move-result-object v1

    .line 732
    if-eqz v1, :cond_18

    .line 733
    .line 734
    invoke-static {p1}, Ll/jl80$a;->x(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 735
    .line 736
    .line 737
    move-result-object v1

    .line 738
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 739
    .line 740
    .line 741
    move-result v1

    .line 742
    if-eqz v1, :cond_18

    .line 743
    .line 744
    invoke-static {p1}, Ll/jl80$a;->z(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 745
    .line 746
    .line 747
    move-result-object v1

    .line 748
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 749
    .line 750
    .line 751
    move-result v1

    .line 752
    if-eqz v1, :cond_18

    .line 753
    .line 754
    invoke-static {p1}, Ll/jl80$a;->o(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 755
    .line 756
    .line 757
    move-result-object v1

    .line 758
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 759
    .line 760
    .line 761
    move-result v1

    .line 762
    if-eqz v1, :cond_18

    .line 763
    .line 764
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 765
    .line 766
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 767
    .line 768
    .line 769
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 770
    .line 771
    .line 772
    goto :goto_d

    .line 773
    :cond_18
    iget-object v1, p0, Ll/jl80;->p:Lv/VText;

    .line 774
    .line 775
    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    .line 776
    .line 777
    .line 778
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 779
    .line 780
    .line 781
    :goto_d
    invoke-static {p1}, Ll/jl80$a;->c(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 782
    .line 783
    .line 784
    move-result-object v0

    .line 785
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 786
    .line 787
    .line 788
    move-result v0

    .line 789
    if-nez v0, :cond_1a

    .line 790
    .line 791
    invoke-static {p1}, Ll/jl80$a;->H(Ll/jl80$a;)I

    .line 792
    .line 793
    .line 794
    move-result v0

    .line 795
    if-nez v0, :cond_1a

    .line 796
    .line 797
    invoke-static {p1}, Ll/jl80$a;->d(Ll/jl80$a;)I

    .line 798
    .line 799
    .line 800
    move-result v0

    .line 801
    if-eqz v0, :cond_19

    .line 802
    .line 803
    iget-object v0, p0, Ll/jl80;->q:Lv/VText;

    .line 804
    .line 805
    invoke-static {p1}, Ll/jl80$a;->d(Ll/jl80$a;)I

    .line 806
    .line 807
    .line 808
    move-result v1

    .line 809
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 810
    .line 811
    .line 812
    :cond_19
    iget-object v0, p0, Ll/jl80;->q:Lv/VText;

    .line 813
    .line 814
    invoke-static {p1}, Ll/jl80$a;->c(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 815
    .line 816
    .line 817
    move-result-object v1

    .line 818
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 819
    .line 820
    .line 821
    iget-object v0, p0, Ll/jl80;->q:Lv/VText;

    .line 822
    .line 823
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 824
    .line 825
    .line 826
    goto :goto_e

    .line 827
    :cond_1a
    iget-object v0, p0, Ll/jl80;->q:Lv/VText;

    .line 828
    .line 829
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 830
    .line 831
    .line 832
    :goto_e
    invoke-static {p1}, Ll/jl80$a;->m(Ll/jl80$a;)Z

    .line 833
    .line 834
    .line 835
    move-result v0

    .line 836
    if-eqz v0, :cond_1b

    .line 837
    .line 838
    sget v0, Ll/vcc0;->v:I

    .line 839
    .line 840
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 841
    .line 842
    .line 843
    move-result-object v0

    .line 844
    check-cast v0, Lv/VImage;

    .line 845
    .line 846
    iput-object v0, p0, Ll/jl80;->r:Lv/VImage;

    .line 847
    .line 848
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 849
    .line 850
    .line 851
    iget-object v0, p0, Ll/jl80;->r:Lv/VImage;

    .line 852
    .line 853
    new-instance v1, Ll/hl80;

    .line 854
    .line 855
    invoke-direct {v1, p0, p1}, Ll/hl80;-><init>(Ll/jl80;Ll/jl80$a;)V

    .line 856
    .line 857
    .line 858
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 859
    .line 860
    .line 861
    :cond_1b
    sget v0, Ll/vcc0;->y0:I

    .line 862
    .line 863
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 864
    .line 865
    .line 866
    move-result-object p2

    .line 867
    check-cast p2, Lv/VButton;

    .line 868
    .line 869
    iput-object p2, p0, Ll/jl80;->o:Lv/VButton;

    .line 870
    .line 871
    invoke-static {p1}, Ll/jl80$a;->A(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 872
    .line 873
    .line 874
    move-result-object p2

    .line 875
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 876
    .line 877
    .line 878
    move-result p2

    .line 879
    iget-object v0, p0, Ll/jl80;->o:Lv/VButton;

    .line 880
    .line 881
    if-nez p2, :cond_1c

    .line 882
    .line 883
    invoke-static {p1}, Ll/jl80$a;->A(Ll/jl80$a;)Ljava/lang/CharSequence;

    .line 884
    .line 885
    .line 886
    move-result-object p2

    .line 887
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 888
    .line 889
    .line 890
    iget-object p2, p0, Ll/jl80;->o:Lv/VButton;

    .line 891
    .line 892
    new-instance v0, Ll/il80;

    .line 893
    .line 894
    invoke-direct {v0, p0, p1}, Ll/il80;-><init>(Ll/jl80;Ll/jl80$a;)V

    .line 895
    .line 896
    .line 897
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 898
    .line 899
    .line 900
    iget-object p0, p0, Ll/jl80;->o:Lv/VButton;

    .line 901
    .line 902
    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 903
    .line 904
    .line 905
    return-void

    .line 906
    :cond_1c
    invoke-virtual {v0, v6}, Landroid/view/View;->setVisibility(I)V

    .line 907
    .line 908
    .line 909
    return-void
.end method

.method public U(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->p:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->j:Ll/jl80$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jl80$a;->J(Ll/jl80$a;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public W(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->j:Ll/jl80$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jl80$a;->K(Ll/jl80$a;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->j:Ll/jl80$a;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/jl80$a;->L(Ll/jl80$a;Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Y(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->m:Lv/VButton;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Z(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->l:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public a0(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jl80;->k:Lv/VText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/tgc0;->g:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 18
    .line 19
    .line 20
    invoke-super {p0}, Ll/g1e;->show()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "Dialogs can only be shown from the UI thread."

    .line 25
    .line 26
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
