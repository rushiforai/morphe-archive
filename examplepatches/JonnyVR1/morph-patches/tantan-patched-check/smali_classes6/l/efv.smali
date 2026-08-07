.class public Ll/efv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final A:Ljava/lang/String;

.field public static final B:Ljava/lang/String;

.field public static final C:Ljava/lang/String;

.field public static final D:Ljava/lang/String;

.field public static final E:Ljava/lang/String;

.field public static final F:Ljava/lang/String;

.field public static final G:Ljava/lang/String;

.field public static final H:Ljava/lang/String;

.field public static final I:Ljava/lang/String;

.field public static final J:Ljava/lang/String;

.field public static final K:Ljava/lang/String;

.field public static final L:Ljava/lang/String;

.field public static final M:Ljava/lang/String;

.field public static final N:Ljava/lang/String;

.field public static final O:Ljava/lang/String;

.field public static final P:Ljava/lang/String;

.field public static final Q:Ljava/lang/String;

.field public static R:Ljava/lang/String;

.field public static final S:Ljava/lang/String;

.field public static final T:Ljava/lang/String;

.field public static U:Ljava/lang/String;

.field public static V:Ljava/lang/String;

.field public static a:Ljava/lang/String;

.field public static b:Ljava/lang/String;

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;

.field public static e:Ljava/lang/String;

.field public static f:Ljava/lang/String;

.field public static g:Ljava/lang/String;

.field public static h:Ljava/lang/String;

.field public static i:Ljava/lang/String;

.field public static j:Ljava/lang/String;

.field public static k:Ljava/lang/String;

.field public static l:Ljava/lang/String;

.field public static m:Ljava/lang/String;

.field public static final n:Ljava/lang/String;

.field public static final o:Ljava/lang/String;

.field public static final p:Ljava/lang/String;

.field public static final q:Ljava/lang/String;

.field public static final r:Ljava/lang/String;

.field public static final s:Ljava/lang/String;

.field public static final t:Ljava/lang/String;

.field public static u:Ljava/lang/String;

.field public static final v:Ljava/lang/String;

.field public static final w:Ljava/lang/String;

.field public static x:Ljava/lang/String;

.field public static final y:Ljava/lang/String;

.field public static final z:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const-string v0, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/liveIdentity/index.html?speed=true&_bid=1005271&hideNavigationBar=1#/auth"

    .line 2
    .line 3
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/efv;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "international_live/applyForLive"

    .line 10
    .line 11
    invoke-static {v0}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Ll/efv;->b:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "coverreview"

    .line 18
    .line 19
    invoke-static {v0}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Ll/efv;->c:Ljava/lang/String;

    .line 24
    .line 25
    const-string v0, "wealthlevel"

    .line 26
    .line 27
    invoke-static {v0}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Ll/efv;->d:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/anchorCenter/index.html?speed=true&_bid=1005259&hideNavigationBar=1&hideNotch=1#/anchor_level/main"

    .line 41
    .line 42
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    const-string v1, "anchorlevel"

    .line 48
    .line 49
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    :goto_0
    sput-object v1, Ll/efv;->e:Ljava/lang/String;

    .line 54
    .line 55
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/teensForgetPWD/index.html?speed=true&_bid=1004044#/switch_teenager_mode"

    .line 56
    .line 57
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sput-object v1, Ll/efv;->f:Ljava/lang/String;

    .line 62
    .line 63
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/teensForgetPWD/index.html?speed=true&_bid=1004044#/password/input_teenager_password?closeable=true&scenes="

    .line 64
    .line 65
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    sput-object v1, Ll/efv;->g:Ljava/lang/String;

    .line 70
    .line 71
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/live_help/main"

    .line 72
    .line 73
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    sput-object v1, Ll/efv;->h:Ljava/lang/String;

    .line 78
    .line 79
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/pk-help"

    .line 80
    .line 81
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    sput-object v1, Ll/efv;->i:Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/funs-rule"

    .line 88
    .line 89
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    sput-object v2, Ll/efv;->j:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    sput-object v1, Ll/efv;->k:Ljava/lang/String;

    .line 100
    .line 101
    const-string v1, "video_connect/identity"

    .line 102
    .line 103
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sput-object v1, Ll/efv;->l:Ljava/lang/String;

    .line 108
    .line 109
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/user-rights-rule"

    .line 110
    .line 111
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    sput-object v1, Ll/efv;->m:Ljava/lang/String;

    .line 116
    .line 117
    const-string v1, "regularActivity/newStarRank/main"

    .line 118
    .line 119
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    sput-object v1, Ll/efv;->n:Ljava/lang/String;

    .line 124
    .line 125
    const-string v1, "identityForVoiceRoom"

    .line 126
    .line 127
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    sput-object v1, Ll/efv;->o:Ljava/lang/String;

    .line 132
    .line 133
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/fragments-rule"

    .line 134
    .line 135
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    sput-object v1, Ll/efv;->p:Ljava/lang/String;

    .line 140
    .line 141
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/sign_in_help"

    .line 142
    .line 143
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    sput-object v1, Ll/efv;->q:Ljava/lang/String;

    .line 148
    .line 149
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/storm_barrage_rule"

    .line 150
    .line 151
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    sput-object v1, Ll/efv;->r:Ljava/lang/String;

    .line 156
    .line 157
    const-string v1, "/first_recharge_optimization_rule"

    .line 158
    .line 159
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    sput-object v1, Ll/efv;->s:Ljava/lang/String;

    .line 164
    .line 165
    const-string v1, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/liveRevenueModule/index.html?_bid=1003389#/firstRecharge/rule"

    .line 166
    .line 167
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    sput-object v1, Ll/efv;->t:Ljava/lang/String;

    .line 172
    .line 173
    const-string v1, "liveRules/obs_rule"

    .line 174
    .line 175
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    sput-object v1, Ll/efv;->u:Ljava/lang/String;

    .line 180
    .line 181
    const-string v1, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/anchorReport/index.html?speed=true&_bid=1005238&hideNavigationBar=1&hideNotch=1#/anchorReport"

    .line 182
    .line 183
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    sput-object v1, Ll/efv;->v:Ljava/lang/String;

    .line 188
    .line 189
    const-string v1, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/anchorReport/index.html?speed=true&_bid=1005238&hideNavigationBar=1&hideNotch=1#/voiceAnchorReport"

    .line 190
    .line 191
    invoke-static {v1}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    sput-object v1, Ll/efv;->w:Ljava/lang/String;

    .line 196
    .line 197
    const-string v1, "voiceUndercoverRule"

    .line 198
    .line 199
    invoke-static {v1}, Ll/efv;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    sput-object v1, Ll/efv;->x:Ljava/lang/String;

    .line 204
    .line 205
    const-string v1, "feedback-mobile/voice_room_feedback"

    .line 206
    .line 207
    invoke-static {v1}, Ll/efv;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    sput-object v1, Ll/efv;->y:Ljava/lang/String;

    .line 212
    .line 213
    const-string v1, "popularity/rule"

    .line 214
    .line 215
    invoke-static {v1}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    sput-object v1, Ll/efv;->z:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-eqz v0, :cond_1

    .line 226
    .line 227
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/anchorCenter/index.html?speed=true&_bid=1005259&hideNavigationBar=1&hideNotch=1#/bill/menu"

    .line 228
    .line 229
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    goto :goto_1

    .line 234
    :cond_1
    const-string v0, "billMenu"

    .line 235
    .line 236
    invoke-static {v0}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    :goto_1
    sput-object v0, Ll/efv;->A:Ljava/lang/String;

    .line 241
    .line 242
    const-string v0, "crown/rule?transparent=1"

    .line 243
    .line 244
    invoke-static {v0}, Ll/efv;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    sput-object v0, Ll/efv;->B:Ljava/lang/String;

    .line 249
    .line 250
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?_bid=1003189#/presents_wall_rule_2"

    .line 251
    .line 252
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    sput-object v0, Ll/efv;->C:Ljava/lang/String;

    .line 257
    .line 258
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/present_skin_rule"

    .line 259
    .line 260
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    sput-object v0, Ll/efv;->D:Ljava/lang/String;

    .line 265
    .line 266
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoomRule/index.html?_bid=1003285&hideNavigationBar=1&hideNoth=1&webviewColor=19191e#/gifts_wall_rule"

    .line 267
    .line 268
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    sput-object v0, Ll/efv;->E:Ljava/lang/String;

    .line 273
    .line 274
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoomRule/index.html?_bid=1003285#/board_rule"

    .line 275
    .line 276
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    sput-object v0, Ll/efv;->F:Ljava/lang/String;

    .line 281
    .line 282
    const-string v0, "fep/tantan/intl/new-fep-projects/intl-h5-activity/src/apps/theGreatRight/index.html?speed=true&_bid=1003477&hideNotch=1&hideNavigationBar=1"

    .line 283
    .line 284
    invoke-static {v0}, Ll/efv;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    sput-object v0, Ll/efv;->G:Ljava/lang/String;

    .line 289
    .line 290
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?_bid=1003189#/auction-rule"

    .line 291
    .line 292
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    sput-object v0, Ll/efv;->H:Ljava/lang/String;

    .line 297
    .line 298
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?_bid=1003189#/auction-relationship-rule"

    .line 299
    .line 300
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    sput-object v0, Ll/efv;->I:Ljava/lang/String;

    .line 305
    .line 306
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/group-master-growth/index.html?_bid=1003862#/main"

    .line 307
    .line 308
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    sput-object v0, Ll/efv;->J:Ljava/lang/String;

    .line 313
    .line 314
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoomRule/index.html?_bid=1003285&_offline=1#/paipai_rule"

    .line 315
    .line 316
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object v0

    .line 320
    sput-object v0, Ll/efv;->K:Ljava/lang/String;

    .line 321
    .line 322
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoomRule/index.html?_bid=1003285/#/love_planet_rule"

    .line 323
    .line 324
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    sput-object v0, Ll/efv;->L:Ljava/lang/String;

    .line 329
    .line 330
    const-string v0, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoomRule/index.html?speed=true&_bid=1003285#/contribution_list"

    .line 331
    .line 332
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    sput-object v0, Ll/efv;->M:Ljava/lang/String;

    .line 337
    .line 338
    const-string v0, "fep/tantan/frontend-live/frontend-live-activity-vue/src/apps/rankingList/index.html"

    .line 339
    .line 340
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    sput-object v0, Ll/efv;->N:Ljava/lang/String;

    .line 345
    .line 346
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/pk_card_rule"

    .line 347
    .line 348
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    sput-object v0, Ll/efv;->O:Ljava/lang/String;

    .line 353
    .line 354
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/pages_about_verify/protocol?needProtocolAndAgreement=noNeed"

    .line 355
    .line 356
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    sput-object v0, Ll/efv;->P:Ljava/lang/String;

    .line 361
    .line 362
    const-string v0, "fep/tantan/frontend-live/frontend-live-web-vue/src/apps/videoRoomRule/index.html?speed=true&_bid=1003189#/pages_about_verify/cooperation_agreement?needProtocolAndAgreement=noNeed"

    .line 363
    .line 364
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    sput-object v0, Ll/efv;->Q:Ljava/lang/String;

    .line 369
    .line 370
    const-string v0, "https://miniprogram.tantanapp.com/view/staticpage/convention.html"

    .line 371
    .line 372
    sput-object v0, Ll/efv;->R:Ljava/lang/String;

    .line 373
    .line 374
    const-string v0, "/fep/tantan/intl/new-fep-projects/intl-h5-activity/src/apps/fanClubDes/index.html?speed=true&_bid=1005584#/"

    .line 375
    .line 376
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    sput-object v0, Ll/efv;->S:Ljava/lang/String;

    .line 381
    .line 382
    const-string v0, "/fep/tantan/intl/new-fep-projects/intl-h5-activity/src/apps/fanClubDes/index.html?speed=true&_bid=1005584#/listDes"

    .line 383
    .line 384
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v0

    .line 388
    sput-object v0, Ll/efv;->T:Ljava/lang/String;

    .line 389
    .line 390
    const-string v0, "fep/tantan/frontend-live/frontend-live-activity-vue/src/apps/ktv-song-title/index.html?speed=true&_bid=1005152&widthRadio=1&heightRatio=0.7&hideNotch=1&needCloseBtn=0&transparent=1&gravity=1&from=ktv#/defendingRule"

    .line 391
    .line 392
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    sput-object v0, Ll/efv;->U:Ljava/lang/String;

    .line 397
    .line 398
    const-string v0, "/fep/tantan/intl/new-fep-projects/intl-h5-activity/src/apps/rules/index.html?speed=true&_bid=1006230/#/giftGuide"

    .line 399
    .line 400
    invoke-static {v0}, Ll/efv;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    sput-object v0, Ll/efv;->V:Ljava/lang/String;

    .line 405
    .line 406
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/voiceRoom/index.html?_bid=1002942&widthRatio=1.0&heightRatio=0.75&needCloseBtn=0&transparent=1&gravity=1&cornerRadius=0&uid=%s&tabs_type=embedded#/chat_room_companion_list"

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v1, Ll/qv5;->D:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static b(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->x:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static c(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->F:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static d(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->E:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static e()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/efv;->N:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "?speed=true&_bid=1004884&name=room_owner&period=hour&widthRatio=1.0&heightRatio=1.0&needCloseBtn=0&transparent=1&gravity=1"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    return-object v0
.end method

.method public static f(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ll/efv;->F:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, "?openFrom="

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public static g(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->D:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static h(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->o:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static i(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "monetization/international/#/revenue"

    .line 4
    .line 5
    invoke-static {p0}, Ll/efv;->h(Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/exchangeTanTanCoin/index.html?speed=true&_bid=1004296#/revenue"

    .line 11
    .line 12
    invoke-static {p0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static j(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qv5;->r:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "/"

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_0

    .line 10
    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static k()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "protocol?needProtocolAndAgreement=noNeed"

    .line 2
    .line 3
    invoke-static {v0}, Ll/efv;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "/fep/tantan/frontend-live/frontend-live-web-vue/src/apps/anchorReport/index.html?speed=true&_bid=1005238&hideNavigationBar=1&hideNotch=1#/videoChatAnchorReport"

    .line 2
    .line 3
    invoke-static {v0}, Ll/efv;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->m(Ljava/lang/String;)Ll/rnl$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "videoChatAnchorId"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "reportUserId"

    .line 18
    .line 19
    invoke-virtual {p0, v0, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "liveId"

    .line 24
    .line 25
    invoke-virtual {p0, p1, p2}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "roomId"

    .line 30
    .line 31
    invoke-virtual {p0, p1, p3}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p2, ""

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string p2, "reportTime"

    .line 53
    .line 54
    invoke-virtual {p0, p2, p1}, Ll/rnl$a;->c(Ljava/lang/String;Ljava/lang/String;)Ll/rnl$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/rnl$a;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
