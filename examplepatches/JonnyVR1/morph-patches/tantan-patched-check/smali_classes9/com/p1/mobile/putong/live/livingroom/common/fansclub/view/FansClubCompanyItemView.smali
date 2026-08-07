.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public e:Lv/VImage;

.field public f:Lv/VDraweeView;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VDraweeView;

.field public l:Lv/VImage;

.field public m:Lv/VText;

.field public n:Lv/VText;

.field public o:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/x6g;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 2
    .line 3
    iget-object v0, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftId:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftName:Ljava/lang/String;

    .line 6
    .line 7
    iget p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftAmount:I

    .line 8
    .line 9
    invoke-static {p0, p1, v0, v1, p4}, Ll/seg;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p2, p1, p3}, Ll/x6g;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic i0(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Landroid/view/View;)V
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->o4:I

    .line 4
    .line 5
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "done"

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->status:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->p4:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method private m0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->f:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->g:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->h:Lv/VDraweeView;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->i:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k:Lv/VDraweeView;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l:Lv/VImage;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->m:Lv/VText;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->n:Lv/VText;

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->o:Lv/VDraweeView;

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 58
    .line 59
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/t6g;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->m0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->m:Lv/VText;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 16
    .line 17
    sget v0, Ll/obc0;->O1:I

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public l0(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ll/x6g;ZLjava/lang/String;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->m:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->e:Lv/VImage;

    .line 14
    .line 15
    sget v3, Ll/obc0;->N1:I

    .line 16
    .line 17
    invoke-virtual {v0, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->iconUrl:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const-string v3, "context_single_room"

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->h:Lv/VDraweeView;

    .line 31
    .line 32
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->h:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->iconUrl:Ljava/lang/String;

    .line 38
    .line 39
    sget v5, Ll/qa00;->o:I

    .line 40
    .line 41
    invoke-static {v3, v0, v4, v5}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 50
    .line 51
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->btnText:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    const-string v0, "done"

    .line 57
    .line 58
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->status:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const v4, 0x4cfb627e    # 1.31798E8f

    .line 65
    .line 66
    .line 67
    const v5, 0x4cff957d    # 1.3399959E8f

    .line 68
    .line 69
    .line 70
    const/high16 v6, 0x41700000    # 15.0f

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 75
    .line 76
    invoke-virtual {p4, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 77
    .line 78
    .line 79
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 80
    .line 81
    filled-new-array {v5, v4}, [I

    .line 82
    .line 83
    .line 84
    move-result-object p5

    .line 85
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 86
    .line 87
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    int-to-float v4, v4

    .line 92
    invoke-static {p5, v0, v4, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 93
    .line 94
    .line 95
    move-result-object p5

    .line 96
    invoke-virtual {p4, p5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    invoke-virtual {p2}, Ll/xzs;->L2()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    iget-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 105
    .line 106
    if-eqz v0, :cond_2

    .line 107
    .line 108
    invoke-virtual {v7, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 109
    .line 110
    .line 111
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 112
    .line 113
    filled-new-array {v5, v4}, [I

    .line 114
    .line 115
    .line 116
    move-result-object p5

    .line 117
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 118
    .line 119
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 120
    .line 121
    .line 122
    move-result v4

    .line 123
    int-to-float v4, v4

    .line 124
    invoke-static {p5, v0, v4, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    .line 127
    move-result-object p5

    .line 128
    invoke-virtual {p4, p5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 129
    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_2
    invoke-virtual {v7, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 133
    .line 134
    .line 135
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 136
    .line 137
    const/16 v4, -0x6a83

    .line 138
    .line 139
    const v5, -0x49d82

    .line 140
    .line 141
    .line 142
    filled-new-array {v4, v5}, [I

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 147
    .line 148
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    int-to-float v6, v6

    .line 153
    invoke-static {v4, v5, v6, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j:Lv/VText;

    .line 161
    .line 162
    new-instance v4, Ll/r6g;

    .line 163
    .line 164
    invoke-direct {v4, p2, p4, p1, p5}, Ll/r6g;-><init>(Ll/x6g;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;I)V

    .line 165
    .line 166
    .line 167
    invoke-static {v0, v4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 168
    .line 169
    .line 170
    :goto_0
    iget-boolean p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awardReceived:Z

    .line 171
    .line 172
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k:Lv/VDraweeView;

    .line 173
    .line 174
    if-eqz p4, :cond_3

    .line 175
    .line 176
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 177
    .line 178
    .line 179
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l:Lv/VImage;

    .line 180
    .line 181
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awards:Ljava/util/List;

    .line 185
    .line 186
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 187
    .line 188
    .line 189
    move-result p4

    .line 190
    if-nez p4, :cond_4

    .line 191
    .line 192
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->o:Lv/VDraweeView;

    .line 193
    .line 194
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 195
    .line 196
    .line 197
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->n:Lv/VText;

    .line 198
    .line 199
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 200
    .line 201
    .line 202
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->o:Lv/VDraweeView;

    .line 203
    .line 204
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awards:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {p5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p5

    .line 210
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;

    .line 211
    .line 212
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;->icon:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {v3, p4, p5}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->n:Lv/VText;

    .line 218
    .line 219
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awards:Ljava/util/List;

    .line 220
    .line 221
    invoke-interface {p5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p5

    .line 225
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;

    .line 226
    .line 227
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;->name:Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_3
    invoke-static {p5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l:Lv/VImage;

    .line 237
    .line 238
    xor-int/lit8 p5, p3, 0x1

    .line 239
    .line 240
    invoke-static {p4, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->o:Lv/VDraweeView;

    .line 244
    .line 245
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->n:Lv/VText;

    .line 249
    .line 250
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 251
    .line 252
    .line 253
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awards:Ljava/util/List;

    .line 254
    .line 255
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 256
    .line 257
    .line 258
    move-result p4

    .line 259
    if-nez p4, :cond_4

    .line 260
    .line 261
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k:Lv/VDraweeView;

    .line 262
    .line 263
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->awards:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {p5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p5

    .line 269
    check-cast p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;

    .line 270
    .line 271
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksAwards;->icon:Ljava/lang/String;

    .line 272
    .line 273
    sget v0, Ll/qa00;->x:I

    .line 274
    .line 275
    invoke-static {v3, p4, p5, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 276
    .line 277
    .line 278
    :cond_4
    :goto_1
    iget-object p4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 279
    .line 280
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftIcon:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 283
    .line 284
    .line 285
    move-result p4

    .line 286
    iget-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->f:Lv/VDraweeView;

    .line 287
    .line 288
    if-nez p4, :cond_5

    .line 289
    .line 290
    invoke-static {p5, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 291
    .line 292
    .line 293
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->f:Lv/VDraweeView;

    .line 294
    .line 295
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->rule:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;

    .line 296
    .line 297
    iget-object p5, p5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksRule;->giftIcon:Ljava/lang/String;

    .line 298
    .line 299
    sget v0, Ll/qa00;->I:I

    .line 300
    .line 301
    invoke-static {v3, p4, p5, v0}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 302
    .line 303
    .line 304
    goto :goto_2

    .line 305
    :cond_5
    invoke-static {p5, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 306
    .line 307
    .line 308
    :goto_2
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->g:Lv/VText;

    .line 309
    .line 310
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 311
    .line 312
    .line 313
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->g:Lv/VText;

    .line 314
    .line 315
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->title:Ljava/lang/String;

    .line 316
    .line 317
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 318
    .line 319
    .line 320
    iget-object p4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->i:Lv/VText;

    .line 321
    .line 322
    iget-object p5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;->desc:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {p4, p5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {p2}, Ll/xzs;->L2()Z

    .line 328
    .line 329
    .line 330
    move-result p2

    .line 331
    if-nez p2, :cond_6

    .line 332
    .line 333
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k:Lv/VDraweeView;

    .line 334
    .line 335
    new-instance p2, Ll/s6g;

    .line 336
    .line 337
    invoke-direct {p2, p3, p1}, Ll/s6g;-><init>(ZLcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;)V

    .line 338
    .line 339
    .line 340
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 341
    .line 342
    .line 343
    :cond_6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
