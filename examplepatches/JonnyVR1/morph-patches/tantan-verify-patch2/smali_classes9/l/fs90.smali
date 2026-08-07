.class public Ll/fs90;
.super Ll/bo90;
.source "SourceFile"


# instance fields
.field public A:Z

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
    iput-object p1, p0, Ll/fs90;->z:Ll/g4b0;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/fs90;->A:Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic W(Ll/fs90;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fs90;->X(Z)V

    return-void
.end method


# virtual methods
.method public S()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ll/s7m;->K2()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 28
    .line 29
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 30
    .line 31
    .line 32
    return v1
.end method

.method public final synthetic X(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "e_other_profile_edit_emoji_banner"

    .line 10
    .line 11
    invoke-static {v1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-interface {v1}, Ll/nol;->act()Landroid/app/Activity;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x1

    .line 27
    xor-int/2addr p1, v2

    .line 28
    const-string v3, "other_profile"

    .line 29
    .line 30
    invoke-static {v1, v2, p1, v3}, Lcom/p1/mobile/putong/core/ui/settings/addemoji/AddEmojiAct;->b2(Landroid/content/Context;ZZLjava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-interface {v0, p1}, Ll/t3m;->startActivity(Landroid/content/Intent;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Ll/nol;->act()Landroid/app/Activity;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    sget p1, Ll/x7c0;->y:I

    .line 48
    .line 49
    sget v0, Ll/x7c0;->q:I

    .line 50
    .line 51
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final Y()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

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
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v1}, Ll/t3m;->P1()Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-interface {v2}, Ll/t3m;->me()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Interest;->emoji:Ljava/util/List;

    .line 31
    .line 32
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    iget-boolean v0, p0, Ll/fs90;->A:Z

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-interface {v0}, Ll/t3m;->pageId()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v3, "e_other_profile_edit_emoji_banner"

    .line 52
    .line 53
    invoke-static {v3, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iput-boolean v2, p0, Ll/fs90;->A:Z

    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 59
    .line 60
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ll/fs90;->w:Lv/VImage;

    .line 64
    .line 65
    sget v2, Ll/dbc0;->a:I

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 71
    .line 72
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    const/high16 v2, 0x425c0000    # 55.0f

    .line 77
    .line 78
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 83
    .line 84
    iget-object v2, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 85
    .line 86
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/fs90;->w:Lv/VImage;

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/high16 v2, 0x41c00000    # 24.0f

    .line 96
    .line 97
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v3

    .line 101
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 102
    .line 103
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 108
    .line 109
    iget-object v3, p0, Ll/fs90;->w:Lv/VImage;

    .line 110
    .line 111
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 115
    .line 116
    const-string v3, "#e6f2ff"

    .line 117
    .line 118
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 123
    .line 124
    .line 125
    iget-object v0, p0, Ll/fs90;->x:Lv/VImage;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 136
    .line 137
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 142
    .line 143
    iget-object v2, p0, Ll/fs90;->x:Lv/VImage;

    .line 144
    .line 145
    invoke-virtual {v2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Ll/fs90;->x:Lv/VImage;

    .line 149
    .line 150
    sget v2, Ll/dbc0;->ss:I

    .line 151
    .line 152
    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Ll/fs90;->y:Lv/VText;

    .line 156
    .line 157
    const v2, -0xb3b5ba

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 161
    .line 162
    .line 163
    iget-object v4, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 164
    .line 165
    new-instance v7, Ll/es90;

    .line 166
    .line 167
    invoke-direct {v7, p0, v1}, Ll/es90;-><init>(Ll/fs90;Z)V

    .line 168
    .line 169
    .line 170
    iget-object v8, p0, Ll/fs90;->y:Lv/VText;

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/ep90;->O()Ll/t3m;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    invoke-interface {v0}, Ll/nol;->act()Landroid/app/Activity;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    check-cast v0, Lcom/p1/mobile/android/app/Act;

    .line 181
    .line 182
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ic:I

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v9

    .line 188
    const/4 v5, 0x0

    .line 189
    const/4 v6, 0x1

    .line 190
    move-object v3, p0

    .line 191
    invoke-virtual/range {v3 .. v9}, Ll/bo90;->U(Landroid/view/View;IZLl/x20;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_1
    return-void
.end method

.method public s(Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fs90;->z:Ll/g4b0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/on2;->w()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ll/t3m;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/t3m;->H2()Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1, p1}, Ll/g4b0;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Ll/fs90;->z:Ll/g4b0;

    .line 18
    .line 19
    iget-object v1, v0, Ll/g4b0;->a:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    iput-object v1, p0, Ll/fs90;->v:Landroid/widget/RelativeLayout;

    .line 22
    .line 23
    iget-object v1, v0, Ll/g4b0;->b:Lv/VImage;

    .line 24
    .line 25
    iput-object v1, p0, Ll/fs90;->w:Lv/VImage;

    .line 26
    .line 27
    iget-object v1, v0, Ll/g4b0;->c:Lv/VImage;

    .line 28
    .line 29
    iput-object v1, p0, Ll/fs90;->x:Lv/VImage;

    .line 30
    .line 31
    iget-object v0, v0, Ll/g4b0;->d:Lv/VText;

    .line 32
    .line 33
    iput-object v0, p0, Ll/fs90;->y:Lv/VText;

    .line 34
    .line 35
    return-object p1
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fs90;->Y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
