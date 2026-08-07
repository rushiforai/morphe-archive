.class public Ll/k7e0;
.super Ll/o5e0;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "purchase"

    .line 5
    .line 6
    iput-object v0, p0, Ll/k7e0;->a:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Ll/abe0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {p0}, Ll/f5g;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v2, "/"

    .line 18
    .line 19
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :cond_0
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "type"

    .line 28
    .line 29
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ljava/lang/String;

    .line 34
    .line 35
    const-string v2, "edit"

    .line 36
    .line 37
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    const-string v3, "gameComposite"

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->GAME_CP:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 60
    .line 61
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/loop/input/ProfileLoopFragAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;)Landroid/content/Intent;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    const-string v1, "mbti"

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_2

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget-object p1, Ll/tr90;->o:Ljava/lang/String;

    .line 92
    .line 93
    const-string p2, "edit_profile"

    .line 94
    .line 95
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    const/4 v6, 0x1

    .line 104
    const/4 v7, 0x0

    .line 105
    const-string v1, ""

    .line 106
    .line 107
    const/4 v3, 0x1

    .line 108
    const/4 v4, 0x1

    .line 109
    const/4 v5, 0x1

    .line 110
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;->g2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZZZLandroid/os/ResultReceiver;)Landroid/content/Intent;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_2
    invoke-super {p0, p1, p2}, Ll/o5e0;->a(Ll/abe0;Ll/z20;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 9
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/abe0;->g()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v1, "/"

    .line 18
    .line 19
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    move-object p2, v0

    .line 25
    :goto_0
    const-string v1, "profile"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    const-string v2, "edit"

    .line 32
    .line 33
    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const-string v3, "type"

    .line 38
    .line 39
    const/4 v4, 0x1

    .line 40
    const/4 v5, 0x0

    .line 41
    if-eqz v2, :cond_22

    .line 42
    .line 43
    const-string p0, "profile_edit"

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "autoScrollTo"

    .line 60
    .line 61
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ljava/lang/String;

    .line 66
    .line 67
    const-string v3, "a"

    .line 68
    .line 69
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    const-string v6, "assistant_smart_portrait_type"

    .line 74
    .line 75
    const-string v7, "e_assistant_smart_portrait_failed"

    .line 76
    .line 77
    const-string v8, "p_chat_view"

    .line 78
    .line 79
    if-eqz v3, :cond_1

    .line 80
    .line 81
    const-string v3, "\u529f\u80fd\u4ecb\u7ecd\u6587\u6848"

    .line 82
    .line 83
    invoke-static {v6, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    filled-new-array {v3}, [Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {v7, v8, v3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 92
    .line 93
    .line 94
    :cond_1
    const-string v3, "b"

    .line 95
    .line 96
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    if-eqz v3, :cond_2

    .line 101
    .line 102
    const-string v3, "\u5931\u8d25\u63d0\u793a\u6587\u6848"

    .line 103
    .line 104
    invoke-static {v6, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    filled-new-array {v3}, [Ll/sfj0$a;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-static {v7, v8, v3}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    const-string v3, "continuousEdit"

    .line 116
    .line 117
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const/4 v3, 0x0

    .line 122
    if-eqz v1, :cond_3

    .line 123
    .line 124
    const-string p0, "e_assistant_update_profile"

    .line 125
    .line 126
    new-array v1, v3, [Ll/sfj0$a;

    .line 127
    .line 128
    invoke-static {p0, v8, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 129
    .line 130
    .line 131
    const-string p0, "profile_edit_continuous"

    .line 132
    .line 133
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    :cond_3
    move-object v1, p0

    .line 138
    const-string p0, "questions"

    .line 139
    .line 140
    invoke-static {v2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_4

    .line 145
    .line 146
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 153
    .line 154
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 159
    .line 160
    const-string p2, "from_auto_scroll_to_question"

    .line 161
    .line 162
    invoke-static {p0, p1, p2, v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    return-object p0

    .line 167
    :cond_4
    const-string p0, "mode"

    .line 168
    .line 169
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    check-cast p0, Ljava/lang/String;

    .line 174
    .line 175
    const-string v2, "from"

    .line 176
    .line 177
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v2

    .line 181
    check-cast v2, Ljava/lang/String;

    .line 182
    .line 183
    const-string v6, "marriage"

    .line 184
    .line 185
    invoke-static {p0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 186
    .line 187
    .line 188
    move-result v6

    .line 189
    if-eqz v6, :cond_6

    .line 190
    .line 191
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-interface {p0}, Ll/r97;->X()Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-eqz p0, :cond_5

    .line 204
    .line 205
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0

    .line 214
    :cond_5
    return-object v5

    .line 215
    :cond_6
    const-string v6, "dating"

    .line 216
    .line 217
    invoke-static {p0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v6

    .line 221
    if-eqz v6, :cond_b

    .line 222
    .line 223
    invoke-static {}, Ll/aw90;->V()Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-nez p0, :cond_a

    .line 228
    .line 229
    invoke-static {}, Ll/gra;->L3()Z

    .line 230
    .line 231
    .line 232
    move-result p0

    .line 233
    if-nez p0, :cond_7

    .line 234
    .line 235
    goto :goto_1

    .line 236
    :cond_7
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 241
    .line 242
    if-nez p0, :cond_8

    .line 243
    .line 244
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 249
    .line 250
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 251
    .line 252
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 253
    .line 254
    .line 255
    move-result-object p2

    .line 256
    iput-object p2, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 257
    .line 258
    :cond_8
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 259
    .line 260
    .line 261
    move-result p0

    .line 262
    if-eqz p0, :cond_9

    .line 263
    .line 264
    const-string v2, "chat_complete_profile"

    .line 265
    .line 266
    :cond_9
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    invoke-static {p0, p1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    return-object p0

    .line 283
    :cond_a
    :goto_1
    return-object v5

    .line 284
    :cond_b
    const-string v6, "profileLikes"

    .line 285
    .line 286
    invoke-static {p0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    if-eqz v6, :cond_f

    .line 291
    .line 292
    invoke-static {}, Ll/aw90;->V()Z

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    if-nez p0, :cond_e

    .line 297
    .line 298
    invoke-static {}, Ll/gra;->L3()Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    if-nez p0, :cond_c

    .line 303
    .line 304
    goto :goto_2

    .line 305
    :cond_c
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 310
    .line 311
    if-nez p0, :cond_d

    .line 312
    .line 313
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 318
    .line 319
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 320
    .line 321
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 322
    .line 323
    .line 324
    move-result-object p2

    .line 325
    iput-object p2, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 326
    .line 327
    :cond_d
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 328
    .line 329
    .line 330
    move-result-object p0

    .line 331
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 332
    .line 333
    .line 334
    move-result-object p2

    .line 335
    iget-object p2, p2, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 336
    .line 337
    invoke-virtual {p0, p2}, Ll/aw90;->k0(Lcom/p1/mobile/putong/data/User;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-eqz p0, :cond_2b

    .line 342
    .line 343
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object p1

    .line 355
    invoke-static {p0, p1, v2, v3, v4}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->q2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    return-object p0

    .line 360
    :cond_e
    :goto_2
    return-object v5

    .line 361
    :cond_f
    const-string v6, "tagMatchPic"

    .line 362
    .line 363
    invoke-static {p0, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 364
    .line 365
    .line 366
    move-result v6

    .line 367
    if-eqz v6, :cond_13

    .line 368
    .line 369
    invoke-static {}, Ll/aw90;->V()Z

    .line 370
    .line 371
    .line 372
    move-result p0

    .line 373
    if-nez p0, :cond_12

    .line 374
    .line 375
    invoke-static {}, Ll/gra;->L3()Z

    .line 376
    .line 377
    .line 378
    move-result p0

    .line 379
    if-nez p0, :cond_10

    .line 380
    .line 381
    goto :goto_3

    .line 382
    :cond_10
    invoke-static {}, Ll/gra;->z()Z

    .line 383
    .line 384
    .line 385
    move-result p0

    .line 386
    if-eqz p0, :cond_11

    .line 387
    .line 388
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 389
    .line 390
    .line 391
    move-result-object p0

    .line 392
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 393
    .line 394
    invoke-static {p0, v3, v4}, Ll/mkf;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 395
    .line 396
    .line 397
    goto :goto_3

    .line 398
    :cond_11
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 399
    .line 400
    .line 401
    move-result-object p0

    .line 402
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 403
    .line 404
    invoke-static {p0, v4, v4}, Ll/y1i0;->M(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 405
    .line 406
    .line 407
    :cond_12
    :goto_3
    return-object v5

    .line 408
    :cond_13
    const-string v3, "addPicForTag"

    .line 409
    .line 410
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 411
    .line 412
    .line 413
    move-result v3

    .line 414
    if-eqz v3, :cond_19

    .line 415
    .line 416
    invoke-static {}, Ll/aw90;->V()Z

    .line 417
    .line 418
    .line 419
    move-result p0

    .line 420
    if-nez p0, :cond_18

    .line 421
    .line 422
    invoke-static {}, Ll/gra;->L3()Z

    .line 423
    .line 424
    .line 425
    move-result p0

    .line 426
    if-nez p0, :cond_14

    .line 427
    .line 428
    goto :goto_5

    .line 429
    :cond_14
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NewTags;->new_()Lcom/p1/mobile/putong/core/data/NewTags;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    const-string v1, "tagID"

    .line 434
    .line 435
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v3

    .line 439
    check-cast v3, Ljava/lang/String;

    .line 440
    .line 441
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 442
    .line 443
    .line 444
    move-result v4

    .line 445
    if-nez v4, :cond_15

    .line 446
    .line 447
    const-string v4, "_"

    .line 448
    .line 449
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v3

    .line 453
    array-length v4, v3

    .line 454
    if-lez v4, :cond_15

    .line 455
    .line 456
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/NewTags;->categories:Ljava/util/List;

    .line 461
    .line 462
    :cond_15
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    check-cast v1, Ljava/lang/String;

    .line 467
    .line 468
    if-nez v1, :cond_16

    .line 469
    .line 470
    move-object v1, v0

    .line 471
    :cond_16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/NewTags;->id:Ljava/lang/String;

    .line 472
    .line 473
    const-string v1, "tagName"

    .line 474
    .line 475
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 476
    .line 477
    .line 478
    move-result-object p2

    .line 479
    check-cast p2, Ljava/lang/String;

    .line 480
    .line 481
    if-nez p2, :cond_17

    .line 482
    .line 483
    goto :goto_4

    .line 484
    :cond_17
    move-object v0, p2

    .line 485
    :goto_4
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/NewTags;->name:Ljava/lang/String;

    .line 486
    .line 487
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 488
    .line 489
    .line 490
    move-result-object p2

    .line 491
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 492
    .line 493
    .line 494
    move-result-object p1

    .line 495
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 496
    .line 497
    invoke-virtual {p2, p1, p0, v2}, Ll/aw90;->t0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/NewTags;Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    :cond_18
    :goto_5
    return-object v5

    .line 501
    :cond_19
    const-string p2, "picMatchTag"

    .line 502
    .line 503
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 504
    .line 505
    .line 506
    move-result p2

    .line 507
    if-eqz p2, :cond_1c

    .line 508
    .line 509
    invoke-static {}, Ll/aw90;->V()Z

    .line 510
    .line 511
    .line 512
    move-result p0

    .line 513
    if-nez p0, :cond_1b

    .line 514
    .line 515
    invoke-static {}, Ll/gra;->L3()Z

    .line 516
    .line 517
    .line 518
    move-result p0

    .line 519
    if-nez p0, :cond_1a

    .line 520
    .line 521
    goto :goto_6

    .line 522
    :cond_1a
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 523
    .line 524
    .line 525
    move-result-object p0

    .line 526
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 527
    .line 528
    .line 529
    move-result-object p1

    .line 530
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 531
    .line 532
    invoke-virtual {p0, p1}, Ll/aw90;->i0(Lcom/p1/mobile/android/app/Act;)V

    .line 533
    .line 534
    .line 535
    :cond_1b
    :goto_6
    return-object v5

    .line 536
    :cond_1c
    const-string p2, "guidePicAndTag"

    .line 537
    .line 538
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 539
    .line 540
    .line 541
    move-result p0

    .line 542
    if-eqz p0, :cond_20

    .line 543
    .line 544
    invoke-static {}, Ll/aw90;->V()Z

    .line 545
    .line 546
    .line 547
    move-result p0

    .line 548
    if-nez p0, :cond_1f

    .line 549
    .line 550
    invoke-static {}, Ll/gra;->L3()Z

    .line 551
    .line 552
    .line 553
    move-result p0

    .line 554
    if-nez p0, :cond_1d

    .line 555
    .line 556
    goto :goto_7

    .line 557
    :cond_1d
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 558
    .line 559
    .line 560
    move-result p0

    .line 561
    if-eqz p0, :cond_1e

    .line 562
    .line 563
    const-string v2, "receive_like_add_lifestyle"

    .line 564
    .line 565
    :cond_1e
    invoke-static {}, Ll/a2i0;->b()Ll/a2i0;

    .line 566
    .line 567
    .line 568
    move-result-object p0

    .line 569
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 570
    .line 571
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 572
    .line 573
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 574
    .line 575
    .line 576
    move-result-object p2

    .line 577
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 578
    .line 579
    .line 580
    move-result-object p2

    .line 581
    invoke-virtual {p0, p2}, Ll/a2i0;->e(Lcom/p1/mobile/putong/data/User;)V

    .line 582
    .line 583
    .line 584
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 585
    .line 586
    .line 587
    move-result-object p0

    .line 588
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 593
    .line 594
    sget-object p2, Ll/tr90;->i:Ljava/lang/String;

    .line 595
    .line 596
    invoke-virtual {p0, p1, p2, v2, v5}, Ll/aw90;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    .line 598
    .line 599
    :cond_1f
    :goto_7
    return-object v5

    .line 600
    :cond_20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 601
    .line 602
    .line 603
    move-result-object p0

    .line 604
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 605
    .line 606
    .line 607
    move-result-object p0

    .line 608
    invoke-interface {p0}, Ll/r97;->X()Z

    .line 609
    .line 610
    .line 611
    move-result p0

    .line 612
    if-eqz p0, :cond_21

    .line 613
    .line 614
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 615
    .line 616
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 617
    .line 618
    iget-object p0, p0, Ll/dkb;->Z3:Ll/wyd0;

    .line 619
    .line 620
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 621
    .line 622
    .line 623
    move-result-object p0

    .line 624
    check-cast p0, Ljava/lang/CharSequence;

    .line 625
    .line 626
    const-string p2, "marryMode"

    .line 627
    .line 628
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 629
    .line 630
    .line 631
    move-result p0

    .line 632
    if-eqz p0, :cond_21

    .line 633
    .line 634
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 635
    .line 636
    .line 637
    move-result-object p0

    .line 638
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/edit/MarryProfileEditAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 639
    .line 640
    .line 641
    move-result-object p0

    .line 642
    return-object p0

    .line 643
    :cond_21
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 644
    .line 645
    .line 646
    move-result-object p0

    .line 647
    invoke-static {p0, v1}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 648
    .line 649
    .line 650
    move-result-object p0

    .line 651
    return-object p0

    .line 652
    :cond_22
    iget-object p0, p0, Ll/k7e0;->a:Ljava/lang/String;

    .line 653
    .line 654
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 655
    .line 656
    .line 657
    move-result p0

    .line 658
    if-eqz p0, :cond_25

    .line 659
    .line 660
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 661
    .line 662
    .line 663
    move-result-object p0

    .line 664
    invoke-interface {p0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 665
    .line 666
    .line 667
    move-result-object p0

    .line 668
    check-cast p0, Ljava/lang/String;

    .line 669
    .line 670
    const-string p2, "vip"

    .line 671
    .line 672
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 673
    .line 674
    .line 675
    move-result p2

    .line 676
    if-eqz p2, :cond_23

    .line 677
    .line 678
    const-string p0, "profile_purchase_vip"

    .line 679
    .line 680
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 681
    .line 682
    .line 683
    move-result-object v1

    .line 684
    goto/16 :goto_9

    .line 685
    .line 686
    :cond_23
    const-string p2, "see"

    .line 687
    .line 688
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 689
    .line 690
    .line 691
    move-result p2

    .line 692
    if-eqz p2, :cond_24

    .line 693
    .line 694
    const-string p0, "profile_purchase_see"

    .line 695
    .line 696
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    goto/16 :goto_9

    .line 701
    .line 702
    :cond_24
    const-string p2, "svip"

    .line 703
    .line 704
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 705
    .line 706
    .line 707
    move-result p0

    .line 708
    if-eqz p0, :cond_2b

    .line 709
    .line 710
    const-string p0, "profile_purchase_svip"

    .line 711
    .line 712
    invoke-static {p0}, Lcom/p1/mobile/putong/data/NavigationIntent;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/NavigationIntent;

    .line 713
    .line 714
    .line 715
    move-result-object v1

    .line 716
    goto :goto_9

    .line 717
    :cond_25
    const-string p0, "task-center"

    .line 718
    .line 719
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    move-result p0

    .line 723
    if-eqz p0, :cond_2b

    .line 724
    .line 725
    invoke-static {}, Ll/gra;->z2()Z

    .line 726
    .line 727
    .line 728
    move-result p0

    .line 729
    if-nez p0, :cond_27

    .line 730
    .line 731
    invoke-static {}, Ll/gra;->A2()Z

    .line 732
    .line 733
    .line 734
    move-result p0

    .line 735
    if-eqz p0, :cond_26

    .line 736
    .line 737
    goto :goto_8

    .line 738
    :cond_26
    const-string p0, "\u529f\u80fd\u5df2\u4e0b\u7ebf"

    .line 739
    .line 740
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 741
    .line 742
    .line 743
    return-object v5

    .line 744
    :cond_27
    :goto_8
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 745
    .line 746
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 747
    .line 748
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 749
    .line 750
    .line 751
    move-result-object p0

    .line 752
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 753
    .line 754
    .line 755
    move-result p2

    .line 756
    if-eqz p2, :cond_28

    .line 757
    .line 758
    invoke-static {v4}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->p2(Z)V

    .line 759
    .line 760
    .line 761
    return-object v5

    .line 762
    :cond_28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isFakeUser()Z

    .line 763
    .line 764
    .line 765
    move-result p2

    .line 766
    if-eqz p2, :cond_29

    .line 767
    .line 768
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 769
    .line 770
    .line 771
    move-result-object p2

    .line 772
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 773
    .line 774
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 775
    .line 776
    .line 777
    move-result-object p0

    .line 778
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 779
    .line 780
    .line 781
    move-result-object v0

    .line 782
    sget v1, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 783
    .line 784
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 785
    .line 786
    .line 787
    move-result-object v0

    .line 788
    new-instance v1, Ll/j7e0;

    .line 789
    .line 790
    invoke-direct {v1, p1}, Ll/j7e0;-><init>(Ll/abe0;)V

    .line 791
    .line 792
    .line 793
    invoke-static {p2, v4, p0, v0, v1}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 794
    .line 795
    .line 796
    return-object v5

    .line 797
    :cond_29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isProfileJailed()Z

    .line 798
    .line 799
    .line 800
    move-result p0

    .line 801
    if-eqz p0, :cond_2a

    .line 802
    .line 803
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 808
    .line 809
    invoke-static {p0}, Ll/ey0;->h(Lcom/p1/mobile/android/app/Act;)V

    .line 810
    .line 811
    .line 812
    return-object v5

    .line 813
    :cond_2a
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 814
    .line 815
    .line 816
    move-result-object p0

    .line 817
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/CoreTaskCenterAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 818
    .line 819
    .line 820
    move-result-object p0

    .line 821
    return-object p0

    .line 822
    :cond_2b
    :goto_9
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 823
    .line 824
    .line 825
    move-result-object p0

    .line 826
    invoke-static {p0, v1}, Ll/xwa;->k(Landroid/content/Context;Lcom/p1/mobile/putong/data/NavigationIntent;)Landroid/content/Intent;

    .line 827
    .line 828
    .line 829
    move-result-object p0

    .line 830
    return-object p0
.end method
