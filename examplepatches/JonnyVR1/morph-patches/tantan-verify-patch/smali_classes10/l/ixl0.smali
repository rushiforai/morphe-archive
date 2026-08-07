.class public Ll/ixl0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/fxl0;",
        ">;"
    }
.end annotation


# instance fields
.field public k:Landroid/view/View;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/view/View;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public o:Landroid/widget/TextView;

.field public p:Lv/VLinear;

.field public q:Lv/VText;

.field public r:Lv/VLinear;

.field public s:Lv/VButton;

.field public t:Landroid/view/View;

.field public u:Lv/VButton;

.field public v:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;


# direct methods
.method public constructor <init>(Ll/fxl0;)V
    .locals 3

    .line 1
    sget v0, Ll/yec0;->D6:I

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, 0x3e99999a    # 0.3f

    .line 8
    .line 9
    .line 10
    invoke-static {v2}, Ll/qag0;->c(F)Ll/rq2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-direct {p0, v0, v1, p1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic F(Ll/ixl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ixl0;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/ixl0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ixl0;->I(Landroid/view/View;)V

    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 5
    .line 6
    check-cast p1, Ll/fxl0;

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ll/rwn0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/rwn0;->p()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-static {p1}, Ll/jkp0;->f(Z)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 23
    .line 24
    check-cast v0, Ll/fxl0;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "anchorId"

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 43
    .line 44
    check-cast v1, Ll/fxl0;

    .line 45
    .line 46
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Ll/rwn0;

    .line 51
    .line 52
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "roomId"

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 63
    .line 64
    check-cast v2, Ll/fxl0;

    .line 65
    .line 66
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ll/rwn0;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const-string v3, "liveId"

    .line 77
    .line 78
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object p0, p0, Ll/ixl0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userId:Ljava/lang/String;

    .line 85
    .line 86
    const-string v3, "other_user_id"

    .line 87
    .line 88
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v3, "button_type"

    .line 93
    .line 94
    const-string v4, "ignore"

    .line 95
    .line 96
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    filled-new-array {v0, v1, v2, p0, v3}, [Ll/pf60;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string v0, "e_audio_add_apply_button"

    .line 105
    .line 106
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/fxl0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ixl0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/fxl0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jxl0;->a(Ll/ixl0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V
    .locals 6

    .line 1
    iput-object p1, p0, Ll/ixl0;->v:Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;

    .line 2
    .line 3
    iget-object v0, p0, Ll/ixl0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 4
    .line 5
    const/high16 v1, 0x42c40000    # 98.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->avatar:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->avatarFrame:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;

    .line 14
    .line 15
    iget-object v4, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->staticUrl:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v5, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMedalWallItemHeaderUrl;->dynamicUrl:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static/range {v0 .. v5}, Ll/biv;->h(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/ixl0;->o:Landroid/widget/TextView;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->userName:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ixl0;->L(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/ixl0;->q:Lv/VText;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->gender:Ljava/lang/String;

    .line 36
    .line 37
    const-string v0, "male"

    .line 38
    .line 39
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    const-string p1, "\u4ed6"

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const-string p1, "\u5979"

    .line 49
    .line 50
    :goto_0
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    const-string v0, "%s\u9001\u4f60\u8bda\u610f\u793c\u7269\uff0c\u7533\u8bf7\u52a0\u4f60\u597d\u53cb\n\u540c\u610f\u5373\u53ef\u914d\u5bf9"

    .line 55
    .line 56
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final L(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 4
    .line 5
    .line 6
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->age:I

    .line 7
    .line 8
    const/16 v1, 0x10

    .line 9
    .line 10
    const/4 v2, -0x1

    .line 11
    const/high16 v3, 0x41100000    # 9.0f

    .line 12
    .line 13
    const/high16 v4, 0x41600000    # 14.0f

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    const/high16 v6, 0x40800000    # 4.0f

    .line 17
    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    new-instance v0, Landroid/widget/TextView;

    .line 21
    .line 22
    iget-object v7, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 23
    .line 24
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v7

    .line 28
    invoke-direct {v0, v7}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 38
    .line 39
    .line 40
    const/high16 v7, 0x40000000    # 2.0f

    .line 41
    .line 42
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v7

    .line 46
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    invoke-virtual {v0, v7, v5, v8, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 51
    .line 52
    .line 53
    iget-object v7, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 54
    .line 55
    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v7

    .line 59
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    iget-object v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->gender:Ljava/lang/String;

    .line 64
    .line 65
    const-string v9, "male"

    .line 66
    .line 67
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v8

    .line 71
    if-eqz v8, :cond_0

    .line 72
    .line 73
    sget v8, Ll/n9c0;->c1:I

    .line 74
    .line 75
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    sget v8, Ll/n9c0;->b1:I

    .line 81
    .line 82
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    :goto_0
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result v10

    .line 90
    int-to-float v10, v10

    .line 91
    invoke-static {v8, v10}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    invoke-virtual {v0, v8}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 96
    .line 97
    .line 98
    iget-object v8, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->gender:Ljava/lang/String;

    .line 99
    .line 100
    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    if-eqz v8, :cond_1

    .line 105
    .line 106
    sget v8, Ll/obc0;->ea:I

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    sget v8, Ll/obc0;->da:I

    .line 110
    .line 111
    :goto_1
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    const/4 v8, 0x0

    .line 116
    invoke-virtual {v0, v7, v8, v8, v8}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 117
    .line 118
    .line 119
    iget v7, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->age:I

    .line 120
    .line 121
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 126
    .line 127
    .line 128
    iget-object v7, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 129
    .line 130
    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    .line 131
    .line 132
    sget v9, Ll/bnl0;->f:I

    .line 133
    .line 134
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v10

    .line 138
    invoke-direct {v8, v9, v10}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v7, v0, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 142
    .line 143
    .line 144
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->zodiac:Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_3

    .line 151
    .line 152
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->zodiac:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {v0}, Lcom/p1/mobile/putong/data/ProfileZodiac;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-static {v0}, Ll/q8g0;->l0(Lcom/p1/mobile/putong/data/ProfileZodiac;)I

    .line 159
    .line 160
    .line 161
    move-result v7

    .line 162
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    int-to-float v8, v8

    .line 167
    invoke-static {v7, v8}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 168
    .line 169
    .line 170
    move-result-object v7

    .line 171
    new-instance v8, Landroid/widget/TextView;

    .line 172
    .line 173
    iget-object v9, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 174
    .line 175
    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 176
    .line 177
    .line 178
    move-result-object v9

    .line 179
    invoke-direct {v8, v9}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v8, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v8, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 186
    .line 187
    .line 188
    invoke-virtual {v8, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 189
    .line 190
    .line 191
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 196
    .line 197
    .line 198
    move-result v3

    .line 199
    invoke-virtual {v8, v2, v5, v3, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {v8, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 203
    .line 204
    .line 205
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 206
    .line 207
    sget v2, Ll/bnl0;->f:I

    .line 208
    .line 209
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 214
    .line 215
    .line 216
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 217
    .line 218
    .line 219
    move-result v2

    .line 220
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 221
    .line 222
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 227
    .line 228
    .line 229
    iget-object v0, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 230
    .line 231
    invoke-virtual {v0, v8, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 232
    .line 233
    .line 234
    :cond_3
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->grade:I

    .line 235
    .line 236
    if-lez v0, :cond_4

    .line 237
    .line 238
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 239
    .line 240
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    check-cast v0, Ll/hiv;

    .line 245
    .line 246
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePayGuideUser;->grade:I

    .line 247
    .line 248
    int-to-long v1, p1

    .line 249
    invoke-virtual {v0, v1, v2}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    if-eqz p1, :cond_4

    .line 254
    .line 255
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 256
    .line 257
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_4

    .line 262
    .line 263
    new-instance v0, Lv/VDraweeView;

    .line 264
    .line 265
    iget-object v1, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 266
    .line 267
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    invoke-direct {v0, v1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 272
    .line 273
    .line 274
    sget v1, Ll/i0k;->a:I

    .line 275
    .line 276
    new-instance v2, Lcom/facebook/drawee/generic/RoundingParams;

    .line 277
    .line 278
    invoke-direct {v2}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 279
    .line 280
    .line 281
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    int-to-float v3, v3

    .line 286
    invoke-virtual {v2, v3}, Lcom/facebook/drawee/generic/RoundingParams;->s(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 287
    .line 288
    .line 289
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 290
    .line 291
    .line 292
    move-result-object v3

    .line 293
    check-cast v3, Ll/wlj;

    .line 294
    .line 295
    invoke-virtual {v3, v2}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 296
    .line 297
    .line 298
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 299
    .line 300
    invoke-static {p1, v0, v1}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 301
    .line 302
    .line 303
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 304
    .line 305
    const/high16 v1, 0x41f00000    # 30.0f

    .line 306
    .line 307
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 312
    .line 313
    .line 314
    move-result v2

    .line 315
    invoke-direct {p1, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 316
    .line 317
    .line 318
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    iput v1, p1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 323
    .line 324
    iget-object p0, p0, Ll/ixl0;->p:Lv/VLinear;

    .line 325
    .line 326
    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 327
    .line 328
    .line 329
    :cond_4
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/ixl0;->H(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/ixl0;->s:Lv/VButton;

    .line 8
    .line 9
    new-instance v0, Ll/gxl0;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/gxl0;-><init>(Ll/ixl0;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/ixl0;->u:Lv/VButton;

    .line 18
    .line 19
    new-instance v0, Ll/hxl0;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Ll/hxl0;-><init>(Ll/ixl0;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
