.class public Ll/e6p0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/v7p0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

.field public B:Landroid/widget/LinearLayout;

.field public C:Lv/VText;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lv/VText;

.field public G:Lv/VImage;

.field public H:Lv/VText;

.field public I:Landroid/view/View;

.field public J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

.field public L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

.field public M:Lcom/p1/mobile/putong/data/User;

.field public N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

.field public O:Ll/vak0;

.field public P:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public Q:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/FrameLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public o:Lv/VImage;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public q:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

.field public r:Lv/VFrame;

.field public s:Lv/VLinear;

.field public t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

.field public u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

.field public v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

.field public x:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

.field public y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

.field public z:Landroid/widget/LinearLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/v7p0;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->A6:I

    .line 2
    .line 3
    const v1, 0x3e99999a    # 0.3f

    .line 4
    .line 5
    .line 6
    invoke-static {v1}, Ll/qag0;->c(F)Ll/rq2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method private B0(Ll/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 6

    .line 1
    iput-object p2, p0, Ll/e6p0;->P:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    iput-object p1, p0, Ll/e6p0;->O:Ll/vak0;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    move-object v0, p2

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p1, Ll/vak0;->c:Ll/nsv;

    .line 11
    .line 12
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    :goto_0
    iput-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    move-object v0, p2

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    iget-object v0, p1, Ll/vak0;->c:Ll/nsv;

    .line 23
    .line 24
    :goto_1
    iput-object v0, p0, Ll/e6p0;->Q:Ll/nsv;

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    goto :goto_2

    .line 29
    :cond_2
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    :goto_2
    iput-object p2, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 34
    .line 35
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    const/4 v1, 0x1

    .line 38
    if-eqz v0, :cond_b

    .line 39
    .line 40
    if-nez p2, :cond_3

    .line 41
    .line 42
    goto/16 :goto_6

    .line 43
    .line 44
    :cond_3
    invoke-virtual {p0}, Ll/e6p0;->D0()V

    .line 45
    .line 46
    .line 47
    invoke-direct {p0}, Ll/e6p0;->I0()V

    .line 48
    .line 49
    .line 50
    new-instance p2, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0}, Ll/vwt;->u7()Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/vak0;->u()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_4

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ll/e6p0;->A0(Ll/vak0;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 81
    .line 82
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    :cond_4
    invoke-virtual {p1}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    if-eqz v0, :cond_5

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 96
    .line 97
    const-wide/16 v4, 0x0

    .line 98
    .line 99
    cmp-long v0, v2, v4

    .line 100
    .line 101
    if-ltz v0, :cond_5

    .line 102
    .line 103
    invoke-virtual {p1}, Ll/vak0;->u()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Ll/e6p0;->z0(Ll/vak0;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Ll/e6p0;->u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 113
    .line 114
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    :cond_5
    invoke-virtual {p1}, Ll/vak0;->q()Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {p0, v0}, Ll/e6p0;->G0(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 125
    .line 126
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    invoke-virtual {p1}, Ll/vak0;->h()Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    if-eqz v0, :cond_6

    .line 134
    .line 135
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->schema:Ljava/lang/String;

    .line 136
    .line 137
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-nez v2, :cond_6

    .line 142
    .line 143
    iget-object v2, p0, Ll/e6p0;->x:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 144
    .line 145
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Ll/e6p0;->x:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 149
    .line 150
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    iget-object v2, p0, Ll/e6p0;->x:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/UserCardFamilyGroupView;

    .line 154
    .line 155
    new-instance v3, Ll/d6p0;

    .line 156
    .line 157
    invoke-direct {v3, p0, v0}, Ll/d6p0;-><init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;)V

    .line 158
    .line 159
    .line 160
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 161
    .line 162
    .line 163
    goto :goto_3

    .line 164
    :cond_6
    invoke-virtual {p1}, Ll/vak0;->w()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_7

    .line 169
    .line 170
    invoke-virtual {p1}, Ll/vak0;->l()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p0, v0}, Ll/e6p0;->J0(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 178
    .line 179
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    :cond_7
    :goto_3
    invoke-direct {p0, p2}, Ll/e6p0;->c0(Ljava/util/List;)V

    .line 183
    .line 184
    .line 185
    iget-object v0, p0, Ll/e6p0;->s:Lv/VLinear;

    .line 186
    .line 187
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 188
    .line 189
    .line 190
    move-result p2

    .line 191
    const/4 v2, 0x0

    .line 192
    if-lez p2, :cond_8

    .line 193
    .line 194
    move p2, v1

    .line 195
    goto :goto_4

    .line 196
    :cond_8
    move p2, v2

    .line 197
    :goto_4
    invoke-static {v0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object p2, p0, Ll/e6p0;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 201
    .line 202
    iget-object v0, p0, Ll/e6p0;->Q:Ll/nsv;

    .line 203
    .line 204
    iget-object v3, p0, Ll/e6p0;->l:Landroid/view/View;

    .line 205
    .line 206
    invoke-virtual {p2, v0, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->y0(Ll/nsv;Landroid/view/View;)V

    .line 207
    .line 208
    .line 209
    iget-object p2, p0, Ll/e6p0;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 210
    .line 211
    iget-object v0, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 212
    .line 213
    iget-object v3, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 214
    .line 215
    if-eqz v3, :cond_9

    .line 216
    .line 217
    iget-boolean v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 218
    .line 219
    if-eqz v3, :cond_9

    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_9
    move v1, v2

    .line 223
    :goto_5
    invoke-virtual {p2, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->D0(Landroid/view/View;Z)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0}, Ll/e6p0;->E0()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p1}, Ll/vak0;->i()Ljava/util/List;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 234
    .line 235
    .line 236
    move-result p2

    .line 237
    if-nez p2, :cond_a

    .line 238
    .line 239
    invoke-virtual {p0, p1}, Ll/e6p0;->H0(Ljava/util/List;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :cond_a
    iget-object p0, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 244
    .line 245
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :cond_b
    :goto_6
    iget-object p1, p0, Ll/e6p0;->H:Lv/VText;

    .line 250
    .line 251
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    iget-object p0, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 255
    .line 256
    const/16 p1, 0x8

    .line 257
    .line 258
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 259
    .line 260
    .line 261
    return-void
.end method

.method public static synthetic F(Ll/e6p0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->n0(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic G(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->r0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/e6p0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->o0(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V

    return-void
.end method

.method private I0()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/e6p0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 2
    .line 3
    const/high16 v1, 0x42c80000    # 100.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, p0, Ll/e6p0;->Q:Ll/nsv;

    .line 10
    .line 11
    new-instance v3, Ll/p5p0;

    .line 12
    .line 13
    invoke-direct {v3}, Ll/p5p0;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3}, Ll/biv;->b(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILl/nsv;Ll/qcj;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/e6p0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->k0()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v2, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    const/high16 v0, 0x40000000    # 2.0f

    .line 38
    .line 39
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-static {v2, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/e6p0;->o:Lv/VImage;

    .line 52
    .line 53
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    const/high16 v0, -0x3f400000    # -6.0f

    .line 58
    .line 59
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {v2, v0}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/e6p0;->Q:Ll/nsv;

    .line 67
    .line 68
    invoke-static {v0}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Ll/e3t;->d()Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v2, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 77
    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    sget v0, Ll/obc0;->C8:I

    .line 81
    .line 82
    invoke-virtual {v2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/e6p0;->o:Lv/VImage;

    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 88
    .line 89
    .line 90
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 91
    .line 92
    iget-object v2, p0, Ll/e6p0;->o:Lv/VImage;

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget-object v3, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    iget-object v5, p0, Ll/e6p0;->o:Lv/VImage;

    .line 101
    .line 102
    invoke-virtual {v0, v2, v3, v5}, Ll/wrv;->s0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/e6p0;->o:Lv/VImage;

    .line 110
    .line 111
    invoke-static {v0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    :goto_0
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 115
    .line 116
    invoke-virtual {v0}, Ll/vak0;->f()Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iget-object v2, p0, Ll/e6p0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 121
    .line 122
    if-eqz v0, :cond_2

    .line 123
    .line 124
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/e6p0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 128
    .line 129
    const/high16 v2, 0x42400000    # 48.0f

    .line 130
    .line 131
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->userAvatar:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->userAvatarFrame:Ljava/lang/String;

    .line 138
    .line 139
    const-string v5, ""

    .line 140
    .line 141
    invoke-static {v1, v2, v3, v4, v5}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object v1, p0, Ll/e6p0;->p:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 145
    .line 146
    new-instance v2, Ll/q5p0;

    .line 147
    .line 148
    invoke-direct {v2, p0, v0}, Ll/q5p0;-><init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;)V

    .line 149
    .line 150
    .line 151
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_2
    invoke-static {v2, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 156
    .line 157
    .line 158
    return-void
.end method

.method public static synthetic J(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->s0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->t0(Landroid/view/View;)V

    return-void
.end method

.method private K0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->l:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/j5p0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/j5p0;-><init>(Ll/e6p0;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/e6p0;->C:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ll/u5p0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/u5p0;-><init>(Ll/e6p0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/e6p0;->D:Lv/VText;

    .line 22
    .line 23
    new-instance v1, Ll/w5p0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/w5p0;-><init>(Ll/e6p0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/e6p0;->I:Landroid/view/View;

    .line 32
    .line 33
    new-instance v1, Ll/x5p0;

    .line 34
    .line 35
    invoke-direct {v1}, Ll/x5p0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/e6p0;->m:Landroid/widget/FrameLayout;

    .line 42
    .line 43
    new-instance v1, Ll/y5p0;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/y5p0;-><init>(Ll/e6p0;)V

    .line 46
    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 52
    .line 53
    new-instance v1, Ll/z5p0;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ll/z5p0;-><init>(Ll/e6p0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 62
    .line 63
    new-instance v1, Ll/a6p0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/a6p0;-><init>(Ll/e6p0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public static synthetic L(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/e6p0;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N(Landroid/view/View;)V
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    const/high16 v1, 0x42d40000    # 106.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/high16 v2, 0x42600000    # 56.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic O(FLandroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 2
    .line 3
    float-to-int p0, p0

    .line 4
    const/high16 v1, 0x42600000    # 56.0f

    .line 5
    .line 6
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-direct {v0, p0, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Q(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic R(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/e6p0;->g0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic S(Ll/e6p0;Ll/vak0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e6p0;->i0(Ll/vak0;)V

    return-void
.end method

.method public static synthetic T(Ll/e6p0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/e6p0;->h0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
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

.method public static synthetic V(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e6p0;->f0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->u0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic X(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->q0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(Ll/e6p0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e6p0;->m0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Z(Ll/e6p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/e6p0;->v0(Landroid/view/View;)V

    return-void
.end method

.method private c0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x3

    .line 6
    const/high16 v1, 0x41100000    # 9.0f

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/bnl0;->y0()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/high16 v0, 0x42680000    # 58.0f

    .line 16
    .line 17
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    sub-int/2addr p0, v0

    .line 22
    int-to-float p0, p0

    .line 23
    const/high16 v0, 0x40400000    # 3.0f

    .line 24
    .line 25
    div-float/2addr p0, v0

    .line 26
    new-instance v0, Ll/n5p0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/n5p0;-><init>(F)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Landroid/view/View;

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {p0, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Landroid/view/View;

    .line 52
    .line 53
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    new-instance p0, Ll/o5p0;

    .line 62
    .line 63
    invoke-direct {p0}, Ll/o5p0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {p1, p0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-le p0, v2, :cond_1

    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Landroid/view/View;

    .line 81
    .line 82
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    invoke-static {p0, p1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method

.method private d0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/e6p0;->D:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/e6p0;->C:Lv/VText;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/e6p0;->B:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/e6p0;->F:Lv/VText;

    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/e6p0;->H:Lv/VText;

    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/e6p0;->s:Lv/VLinear;

    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ll/e6p0;->u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/e6p0;->K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Ll/e6p0;->n:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->i0()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/e6p0;->q:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceUserCardMedalAndNameView;->b()V

    .line 75
    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    iput-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    iput-object v0, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 81
    .line 82
    iget-object v0, p0, Ll/e6p0;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->n0()V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->e()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method private synthetic j0(Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p2, Ll/v7p0;

    .line 4
    .line 5
    const/16 v0, 0xed8

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->schema:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, v0, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 13
    .line 14
    check-cast p0, Ll/v7p0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic q0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/v7p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/atm0;->Z3()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic r0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/e6p0;->x0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/w7p0;->c()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 9
    .line 10
    check-cast p1, Ll/v7p0;

    .line 11
    .line 12
    iget-object p0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 13
    .line 14
    iget-object p0, p0, Ll/vak0;->c:Ll/nsv;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Ll/v7p0;->V4(Ll/nsv;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private synthetic t0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 6
    .line 7
    check-cast p0, Ll/v7p0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/v7p0;->U4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic u0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/v7p0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showVoiceFansClubDialog()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic v0(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/e6p0;->O:Ll/vak0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/vak0;->l()Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 24
    .line 25
    check-cast p1, Ll/v7p0;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->IntlVoiceMedalWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$IntlVoiceMedalWallEvent;->showMedalWall()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method private x0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "@"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, " "

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sget v2, Ll/ix4;->E:I

    .line 34
    .line 35
    if-le v1, v2, :cond_1

    .line 36
    .line 37
    add-int/lit8 v2, v2, -0x4

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "... "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 51
    .line 52
    check-cast p0, Ll/v7p0;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/v7p0;->T4(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public final A0(Ll/vak0;)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v2, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->shadingBackUrl:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v7, Ll/t5p0;

    .line 26
    .line 27
    invoke-direct {v7, p0, p1}, Ll/t5p0;-><init>(Ll/e6p0;Ll/vak0;)V

    .line 28
    .line 29
    .line 30
    move-object v4, p1

    .line 31
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->K(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ll/vak0;Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/v7p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public D0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 2
    .line 3
    const-string v1, "voiceUserCard"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "config is null"

    .line 8
    .line 9
    invoke-static {v1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const-string v0, "config.bottomButtons is empty"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/e6p0;->B:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "bottom button:"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 42
    .line 43
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->userId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/e6p0;->B:Landroid/widget/LinearLayout;

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    move v0, v2

    .line 62
    :goto_0
    iget-object v3, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 63
    .line 64
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-ge v0, v3, :cond_7

    .line 71
    .line 72
    iget-object v3, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 73
    .line 74
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Ljava/lang/String;

    .line 81
    .line 82
    new-instance v4, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v5, "render bottom button:"

    .line 85
    .line 86
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v4

    .line 96
    invoke-static {v1, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    const/4 v5, 0x1

    .line 107
    const/4 v6, -0x1

    .line 108
    sparse-switch v4, :sswitch_data_0

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :sswitch_0
    const-string v4, "sendGift"

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-nez v3, :cond_2

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    const/4 v6, 0x3

    .line 122
    goto :goto_1

    .line 123
    :sswitch_1
    const-string v4, "call"

    .line 124
    .line 125
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-nez v3, :cond_3

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    const/4 v6, 0x2

    .line 133
    goto :goto_1

    .line 134
    :sswitch_2
    const-string v4, "at"

    .line 135
    .line 136
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    if-nez v3, :cond_4

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_4
    move v6, v5

    .line 144
    goto :goto_1

    .line 145
    :sswitch_3
    const-string v4, "follow"

    .line 146
    .line 147
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v3

    .line 151
    if-nez v3, :cond_5

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_5
    move v6, v2

    .line 155
    :goto_1
    packed-switch v6, :pswitch_data_0

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :pswitch_0
    iget-object v3, p0, Ll/e6p0;->D:Lv/VText;

    .line 160
    .line 161
    invoke-static {v3, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    iget-object v3, p0, Ll/e6p0;->D:Lv/VText;

    .line 165
    .line 166
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->md:I

    .line 167
    .line 168
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :pswitch_1
    iget-object v3, p0, Ll/e6p0;->P:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 173
    .line 174
    invoke-virtual {p0, v3}, Ll/e6p0;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :pswitch_2
    iget-object v3, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 179
    .line 180
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 181
    .line 182
    .line 183
    move-result v3

    .line 184
    iget-object v4, p0, Ll/e6p0;->C:Lv/VText;

    .line 185
    .line 186
    if-eqz v3, :cond_6

    .line 187
    .line 188
    sget-object v3, Ll/zrv;->e:Landroid/app/Application;

    .line 189
    .line 190
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->Se:I

    .line 191
    .line 192
    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_6
    sget-object v3, Ll/zrv;->e:Landroid/app/Application;

    .line 201
    .line 202
    sget v5, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qe:I

    .line 203
    .line 204
    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    :goto_2
    iget-object v3, p0, Ll/e6p0;->C:Lv/VText;

    .line 212
    .line 213
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 214
    .line 215
    .line 216
    goto :goto_3

    .line 217
    :pswitch_3
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 218
    .line 219
    check-cast v3, Ll/v7p0;

    .line 220
    .line 221
    iget-object v4, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 222
    .line 223
    iget-object v5, p0, Ll/e6p0;->N:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 224
    .line 225
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->bottomButtons:Ljava/util/List;

    .line 226
    .line 227
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result v5

    .line 231
    invoke-virtual {v3, v4, v5}, Ll/atm0;->X3(Lcom/p1/mobile/putong/data/User;I)V

    .line 232
    .line 233
    .line 234
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 235
    .line 236
    move-object v4, v3

    .line 237
    check-cast v4, Ll/v7p0;

    .line 238
    .line 239
    invoke-virtual {v4}, Ll/v7p0;->h4()Ll/vak0;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 244
    .line 245
    check-cast v5, Ll/v7p0;

    .line 246
    .line 247
    invoke-virtual {v5}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 248
    .line 249
    .line 250
    move-result-object v5

    .line 251
    iget-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 252
    .line 253
    check-cast v6, Ll/v7p0;

    .line 254
    .line 255
    invoke-virtual {v6}, Ll/xzs;->R2()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v6

    .line 259
    invoke-static {v3, v4, v5, v6}, Ll/z8p0;->d(Ll/i6t;Ll/vak0;Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 263
    .line 264
    goto/16 :goto_0

    .line 265
    .line 266
    :cond_7
    return-void

    .line 267
    :sswitch_data_0
    .sparse-switch
        -0x4ba2c44f -> :sswitch_3
        0xc33 -> :sswitch_2
        0x2e7a5e -> :sswitch_1
        0x4a54a8d8 -> :sswitch_0
    .end sparse-switch

    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final E0()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e6p0;->O:Ll/vak0;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/vak0;->v()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/vak0;->v()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/vak0;->g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->maxRankHouseInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;

    .line 27
    .line 28
    iget-object v1, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 29
    .line 30
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseBackground:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseImage:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v4, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v5, "LV."

    .line 37
    .line 38
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iget v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 42
    .line 43
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseName:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->meUserAvatar:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->cpUserAvatar:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 63
    .line 64
    const/high16 v2, 0x42960000    # 75.0f

    .line 65
    .line 66
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    invoke-virtual {v1, v3, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->c(II)V

    .line 75
    .line 76
    .line 77
    iget-object v1, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->e:Lv/VDraweeView;

    .line 80
    .line 81
    new-instance v2, Ll/r5p0;

    .line 82
    .line 83
    invoke-direct {v2, p0, v0}, Ll/r5p0;-><init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p0, Ll/e6p0;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/VoiceSweetCpHeadView;->g:Lv/VDraweeView;

    .line 92
    .line 93
    new-instance v2, Ll/s5p0;

    .line 94
    .line 95
    invoke-direct {v2, p0, v0}, Ll/s5p0;-><init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    .line 100
    .line 101
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->houseRank:I

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    if-lt v0, v1, :cond_1

    .line 106
    .line 107
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/vak0;->g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->profileVideoEffect:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iget-object v1, p0, Ll/e6p0;->O:Ll/vak0;

    .line 120
    .line 121
    if-nez v0, :cond_0

    .line 122
    .line 123
    invoke-virtual {v1}, Ll/vak0;->g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->profileVideoEffect:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {p0, v0}, Ll/e6p0;->y0(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_0
    invoke-virtual {v1}, Ll/vak0;->g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->profileEffectImage:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_1

    .line 144
    .line 145
    iget-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 146
    .line 147
    const/4 v1, 0x1

    .line 148
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 149
    .line 150
    .line 151
    iget-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 152
    .line 153
    iget-object v2, p0, Ll/e6p0;->O:Ll/vak0;

    .line 154
    .line 155
    invoke-virtual {v2}, Ll/vak0;->g()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHouseRankUpgradeInfo;->profileEffectImage:Ljava/lang/String;

    .line 160
    .line 161
    new-instance v3, Ll/e6p0$a;

    .line 162
    .line 163
    invoke-direct {v3, p0}, Ll/e6p0$a;-><init>(Ll/e6p0;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, v2, v1, v3, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 167
    .line 168
    .line 169
    :cond_1
    return-void
.end method

.method public final G0(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/e6p0;->v:Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/fanbase/VoiceCardFanBaseEnterView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveFansMemberNum;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final H0(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserCardGiftWall;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast v0, Ll/v7p0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/v7p0;->B4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 22
    .line 23
    check-cast v2, Ll/v7p0;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    new-instance v3, Ll/k5p0;

    .line 30
    .line 31
    invoke-direct {v3, p0, v0}, Ll/k5p0;-><init>(Ll/e6p0;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    new-instance v4, Ll/l5p0;

    .line 35
    .line 36
    invoke-direct {v4, p0, v0}, Ll/l5p0;-><init>(Ll/e6p0;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1, v2, p1, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ll/x20;Lcom/tantanapp/media/ttmediautils/download/Action1;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/e6p0;->y:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/submodule/giftwall/VoiceCardGiftWallView;->b:Lv/VDraweeView;

    .line 45
    .line 46
    new-instance v1, Ll/m5p0;

    .line 47
    .line 48
    invoke-direct {v1, p0, v0}, Ll/m5p0;-><init>(Ll/e6p0;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final J0(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/e6p0;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/medalwall/VoiceCardMedalWallEnterView;->v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlMedalWallInUserCard;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public L0(ZLl/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/e6p0;->d0()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p2, p3}, Ll/e6p0;->B0(Ll/vak0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final M0(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 23
    .line 24
    move-object v0, p0

    .line 25
    check-cast v0, Ll/v7p0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public final a0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f6p0;->a(Ll/e6p0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/v7p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b0(Ll/v7p0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p0, Ll/v7p0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/v7p0;->z4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 15
    .line 16
    sget v1, Ll/obc0;->Y0:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 24
    .line 25
    check-cast p0, Ll/v7p0;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget v1, Ll/n9c0;->j1:I

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic f0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/v7p0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/v7p0;->G4(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic g0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p2, Ll/v7p0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p2, p1, p0}, Ll/v7p0;->S4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic h0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic i0(Ll/vak0;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->enableNewPrivilege:Z

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p1, Ll/vak0;->c:Ll/nsv;

    .line 22
    .line 23
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->jumpScheme:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_0

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 48
    .line 49
    check-cast p0, Ll/v7p0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->jumpScheme:Ljava/lang/String;

    .line 56
    .line 57
    const/16 v0, 0xed8

    .line 58
    .line 59
    invoke-virtual {p0, v0, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    const/4 v0, 0x3

    .line 64
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p1}, Ll/vak0;->o()Ll/nsv;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-eqz v0, :cond_1

    .line 91
    .line 92
    iget-object p0, p0, Ll/e6p0;->t:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardUserLevelView;->P(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v7p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e6p0;->b0(Ll/v7p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e6p0;->M0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCpHouseInfo;->otherUserId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e6p0;->M0(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/e6p0;->a0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->USER_CARD:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x50

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->A(I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Ll/e6p0;->K0()V

    .line 15
    .line 16
    .line 17
    sget v0, Ll/mdc0;->M7:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 24
    .line 25
    iput-object p1, p0, Ll/e6p0;->L:Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/view/LiveUserCardSkinView;->setDialogHost(Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic m0(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "profile"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast v0, Ll/v7p0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/v7p0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/e6p0;->b0(Ll/v7p0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic n0(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "profile"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast v1, Ll/v7p0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Ll/aco0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/aco0;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p2, v0, Ll/aco0;->b:Ljava/lang/String;

    .line 30
    .line 31
    iput-object p1, v0, Ll/aco0;->a:Ljava/lang/String;

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 34
    .line 35
    check-cast p1, Ll/v7p0;

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showGiftDetail()Ll/v3f$d;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final synthetic o0(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "profile"

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/bco0;->a(Ljava/lang/String;Ljava/lang/String;)Ll/bco0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p0, Ll/v7p0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceNewGiftWallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceNewGiftWallEvent;->showMainPage()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic p0(Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/v7p0;

    .line 4
    .line 5
    const/16 p2, 0xed8

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBoardGuard;->schema:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->w()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ll/e6p0;->J:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/e6p0;->K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/immomo/velib/player/VideoEffectView;->isPlaying()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Ll/e6p0;->K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;->stop()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/e6p0;->O:Ll/vak0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Ll/e6p0;->O:Ll/vak0;

    .line 20
    .line 21
    iget-object v0, p0, Ll/e6p0;->M:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Ll/vak0;->c(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Ll/e6p0;->E:Lv/VText;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/e6p0;->E:Lv/VText;

    .line 37
    .line 38
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->K6:I

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Ll/e6p0;->E:Lv/VText;

    .line 44
    .line 45
    sget v0, Ll/obc0;->c1:I

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/e6p0;->E:Lv/VText;

    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 53
    .line 54
    check-cast v0, Ll/v7p0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sget v1, Ll/n9c0;->w1:I

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/e6p0;->E:Lv/VText;

    .line 74
    .line 75
    new-instance v0, Ll/b6p0;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/b6p0;-><init>(Ll/e6p0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_1
    invoke-virtual {p0}, Ll/e6p0;->e0()V

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_2
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 89
    .line 90
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->qi:I

    .line 91
    .line 92
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 101
    .line 102
    sget v1, Ll/obc0;->c1:I

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 110
    .line 111
    check-cast v1, Ll/v7p0;

    .line 112
    .line 113
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    sget v2, Ll/n9c0;->w1:I

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/e6p0;->E:Lv/VText;

    .line 131
    .line 132
    new-instance v1, Ll/c6p0;

    .line 133
    .line 134
    invoke-direct {v1, p0, p1}, Ll/c6p0;-><init>(Ll/e6p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 138
    .line 139
    .line 140
    :cond_3
    :goto_0
    return-void
.end method

.method public final y0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ll/hre;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/v5p0;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/v5p0;-><init>(Ll/e6p0;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/hre;->m(Ll/pcj;)Ll/hre;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p0, p0, Ll/e6p0;->K:Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jfl0;->n(Lcom/p1/mobile/putong/live/base/mmsdk/effect/video/VideoEffectPlayer;Ll/hre;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final z0(Ll/vak0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/e6p0;->u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/e6p0;->u:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vak0;->d()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->shadingFrontUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/vak0;->e()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorLevel;->shadingBackUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VoiceCardAnchorLevelView;->O(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
