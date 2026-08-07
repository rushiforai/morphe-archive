.class public Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;

.field public e:Lv/VDraweeView;

.field public f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Lv/VLinear;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 100
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 99
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/xec0;->t0:I

    .line 9
    .line 10
    const/4 p3, 0x1

    .line 11
    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    sget p1, Ll/ldc0;->P:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lv/VDraweeView;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->e:Lv/VDraweeView;

    .line 23
    .line 24
    sget p1, Ll/ldc0;->W0:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 33
    .line 34
    sget p1, Ll/ldc0;->P0:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/tantan/library/svga/SVGAnimationView;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 43
    .line 44
    sget p1, Ll/ldc0;->r2:I

    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Lv/VText;

    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->h:Lv/VText;

    .line 53
    .line 54
    sget p1, Ll/ldc0;->S1:I

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lv/VLinear;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->k:Lv/VLinear;

    .line 63
    .line 64
    sget p1, Ll/ldc0;->u2:I

    .line 65
    .line 66
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lv/VText;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->i:Lv/VText;

    .line 73
    .line 74
    sget p1, Ll/ldc0;->t2:I

    .line 75
    .line 76
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lv/VText;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->j:Lv/VText;

    .line 83
    .line 84
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 85
    .line 86
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->setNeedAdjustUI(Z)V

    .line 87
    .line 88
    .line 89
    const/high16 p1, 0x41200000    # 10.0f

    .line 90
    .line 91
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-static {p0, p1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    return-void
.end method


# virtual methods
.method public h0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->d:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->n(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public i0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->f:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->q()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setData(Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;)V
    .locals 6

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->d:Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;

    .line 2
    .line 3
    const-string v0, "live"

    .line 4
    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->type:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const-string v1, "context_livingAct"

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->e:Lv/VDraweeView;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 22
    .line 23
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->profilePicture:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1, v0, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->j:Lv/VText;

    .line 31
    .line 32
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 33
    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->name:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->i:Lv/VText;

    .line 42
    .line 43
    sget-object v3, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 44
    .line 45
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->live:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 46
    .line 47
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 48
    .line 49
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v5, "\u5728\u7ebf \u00b7 %d"

    .line 58
    .line 59
    invoke-static {v3, v5, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v3, "https://auto.tancdn.com/v1/raw/89df1bb3-e344-475d-a3e0-5d4fa723ad2311.pdf"

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->k:Lv/VLinear;

    .line 86
    .line 87
    sget v3, Ll/nbc0;->o0:I

    .line 88
    .line 89
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->h:Lv/VText;

    .line 93
    .line 94
    const-string v3, "\u76f4\u64ad\u4e2d"

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    const-string v0, "voiceFeed"

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->type:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_1

    .line 108
    .line 109
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->users:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexUser;

    .line 119
    .line 120
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->e:Lv/VDraweeView;

    .line 121
    .line 122
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexUser;->icon:Ljava/lang/String;

    .line 123
    .line 124
    invoke-static {v1, v2, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->j:Lv/VText;

    .line 128
    .line 129
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveComplexUser;->name:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->i:Lv/VText;

    .line 135
    .line 136
    sget-object v1, Ljava/util/Locale;->CHINA:Ljava/util/Locale;

    .line 137
    .line 138
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveComplexCard;->voiceFeed:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 139
    .line 140
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 141
    .line 142
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    const-string v2, "\u5728\u7ebf \u00b7 %s"

    .line 147
    .line 148
    invoke-static {v1, v2, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 153
    .line 154
    .line 155
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 156
    .line 157
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 162
    .line 163
    const/high16 v0, 0x41600000    # 14.0f

    .line 164
    .line 165
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 170
    .line 171
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 176
    .line 177
    const/high16 v0, 0x40c00000    # 6.0f

    .line 178
    .line 179
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 184
    .line 185
    const/high16 v0, 0x40400000    # 3.0f

    .line 186
    .line 187
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 194
    .line 195
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    const-string v0, "https://auto.tancdn.com/v1/raw/e90eea29-f0ff-4ceb-88b8-066d6ea743bb12.pdf"

    .line 207
    .line 208
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 215
    .line 216
    .line 217
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->k:Lv/VLinear;

    .line 218
    .line 219
    sget v0, Ll/nbc0;->n0:I

    .line 220
    .line 221
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 222
    .line 223
    .line 224
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/swipecard/MultipleLiveFourItem;->h:Lv/VText;

    .line 225
    .line 226
    const-string p1, "\u8bed\u804a\u4e2d"

    .line 227
    .line 228
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    .line 230
    .line 231
    :cond_1
    return-void
.end method
