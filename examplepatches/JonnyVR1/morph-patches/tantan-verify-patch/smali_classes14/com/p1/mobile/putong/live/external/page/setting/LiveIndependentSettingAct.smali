.class public Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->a2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "target"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "bundle_for_frag"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private a2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "target"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "bundle_for_frag"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->b2(Ljava/lang/String;Landroid/os/Bundle;)Lcom/p1/mobile/putong/app/PutongFrag;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->c:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    sget v1, Ll/jdc0;->G0:I

    .line 42
    .line 43
    invoke-virtual {p0, v1, v0, p1}, Landroidx/fragment/app/k;->t(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static c2(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Y1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final b2(Ljava/lang/String;Landroid/os/Bundle;)Lcom/p1/mobile/putong/app/PutongFrag;
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "intl_music_scanning_page_frag"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_1
    const/16 v1, 0xe

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "voice_internal_square_page"

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_2
    const/16 v1, 0xd

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "live_video_chat"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-nez p1, :cond_3

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_3
    const/16 v1, 0xc

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "privacy_setting"

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-nez p1, :cond_4

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_4
    const/16 v1, 0xb

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "voice_square_page"

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_5

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_5
    const/16 v1, 0xa

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "live_video_square_page"

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_6

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_6
    const/16 v1, 0x9

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "hide_wealth_icon"

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-nez p1, :cond_7

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_7
    const/16 v1, 0x8

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "hide_avatar"

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-nez p1, :cond_8

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_8
    const/4 v1, 0x7

    .line 123
    goto :goto_0

    .line 124
    :sswitch_8
    const-string v0, "scheme_fake_frag"

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_9

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_9
    const/4 v1, 0x6

    .line 134
    goto :goto_0

    .line 135
    :sswitch_9
    const-string v0, "intl_music_playlist_page_frag"

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-nez p1, :cond_a

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_a
    const/4 v1, 0x5

    .line 145
    goto :goto_0

    .line 146
    :sswitch_a
    const-string v0, "live_setting_page"

    .line 147
    .line 148
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result p1

    .line 152
    if-nez p1, :cond_b

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_b
    const/4 v1, 0x4

    .line 156
    goto :goto_0

    .line 157
    :sswitch_b
    const-string v0, "voice_favorite_chat_rooms"

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    if-nez p1, :cond_c

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_c
    const/4 v1, 0x3

    .line 167
    goto :goto_0

    .line 168
    :sswitch_c
    const-string v0, "scheme_dummy_frag"

    .line 169
    .line 170
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_d

    .line 175
    .line 176
    goto :goto_0

    .line 177
    :cond_d
    const/4 v1, 0x2

    .line 178
    goto :goto_0

    .line 179
    :sswitch_d
    const-string v0, "live_internal_my_room_frag"

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_e

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_e
    const/4 v1, 0x1

    .line 189
    goto :goto_0

    .line 190
    :sswitch_e
    const-string v0, "live_internal_voice_search"

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-nez p1, :cond_f

    .line 197
    .line 198
    goto :goto_0

    .line 199
    :cond_f
    const/4 v1, 0x0

    .line 200
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 201
    .line 202
    .line 203
    return-object p0

    .line 204
    :pswitch_0
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/music/MusicScanningPageFrag;->M4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 205
    .line 206
    .line 207
    move-result-object p0

    .line 208
    return-object p0

    .line 209
    :pswitch_1
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/LiveVoiceInternalSquareFrag;->N4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0

    .line 214
    :pswitch_2
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;->l5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/internal/live/square/fragments/videochat/LiveVideoChatFrag;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    return-object p0

    .line 219
    :pswitch_3
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/LivePrivacySettingFrag;->M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/LivePrivacySettingFrag;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    return-object p0

    .line 224
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;

    .line 225
    .line 226
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voice/home/LiveSquareVoiceFragment;-><init>()V

    .line 227
    .line 228
    .line 229
    return-object p0

    .line 230
    :pswitch_5
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/internal/live/square/featuredExp/LiveSquareFrag;->S4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/internal/live/square/featuredExp/LiveSquareFrag;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    return-object p0

    .line 235
    :pswitch_6
    invoke-static {}, Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;->N4()Lcom/p1/mobile/putong/live/external/page/setting/privacy/frag/HideWealthIconFrag;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    return-object p0

    .line 240
    :pswitch_7
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/LiveHideAvatarFrag;->M4(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/setting/hideavatar/LiveHideAvatarFrag;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    return-object p0

    .line 245
    :pswitch_8
    new-instance p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSchemeFakeFrag;

    .line 246
    .line 247
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSchemeFakeFrag;-><init>()V

    .line 248
    .line 249
    .line 250
    return-object p0

    .line 251
    :pswitch_9
    invoke-static {}, Lcom/p1/mobile/putong/live/external/intl/music/MusicPlaylistPageFrag;->M4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    return-object p0

    .line 256
    :pswitch_a
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;->D5(Landroid/os/Bundle;)Lcom/p1/mobile/putong/live/external/page/setting/LiveSettingFragNew;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    return-object p0

    .line 261
    :pswitch_b
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;->M4()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/favoritevoice/VoiceInternalFavoriteRoomFrag;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    return-object p0

    .line 266
    :pswitch_c
    new-instance p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveSchemeDummyFrag;

    .line 267
    .line 268
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveSchemeDummyFrag;-><init>()V

    .line 269
    .line 270
    .line 271
    return-object p0

    .line 272
    :pswitch_d
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/me/LiveMyVoiceRoomPageFrag;->O4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    return-object p0

    .line 277
    :pswitch_e
    invoke-static {}, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/search/LiveVoiceSearchFrag;->O4()Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    return-object p0

    .line 282
    nop

    .line 283
    :sswitch_data_0
    .sparse-switch
        -0x7a05637c -> :sswitch_e
        -0x769108ce -> :sswitch_d
        -0x4e22f5fd -> :sswitch_c
        -0x4b73bcb9 -> :sswitch_b
        -0x4a72e86f -> :sswitch_a
        -0x3400c08f -> :sswitch_9
        -0x261f957e -> :sswitch_8
        -0x1cc32d0a -> :sswitch_7
        -0xb1211b2 -> :sswitch_6
        0xc3d361a -> :sswitch_5
        0x3bfbf0e4 -> :sswitch_4
        0x3eb7d099 -> :sswitch_3
        0x666be5cf -> :sswitch_2
        0x73b32adc -> :sswitch_1
        0x74f4cb90 -> :sswitch_0
    .end sparse-switch

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget p0, Ll/jdc0;->G0:I

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/view/View;->setId(I)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/vzs;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/vzs;-><init>(Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    const-string v0, "live_video_square_page"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 23
    .line 24
    .line 25
    return-void
.end method
