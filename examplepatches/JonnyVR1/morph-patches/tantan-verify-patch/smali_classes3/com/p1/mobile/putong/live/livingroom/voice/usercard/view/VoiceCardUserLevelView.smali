.class public Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;
.super Lv/VFrame;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VMarqueeText;

.field public f:Landroid/widget/RelativeLayout;

.field public g:Lv/VDraweeView;

.field public h:Lv/VFrame;

.field public i:Landroid/view/View;

.field public j:Lv/VText;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public n:Ll/vak0;

.field public o:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private synthetic E(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->setShadowProgress(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic F(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->b:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x0

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private L(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/lang/String;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->h:Lv/VFrame;

    .line 2
    .line 3
    const/high16 v1, 0x41300000    # 11.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->superGrade:J

    .line 13
    .line 14
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 20
    .line 21
    .line 22
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->gap:J

    .line 23
    .line 24
    const-wide/32 v5, 0xf423f

    .line 25
    .line 26
    .line 27
    cmp-long v5, v3, v5

    .line 28
    .line 29
    const/4 v6, 0x0

    .line 30
    if-lez v5, :cond_0

    .line 31
    .line 32
    long-to-double v3, v3

    .line 33
    invoke-static {v3, v4}, Ll/yau;->c(D)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    invoke-static {v3}, Ll/xau;->o(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    const/4 v4, -0x1

    .line 42
    if-eq v3, v4, :cond_0

    .line 43
    .line 44
    new-instance v3, Landroid/text/SpannableString;

    .line 45
    .line 46
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->gap:J

    .line 47
    .line 48
    long-to-double v4, v4

    .line 49
    invoke-static {v4, v5}, Ll/yau;->c(D)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-direct {v3, v4}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    sget v5, Ll/n9c0;->w1:I

    .line 65
    .line 66
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    new-instance v5, Lv/text/CustomTypefaceSpan;

    .line 71
    .line 72
    sget v7, Ll/v7p0;->o:I

    .line 73
    .line 74
    const-string v8, "sans-serif"

    .line 75
    .line 76
    invoke-direct {v5, v8, v2, v4, v7}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v7

    .line 83
    invoke-static {v7}, Ll/xau;->o(Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    move-result v7

    .line 87
    const/16 v9, 0x12

    .line 88
    .line 89
    invoke-virtual {v3, v5, v6, v7, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 90
    .line 91
    .line 92
    new-instance v5, Lv/text/CustomTypefaceSpan;

    .line 93
    .line 94
    sget v7, Ll/v7p0;->p:I

    .line 95
    .line 96
    invoke-direct {v5, v8, v2, v4, v7}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3}, Landroid/text/SpannableString;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-static {v2}, Ll/xau;->o(Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    move-result v2

    .line 107
    invoke-virtual {v3}, Landroid/text/SpannableString;->length()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {v3, v5, v2, v4, v9}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 123
    .line 124
    .line 125
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 126
    .line 127
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->gap:J

    .line 128
    .line 129
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    .line 135
    .line 136
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->g:Lv/VDraweeView;

    .line 141
    .line 142
    if-nez v2, :cond_1

    .line 143
    .line 144
    const-string v2, "context_livingAct"

    .line 145
    .line 146
    invoke-static {v2, v3, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-virtual {v3, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    :goto_1
    const-wide/16 v2, 0x0

    .line 158
    .line 159
    cmp-long p2, v0, v2

    .line 160
    .line 161
    if-lez p2, :cond_2

    .line 162
    .line 163
    invoke-direct {p0, v6}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->setShadowProgress(I)V

    .line 164
    .line 165
    .line 166
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 167
    .line 168
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 169
    .line 170
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->i:Landroid/view/View;

    .line 171
    .line 172
    const/4 v3, 0x1

    .line 173
    invoke-static {p2, v3, v0, v1, v2}, Ll/ln4;->f(Ll/vak0;ZJLandroid/view/View;)V

    .line 174
    .line 175
    .line 176
    iget-wide p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->wealthRatio:D

    .line 177
    .line 178
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 179
    .line 180
    cmpl-double p1, p1, v0

    .line 181
    .line 182
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->k:Lv/VText;

    .line 183
    .line 184
    if-nez p1, :cond_3

    .line 185
    .line 186
    invoke-static {p2, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 190
    .line 191
    invoke-static {p1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->l:Lv/VText;

    .line 195
    .line 196
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 197
    .line 198
    .line 199
    return-void

    .line 200
    :cond_3
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->j:Lv/VText;

    .line 204
    .line 205
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 206
    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->l:Lv/VText;

    .line 209
    .line 210
    invoke-static {p0, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method private M(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->c:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->iconUrl:Ljava/lang/String;

    .line 4
    .line 5
    const/high16 v2, 0x42380000    # 46.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const-string v3, "context_livingAct"

    .line 12
    .line 13
    invoke-static {v3, v0, v1, v2}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "hierarchy.iconUrl:"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->iconUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "VoiceCardUserLevelView"

    .line 33
    .line 34
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 40
    .line 41
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 42
    .line 43
    .line 44
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->superGrade:J

    .line 45
    .line 46
    const-wide/16 v4, 0x0

    .line 47
    .line 48
    cmp-long v2, v0, v4

    .line 49
    .line 50
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    if-lez v2, :cond_0

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 56
    .line 57
    invoke-static {v4, v5, v2}, Ll/ln4;->h(Ll/vak0;ZLandroid/widget/TextView;)V

    .line 58
    .line 59
    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->e:Lv/VMarqueeText;

    .line 61
    .line 62
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ue:I

    .line 63
    .line 64
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(I)V

    .line 65
    .line 66
    .line 67
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 78
    .line 79
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 80
    .line 81
    invoke-static {v4, v5, v0, v1, v2}, Ll/ln4;->g(Ll/vak0;ZJLandroid/widget/TextView;)V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->e:Lv/VMarqueeText;

    .line 85
    .line 86
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ve:I

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 92
    .line 93
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 94
    .line 95
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->b:Lv/VDraweeView;

    .line 107
    .line 108
    if-nez v0, :cond_1

    .line 109
    .line 110
    invoke-static {v3, v1, p2}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    invoke-virtual {v1, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 119
    .line 120
    .line 121
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->d:Lv/VText;

    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->e:Lv/VMarqueeText;

    .line 124
    .line 125
    invoke-virtual {p0, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->N(Lv/VText;Lv/VText;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    new-instance v0, Ll/z4n0;

    .line 133
    .line 134
    invoke-direct {v0, p0, p1}, Ll/z4n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    .line 135
    .line 136
    .line 137
    const-wide/16 p0, 0x1c2

    .line 138
    .line 139
    invoke-static {p2, v0, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method private O()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static getDefaultCardBgDraw()Landroid/graphics/drawable/GradientDrawable;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x41800000    # 16.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    const-string v1, "#242429"

    .line 17
    .line 18
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->F(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ll/x20;->call()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method private setShadowProgress(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x41400000    # 12.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v0, v2

    .line 14
    int-to-float v0, v0

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sub-int/2addr v2, v1

    .line 26
    mul-int/2addr p1, v2

    .line 27
    int-to-float p1, p1

    .line 28
    const v1, 0x3c23d70a    # 0.01f

    .line 29
    .line 30
    .line 31
    mul-float/2addr p1, v1

    .line 32
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    float-to-int p1, p1

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->i:Landroid/view/View;

    .line 38
    .line 39
    filled-new-array {p0}, [Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p1, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->E(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->G(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;)Ll/vak0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    return-object p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->setShadowProgress(I)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/a5n0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Z)V
    .locals 20

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    new-array v3, v0, [F

    .line 9
    .line 10
    fill-array-data v3, :array_0

    .line 11
    .line 12
    .line 13
    const-string v4, "scaleX"

    .line 14
    .line 15
    invoke-static {v6, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    const-wide/16 v8, 0x12c

    .line 20
    .line 21
    invoke-virtual {v7, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v7, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 30
    .line 31
    .line 32
    new-array v3, v0, [F

    .line 33
    .line 34
    fill-array-data v3, :array_1

    .line 35
    .line 36
    .line 37
    const-string v5, "scaleY"

    .line 38
    .line 39
    invoke-static {v6, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 40
    .line 41
    .line 42
    move-result-object v10

    .line 43
    invoke-virtual {v10, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 47
    .line 48
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v10, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 52
    .line 53
    .line 54
    new-array v3, v0, [F

    .line 55
    .line 56
    fill-array-data v3, :array_2

    .line 57
    .line 58
    .line 59
    const-string v11, "alpha"

    .line 60
    .line 61
    invoke-static {v6, v11, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v12

    .line 65
    invoke-virtual {v12, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 66
    .line 67
    .line 68
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 69
    .line 70
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v12, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 74
    .line 75
    .line 76
    new-array v3, v0, [F

    .line 77
    .line 78
    fill-array-data v3, :array_3

    .line 79
    .line 80
    .line 81
    invoke-static {v2, v4, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    const-wide/16 v14, 0xc8

    .line 86
    .line 87
    invoke-virtual {v13, v14, v15}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 88
    .line 89
    .line 90
    new-instance v3, Landroid/view/animation/LinearInterpolator;

    .line 91
    .line 92
    invoke-direct {v3}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v13, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 96
    .line 97
    .line 98
    new-array v3, v0, [F

    .line 99
    .line 100
    fill-array-data v3, :array_4

    .line 101
    .line 102
    .line 103
    invoke-static {v2, v5, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v3, v14, v15}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 108
    .line 109
    .line 110
    new-instance v14, Landroid/view/animation/LinearInterpolator;

    .line 111
    .line 112
    invoke-direct {v14}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, v14}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 116
    .line 117
    .line 118
    new-array v14, v0, [F

    .line 119
    .line 120
    fill-array-data v14, :array_5

    .line 121
    .line 122
    .line 123
    invoke-static {v2, v4, v14}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 124
    .line 125
    .line 126
    move-result-object v14

    .line 127
    invoke-virtual {v14, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 128
    .line 129
    .line 130
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 131
    .line 132
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v14, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 136
    .line 137
    .line 138
    new-array v4, v0, [F

    .line 139
    .line 140
    fill-array-data v4, :array_6

    .line 141
    .line 142
    .line 143
    invoke-static {v2, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object v15

    .line 147
    invoke-virtual {v15, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 148
    .line 149
    .line 150
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 151
    .line 152
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 153
    .line 154
    .line 155
    invoke-virtual {v15, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 156
    .line 157
    .line 158
    new-array v4, v0, [F

    .line 159
    .line 160
    fill-array-data v4, :array_7

    .line 161
    .line 162
    .line 163
    invoke-static {v2, v11, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-virtual {v4, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 168
    .line 169
    .line 170
    const-wide/16 v8, 0x64

    .line 171
    .line 172
    invoke-virtual {v4, v8, v9}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 173
    .line 174
    .line 175
    new-instance v5, Landroid/view/animation/LinearInterpolator;

    .line 176
    .line 177
    invoke-direct {v5}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v4, v5}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 181
    .line 182
    .line 183
    new-array v0, v0, [F

    .line 184
    .line 185
    fill-array-data v0, :array_8

    .line 186
    .line 187
    .line 188
    move-object/from16 v5, p3

    .line 189
    .line 190
    invoke-static {v5, v11, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    move-object v0, v3

    .line 195
    const-wide/16 v2, 0x12c

    .line 196
    .line 197
    invoke-virtual {v8, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 198
    .line 199
    .line 200
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 201
    .line 202
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 203
    .line 204
    .line 205
    invoke-virtual {v8, v2}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 206
    .line 207
    .line 208
    move-object/from16 v9, p4

    .line 209
    .line 210
    const-wide/high16 v17, 0x4059000000000000L    # 100.0

    .line 211
    .line 212
    iget-wide v2, v9, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->wealthRatio:D

    .line 213
    .line 214
    mul-double v2, v2, v17

    .line 215
    .line 216
    double-to-int v2, v2

    .line 217
    const/4 v3, 0x0

    .line 218
    filled-new-array {v3, v2}, [I

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    move-object v11, v4

    .line 227
    const-wide/16 v3, 0xdc

    .line 228
    .line 229
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    new-instance v3, Ll/yyb;

    .line 234
    .line 235
    invoke-direct {v3}, Ll/yyb;-><init>()V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 239
    .line 240
    .line 241
    const-wide/16 v3, 0xc8

    .line 242
    .line 243
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 244
    .line 245
    .line 246
    new-instance v3, Ll/w4n0;

    .line 247
    .line 248
    invoke-direct {v3, v1}, Ll/w4n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 252
    .line 253
    .line 254
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 255
    .line 256
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 257
    .line 258
    .line 259
    iput-object v3, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 260
    .line 261
    move-object v4, v0

    .line 262
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;

    .line 263
    .line 264
    move-object/from16 v19, v2

    .line 265
    .line 266
    move-object/from16 v16, v15

    .line 267
    .line 268
    move-object/from16 v2, p2

    .line 269
    .line 270
    move-object v15, v3

    .line 271
    move-object v3, v5

    .line 272
    move-object v5, v9

    .line 273
    move-object v9, v4

    .line 274
    move/from16 v4, p5

    .line 275
    .line 276
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Landroid/view/View;Landroid/view/View;ZLcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v15, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 280
    .line 281
    .line 282
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 283
    .line 284
    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-virtual {v0, v10}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    invoke-virtual {v0, v12}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    invoke-virtual {v0, v13}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    invoke-virtual {v0, v9}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {v0, v11}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0, v8}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->before(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    move-object/from16 v2, v16

    .line 317
    .line 318
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 319
    .line 320
    .line 321
    if-eqz p5, :cond_0

    .line 322
    .line 323
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 324
    .line 325
    move-object/from16 v2, v19

    .line 326
    .line 327
    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0, v14}, Landroid/animation/AnimatorSet$Builder;->after(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 332
    .line 333
    .line 334
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 335
    .line 336
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 337
    .line 338
    .line 339
    return-void

    .line 340
    nop

    .line 341
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f59999a    # 0.85f
    .end array-data

    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f59999a    # 0.85f
    .end array-data

    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    :array_3
    .array-data 4
        0x3f59999a    # 0.85f
        0x3f866666    # 1.05f
    .end array-data

    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    :array_4
    .array-data 4
        0x3f59999a    # 0.85f
        0x3f866666    # 1.05f
    .end array-data

    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    :array_5
    .array-data 4
        0x3f866666    # 1.05f
        0x3f800000    # 1.0f
    .end array-data

    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    :array_6
    .array-data 4
        0x3f866666    # 1.05f
        0x3f800000    # 1.0f
    .end array-data

    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    :array_7
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    :array_8
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final synthetic G(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 4
    .line 5
    iget-wide v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 6
    .line 7
    iget-wide v6, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->superGrade:J

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static/range {v0 .. v7}, Ll/ln4;->c(Ll/vak0;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;ZZJJ)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ll/vak0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

    .line 1
    invoke-static {p2}, Ll/ln4;->b(Ll/vak0;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 8
    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->O()V

    .line 10
    .line 11
    .line 12
    invoke-direct {p0, p1, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->M(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p0, p1, p4}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->L(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    new-instance p3, Ll/x4n0;

    .line 21
    .line 22
    invoke-direct {p3, p5}, Ll/x4n0;-><init>(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    new-instance p3, Ll/y4n0;

    .line 31
    .line 32
    invoke-direct {p3, p0, p1}, Ll/y4n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public N(Lv/VText;Lv/VText;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/ln4;->b(Ll/vak0;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->textColor:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->n:Ll/vak0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->textColor:Ljava/lang/String;

    .line 30
    .line 31
    sget p1, Ll/n9c0;->w1:I

    .line 32
    .line 33
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    invoke-static {p0, p1}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p1}, Landroid/widget/TextView;->getCurrentTextColor()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const-string p1, "80"

    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/n3d0;->j(ILjava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->g:Lv/VDraweeView;

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    move-object v0, p0

    .line 9
    move-object v4, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->o:Landroid/animation/AnimatorSet;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 20
    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->f:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->g:Lv/VDraweeView;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->a:Landroid/widget/RelativeLayout;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->b:Lv/VDraweeView;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->m:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
