.class public Ll/koe;
.super Ll/ep90;
.source "SourceFile"


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Lv/VText;

.field public u:Lv/VLinear_Dividers;

.field public v:Lv/VText;

.field public w:Landroid/widget/ImageView;

.field public x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

.field public y:Lv/VImage;

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

.method public static synthetic R(Ll/koe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/koe;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/koe;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/koe;->X(Landroid/view/View;)V

    return-void
.end method

.method private U()V
    .locals 3

    .line 1
    const-string v0, "edit_profile_my_info_name"

    .line 2
    .line 3
    const-string v1, "self_introduction"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/sfj0$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "e_edit_profile_my_info"

    .line 14
    .line 15
    const-string v2, "p_edit_profile_view"

    .line 16
    .line 17
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/t3m;->i2()Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Ll/t3m;->J1()Lcom/p1/mobile/putong/app/PutongFrag;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 37
    .line 38
    invoke-static {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory;->S(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/android/app/Frag;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private V(I)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/koe;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/koe;->U()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/loe;->b(Ll/koe;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

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
    iget-object p1, p0, Ll/koe;->v:Lv/VText;

    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/koe;->C:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

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
    invoke-virtual {p0, v0, p1}, Ll/koe;->T(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public t()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Ll/koe;->w:Landroid/widget/ImageView;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/16 v1, 0x8

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/koe;->C:Lv/VText;

    .line 27
    .line 28
    sget v2, Lcom/p1/mobile/putong/core/R$string;->A:I

    .line 29
    .line 30
    invoke-direct {p0, v2}, Ll/koe;->V(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    sget v2, Ll/dbc0;->sm:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    invoke-virtual {v1, v4, v4, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Ll/koe;->C:Lv/VText;

    .line 69
    .line 70
    invoke-virtual {v2, v3, v3, v1, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/koe;->C:Lv/VText;

    .line 78
    .line 79
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/koe;->C:Lv/VText;

    .line 83
    .line 84
    invoke-virtual {v1, v3, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    :goto_0
    iget-object v1, p0, Ll/koe;->w:Landroid/widget/ImageView;

    .line 88
    .line 89
    new-instance v2, Ll/ioe;

    .line 90
    .line 91
    invoke-direct {v2, p0}, Ll/ioe;-><init>(Ll/koe;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Ll/koe;->C:Lv/VText;

    .line 98
    .line 99
    new-instance v2, Ll/joe;

    .line 100
    .line 101
    invoke-direct {v2, p0}, Ll/joe;-><init>(Ll/koe;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Ll/koe;->v:Lv/VText;

    .line 108
    .line 109
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Hl:I

    .line 110
    .line 111
    invoke-direct {p0, v2}, Ll/koe;->V(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    if-nez v3, :cond_1

    .line 120
    .line 121
    move v3, v4

    .line 122
    goto :goto_1

    .line 123
    :cond_1
    invoke-static {}, Ll/gra;->L3()Z

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    if-eqz v3, :cond_2

    .line 128
    .line 129
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 134
    .line 135
    iget v3, v3, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    invoke-static {}, Ll/gra;->p()Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/ProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 143
    .line 144
    iget v3, v3, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 145
    .line 146
    :goto_1
    invoke-virtual {p0, v1, v2, v3}, Ll/ep90;->P(Landroid/widget/TextView;Ljava/lang/String;I)V

    .line 147
    .line 148
    .line 149
    invoke-static {}, Ll/gra;->L3()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_5

    .line 154
    .line 155
    invoke-static {}, Ll/xra;->s()Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/NewProfileCompletionConfig;->weight:Lcom/p1/mobile/putong/core/data/NewDatingPurpose;

    .line 160
    .line 161
    iget v1, v1, Lcom/p1/mobile/putong/core/data/NewDatingPurpose;->introduction:I

    .line 162
    .line 163
    if-lez v1, :cond_4

    .line 164
    .line 165
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_3

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_3
    move v4, v1

    .line 173
    :goto_2
    iget-object v0, p0, Ll/koe;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 174
    .line 175
    const-string v2, "\u6dfb\u52a0\u81ea\u6211\u4ecb\u7ecd"

    .line 176
    .line 177
    invoke-virtual {v0, v4, v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;->P(IILjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Ll/koe;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 181
    .line 182
    const/4 v0, 0x1

    .line 183
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_4
    iget-object p0, p0, Ll/koe;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 188
    .line 189
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 190
    .line 191
    .line 192
    return-void

    .line 193
    :cond_5
    iget-object p0, p0, Ll/koe;->x:Lcom/p1/mobile/putong/core/ui/profile/profilelist/view/ProfileIntegrityOptView;

    .line 194
    .line 195
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 196
    .line 197
    .line 198
    return-void
.end method
