.class public final Ll/hl3;
.super Ll/g6e;
.source "SourceFile"


# static fields
.field public static g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/g6e;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(ZLjava/lang/Runnable;)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "e_superlike_first_use_make_sure"

    .line 4
    .line 5
    const-string v0, "p_superlike_first_use_view"

    .line 6
    .line 7
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic C(Lcom/p1/mobile/putong/data/Settings;Lcom/p1/mobile/putong/data/Settings;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 12
    .line 13
    .line 14
    move-result p3

    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    new-instance p3, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 18
    .line 19
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 23
    .line 24
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p3, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 34
    .line 35
    iget-object v0, p3, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/data/SettingGroups;->subtract(Lcom/p1/mobile/putong/data/SettingGroups;)Lcom/p1/mobile/putong/data/SettingGroups;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 60
    .line 61
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->k8(Lcom/p1/mobile/putong/data/SettingGroups;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p1, Ll/uk3;

    .line 66
    .line 67
    invoke-direct {p1}, Ll/uk3;-><init>()V

    .line 68
    .line 69
    .line 70
    new-instance p3, Ll/vk3;

    .line 71
    .line 72
    invoke-direct {p3}, Ll/vk3;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {p1, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    :cond_0
    invoke-virtual {p2}, Ll/l4g0;->g()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public static synthetic D(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v0, 0x61af9

    .line 10
    .line 11
    .line 12
    if-ne p0, v0, :cond_0

    .line 13
    .line 14
    const-string p0, "\u65e0\u6548\u4e8c\u7ef4\u7801"

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const-string p0, "\u767b\u5f55\u5931\u8d25,\u8bf7\u7a0d\u540e\u518d\u8bd5"

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/data/Meta;)V
    .locals 0

    .line 1
    const-string p0, "\u767b\u5f55\u6210\u529f"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic F(Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static G(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ljava/lang/String;ZLjava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move/from16 v2, p1

    .line 4
    .line 5
    move-object/from16 v3, p3

    .line 6
    .line 7
    move-object/from16 v4, p5

    .line 8
    .line 9
    move-object/from16 v5, p6

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    move-object/from16 v0, p2

    .line 14
    .line 15
    invoke-static {v1, v0, v3, v4, v5}, Ll/o5h0;->s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    move-object/from16 v0, p2

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    sget v7, Ll/kec0;->ve:I

    .line 26
    .line 27
    const/4 v8, 0x0

    .line 28
    invoke-virtual {v6, v7, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    check-cast v6, Landroid/view/ViewGroup;

    .line 33
    .line 34
    sget v7, Ll/adc0;->c2:I

    .line 35
    .line 36
    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v7

    .line 40
    check-cast v7, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 41
    .line 42
    sget v9, Ll/adc0;->k9:I

    .line 43
    .line 44
    invoke-virtual {v6, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v9

    .line 48
    check-cast v9, Lcom/p1/mobile/putong/core/ui/GradientBgButton;

    .line 49
    .line 50
    if-eqz v2, :cond_1

    .line 51
    .line 52
    sget v10, Lcom/p1/mobile/putong/core/R$string;->wp:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    sget v10, Lcom/p1/mobile/putong/core/R$string;->Lq:I

    .line 56
    .line 57
    :goto_0
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v1, v10, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    if-eqz p4, :cond_2

    .line 68
    .line 69
    sget v0, Lcom/p1/mobile/putong/core/R$string;->vp:I

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_2
    sget v0, Lcom/p1/mobile/putong/core/R$string;->up:I

    .line 73
    .line 74
    :goto_1
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v11

    .line 78
    invoke-virtual {v1, v0, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    :goto_2
    move-object v11, v0

    .line 83
    goto :goto_3

    .line 84
    :cond_3
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Kq:I

    .line 85
    .line 86
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object v11

    .line 90
    invoke-virtual {v1, v0, v11}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    goto :goto_2

    .line 95
    :goto_3
    if-eqz v2, :cond_4

    .line 96
    .line 97
    sget v0, Lcom/p1/mobile/putong/core/R$string;->w:I

    .line 98
    .line 99
    goto :goto_4

    .line 100
    :cond_4
    sget v0, Lcom/p1/mobile/putong/core/R$string;->x:I

    .line 101
    .line 102
    :goto_4
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v12

    .line 106
    if-nez v2, :cond_5

    .line 107
    .line 108
    sget v0, Ll/dbc0;->iv:I

    .line 109
    .line 110
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v9, v0}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    sget v0, Ll/c9c0;->a2:I

    .line 118
    .line 119
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {v9, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorEnd(I)V

    .line 124
    .line 125
    .line 126
    sget v0, Ll/c9c0;->b2:I

    .line 127
    .line 128
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-virtual {v9, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setButtonColorStart(I)V

    .line 133
    .line 134
    .line 135
    :cond_5
    const/4 v9, 0x1

    .line 136
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-interface {v11}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    const-string v14, "\n"

    .line 146
    .line 147
    invoke-virtual {v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v13

    .line 151
    aget-object v13, v13, v9

    .line 152
    .line 153
    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    invoke-interface {v11}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v13

    .line 160
    const-string v14, "#4a4a4a"

    .line 161
    .line 162
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v14

    .line 166
    const/4 v15, 0x3

    .line 167
    invoke-static {v15}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 168
    .line 169
    .line 170
    move-result-object v15

    .line 171
    invoke-static {v13, v0, v14, v15}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 172
    .line 173
    .line 174
    move-result-object v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    goto :goto_5

    .line 176
    :catch_0
    move-exception v0

    .line 177
    new-instance v13, Ljava/lang/Exception;

    .line 178
    .line 179
    new-instance v14, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string v15, "firstSuperLikeOrUndo exception:"

    .line 182
    .line 183
    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v15

    .line 190
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v14

    .line 197
    invoke-direct {v13, v14, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 198
    .line 199
    .line 200
    invoke-static {v13}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 201
    .line 202
    .line 203
    :goto_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v13, "x"

    .line 206
    .line 207
    invoke-direct {v0, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    invoke-virtual {v7, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->setCenterText(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    if-eqz v2, :cond_6

    .line 221
    .line 222
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    const-string v3, "p_superlike_first_use_view"

    .line 229
    .line 230
    invoke-static {v3, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 231
    .line 232
    .line 233
    move-result-object v8

    .line 234
    const-string v17, "swipe_page"

    .line 235
    .line 236
    const-string v18, "tips"

    .line 237
    .line 238
    const-string v13, "passive"

    .line 239
    .line 240
    const-string v14, "alert"

    .line 241
    .line 242
    const-string v15, "alert_self_definition_basic"

    .line 243
    .line 244
    const-string v16, "superlike_button"

    .line 245
    .line 246
    invoke-static/range {v13 .. v18}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v8, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 251
    .line 252
    .line 253
    :cond_6
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-virtual {v0, v6}, Lcom/p1/mobile/android/app/Dialog$e;->b0(Landroid/view/View;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-virtual {v0, v9}, Lcom/p1/mobile/android/app/Dialog$e;->y(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->v()Lcom/p1/mobile/android/app/Dialog$e;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v3

    .line 273
    invoke-virtual {v0, v3}, Lcom/p1/mobile/android/app/Dialog$e;->G0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {v0, v11}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    new-instance v3, Ll/kk3;

    .line 282
    .line 283
    invoke-direct {v3, v2, v4}, Ll/kk3;-><init>(ZLjava/lang/Runnable;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v0, v12, v3}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 295
    .line 296
    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v1

    .line 300
    new-instance v3, Ll/lk3;

    .line 301
    .line 302
    invoke-direct {v3, v5}, Ll/lk3;-><init>(Ljava/lang/Runnable;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    invoke-virtual {v0, v9}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    new-instance v1, Ll/mk3;

    .line 314
    .line 315
    invoke-direct {v1, v5}, Ll/mk3;-><init>(Ljava/lang/Runnable;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->A(Landroid/content/DialogInterface$OnCancelListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    new-instance v1, Ll/nk3;

    .line 323
    .line 324
    invoke-direct {v1, v2, v8}, Ll/nk3;-><init>(ZLl/l4g0;)V

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->V(Landroid/content/DialogInterface$OnDismissListener;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    if-eqz v2, :cond_7

    .line 336
    .line 337
    invoke-static {v8}, Ll/w1e;->f(Ll/l4g0;)V

    .line 338
    .line 339
    .line 340
    :cond_7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 341
    .line 342
    .line 343
    return-void
.end method

.method public static H(Lcom/p1/mobile/android/app/Act;ILjava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    return-void

    .line 1
    invoke-static {p1}, Ll/rbb0;->z(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/rbb0;->y(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/agc0;->n:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget v0, Ll/kec0;->e0:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "p_no_match_svip"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_no_match_svip:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 55
    .line 56
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v7, "swipe_page"

    .line 61
    .line 62
    const-string v8, "swipe"

    .line 63
    .line 64
    const-string v3, "passive"

    .line 65
    .line 66
    const-string v4, "alert"

    .line 67
    .line 68
    const-string v5, "alert_self_definition_basic"

    .line 69
    .line 70
    const-string v6, "card"

    .line 71
    .line 72
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v1, v2, v3}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;

    .line 88
    .line 89
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->c(Ljava/util/List;)V

    .line 90
    .line 91
    .line 92
    iget-object p2, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->n:Lv/VButton;

    .line 93
    .line 94
    new-instance v2, Ll/qk3;

    .line 95
    .line 96
    invoke-direct {v2, p1, p0}, Ll/qk3;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p2, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, v1, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->o:Landroid/widget/TextView;

    .line 103
    .line 104
    new-instance p2, Ll/rk3;

    .line 105
    .line 106
    invoke-direct {p2, p1}, Ll/rk3;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    new-instance p0, Ll/sk3;

    .line 113
    .line 114
    invoke-direct {p0, v0}, Ll/sk3;-><init>(Ll/l4g0;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public static I(Lcom/p1/mobile/android/app/Act;ILjava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/rbb0;->z(I)V

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ll/rbb0;->y(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->u()Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    sget p2, Ll/kec0;->yf:I

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const/4 p2, 0x0

    .line 22
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    const-string v0, "p_no_match_see_purchase_guide_view"

    .line 39
    .line 40
    invoke-static {v0, p2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->see_guide:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const-string v6, "swipe_page"

    .line 59
    .line 60
    const-string v7, "swipe"

    .line 61
    .line 62
    const-string v2, "passive"

    .line 63
    .line 64
    const-string v3, "alert"

    .line 65
    .line 66
    const-string v4, "alert_self_definition_basic"

    .line 67
    .line 68
    const-string v5, "card"

    .line 69
    .line 70
    invoke-static/range {v2 .. v7}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v1, v2}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p2, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    move-object v1, v0

    .line 86
    check-cast v1, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_not_match_guide:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 89
    .line 90
    invoke-static {v0}, Ll/j690;->o(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    sget-object v4, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_LIKERS:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 95
    .line 96
    new-instance v5, Ll/al3;

    .line 97
    .line 98
    invoke-direct {v5, p1, p0}, Ll/al3;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V

    .line 99
    .line 100
    .line 101
    new-instance v6, Ll/bl3;

    .line 102
    .line 103
    invoke-direct {v6, p1}, Ll/bl3;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 104
    .line 105
    .line 106
    move-object v2, p0

    .line 107
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/VipItemDetailPage;->g(Lcom/p1/mobile/android/app/Act;Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/x20;Ll/x20;)V

    .line 108
    .line 109
    .line 110
    new-instance p0, Ll/cl3;

    .line 111
    .line 112
    invoke-direct {p0, p2}, Ll/cl3;-><init>(Ll/l4g0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;ILcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 9

    return-void

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_offline_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_offline_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v7, "swipe_page"

    .line 28
    .line 29
    const-string v8, "guide"

    .line 30
    .line 31
    const-string v3, "passive"

    .line 32
    .line 33
    const-string v4, "alert"

    .line 34
    .line 35
    const-string v5, "alert_self_definition_basic"

    .line 36
    .line 37
    const-string v6, "null"

    .line 38
    .line 39
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v1, v2, v3}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    :try_start_0
    const-string v2, "pop_type"

    .line 48
    .line 49
    const-string v3, "popup"

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    .line 54
    :catch_0
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    sget v2, Ll/kec0;->e0:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    sget v2, Ll/agc0;->n:I

    .line 68
    .line 69
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    check-cast v2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;

    .line 82
    .line 83
    invoke-virtual {v2, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->b(ILcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, v2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->n:Lv/VButton;

    .line 87
    .line 88
    new-instance p2, Ll/ik3;

    .line 89
    .line 90
    invoke-direct {p2, v1, p0}, Ll/ik3;-><init>(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, v2, Lcom/p1/mobile/putong/core/ui/vip/likers/LikersDialogView;->o:Landroid/widget/TextView;

    .line 97
    .line 98
    new-instance p1, Ll/tk3;

    .line 99
    .line 100
    invoke-direct {p1, v1}, Ll/tk3;-><init>(Lcom/p1/mobile/android/app/Dialog;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public static K(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_quickchat_match_timeout_popup"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/pej0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    sget v2, Ll/kec0;->t8:I

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ll/nu0;->getDelegate()Landroidx/appcompat/app/b;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    sget v3, Ll/vcc0;->E:I

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Landroidx/appcompat/app/b;->g(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v4, 0x3

    .line 38
    invoke-virtual {v3, v4}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 39
    .line 40
    .line 41
    const/4 v5, 0x1

    .line 42
    invoke-virtual {v3, v5}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    const v6, 0x106000d

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getColor(I)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const v3, 0x3e99999a    # 0.3f

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v3}, Landroid/view/Window;->setDimAmount(F)V

    .line 67
    .line 68
    .line 69
    sget v2, Ll/adc0;->je:I

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    check-cast v2, Lv/VText;

    .line 76
    .line 77
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v2, v3, v5}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 82
    .line 83
    .line 84
    sget v2, Ll/adc0;->zc:I

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    check-cast v2, Lv/VButton;

    .line 91
    .line 92
    invoke-static {v4}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v2, v3, v5}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 97
    .line 98
    .line 99
    sget v2, Ll/adc0;->lc:I

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lv/VRangeSlider;

    .line 106
    .line 107
    sget v3, Ll/adc0;->B:I

    .line 108
    .line 109
    invoke-virtual {v1, v3}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    check-cast v3, Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    new-instance v5, Ll/el3;

    .line 120
    .line 121
    invoke-direct {v5, v3, v4}, Ll/el3;-><init>(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Settings;)V

    .line 122
    .line 123
    .line 124
    invoke-interface {v5}, Ljava/lang/Runnable;->run()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    int-to-float v3, v3

    .line 136
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 141
    .line 142
    .line 143
    move-result v6

    .line 144
    int-to-float v6, v6

    .line 145
    const/4 v7, 0x0

    .line 146
    cmpg-float v8, v3, v7

    .line 147
    .line 148
    if-gtz v8, :cond_0

    .line 149
    .line 150
    sget v3, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MIN:I

    .line 151
    .line 152
    int-to-float v3, v3

    .line 153
    :cond_0
    cmpg-float v8, v6, v7

    .line 154
    .line 155
    if-gtz v8, :cond_1

    .line 156
    .line 157
    sget v6, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MAX:I

    .line 158
    .line 159
    int-to-float v6, v6

    .line 160
    :cond_1
    invoke-virtual {v2, v3}, Lv/VRangeSlider;->setValueFrom(F)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2, v6}, Lv/VRangeSlider;->setValueTo(F)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v3

    .line 170
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    int-to-float v3, v3

    .line 175
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v6

    .line 179
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 180
    .line 181
    .line 182
    move-result v6

    .line 183
    int-to-float v6, v6

    .line 184
    cmpg-float v8, v3, v7

    .line 185
    .line 186
    if-gtz v8, :cond_2

    .line 187
    .line 188
    sget v3, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MIN:I

    .line 189
    .line 190
    int-to-float v3, v3

    .line 191
    :cond_2
    cmpg-float v7, v6, v7

    .line 192
    .line 193
    if-gtz v7, :cond_3

    .line 194
    .line 195
    sget v6, Lcom/p1/mobile/putong/data/User;->AGE_DEFAULT_SEARCH_MAX:I

    .line 196
    .line 197
    int-to-float v6, v6

    .line 198
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v7

    .line 202
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 203
    .line 204
    .line 205
    move-result v7

    .line 206
    int-to-float v7, v7

    .line 207
    cmpl-float v7, v7, v3

    .line 208
    .line 209
    if-lez v7, :cond_4

    .line 210
    .line 211
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMinimum()Ljava/lang/Integer;

    .line 212
    .line 213
    .line 214
    move-result-object v3

    .line 215
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 216
    .line 217
    .line 218
    move-result v3

    .line 219
    int-to-float v3, v3

    .line 220
    :cond_4
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    filled-new-array {v3, v6}, [Ljava/lang/Float;

    .line 229
    .line 230
    .line 231
    move-result-object v3

    .line 232
    invoke-virtual {v2, v3}, Lv/VRangeSlider;->setValues([Ljava/lang/Float;)V

    .line 233
    .line 234
    .line 235
    const/4 v3, 0x0

    .line 236
    sput-boolean v3, Ll/hl3;->g:Z

    .line 237
    .line 238
    new-instance v3, Ll/hl3$a;

    .line 239
    .line 240
    invoke-direct {v3, v4, v5}, Ll/hl3$a;-><init>(Lcom/p1/mobile/putong/data/Settings;Ljava/lang/Runnable;)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v2, v3}, Lv/VRangeSlider;->f(Ll/cp50;)V

    .line 244
    .line 245
    .line 246
    new-instance v2, Ll/fl3;

    .line 247
    .line 248
    invoke-direct {v2, v4, p1, v0}, Ll/fl3;-><init>(Lcom/p1/mobile/putong/data/Settings;Lcom/p1/mobile/putong/data/Settings;Ll/l4g0;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 252
    .line 253
    .line 254
    new-instance p1, Ll/gl3;

    .line 255
    .line 256
    invoke-direct {p1, v0}, Ll/gl3;-><init>(Ll/l4g0;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, p1}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 260
    .line 261
    .line 262
    sget p1, Ll/adc0;->zc:I

    .line 263
    .line 264
    invoke-virtual {v1, p1}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    new-instance v0, Ll/jk3;

    .line 269
    .line 270
    invoke-direct {v0, p0, v1, v4}, Ll/jk3;-><init>(Lcom/p1/mobile/android/app/Act;Ll/pej0;Lcom/p1/mobile/putong/data/Settings;)V

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1}, Landroid/app/Dialog;->show()V

    .line 277
    .line 278
    .line 279
    return-void
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;I)V
    .locals 9

    return-void

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_see_popup_expired_svip"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ll/pk50;->f()Ll/rj50;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_offline_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v7, "swipe_page"

    .line 28
    .line 29
    const-string v8, "guide"

    .line 30
    .line 31
    const-string v3, "passive"

    .line 32
    .line 33
    const-string v4, "alert"

    .line 34
    .line 35
    const-string v5, "alert_self_definition_basic"

    .line 36
    .line 37
    const-string v6, "null"

    .line 38
    .line 39
    invoke-static/range {v3 .. v8}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v1, v2, v3}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget v2, Ll/kec0;->xc:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    sget v2, Ll/agc0;->n:I

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const/4 v2, 0x0

    .line 67
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;

    .line 80
    .line 81
    new-instance v3, Ll/dl3;

    .line 82
    .line 83
    invoke-direct {v3, v1, v0}, Ll/dl3;-><init>(Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/dlg/SVipSeeRecoverDlg;->d(Lcom/p1/mobile/android/app/Act;ILl/x20;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;)V
    .locals 11

    .line 1
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/kec0;->a0:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    const-string v3, "p_vip_expired"

    .line 38
    .line 39
    invoke-static {v3, v2}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Ll/pk50;->f()Ll/rj50;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget-object v4, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_vip_expired:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 52
    .line 53
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    const-string v9, "swipe_page"

    .line 58
    .line 59
    const-string v10, "guide"

    .line 60
    .line 61
    const-string v5, "passive"

    .line 62
    .line 63
    const-string v6, "alert"

    .line 64
    .line 65
    const-string v7, "alert_self_definition_basic"

    .line 66
    .line 67
    const-string v8, "null"

    .line 68
    .line 69
    invoke-static/range {v5 .. v10}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-virtual {v3, v4, v5}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v2, v3}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 78
    .line 79
    .line 80
    sget v3, Ll/adc0;->N4:I

    .line 81
    .line 82
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    new-instance v4, Ll/wk3;

    .line 87
    .line 88
    invoke-direct {v4, v1, p0}, Ll/wk3;-><init>(Ll/jl80;Lcom/p1/mobile/android/app/Act;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Ll/xk3;

    .line 95
    .line 96
    invoke-direct {p0, v2}, Ll/xk3;-><init>(Ll/l4g0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 100
    .line 101
    .line 102
    sget p0, Ll/adc0;->u2:I

    .line 103
    .line 104
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v0, Ll/yk3;

    .line 109
    .line 110
    invoke-direct {v0, v1}, Ll/yk3;-><init>(Ll/jl80;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v2}, Ll/w1e;->f(Ll/l4g0;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/core/R$string;->S1:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ki:I

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v1, Ll/zk3;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ll/zk3;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const-string p1, "\u786e\u8ba4\u662f\u5426\u8981\u767b\u5f55\u7f51\u9875\u7248\u63a2\u63a2"

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static synthetic h(ZLl/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/android/app/Dialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/android/app/Dialog;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p2, "p_popup_see,default"

    .line 13
    .line 14
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Rm(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/android/app/Act;Ll/pej0;Lcom/p1/mobile/putong/data/Settings;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->z()Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p3, p0, v0}, Lcom/p1/mobile/putong/core/ui/onlinematch/OnlineMatchManager;->o0(Lcom/p1/mobile/android/app/Act;Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Ll/pej0;->dismiss()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/DropDownAct;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/secondfloor/QuickChatLoftAct;

    .line 63
    .line 64
    if-eqz p1, :cond_0

    .line 65
    .line 66
    const-string p1, "text_quick_chat"

    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/r3c0;->m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    instance-of p1, p1, Lcom/p1/mobile/putong/core/ui/quickaudio/newquickchat/searchingPage/QuickChatSearchingAct;

    .line 83
    .line 84
    if-nez p1, :cond_1

    .line 85
    .line 86
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/main/NewMainAct;->q7(Landroid/content/Context;)Landroid/content/Intent;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    const-string p0, "\u95ea\u804a\u5339\u914d\u641c\u7d22\u4e2d\uff0c\u5408\u62cd\u7684\u4eba\u6b63\u5728\u8d76\u6765..."

    .line 94
    .line 95
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-boolean p0, Ll/hl3;->g:Z

    .line 99
    .line 100
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string p1, "is_move"

    .line 105
    .line 106
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string p2, "(%s,%s)"

    .line 123
    .line 124
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const-string p2, "age_range"

    .line 129
    .line 130
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    const-string p1, "e_quickchat_match_timeout_popup_start"

    .line 139
    .line 140
    const-string p2, "p_quickchat_match_timeout_popup"

    .line 141
    .line 142
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public static synthetic m(Ljava/lang/Runnable;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string p2, "NA,NA,noMatchGuidePage"

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 15
    .line 16
    invoke-interface {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic p(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/l4g0;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/jl80;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    const-string p0, "p_home,expired_vip"

    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/data/Privilege;->vip_unlimited_likes:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 7
    .line 8
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/core/ui/purchase/c;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic s(Landroid/widget/TextView;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMinAge()Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " - "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchMaxAge()Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Settings;->getSearchAgeAllowedMaximum()Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    const-string p1, "+"

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const-string p1, ""

    .line 43
    .line 44
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic t(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/dkb;->Qa(Ljava/lang/String;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance v0, Ll/ok3;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/ok3;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ll/pk3;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/pk3;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic v(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic w(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/android/app/Dialog;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "NA,NA,noMatchGuidePage"

    .line 13
    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 15
    .line 16
    invoke-interface {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->wr(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
