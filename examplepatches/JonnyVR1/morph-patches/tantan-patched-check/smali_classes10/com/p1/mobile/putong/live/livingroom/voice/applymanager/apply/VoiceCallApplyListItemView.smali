.class public Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/fvm0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ll/x20;Ll/y20;Ljava/lang/String;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Ll/x20;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-static/range {p5 .. p5}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->c:Lv/VDraweeView;

    .line 12
    .line 13
    new-instance v5, Ll/cvm0;

    .line 14
    .line 15
    invoke-direct {v5}, Ll/cvm0;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v4, v1, v5}, Ll/ql3;->c(Lcom/facebook/drawee/view/SimpleDraweeView;Ll/nsv;Ll/qcj;)V

    .line 19
    .line 20
    .line 21
    iget-object v4, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->e:Landroid/widget/TextView;

    .line 22
    .line 23
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->e:Landroid/widget/TextView;

    .line 33
    .line 34
    const-string v4, "#ffffff"

    .line 35
    .line 36
    const-string v5, "#CCffffff"

    .line 37
    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    move-object v6, v5

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v6, v4

    .line 43
    :goto_0
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->h:Landroid/widget/ImageView;

    .line 51
    .line 52
    invoke-virtual {v1}, Landroid/view/View;->clearAnimation()V

    .line 53
    .line 54
    .line 55
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 56
    .line 57
    const/4 v6, 0x0

    .line 58
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->h:Landroid/widget/ImageView;

    .line 62
    .line 63
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    invoke-static {v2}, Ll/guk0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    const/4 v7, 0x1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 74
    .line 75
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 79
    .line 80
    sget v8, Lcom/p1/mobile/putong/live/livingroom/R$string;->B:I

    .line 81
    .line 82
    invoke-virtual {v1, v8}, Landroid/widget/TextView;->setText(I)V

    .line 83
    .line 84
    .line 85
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 86
    .line 87
    if-eqz v3, :cond_1

    .line 88
    .line 89
    move-object v4, v5

    .line 90
    :cond_1
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 95
    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_2
    invoke-static {v2}, Ll/guk0;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->h:Landroid/widget/ImageView;

    .line 105
    .line 106
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object v8, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->h:Landroid/widget/ImageView;

    .line 110
    .line 111
    new-instance v14, Landroid/view/animation/LinearInterpolator;

    .line 112
    .line 113
    invoke-direct {v14}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 114
    .line 115
    .line 116
    const/4 v1, 0x2

    .line 117
    new-array v15, v1, [F

    .line 118
    .line 119
    fill-array-data v15, :array_0

    .line 120
    .line 121
    .line 122
    const-string v9, "rotation"

    .line 123
    .line 124
    const-wide/16 v10, 0x0

    .line 125
    .line 126
    const-wide/16 v12, 0x258

    .line 127
    .line 128
    invoke-static/range {v8 .. v15}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 133
    .line 134
    const/4 v3, -0x1

    .line 135
    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 139
    .line 140
    .line 141
    :cond_3
    :goto_1
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_LIVE_MODEL_BOSS:Ljava/lang/String;

    .line 142
    .line 143
    move-object/from16 v3, p5

    .line 144
    .line 145
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_4

    .line 150
    .line 151
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_4

    .line 156
    .line 157
    iget v1, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 158
    .line 159
    sget v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->VOICE_NINE_MIC_BOSS_POSITION:I

    .line 160
    .line 161
    if-ne v1, v3, :cond_4

    .line 162
    .line 163
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->d:Lv/VImage;

    .line 164
    .line 165
    invoke-static {v1, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 166
    .line 167
    .line 168
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;

    .line 169
    .line 170
    sget v3, Ll/obc0;->O7:I

    .line 171
    .line 172
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 173
    .line 174
    .line 175
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->f:Landroid/widget/FrameLayout;

    .line 176
    .line 177
    sget v3, Ll/obc0;->S7:I

    .line 178
    .line 179
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 180
    .line 181
    .line 182
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 183
    .line 184
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    sget v4, Ll/n9c0;->g:I

    .line 189
    .line 190
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 195
    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_4
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->d:Lv/VImage;

    .line 199
    .line 200
    invoke-static {v1, v6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 201
    .line 202
    .line 203
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;

    .line 204
    .line 205
    sget v3, Ll/obc0;->Na:I

    .line 206
    .line 207
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 208
    .line 209
    .line 210
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->f:Landroid/widget/FrameLayout;

    .line 211
    .line 212
    sget v3, Ll/obc0;->o0:I

    .line 213
    .line 214
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 215
    .line 216
    .line 217
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 218
    .line 219
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    sget v4, Ll/n9c0;->e1:I

    .line 224
    .line 225
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 230
    .line 231
    .line 232
    :goto_2
    iget-object v1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->g:Landroid/widget/TextView;

    .line 233
    .line 234
    new-instance v3, Ll/dvm0;

    .line 235
    .line 236
    move-object/from16 v4, p3

    .line 237
    .line 238
    invoke-direct {v3, v4}, Ll/dvm0;-><init>(Ll/x20;)V

    .line 239
    .line 240
    .line 241
    invoke-static {v1, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 242
    .line 243
    .line 244
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->c:Lv/VDraweeView;

    .line 245
    .line 246
    new-instance v1, Ll/evm0;

    .line 247
    .line 248
    move-object/from16 v3, p4

    .line 249
    .line 250
    invoke-direct {v1, v3, v2}, Ll/evm0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 251
    .line 252
    .line 253
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :array_0
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/apply/VoiceCallApplyListItemView;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
