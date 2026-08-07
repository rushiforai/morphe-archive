.class public Ll/m5o0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;Landroid/view/View;)V
    .locals 8

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->d:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/VoiceBackgroundView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->e:Lcom/p1/mobile/putong/live/livingroom/view/TouchSwallowView;

    .line 20
    .line 21
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->f:Lcom/p1/mobile/putong/live/livingroom/voice/fans/VoiceFansView;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 41
    .line 42
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->g:Lcom/p1/mobile/putong/live/livingroom/voice/intl/close/VoiceCloseView;

    .line 43
    .line 44
    const/4 v3, 0x3

    .line 45
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

    .line 50
    .line 51
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->h:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;

    .line 52
    .line 53
    const/4 v4, 0x4

    .line 54
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v5

    .line 58
    check-cast v5, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roominfobar/VoiceRoomInfoView;

    .line 59
    .line 60
    iput-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->i:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roominfobar/VoiceRoomInfoView;

    .line 61
    .line 62
    const/4 v5, 0x5

    .line 63
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 68
    .line 69
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->j:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 70
    .line 71
    const/4 v6, 0x6

    .line 72
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationView;

    .line 77
    .line 78
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->k:Lcom/p1/mobile/putong/live/livingroom/voice/intl/newoperation/VoiceNewOperationView;

    .line 79
    .line 80
    const/4 v6, 0x7

    .line 81
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 86
    .line 87
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->l:Lcom/p1/mobile/putong/live/livingroom/voice/applymanager/VoiceLiveApplyManagerEnterViewModel;

    .line 88
    .line 89
    const/16 v6, 0x8

    .line 90
    .line 91
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object v6

    .line 95
    check-cast v6, Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/gameRoot/VoiceNewGamePlayRootView;

    .line 96
    .line 97
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->m:Lcom/p1/mobile/putong/live/livingroom/voice/intl/game/gameRoot/VoiceNewGamePlayRootView;

    .line 98
    .line 99
    const/16 v6, 0x9

    .line 100
    .line 101
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    .line 106
    .line 107
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->n:Lcom/p1/mobile/putong/live/livingroom/voice/intl/operations/VoiceOperationsView;

    .line 108
    .line 109
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    check-cast v6, Landroid/view/ViewGroup;

    .line 114
    .line 115
    invoke-virtual {v6, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    .line 120
    .line 121
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->o:Landroidx/recyclerview/widget/RecyclerView;

    .line 122
    .line 123
    const/16 v6, 0xa

    .line 124
    .line 125
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    check-cast v6, Landroid/widget/FrameLayout;

    .line 130
    .line 131
    iput-object v6, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->p:Landroid/widget/FrameLayout;

    .line 132
    .line 133
    const/16 v6, 0xb

    .line 134
    .line 135
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    check-cast v7, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 140
    .line 141
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 142
    .line 143
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    check-cast v7, Landroid/view/ViewGroup;

    .line 148
    .line 149
    invoke-virtual {v7, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 154
    .line 155
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->r:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heartbeat/VoiceTopHeartBeatView;

    .line 156
    .line 157
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v7

    .line 161
    check-cast v7, Landroid/view/ViewGroup;

    .line 162
    .line 163
    invoke-virtual {v7, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 164
    .line 165
    .line 166
    move-result-object v7

    .line 167
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 168
    .line 169
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/intlstarboard/IntlLiveStarBoardEntryView;

    .line 170
    .line 171
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 172
    .line 173
    .line 174
    move-result-object v7

    .line 175
    check-cast v7, Landroid/view/ViewGroup;

    .line 176
    .line 177
    invoke-virtual {v7, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object v7

    .line 181
    check-cast v7, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 182
    .line 183
    iput-object v7, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->t:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/leaderboard/hourleaderboard/widget/VoiceLiveHourBoardEntryView;

    .line 184
    .line 185
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    check-cast v7, Landroid/view/ViewGroup;

    .line 190
    .line 191
    invoke-virtual {v7, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 196
    .line 197
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->u:Lcom/p1/mobile/putong/live/livingroom/voice/intl/heatbox/VoiceLiveHeatBoxEntryView;

    .line 198
    .line 199
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    check-cast v3, Landroid/view/ViewGroup;

    .line 204
    .line 205
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceTopNoticeView;

    .line 210
    .line 211
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->v:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceTopNoticeView;

    .line 212
    .line 213
    invoke-virtual {p1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    check-cast v3, Landroid/view/ViewGroup;

    .line 218
    .line 219
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 220
    .line 221
    .line 222
    move-result-object v3

    .line 223
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/VoiceChatGroupEnterView;

    .line 224
    .line 225
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->w:Lcom/p1/mobile/putong/live/livingroom/voice/intl/chatgroup/VoiceChatGroupEnterView;

    .line 226
    .line 227
    const/16 v3, 0xc

    .line 228
    .line 229
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->x:Landroid/view/View;

    .line 234
    .line 235
    const/16 v3, 0xd

    .line 236
    .line 237
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 242
    .line 243
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->y:Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 244
    .line 245
    const/16 v3, 0xe

    .line 246
    .line 247
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    check-cast v3, Landroid/widget/FrameLayout;

    .line 252
    .line 253
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->z:Landroid/widget/FrameLayout;

    .line 254
    .line 255
    const/16 v3, 0xf

    .line 256
    .line 257
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 258
    .line 259
    .line 260
    move-result-object v3

    .line 261
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->A:Landroid/view/View;

    .line 262
    .line 263
    const/16 v3, 0x10

    .line 264
    .line 265
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 270
    .line 271
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->B:Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkTimeView;

    .line 272
    .line 273
    const/16 v3, 0x11

    .line 274
    .line 275
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 276
    .line 277
    .line 278
    move-result-object v3

    .line 279
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;

    .line 280
    .line 281
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->C:Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceGrabHatFloatViewMode;

    .line 282
    .line 283
    const/16 v3, 0x12

    .line 284
    .line 285
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 286
    .line 287
    .line 288
    move-result-object v4

    .line 289
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 290
    .line 291
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->D:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/VoiceBottomView;

    .line 292
    .line 293
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 294
    .line 295
    .line 296
    move-result-object v4

    .line 297
    check-cast v4, Landroid/view/ViewGroup;

    .line 298
    .line 299
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 304
    .line 305
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->E:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatBottomView;

    .line 306
    .line 307
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 308
    .line 309
    .line 310
    move-result-object v3

    .line 311
    check-cast v3, Landroid/view/ViewGroup;

    .line 312
    .line 313
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 314
    .line 315
    .line 316
    move-result-object v3

    .line 317
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 318
    .line 319
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->F:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/BottomMenuView;

    .line 320
    .line 321
    const/16 v3, 0x13

    .line 322
    .line 323
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 324
    .line 325
    .line 326
    move-result-object v3

    .line 327
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 328
    .line 329
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->G:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveGiftTrays;

    .line 330
    .line 331
    const/16 v3, 0x14

    .line 332
    .line 333
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 338
    .line 339
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->H:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 340
    .line 341
    const/16 v3, 0x15

    .line 342
    .line 343
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    check-cast v3, Landroid/view/ViewGroup;

    .line 348
    .line 349
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    check-cast v3, Landroid/widget/FrameLayout;

    .line 354
    .line 355
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->I:Landroid/widget/FrameLayout;

    .line 356
    .line 357
    const/16 v3, 0x16

    .line 358
    .line 359
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    check-cast v3, Landroid/view/ViewGroup;

    .line 364
    .line 365
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 370
    .line 371
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->J:Lcom/p1/mobile/putong/live/livingroom/intl/gift/IntlGiftComboView;

    .line 372
    .line 373
    const/16 v3, 0x17

    .line 374
    .line 375
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 380
    .line 381
    iput-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->K:Lcom/p1/mobile/putong/live/livingroom/voice/intl/increment/bullet/VoiceLiveBulletView;

    .line 382
    .line 383
    const/16 v3, 0x18

    .line 384
    .line 385
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 386
    .line 387
    .line 388
    move-result-object v4

    .line 389
    check-cast v4, Lv/VFrame;

    .line 390
    .line 391
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->L:Lv/VFrame;

    .line 392
    .line 393
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 394
    .line 395
    .line 396
    move-result-object v4

    .line 397
    check-cast v4, Landroid/view/ViewGroup;

    .line 398
    .line 399
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 404
    .line 405
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->M:Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;

    .line 406
    .line 407
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    check-cast v4, Landroid/view/ViewGroup;

    .line 412
    .line 413
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 418
    .line 419
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->N:Lcom/p1/mobile/putong/live/livingroom/increment/gift/giftlayer/LiveGiftLayer;

    .line 420
    .line 421
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    check-cast v1, Landroid/view/ViewGroup;

    .line 426
    .line 427
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 428
    .line 429
    .line 430
    move-result-object v1

    .line 431
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 432
    .line 433
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->O:Lcom/p1/mobile/putong/live/livingroom/increment/gift/topeffect/view/TopEffectLayer;

    .line 434
    .line 435
    const/16 v1, 0x19

    .line 436
    .line 437
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 442
    .line 443
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->P:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 444
    .line 445
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 446
    .line 447
    .line 448
    move-result-object v1

    .line 449
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 450
    .line 451
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->Q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/LiveEnterRoomView;

    .line 452
    .line 453
    const/16 v1, 0x1a

    .line 454
    .line 455
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 456
    .line 457
    .line 458
    move-result-object v2

    .line 459
    check-cast v2, Lv/VFrame;

    .line 460
    .line 461
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->R:Lv/VFrame;

    .line 462
    .line 463
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    check-cast v1, Landroid/view/ViewGroup;

    .line 468
    .line 469
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 474
    .line 475
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->S:Lcom/p1/mobile/putong/live/livingroom/voice/bubble/VoiceLiveBubbleView;

    .line 476
    .line 477
    const/16 v0, 0x1b

    .line 478
    .line 479
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->T:Landroid/view/View;

    .line 484
    .line 485
    const/16 v0, 0x1c

    .line 486
    .line 487
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    .line 492
    .line 493
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->U:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    .line 494
    .line 495
    const/16 v0, 0x1d

    .line 496
    .line 497
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 498
    .line 499
    .line 500
    move-result-object p1

    .line 501
    check-cast p1, Landroid/widget/FrameLayout;

    .line 502
    .line 503
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceLiveView;->V:Landroid/widget/FrameLayout;

    .line 504
    .line 505
    return-void
.end method
