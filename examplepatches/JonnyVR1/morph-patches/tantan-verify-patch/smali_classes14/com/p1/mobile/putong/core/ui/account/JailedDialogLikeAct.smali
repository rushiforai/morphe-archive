.class public Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"

# interfaces
.implements Ll/crl;


# instance fields
.field public c:Landroid/widget/LinearLayout;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VDraweeView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VButton;

.field public i:Lv/VText;

.field public j:Z


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

.method public static synthetic X1(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->l2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->k2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->m2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->lambda$initSubscription$6(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic d2(Ll/kcg0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "ban_type"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p6, "tooltips_trigger_mode"

    .line 12
    .line 13
    invoke-virtual {v0, p6, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "tooltips_type"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "tooltips_type_ui"

    .line 22
    .line 23
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string p0, "tooltips_trigger_module"

    .line 27
    .line 28
    invoke-virtual {v0, p0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string p0, "tooltips_trigger_page"

    .line 32
    .line 33
    invoke-virtual {v0, p0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    const-string p0, "tooltips_trigger_reason"

    .line 37
    .line 38
    invoke-virtual {v0, p0, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    .line 40
    .line 41
    return-object v0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    return-object v0
.end method

.method private synthetic k2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic lambda$initSubscription$6(Landroid/os/Bundle;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "CLOSE_PRE_ACT"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->j:Z

    .line 13
    .line 14
    invoke-static {}, Ll/bnl0;->w0()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/16 v0, 0x3c0

    .line 19
    .line 20
    if-ge p1, v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->f:Lv/VText;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 29
    .line 30
    const/high16 v0, 0x41000000    # 8.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->f:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 50
    .line 51
    const/high16 v0, 0x41400000    # 12.0f

    .line 52
    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const/high16 v3, 0x40a00000    # 5.0f

    .line 58
    .line 59
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p1, v2, v3, v4, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->c:Landroid/widget/LinearLayout;

    .line 88
    .line 89
    new-instance v2, Ll/hlq;

    .line 90
    .line 91
    invoke-direct {v2, p0}, Ll/hlq;-><init>(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->c:Landroid/widget/LinearLayout;

    .line 98
    .line 99
    const/4 v2, 0x0

    .line 100
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_5

    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->e:Lv/VDraweeView;

    .line 110
    .line 111
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_1

    .line 124
    .line 125
    sget v2, Ll/kbc0;->C0:I

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_1
    sget v2, Ll/kbc0;->l:I

    .line 129
    .line 130
    :goto_0
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->f:Lv/VText;

    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->u:I

    .line 140
    .line 141
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    .line 147
    .line 148
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 149
    .line 150
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 155
    .line 156
    sget v2, Ll/qa00;->v:I

    .line 157
    .line 158
    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->t:I

    .line 167
    .line 168
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 176
    .line 177
    new-instance v2, Ll/ilq;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/ilq;-><init>(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->i2()Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_2

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g:Lv/VText;

    .line 192
    .line 193
    const-string v0, "\u60a8\u597d\uff0c\u7cfb\u7edf\u68c0\u6d4b\u5230\u60a8\u7684\u8d26\u53f7\u5b58\u5728\u5b89\u5168\u98ce\u9669\uff0c\u4e3a\u4fdd\u62a4\u60a8\u7684\u5b89\u5168\uff0c\u5c06\u6682\u65f6\u9650\u5236\u60a8\u7684\u76f8\u5173\u793e\u4ea4\u529f\u80fd\u4f7f\u7528\u3002"

    .line 194
    .line 195
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 196
    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 200
    .line 201
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BanStatus;->text:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    if-eqz v0, :cond_4

    .line 208
    .line 209
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    const-string v0, "zh"

    .line 218
    .line 219
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g:Lv/VText;

    .line 224
    .line 225
    if-eqz p1, :cond_3

    .line 226
    .line 227
    const-string p1, "\u4f60\u7684\u8d26\u53f7\u5b58\u5728\u8fdd\u89c4\u884c\u4e3a\uff0c\u4e25\u91cd\u5f71\u54cd\u4e86\u5176\u4ed6\u7528\u6237\u7684\u793e\u4ea4\u4f53\u9a8c\uff0c\u73b0\u5df2\u88ab\u51bb\u7ed3\uff0c\u65e0\u6cd5\u7ee7\u7eed\u4f7f\u7528"

    .line 228
    .line 229
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_3
    sget p1, Lcom/p1/mobile/putong/core/profile/R$string;->Q1:I

    .line 234
    .line 235
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 236
    .line 237
    .line 238
    goto :goto_1

    .line 239
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g:Lv/VText;

    .line 240
    .line 241
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 242
    .line 243
    iget-object p1, p1, Lcom/p1/mobile/putong/data/BanStatus;->text:Ljava/lang/String;

    .line 244
    .line 245
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 250
    .line 251
    .line 252
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->i:Lv/VText;

    .line 253
    .line 254
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    goto/16 :goto_5

    .line 258
    .line 259
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    const/4 v1, 0x2

    .line 264
    if-eqz v0, :cond_7

    .line 265
    .line 266
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->e:Lv/VDraweeView;

    .line 267
    .line 268
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 273
    .line 274
    .line 275
    move-result-object v2

    .line 276
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 277
    .line 278
    .line 279
    move-result v2

    .line 280
    if-eqz v2, :cond_6

    .line 281
    .line 282
    sget v2, Ll/kbc0;->E0:I

    .line 283
    .line 284
    goto :goto_2

    .line 285
    :cond_6
    sget v2, Ll/kbc0;->m0:I

    .line 286
    .line 287
    :goto_2
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 288
    .line 289
    .line 290
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 291
    .line 292
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailed:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 293
    .line 294
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserStateContent;->reason:Ljava/lang/String;

    .line 295
    .line 296
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 297
    .line 298
    .line 299
    move-result-object v2

    .line 300
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->a2:I

    .line 301
    .line 302
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v4

    .line 306
    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v2

    .line 310
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object v2

    .line 314
    filled-new-array {v0}, [Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 319
    .line 320
    .line 321
    move-result-object v0

    .line 322
    sget v3, Ll/j9c0;->f:I

    .line 323
    .line 324
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 325
    .line 326
    .line 327
    move-result v3

    .line 328
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    invoke-static {v2, v0, v3, v4}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 333
    .line 334
    .line 335
    move-result-object v0

    .line 336
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->f:Lv/VText;

    .line 337
    .line 338
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 339
    .line 340
    .line 341
    goto :goto_3

    .line 342
    :cond_7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isRestrict()Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-eqz v0, :cond_8

    .line 347
    .line 348
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->e:Lv/VDraweeView;

    .line 349
    .line 350
    sget v2, Ll/kbc0;->B1:I

    .line 351
    .line 352
    invoke-virtual {v0, v2}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 353
    .line 354
    .line 355
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->f:Lv/VText;

    .line 356
    .line 357
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->i3:I

    .line 358
    .line 359
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 363
    .line 364
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->j2:I

    .line 365
    .line 366
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 367
    .line 368
    .line 369
    :cond_8
    :goto_3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->W1:I

    .line 374
    .line 375
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v0

    .line 379
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->X1:I

    .line 384
    .line 385
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->Y1:I

    .line 394
    .line 395
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v3

    .line 399
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    sget v5, Lcom/p1/mobile/putong/core/profile/R$string;->U1:I

    .line 404
    .line 405
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v4

    .line 409
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 410
    .line 411
    .line 412
    move-result v5

    .line 413
    if-eqz v5, :cond_9

    .line 414
    .line 415
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 416
    .line 417
    .line 418
    move-result-object v5

    .line 419
    sget v6, Lcom/p1/mobile/putong/core/profile/R$string;->V1:I

    .line 420
    .line 421
    filled-new-array {v0, v2, v3, v4}, [Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v7

    .line 425
    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v5

    .line 429
    goto :goto_4

    .line 430
    :cond_9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 431
    .line 432
    .line 433
    move-result-object v5

    .line 434
    sget v6, Lcom/p1/mobile/putong/core/profile/R$string;->h3:I

    .line 435
    .line 436
    filled-new-array {v2, v3, v4}, [Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v7

    .line 440
    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v5

    .line 444
    :goto_4
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v5

    .line 448
    filled-new-array {v0, v2, v3, v4}, [Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 453
    .line 454
    .line 455
    move-result-object v0

    .line 456
    sget v2, Ll/j9c0;->f:I

    .line 457
    .line 458
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 459
    .line 460
    .line 461
    move-result v2

    .line 462
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    invoke-static {v5, v0, v2, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g:Lv/VText;

    .line 471
    .line 472
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 473
    .line 474
    .line 475
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 476
    .line 477
    new-instance v1, Ll/jlq;

    .line 478
    .line 479
    invoke-direct {v1, p0}, Ll/jlq;-><init>(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    .line 484
    .line 485
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->q2(Lcom/p1/mobile/putong/data/User;)V

    .line 486
    .line 487
    .line 488
    const-wide/16 v0, 0x1

    .line 489
    .line 490
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 491
    .line 492
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 501
    .line 502
    .line 503
    move-result-object v1

    .line 504
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 505
    .line 506
    .line 507
    move-result-object v0

    .line 508
    new-instance v1, Ll/klq;

    .line 509
    .line 510
    invoke-direct {v1, p0, p1}, Ll/klq;-><init>(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Lcom/p1/mobile/putong/data/User;)V

    .line 511
    .line 512
    .line 513
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 514
    .line 515
    .line 516
    move-result-object p1

    .line 517
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 518
    .line 519
    .line 520
    move-result-object p1

    .line 521
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 522
    .line 523
    .line 524
    move-result-object v0

    .line 525
    new-instance v1, Ll/llq;

    .line 526
    .line 527
    invoke-direct {v1}, Ll/llq;-><init>()V

    .line 528
    .line 529
    .line 530
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    new-instance v1, Ll/mlq;

    .line 535
    .line 536
    invoke-direct {v1, p1}, Ll/mlq;-><init>(Ll/kcg0;)V

    .line 537
    .line 538
    .line 539
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 544
    .line 545
    .line 546
    :goto_5
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 547
    .line 548
    .line 549
    move-result-object p1

    .line 550
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 551
    .line 552
    .line 553
    move-result-object p1

    .line 554
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 555
    .line 556
    .line 557
    move-result p1

    .line 558
    if-eqz p1, :cond_a

    .line 559
    .line 560
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 561
    .line 562
    sget p1, Ll/kbc0;->j:I

    .line 563
    .line 564
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 565
    .line 566
    .line 567
    :cond_a
    return-void
.end method

.method public static o2()V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const/high16 v1, 0x10000000

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static p2(Z)V
    .locals 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    const-class v2, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "CLOSE_PRE_ACT"

    .line 11
    .line 12
    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    const/high16 p0, 0x10000000

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/nlq;->b(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public finish()V
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 5
    .line 6
    const/16 v1, 0x22

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    if-gt v0, v1, :cond_0

    .line 10
    .line 11
    sget v0, Ll/z7c0;->d:I

    .line 12
    .line 13
    invoke-virtual {p0, v2, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0, v2, v2}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final g2()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/app/Activity;

    .line 48
    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v2, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ag(Landroid/app/Activity;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_2
    return-void
.end method

.method public i2()Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->e2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 7
    .line 8
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    move-object v0, p2

    .line 13
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 14
    .line 15
    const/high16 v1, 0x41200000    # 10.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h:Lv/VButton;

    .line 24
    .line 25
    invoke-virtual {p0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-object p1
.end method

.method public initSubscription()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/glq;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/glq;-><init>(Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l2(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/account/BanDetailAct;->X1(Landroid/content/Context;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "e_banned_warn_alert_detail"

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->i2()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->finish()V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->j:Z

    .line 35
    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g2()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public final synthetic m2(Landroid/view/View;)V
    .locals 4

    .line 1
    const-string p1, "e_banned_warn_alert_detail"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    const/4 v2, 0x0

    .line 21
    const-string v3, "-1"

    .line 22
    .line 23
    invoke-interface {p1, v0, v3, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->startMessagesAct(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic n2(Lcom/p1/mobile/putong/data/User;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->q2(Lcom/p1/mobile/putong/data/User;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->i2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 9
    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->j:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->g2()V

    .line 16
    .line 17
    .line 18
    :cond_1
    :goto_0
    return-void
.end method

.method public onStartLifecycle()V
    .locals 10

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const-string v2, ""

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 23
    .line 24
    iget v0, v0, Lcom/p1/mobile/putong/data/BanStatus;->code:I

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :cond_0
    move-object v9, v2

    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 38
    .line 39
    const-string v7, "anywhere"

    .line 40
    .line 41
    const-string v8, "banned"

    .line 42
    .line 43
    const-string v3, "passive"

    .line 44
    .line 45
    const-string v4, "alert"

    .line 46
    .line 47
    const-string v5, "alert_special"

    .line 48
    .line 49
    const-string v6, "null"

    .line 50
    .line 51
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->h2(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 56
    .line 57
    .line 58
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_banned_warn_alert"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 3
    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q2(Lcom/p1/mobile/putong/data/User;)V
    .locals 9

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-wide/16 v1, 0x0

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserState;->jailed:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 18
    .line 19
    :goto_0
    iget-wide v3, p1, Lcom/p1/mobile/putong/data/UserStateContent;->expireTime:D

    .line 20
    .line 21
    double-to-long v3, v3

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserState;->restricted:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move-wide v3, v1

    .line 27
    :goto_1
    sget-object p1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 30
    .line 31
    .line 32
    move-result-wide v5

    .line 33
    sub-long/2addr v3, v5

    .line 34
    const-wide/32 v5, 0x5265c00

    .line 35
    .line 36
    .line 37
    div-long v7, v3, v5

    .line 38
    .line 39
    long-to-int p1, v7

    .line 40
    cmp-long v0, v3, v1

    .line 41
    .line 42
    if-gtz v0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->finish()V

    .line 45
    .line 46
    .line 47
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->U:I

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-lez p1, :cond_3

    .line 73
    .line 74
    int-to-long v1, p1

    .line 75
    mul-long/2addr v1, v5

    .line 76
    sub-long/2addr v3, v1

    .line 77
    :cond_3
    invoke-static {v3, v4}, Ll/tzi0;->b(J)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    sget v4, Lcom/p1/mobile/putong/core/profile/R$string;->Z1:I

    .line 91
    .line 92
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    filled-new-array {p1, v1}, [Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    sget v1, Ll/j9c0;->f:I

    .line 126
    .line 127
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    const/4 v2, 0x2

    .line 132
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v0, p1, v1, v2}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/account/JailedDialogLikeAct;->i:Lv/VText;

    .line 141
    .line 142
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public setTheme()V
    .locals 1

    .line 1
    sget v0, Ll/egc0;->d:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->setTheme(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
