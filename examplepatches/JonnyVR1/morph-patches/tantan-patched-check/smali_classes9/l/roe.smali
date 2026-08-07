.class public Ll/roe;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Landroid/widget/LinearLayout;

.field public F:Lv/VText;

.field public G:Lv/VText;

.field public H:Landroid/widget/LinearLayout;

.field public I:Lv/VText;

.field public J:Lv/VText;

.field public K:Landroid/widget/LinearLayout;

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Ll/t3m;Ll/ner;)V
    .locals 0
    .param p1    # Ll/t3m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Ll/ep90;-><init>(Ll/t3m;Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(Ll/roe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/roe;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/roe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/roe;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic T(Ll/roe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/roe;->V(Landroid/view/View;)V

    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_edit_profile_exercise"

    .line 5
    .line 6
    const-string v1, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->FITNESS:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_edit_profile_drinking"

    .line 5
    .line 6
    const-string v1, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->DRINKING:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v0, "e_edit_profile_smoking"

    .line 5
    .line 6
    const-string v1, "p_edit_profile_view"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SMOKING:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 28
    .line 29
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/soe;->b(Ll/roe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/on2;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/roe;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/roe;->C:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ll/roe;->F:Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/roe;->I:Lv/VText;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/roe;->B:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    new-instance v0, Ll/ooe;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/ooe;-><init>(Ll/roe;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/roe;->E:Landroid/widget/LinearLayout;

    .line 37
    .line 38
    new-instance v0, Ll/poe;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Ll/poe;-><init>(Ll/roe;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Ll/roe;->H:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    new-instance v0, Ll/qoe;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Ll/qoe;-><init>(Ll/roe;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p1}, Ll/roe;->U(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    sget v1, Ll/dbc0;->um:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    sget v2, Ll/dbc0;->sm:I

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    invoke-virtual {v1, v3, v3, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ll/roe;->D:Lv/VText;

    .line 65
    .line 66
    const-string v4, ""

    .line 67
    .line 68
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ll/roe;->G:Lv/VText;

    .line 72
    .line 73
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Ll/roe;->J:Lv/VText;

    .line 77
    .line 78
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    if-nez v2, :cond_0

    .line 90
    .line 91
    return-void

    .line 92
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eqz v2, :cond_3

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 117
    .line 118
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 119
    .line 120
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_3

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 137
    .line 138
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 139
    .line 140
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    if-eqz v2, :cond_3

    .line 145
    .line 146
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 155
    .line 156
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 157
    .line 158
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 159
    .line 160
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 161
    .line 162
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    const-string v5, "\u6682\u4e0d\u900f\u9732"

    .line 167
    .line 168
    if-nez v4, :cond_1

    .line 169
    .line 170
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 171
    .line 172
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Ljava/lang/CharSequence;

    .line 177
    .line 178
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    if-nez v4, :cond_1

    .line 183
    .line 184
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 185
    .line 186
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v4}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$DrinkType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 197
    .line 198
    .line 199
    move-result v4

    .line 200
    if-nez v4, :cond_1

    .line 201
    .line 202
    iget-object v4, p0, Ll/roe;->G:Lv/VText;

    .line 203
    .line 204
    iget-object v6, v2, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    check-cast v6, Ljava/lang/String;

    .line 211
    .line 212
    invoke-static {v6}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$DrinkType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    :cond_1
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 220
    .line 221
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    if-nez v4, :cond_2

    .line 226
    .line 227
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 228
    .line 229
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    check-cast v4, Ljava/lang/CharSequence;

    .line 234
    .line 235
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 236
    .line 237
    .line 238
    move-result v4

    .line 239
    if-nez v4, :cond_2

    .line 240
    .line 241
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 242
    .line 243
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v4

    .line 247
    check-cast v4, Ljava/lang/String;

    .line 248
    .line 249
    invoke-static {v4}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 254
    .line 255
    .line 256
    move-result v4

    .line 257
    if-nez v4, :cond_2

    .line 258
    .line 259
    iget-object v4, p0, Ll/roe;->D:Lv/VText;

    .line 260
    .line 261
    iget-object v6, v2, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 262
    .line 263
    invoke-interface {v6, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v6

    .line 267
    check-cast v6, Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v6}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$FitnessType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 274
    .line 275
    .line 276
    :cond_2
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 277
    .line 278
    invoke-static {v4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 279
    .line 280
    .line 281
    move-result v4

    .line 282
    if-nez v4, :cond_3

    .line 283
    .line 284
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 285
    .line 286
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    check-cast v4, Ljava/lang/CharSequence;

    .line 291
    .line 292
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 293
    .line 294
    .line 295
    move-result v4

    .line 296
    if-nez v4, :cond_3

    .line 297
    .line 298
    iget-object v4, v2, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 299
    .line 300
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 301
    .line 302
    .line 303
    move-result-object v4

    .line 304
    check-cast v4, Ljava/lang/String;

    .line 305
    .line 306
    invoke-static {v4}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$SmokeType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v4

    .line 310
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 311
    .line 312
    .line 313
    move-result v4

    .line 314
    if-nez v4, :cond_3

    .line 315
    .line 316
    iget-object v4, p0, Ll/roe;->J:Lv/VText;

    .line 317
    .line 318
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 319
    .line 320
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    check-cast v2, Ljava/lang/String;

    .line 325
    .line 326
    invoke-static {v2}, Lcom/p1/mobile/putong/core/util/FriendPurposeHelper$SmokeType;->getDes(Ljava/lang/String;)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    .line 332
    .line 333
    :cond_3
    iget-object v2, p0, Ll/roe;->D:Lv/VText;

    .line 334
    .line 335
    invoke-static {v2, v1, v0}, Ll/qza0;->b(Lv/VText;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 336
    .line 337
    .line 338
    iget-object v2, p0, Ll/roe;->G:Lv/VText;

    .line 339
    .line 340
    invoke-static {v2, v1, v0}, Ll/qza0;->b(Lv/VText;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 341
    .line 342
    .line 343
    iget-object v2, p0, Ll/roe;->J:Lv/VText;

    .line 344
    .line 345
    invoke-static {v2, v1, v0}, Ll/qza0;->b(Lv/VText;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 346
    .line 347
    .line 348
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 353
    .line 354
    iget v0, v0, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 355
    .line 356
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    invoke-interface {v2}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 365
    .line 366
    .line 367
    move-result-object v2

    .line 368
    invoke-virtual {v1, v2, v0}, Ll/aw90;->I(Lcom/p1/mobile/putong/data/User;I)F

    .line 369
    .line 370
    .line 371
    move-result v1

    .line 372
    iget-object v2, p0, Ll/roe;->v:Lv/VText;

    .line 373
    .line 374
    int-to-float v4, v0

    .line 375
    cmpl-float v1, v1, v4

    .line 376
    .line 377
    if-ltz v1, :cond_4

    .line 378
    .line 379
    move v0, v3

    .line 380
    :cond_4
    const-string v1, "\u751f\u6d3b\u4e60\u60ef"

    .line 381
    .line 382
    invoke-virtual {p0, v2, v1, v0}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 383
    .line 384
    .line 385
    invoke-static {}, Ll/gra;->L3()Z

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    if-eqz v0, :cond_6

    .line 390
    .line 391
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 400
    .line 401
    .line 402
    move-result-object v1

    .line 403
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 404
    .line 405
    iget v1, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->livingHabit:I

    .line 406
    .line 407
    if-lez v1, :cond_5

    .line 408
    .line 409
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 410
    .line 411
    .line 412
    move-result-object v2

    .line 413
    invoke-virtual {v2, v0, v1}, Ll/aw90;->I(Lcom/p1/mobile/putong/data/User;I)F

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    float-to-int v0, v0

    .line 418
    iget-object v2, p0, Ll/roe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 419
    .line 420
    const-string v3, "\u5b8c\u5584\u6211\u7684\u751f\u6d3b\u4e60\u60ef"

    .line 421
    .line 422
    invoke-virtual {v2, v0, v1, v3}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;->P(IILjava/lang/String;)V

    .line 423
    .line 424
    .line 425
    iget-object p0, p0, Ll/roe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 426
    .line 427
    const/4 v0, 0x1

    .line 428
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 429
    .line 430
    .line 431
    return-void

    .line 432
    :cond_5
    iget-object p0, p0, Ll/roe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 433
    .line 434
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 435
    .line 436
    .line 437
    return-void

    .line 438
    :cond_6
    iget-object p0, p0, Ll/roe;->w:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 439
    .line 440
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 441
    .line 442
    .line 443
    return-void
.end method
