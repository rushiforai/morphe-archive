.class public Ll/sro0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;Landroid/view/View;)V
    .locals 8

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->e:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 23
    .line 24
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->f:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 25
    .line 26
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 37
    .line 38
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 39
    .line 40
    const/4 v2, 0x2

    .line 41
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 48
    .line 49
    const/4 v3, 0x3

    .line 50
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

    .line 55
    .line 56
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

    .line 57
    .line 58
    const/4 v4, 0x4

    .line 59
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roominfobar/VoiceRoomInfoView;

    .line 64
    .line 65
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->j:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roominfobar/VoiceRoomInfoView;

    .line 66
    .line 67
    const/4 v5, 0x5

    .line 68
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 73
    .line 74
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 75
    .line 76
    const/4 v6, 0x6

    .line 77
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationView;

    .line 82
    .line 83
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationView;

    .line 84
    .line 85
    const/4 v6, 0x7

    .line 86
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v6

    .line 90
    check-cast v6, Landroid/widget/FrameLayout;

    .line 91
    .line 92
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->m:Landroid/widget/FrameLayout;

    .line 93
    .line 94
    const/16 v6, 0x8

    .line 95
    .line 96
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 101
    .line 102
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->n:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 103
    .line 104
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    check-cast v7, Landroid/view/ViewGroup;

    .line 109
    .line 110
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    .line 115
    .line 116
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->o:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    .line 117
    .line 118
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    check-cast v6, Landroid/view/ViewGroup;

    .line 123
    .line 124
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    check-cast v6, Landroid/view/ViewGroup;

    .line 129
    .line 130
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    move-result-object v6

    .line 134
    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    .line 135
    .line 136
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->p:Landroidx/recyclerview/widget/RecyclerView;

    .line 137
    .line 138
    const/16 v6, 0x9

    .line 139
    .line 140
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 145
    .line 146
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 147
    .line 148
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object v7

    .line 152
    check-cast v7, Landroid/view/ViewGroup;

    .line 153
    .line 154
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 155
    .line 156
    .line 157
    move-result-object v7

    .line 158
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 159
    .line 160
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->r:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 161
    .line 162
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    check-cast v7, Landroid/view/ViewGroup;

    .line 167
    .line 168
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 173
    .line 174
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 175
    .line 176
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    check-cast v7, Landroid/view/ViewGroup;

    .line 181
    .line 182
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 187
    .line 188
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->t:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 189
    .line 190
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 191
    .line 192
    .line 193
    move-result-object v7

    .line 194
    check-cast v7, Landroid/view/ViewGroup;

    .line 195
    .line 196
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 201
    .line 202
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->u:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 203
    .line 204
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    check-cast v3, Landroid/view/ViewGroup;

    .line 209
    .line 210
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceTopNoticeView;

    .line 215
    .line 216
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->v:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceTopNoticeView;

    .line 217
    .line 218
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    check-cast v3, Landroid/view/ViewGroup;

    .line 223
    .line 224
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/VoiceChatGroupEnterView;

    .line 229
    .line 230
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/VoiceChatGroupEnterView;

    .line 231
    .line 232
    const/16 v3, 0xa

    .line 233
    .line 234
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 239
    .line 240
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->x:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 241
    .line 242
    const/16 v3, 0xb

    .line 243
    .line 244
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;

    .line 249
    .line 250
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->y:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceIncomeAreaStateView;

    .line 251
    .line 252
    const/16 v3, 0xc

    .line 253
    .line 254
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    check-cast v4, Lv/VFrame;

    .line 259
    .line 260
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->z:Lv/VFrame;

    .line 261
    .line 262
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 263
    .line 264
    .line 265
    move-result-object v3

    .line 266
    check-cast v3, Landroid/view/ViewGroup;

    .line 267
    .line 268
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceOrignalStateView;

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->A:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceOrignalStateView;

    .line 275
    .line 276
    const/16 v3, 0xd

    .line 277
    .line 278
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 279
    .line 280
    .line 281
    move-result-object v3

    .line 282
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/gameRoot/VoiceNewGamePlayRootView;

    .line 283
    .line 284
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->B:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/gameRoot/VoiceNewGamePlayRootView;

    .line 285
    .line 286
    const/16 v3, 0xe

    .line 287
    .line 288
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->C:Landroid/view/View;

    .line 293
    .line 294
    const/16 v3, 0xf

    .line 295
    .line 296
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 297
    .line 298
    .line 299
    move-result-object v4

    .line 300
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 301
    .line 302
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->D:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 303
    .line 304
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 305
    .line 306
    .line 307
    move-result-object v3

    .line 308
    check-cast v3, Landroid/view/ViewGroup;

    .line 309
    .line 310
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 311
    .line 312
    .line 313
    move-result-object v3

    .line 314
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 315
    .line 316
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->E:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 317
    .line 318
    const/16 v3, 0x10

    .line 319
    .line 320
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 321
    .line 322
    .line 323
    move-result-object v3

    .line 324
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 325
    .line 326
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->F:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 327
    .line 328
    const/16 v3, 0x11

    .line 329
    .line 330
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;

    .line 335
    .line 336
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->G:Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;

    .line 337
    .line 338
    const/16 v3, 0x12

    .line 339
    .line 340
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    check-cast v3, Landroid/widget/FrameLayout;

    .line 345
    .line 346
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->H:Landroid/widget/FrameLayout;

    .line 347
    .line 348
    const/16 v3, 0x13

    .line 349
    .line 350
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v3

    .line 354
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->I:Landroid/view/View;

    .line 355
    .line 356
    const/16 v3, 0x14

    .line 357
    .line 358
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 363
    .line 364
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->J:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 365
    .line 366
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v4

    .line 370
    check-cast v4, Landroid/view/ViewGroup;

    .line 371
    .line 372
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 373
    .line 374
    .line 375
    move-result-object v4

    .line 376
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 377
    .line 378
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->K:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 379
    .line 380
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    check-cast v4, Landroid/view/ViewGroup;

    .line 385
    .line 386
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    check-cast v4, Landroid/view/ViewGroup;

    .line 391
    .line 392
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 393
    .line 394
    .line 395
    move-result-object v4

    .line 396
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 397
    .line 398
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->L:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 399
    .line 400
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 401
    .line 402
    .line 403
    move-result-object v3

    .line 404
    check-cast v3, Landroid/view/ViewGroup;

    .line 405
    .line 406
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 407
    .line 408
    .line 409
    move-result-object v3

    .line 410
    check-cast v3, Landroid/view/ViewGroup;

    .line 411
    .line 412
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 413
    .line 414
    .line 415
    move-result-object v3

    .line 416
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 417
    .line 418
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->M:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 419
    .line 420
    const/16 v3, 0x15

    .line 421
    .line 422
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 427
    .line 428
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->N:Lcom/p1/mobile/putong/live/livingroom/voice/intl/player/VoiceRoomLoadingView;

    .line 429
    .line 430
    const/16 v3, 0x16

    .line 431
    .line 432
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 433
    .line 434
    .line 435
    move-result-object v4

    .line 436
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 437
    .line 438
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->O:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 439
    .line 440
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    check-cast v3, Landroid/view/ViewGroup;

    .line 445
    .line 446
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 451
    .line 452
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->P:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 453
    .line 454
    const/16 v3, 0x17

    .line 455
    .line 456
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 461
    .line 462
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->Q:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 463
    .line 464
    const/16 v3, 0x18

    .line 465
    .line 466
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 467
    .line 468
    .line 469
    move-result-object v4

    .line 470
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 471
    .line 472
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->R:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 473
    .line 474
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 475
    .line 476
    .line 477
    move-result-object v3

    .line 478
    check-cast v3, Landroid/view/ViewGroup;

    .line 479
    .line 480
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    check-cast v3, Landroid/widget/FrameLayout;

    .line 485
    .line 486
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->S:Landroid/widget/FrameLayout;

    .line 487
    .line 488
    const/16 v3, 0x19

    .line 489
    .line 490
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 491
    .line 492
    .line 493
    move-result-object v3

    .line 494
    check-cast v3, Landroid/view/ViewGroup;

    .line 495
    .line 496
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 497
    .line 498
    .line 499
    move-result-object v3

    .line 500
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 501
    .line 502
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->T:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 503
    .line 504
    const/16 v3, 0x1a

    .line 505
    .line 506
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 507
    .line 508
    .line 509
    move-result-object v3

    .line 510
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 511
    .line 512
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->U:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 513
    .line 514
    const/16 v3, 0x1b

    .line 515
    .line 516
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 517
    .line 518
    .line 519
    move-result-object v4

    .line 520
    check-cast v4, Lv/VFrame;

    .line 521
    .line 522
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->V:Lv/VFrame;

    .line 523
    .line 524
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 525
    .line 526
    .line 527
    move-result-object v4

    .line 528
    check-cast v4, Landroid/view/ViewGroup;

    .line 529
    .line 530
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 531
    .line 532
    .line 533
    move-result-object v4

    .line 534
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 535
    .line 536
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->W:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 537
    .line 538
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 539
    .line 540
    .line 541
    move-result-object v4

    .line 542
    check-cast v4, Landroid/view/ViewGroup;

    .line 543
    .line 544
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 549
    .line 550
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->k0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 551
    .line 552
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 553
    .line 554
    .line 555
    move-result-object v3

    .line 556
    check-cast v3, Landroid/view/ViewGroup;

    .line 557
    .line 558
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 559
    .line 560
    .line 561
    move-result-object v2

    .line 562
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 563
    .line 564
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->p0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 565
    .line 566
    const/16 v2, 0x1c

    .line 567
    .line 568
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 569
    .line 570
    .line 571
    move-result-object v3

    .line 572
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 573
    .line 574
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->E0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 575
    .line 576
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 577
    .line 578
    .line 579
    move-result-object v2

    .line 580
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 581
    .line 582
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->F0:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 583
    .line 584
    const/16 v2, 0x1d

    .line 585
    .line 586
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 587
    .line 588
    .line 589
    move-result-object v3

    .line 590
    check-cast v3, Lv/VFrame;

    .line 591
    .line 592
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->G0:Lv/VFrame;

    .line 593
    .line 594
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 595
    .line 596
    .line 597
    move-result-object v3

    .line 598
    check-cast v3, Landroid/view/ViewGroup;

    .line 599
    .line 600
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 601
    .line 602
    .line 603
    move-result-object v0

    .line 604
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 605
    .line 606
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->H0:Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 607
    .line 608
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 609
    .line 610
    .line 611
    move-result-object v0

    .line 612
    check-cast v0, Landroid/view/ViewGroup;

    .line 613
    .line 614
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->I0:Landroid/view/View;

    .line 619
    .line 620
    const/16 v0, 0x1e

    .line 621
    .line 622
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 623
    .line 624
    .line 625
    move-result-object p1

    .line 626
    check-cast p1, Landroid/widget/FrameLayout;

    .line 627
    .line 628
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;->J0:Landroid/widget/FrameLayout;

    .line 629
    .line 630
    return-void
.end method
