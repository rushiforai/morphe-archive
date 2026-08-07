.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lv/VDraweeView;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VDraweeView;

.field public j:Lv/VText;

.field public k:Lv/VDraweeView;

.field public l:Lv/VText;

.field public m:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

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


# virtual methods
.method public h0(Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;Landroid/view/View$OnClickListener;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->d:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->icon:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    sget v0, Ll/mdc0;->U7:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->e:Lv/VDraweeView;

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->avatar:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, p2}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->f:Lv/VText;

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 p2, 0x0

    .line 45
    invoke-virtual {v0, p2}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->f:Lv/VText;

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ba:I

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 53
    .line 54
    .line 55
    :goto_0
    iget p2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->leaderboardThreshold:I

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->m:Lv/VText;

    .line 58
    .line 59
    const-string v1, ""

    .line 60
    .line 61
    if-lez p2, :cond_1

    .line 62
    .line 63
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->qd:I

    .line 64
    .line 65
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-static {v2, p2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->m:Lv/VText;

    .line 77
    .line 78
    const-string v0, "#FE7E1D"

    .line 79
    .line 80
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->m:Lv/VText;

    .line 85
    .line 86
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    new-instance v3, Ljava/lang/StringBuilder;

    .line 95
    .line 96
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 97
    .line 98
    .line 99
    iget v4, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->leaderboardThreshold:I

    .line 100
    .line 101
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-static {p2, v0, v2, v3}, Ll/xau;->E(Landroid/widget/TextView;ILjava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_1
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->N2:I

    .line 116
    .line 117
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->user:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;

    .line 118
    .line 119
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;->name:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p2, v2}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->h:Lv/VText;

    .line 129
    .line 130
    new-instance v0, Ljava/lang/StringBuilder;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    .line 134
    .line 135
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->gift:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;

    .line 136
    .line 137
    iget v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;->price:I

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    .line 151
    .line 152
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->g:Lv/VText;

    .line 153
    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 157
    .line 158
    .line 159
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->myLeaderboard:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;

    .line 160
    .line 161
    iget v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/WeekStarLeaderboard;->score:I

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail;->top1Rewards:Ljava/util/List;

    .line 177
    .line 178
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    const/4 v0, 0x2

    .line 183
    if-ne p2, v0, :cond_2

    .line 184
    .line 185
    const/4 p2, 0x0

    .line 186
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    check-cast p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;

    .line 191
    .line 192
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->i:Lv/VDraweeView;

    .line 193
    .line 194
    iget-object v1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;->icon:Ljava/lang/String;

    .line 195
    .line 196
    invoke-static {v0, v1}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->j:Lv/VText;

    .line 200
    .line 201
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;->name:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    const/4 p2, 0x1

    .line 207
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;

    .line 212
    .line 213
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->k:Lv/VDraweeView;

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;->icon:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {p2, v0}, Ll/izs;->y(Lv/VDraweeView;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->l:Lv/VText;

    .line 221
    .line 222
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftWallV3GiftWeekStarGiftMainDetail$Top1Reward;->name:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 225
    .line 226
    .line 227
    :cond_2
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/mdc0;->d2:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->d:Lv/VDraweeView;

    .line 13
    .line 14
    sget v0, Ll/mdc0;->H0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->e:Lv/VDraweeView;

    .line 23
    .line 24
    sget v0, Ll/mdc0;->J0:I

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lv/VText;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->f:Lv/VText;

    .line 33
    .line 34
    sget v0, Ll/mdc0;->I0:I

    .line 35
    .line 36
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lv/VText;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->m:Lv/VText;

    .line 43
    .line 44
    sget v0, Ll/mdc0;->M5:I

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lv/VText;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->g:Lv/VText;

    .line 53
    .line 54
    sget v0, Ll/mdc0;->f1:I

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lv/VText;

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->h:Lv/VText;

    .line 63
    .line 64
    sget v0, Ll/mdc0;->I4:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lv/VDraweeView;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->i:Lv/VDraweeView;

    .line 73
    .line 74
    sget v0, Ll/mdc0;->K4:I

    .line 75
    .line 76
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    check-cast v0, Lv/VText;

    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->j:Lv/VText;

    .line 83
    .line 84
    sget v0, Ll/mdc0;->J4:I

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    check-cast v0, Lv/VDraweeView;

    .line 91
    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->k:Lv/VDraweeView;

    .line 93
    .line 94
    sget v0, Ll/mdc0;->L4:I

    .line 95
    .line 96
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Lv/VText;

    .line 101
    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->l:Lv/VText;

    .line 103
    .line 104
    sget v0, Ll/obc0;->K1:I

    .line 105
    .line 106
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-eqz v0, :cond_0

    .line 115
    .line 116
    const/high16 v1, 0x41500000    # 13.0f

    .line 117
    .line 118
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v2

    .line 122
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    const/4 v3, 0x0

    .line 127
    invoke-virtual {v0, v3, v3, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 128
    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->h:Lv/VText;

    .line 131
    .line 132
    const/4 v2, 0x0

    .line 133
    invoke-virtual {v1, v0, v2, v2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/view/LiveVoiceWeekStarGiftDetailPageTopView;->h:Lv/VText;

    .line 137
    .line 138
    const/high16 v0, 0x40000000    # 2.0f

    .line 139
    .line 140
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 145
    .line 146
    .line 147
    :cond_0
    return-void
.end method
