.class public Ll/guj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bjs;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bjs<",
            "*>;"
        }
    .end annotation
.end field

.field public b:Z

.field public c:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/bjs;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bjs<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/guj;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/guj;->a:Ll/bjs;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/guj;Ll/jjs;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/guj;->q(Ll/jjs;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic b(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/guj;->p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/guj;->t(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic d(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/guj;->o(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic e(Ll/guj;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/guj;->s(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic f(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/stj;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/guj;->r(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/stj;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final g(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 3
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, p4, v1}, Ll/guj;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p4, :cond_1

    .line 14
    .line 15
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 16
    .line 17
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 18
    .line 19
    :cond_1
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p4

    .line 23
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    if-eqz p4, :cond_2

    .line 28
    .line 29
    const/4 p0, 0x0

    .line 30
    invoke-virtual {p2, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    invoke-virtual {p2, p0}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {p2, v1}, Landroid/view/View;->setHapticFeedbackEnabled(Z)V

    .line 39
    .line 40
    .line 41
    new-instance p4, Ll/ytj;

    .line 42
    .line 43
    invoke-direct {p4, p0, p2, p1, p3}, Ll/ytj;-><init>(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final h(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 2
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {p0, p4, v1}, Ll/guj;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-eqz p4, :cond_1

    .line 14
    .line 15
    iget-object p4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 16
    .line 17
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 18
    .line 19
    :cond_1
    new-instance p4, Ll/auj;

    .line 20
    .line 21
    invoke-direct {p4, p0, p2, p1, p3}, Ll/auj;-><init>(Ll/guj;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final i(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    new-array p0, p0, [I

    .line 3
    .line 4
    invoke-virtual {p2, p0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/jjs;->y([I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final j(Ll/jjs;)Z
    .locals 2

    .line 1
    iget-object p0, p0, Ll/guj;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    long-to-double v0, v0

    .line 12
    invoke-virtual {p0, v0, v1}, Ll/bjs;->a5(D)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    sget-object p1, Ll/htd0;->f:Ll/htd0;

    .line 17
    .line 18
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/civ;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/civ;->b()Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p0, :cond_1

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 36
    return p0
.end method

.method public final k(Ll/jjs;)J
    .locals 3

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->longPress:Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;

    .line 8
    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftRule;->intervalMs:I

    .line 10
    .line 11
    int-to-long p0, p0

    .line 12
    const-wide/16 v0, 0x12c

    .line 13
    .line 14
    cmp-long v2, p0, v0

    .line 15
    .line 16
    if-gez v2, :cond_0

    .line 17
    .line 18
    return-wide v0

    .line 19
    :cond_0
    const-wide/16 v0, 0x258

    .line 20
    .line 21
    cmp-long v2, p0, v0

    .line 22
    .line 23
    if-ltz v2, :cond_1

    .line 24
    .line 25
    return-wide v0

    .line 26
    :cond_1
    return-wide p0
.end method

.method public final l(ZLl/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/guj;->a:Ll/bjs;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p2}, Ll/bjs;->L5(Ll/jjs;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPaidGift()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/guj;->a:Ll/bjs;

    .line 19
    .line 20
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getPrice()J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    long-to-double v1, v1

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/bjs;->a5(D)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :goto_0
    move-object v5, v0

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    const-string v0, "NA"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :goto_1
    new-instance v7, Ll/cuj;

    .line 43
    .line 44
    invoke-direct {v7, p0, p2, p4, p1}, Ll/cuj;-><init>(Ll/guj;Ll/jjs;IZ)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getClickAction(Z)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getActionScheme(Z)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p2, p3}, Ll/guj;->i(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    const/4 v4, 0x1

    .line 73
    const/4 v6, 0x0

    .line 74
    const/4 v8, -0x1

    .line 75
    sparse-switch v3, :sswitch_data_0

    .line 76
    .line 77
    .line 78
    :goto_2
    move v1, v6

    .line 79
    goto/16 :goto_3

    .line 80
    .line 81
    :sswitch_0
    const-string v3, "GivenGiftOnce"

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_2
    const/16 v8, 0x8

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :sswitch_1
    const-string v3, "Draw"

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_3

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_3
    const/4 v8, 0x7

    .line 103
    goto :goto_2

    .line 104
    :sswitch_2
    const-string v3, "AutoCombo"

    .line 105
    .line 106
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    if-nez v1, :cond_4

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_4
    const/4 v8, 0x6

    .line 114
    goto :goto_2

    .line 115
    :sswitch_3
    const-string v3, "GivenGiftAndShowComboGearMenu"

    .line 116
    .line 117
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-nez v1, :cond_5

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_5
    const/4 v8, 0x5

    .line 125
    goto :goto_2

    .line 126
    :sswitch_4
    const-string v3, "GivenGift"

    .line 127
    .line 128
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_6

    .line 133
    .line 134
    goto :goto_2

    .line 135
    :cond_6
    const/4 v8, 0x4

    .line 136
    goto :goto_2

    .line 137
    :sswitch_5
    const-string v3, "JumpToScheme"

    .line 138
    .line 139
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_7

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_7
    const/4 v8, 0x3

    .line 147
    goto :goto_2

    .line 148
    :sswitch_6
    const-string v3, "ShowExpirationInfo"

    .line 149
    .line 150
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_8

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_8
    const/4 v8, 0x2

    .line 158
    goto :goto_2

    .line 159
    :sswitch_7
    const-string v3, "ShowNotice"

    .line 160
    .line 161
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-nez v1, :cond_9

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_9
    move v8, v4

    .line 169
    goto :goto_2

    .line 170
    :sswitch_8
    const-string v3, "ShowSlotGift"

    .line 171
    .line 172
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_a

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_a
    move v1, v6

    .line 180
    move v8, v1

    .line 181
    :goto_3
    const-string v6, ""

    .line 182
    .line 183
    packed-switch v8, :pswitch_data_0

    .line 184
    .line 185
    .line 186
    goto/16 :goto_4

    .line 187
    .line 188
    :pswitch_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    if-eqz p1, :cond_b

    .line 199
    .line 200
    const-string v0, "game"

    .line 201
    .line 202
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEffect;->type:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eqz p1, :cond_b

    .line 209
    .line 210
    invoke-static {}, Ll/hlj;->d()Z

    .line 211
    .line 212
    .line 213
    move-result p1

    .line 214
    if-eqz p1, :cond_b

    .line 215
    .line 216
    const-string p0, "GameEffect is not ready When click gift item. because the engine so is not load."

    .line 217
    .line 218
    invoke-static {p0}, Ll/clj;->o(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->h5:I

    .line 222
    .line 223
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_b
    iget-object p1, p0, Ll/guj;->a:Ll/bjs;

    .line 232
    .line 233
    invoke-virtual {p1}, Ll/bjs;->E4()V

    .line 234
    .line 235
    .line 236
    const/4 v8, 0x0

    .line 237
    const/4 v9, 0x0

    .line 238
    move-object v1, p0

    .line 239
    move-object v2, p2

    .line 240
    move-object v3, p3

    .line 241
    move v4, p4

    .line 242
    invoke-virtual/range {v1 .. v9}, Ll/guj;->v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V

    .line 243
    .line 244
    .line 245
    return-void

    .line 246
    :pswitch_1
    move-object v1, p0

    .line 247
    move-object v2, p2

    .line 248
    iget-object p0, v1, Ll/guj;->a:Ll/bjs;

    .line 249
    .line 250
    invoke-virtual {p0, v2}, Ll/bjs;->a6(Ll/jjs;)V

    .line 251
    .line 252
    .line 253
    return-void

    .line 254
    :pswitch_2
    move-object v1, p0

    .line 255
    move-object v2, p2

    .line 256
    move-object v3, p3

    .line 257
    move v4, p4

    .line 258
    invoke-virtual/range {v1 .. v7}, Ll/guj;->w(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_3
    move-object v1, p0

    .line 263
    move-object v2, p2

    .line 264
    move-object v3, p3

    .line 265
    move v4, p4

    .line 266
    iget-object p0, v1, Ll/guj;->a:Ll/bjs;

    .line 267
    .line 268
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    move-object v8, v7

    .line 273
    move-object v7, v6

    .line 274
    move-object v6, v5

    .line 275
    move v5, v4

    .line 276
    move-object v4, v3

    .line 277
    move-object v3, v2

    .line 278
    move-object v2, v1

    .line 279
    new-instance v1, Ll/euj;

    .line 280
    .line 281
    invoke-direct/range {v1 .. v8}, Ll/euj;-><init>(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 282
    .line 283
    .line 284
    invoke-static {p0, v0, p1, v1}, Ll/toe0;->b(Ll/y8s;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 285
    .line 286
    .line 287
    return-void

    .line 288
    :pswitch_4
    move-object v1, p0

    .line 289
    move-object v3, p2

    .line 290
    move-object v4, p3

    .line 291
    new-instance p0, Ll/bae0$b;

    .line 292
    .line 293
    invoke-direct {p0}, Ll/bae0$b;-><init>()V

    .line 294
    .line 295
    .line 296
    invoke-virtual {p0, v4}, Ll/bae0$b;->b(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0, v3}, Ll/bae0$b;->c(Ll/jjs;)V

    .line 300
    .line 301
    .line 302
    iget-object p1, v1, Ll/guj;->a:Ll/bjs;

    .line 303
    .line 304
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 309
    .line 310
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    new-instance p2, Ll/bae0$a;

    .line 315
    .line 316
    const/16 p3, 0xc8

    .line 317
    .line 318
    invoke-direct {p2, p3}, Ll/bae0$a;-><init>(I)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p2, v2}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    invoke-virtual {p2, p0}, Ll/bae0$a;->d(Ll/bae0$b;)Ll/bae0$a;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    invoke-virtual {p0}, Ll/bae0$a;->c()Ll/bae0;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 334
    .line 335
    .line 336
    return-void

    .line 337
    :pswitch_5
    move-object v1, p0

    .line 338
    move-object v3, p2

    .line 339
    move-object v4, p3

    .line 340
    move v5, p4

    .line 341
    iget-object p0, v1, Ll/guj;->a:Ll/bjs;

    .line 342
    .line 343
    invoke-virtual {p0, v3, v4, v5}, Ll/bjs;->c6(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :pswitch_6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getActionNotice(Z)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p0

    .line 351
    invoke-static {p0}, Ll/cpj;->K(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LangModel;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    if-eqz p0, :cond_c

    .line 356
    .line 357
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LangModel;->getLocalName()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-static {p0, v1, v4}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 362
    .line 363
    .line 364
    :cond_c
    :goto_4
    return-void

    .line 365
    :pswitch_7
    move-object v1, p0

    .line 366
    move-object v3, p2

    .line 367
    move-object v4, p3

    .line 368
    iget-object p0, v1, Ll/guj;->a:Ll/bjs;

    .line 369
    .line 370
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->getReplaceListener()Ll/qxj;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-virtual {p0, v3, p1}, Ll/bjs;->e6(Ll/jjs;Ll/qxj;)V

    .line 375
    .line 376
    .line 377
    return-void

    .line 378
    nop

    .line 379
    :sswitch_data_0
    .sparse-switch
        -0x69c62175 -> :sswitch_8
        -0x634eb7ab -> :sswitch_7
        -0x5007e786 -> :sswitch_6
        -0x3fee3992 -> :sswitch_5
        -0x310111d3 -> :sswitch_4
        -0x2a51640b -> :sswitch_3
        -0x27154701 -> :sswitch_2
        0x20a164 -> :sswitch_1
        0x3c77a24e -> :sswitch_0
    .end sparse-switch

    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Z)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->getClickAction(Z)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/guj;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    iput-boolean p4, p0, Ll/guj;->b:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->P0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p4, p2, p1, p3}, Ll/guj;->l(ZLl/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V

    .line 8
    .line 9
    .line 10
    return p4
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;ILandroid/view/View;)V
    .locals 0

    .line 1
    const/4 p4, 0x0

    .line 2
    iput-boolean p4, p0, Ll/guj;->b:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->P0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p4, p2, p1, p3}, Ll/guj;->l(ZLl/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic q(Ll/jjs;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/guj;->a:Ll/bjs;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v4

    .line 7
    iget-object p0, p0, Ll/guj;->a:Ll/bjs;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    const/4 v5, 0x1

    .line 14
    const-string v6, ""

    .line 15
    .line 16
    move-object v1, p1

    .line 17
    move v2, p2

    .line 18
    move v8, p3

    .line 19
    move-object v3, p4

    .line 20
    invoke-static/range {v0 .. v8}, Ll/qzj;->r(Ll/bjs;Ll/jjs;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic r(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ll/stj;)Lkotlin/Unit;
    .locals 9

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    move-object/from16 v8, p7

    .line 10
    .line 11
    invoke-virtual/range {v0 .. v8}, Ll/guj;->v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V

    .line 12
    .line 13
    .line 14
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 15
    .line 16
    return-object p0
.end method

.method public final synthetic s(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    const/4 v0, 0x0

    .line 7
    if-eq p1, p2, :cond_0

    .line 8
    .line 9
    const/4 p2, 0x3

    .line 10
    if-ne p1, p2, :cond_1

    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Ll/guj;->c:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p0, Ll/guj;->b:Z

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Ll/guj;->a:Ll/bjs;

    .line 22
    .line 23
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftLongPressCancel()Ll/v3f$c;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 34
    .line 35
    .line 36
    iput-boolean v0, p0, Ll/guj;->b:Z

    .line 37
    .line 38
    :cond_1
    return v0
.end method

.method public final synthetic t(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;Ljava/lang/Long;)V
    .locals 9

    .line 1
    const/4 v7, 0x1

    .line 2
    const/4 v8, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-object v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move-object v6, p6

    .line 10
    invoke-virtual/range {v0 .. v8}, Ll/guj;->v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0
    .param p4    # Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/guj;->h(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/guj;->g(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/wtj;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/wtj;-><init>(Ll/guj;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p2, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V
    .locals 14
    .param p8    # Ll/stj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;Z",
            "Ll/stj;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/guj;->a:Ll/bjs;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/vp20;->p()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->B0()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v3, v4}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const/4 v4, 0x0

    .line 48
    if-eqz v3, :cond_0

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v3, v4

    .line 53
    :goto_0
    invoke-static {v0, v1, v2, v4, v3}, Ll/rre;->F(ZLjava/lang/String;ZZZ)V

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z0()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->d1()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D0()Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-virtual/range {p2 .. p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u0()V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_4

    .line 81
    .line 82
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->h5:I

    .line 83
    .line 84
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_4
    iget-object v0, p0, Ll/guj;->a:Ll/bjs;

    .line 93
    .line 94
    const/4 v4, 0x1

    .line 95
    move-object v1, p1

    .line 96
    move-object/from16 v2, p2

    .line 97
    .line 98
    move/from16 v5, p3

    .line 99
    .line 100
    move-object/from16 v3, p6

    .line 101
    .line 102
    move/from16 v6, p7

    .line 103
    .line 104
    move-object/from16 v7, p8

    .line 105
    .line 106
    invoke-virtual/range {v0 .. v7}, Ll/bjs;->W5(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IIZLl/stj;)V

    .line 107
    .line 108
    .line 109
    iget-object v5, p0, Ll/guj;->a:Ll/bjs;

    .line 110
    .line 111
    invoke-virtual {v5}, Ll/xzs;->R2()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v9

    .line 115
    iget-object p0, p0, Ll/guj;->a:Ll/bjs;

    .line 116
    .line 117
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v12

    .line 121
    const/4 v10, 0x1

    .line 122
    move-object v6, p1

    .line 123
    move/from16 v7, p3

    .line 124
    .line 125
    move-object/from16 v8, p4

    .line 126
    .line 127
    move-object/from16 v11, p5

    .line 128
    .line 129
    move/from16 v13, p7

    .line 130
    .line 131
    invoke-static/range {v5 .. v13}, Ll/qzj;->j(Ll/bjs;Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public final w(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;",
            "I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->z0()Z

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->d1()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->D0()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->u0()V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    invoke-virtual {p1}, Ll/jjs;->p()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    const/4 v2, 0x0

    .line 26
    if-nez v1, :cond_2

    .line 27
    .line 28
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->h5:I

    .line 29
    .line 30
    invoke-static {v1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-static {v1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-boolean v2, p0, Ll/guj;->b:Z

    .line 38
    .line 39
    return-void

    .line 40
    :cond_2
    iget-object v1, p0, Ll/guj;->c:Ll/kcg0;

    .line 41
    .line 42
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual/range {p0 .. p1}, Ll/guj;->k(Ll/jjs;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v9

    .line 49
    invoke-virtual/range {p0 .. p1}, Ll/guj;->j(Ll/jjs;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iput-boolean v2, p0, Ll/guj;->b:Z

    .line 56
    .line 57
    const/4 v7, 0x0

    .line 58
    const/4 v8, 0x0

    .line 59
    move-object v0, p0

    .line 60
    move-object v1, p1

    .line 61
    move-object v2, p2

    .line 62
    move v3, p3

    .line 63
    move-object v4, p4

    .line 64
    move-object/from16 v5, p5

    .line 65
    .line 66
    move-object/from16 v6, p6

    .line 67
    .line 68
    invoke-virtual/range {v0 .. v8}, Ll/guj;->v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_3
    const/4 v7, 0x1

    .line 73
    const/4 v8, 0x0

    .line 74
    move-object v0, p0

    .line 75
    move-object v1, p1

    .line 76
    move-object v2, p2

    .line 77
    move v3, p3

    .line 78
    move-object v4, p4

    .line 79
    move-object/from16 v5, p5

    .line 80
    .line 81
    move-object/from16 v6, p6

    .line 82
    .line 83
    invoke-virtual/range {v0 .. v8}, Ll/guj;->v(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;ZLl/stj;)V

    .line 84
    .line 85
    .line 86
    iget-object v1, p0, Ll/guj;->a:Ll/bjs;

    .line 87
    .line 88
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 89
    .line 90
    invoke-static {v9, v10, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v1, v2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 103
    .line 104
    .line 105
    move-result-object v8

    .line 106
    new-instance v0, Ll/fuj;

    .line 107
    .line 108
    move-object v1, p0

    .line 109
    move-object v2, p1

    .line 110
    move-object v3, p2

    .line 111
    move v4, p3

    .line 112
    move-object v5, p4

    .line 113
    move-object/from16 v6, p5

    .line 114
    .line 115
    move-object/from16 v7, p6

    .line 116
    .line 117
    invoke-direct/range {v0 .. v7}, Ll/fuj;-><init>(Ll/guj;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;ILjava/lang/String;Ljava/lang/String;Ll/y20;)V

    .line 118
    .line 119
    .line 120
    move-object v1, v0

    .line 121
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v8, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iput-object v1, p0, Ll/guj;->c:Ll/kcg0;

    .line 130
    .line 131
    return-void
.end method
