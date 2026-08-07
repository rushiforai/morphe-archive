.class public Ll/bbl;
.super Ll/n4;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/n4;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Ll/p8l$a;Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;)V
    .locals 7

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/p8l$a;->a()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget v1, Ll/agc0;->o:I

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->L(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget v1, Ll/kec0;->fd:I

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->M(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->P()Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    sget v2, Ll/adc0;->C6:I

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/widget/ImageView;

    .line 44
    .line 45
    sget v3, Ll/adc0;->Le:I

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lv/VText;

    .line 52
    .line 53
    sget v4, Ll/adc0;->Ce:I

    .line 54
    .line 55
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    check-cast v4, Lv/VText;

    .line 60
    .line 61
    sget v5, Ll/adc0;->H0:I

    .line 62
    .line 63
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Lv/VText;

    .line 68
    .line 69
    sget v5, Lcom/p1/mobile/putong/core/R$string;->E8:I

    .line 70
    .line 71
    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 72
    .line 73
    .line 74
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->type:Ljava/lang/String;

    .line 75
    .line 76
    const-string v6, "boost"

    .line 77
    .line 78
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    const-string v6, "privilege_type"

    .line 83
    .line 84
    if-eqz v5, :cond_1

    .line 85
    .line 86
    const-string v5, "superlike_and_boost"

    .line 87
    .line 88
    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->picUrl:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v5

    .line 97
    if-eqz v5, :cond_0

    .line 98
    .line 99
    sget v5, Ll/dbc0;->Ks:I

    .line 100
    .line 101
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_0
    invoke-static {v2}, Lcom/bumptech/glide/a;->u(Landroid/view/View;)Ll/m2d0;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->picUrl:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v5, v6}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    sget v6, Ll/dbc0;->Ks:I

    .line 116
    .line 117
    invoke-virtual {v5, v6}, Ll/lr2;->j(I)Ll/lr2;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    check-cast v5, Ll/a2d0;

    .line 122
    .line 123
    invoke-virtual {v5, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 124
    .line 125
    .line 126
    :goto_0
    sget v2, Lcom/p1/mobile/putong/core/R$string;->D8:I

    .line 127
    .line 128
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(I)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_1
    const-string v5, "superlike"

    .line 133
    .line 134
    invoke-virtual {v0, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->picUrl:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 140
    .line 141
    .line 142
    move-result v5

    .line 143
    if-eqz v5, :cond_2

    .line 144
    .line 145
    sget v5, Ll/dbc0;->Js:I

    .line 146
    .line 147
    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_2
    invoke-static {v2}, Lcom/bumptech/glide/a;->u(Landroid/view/View;)Ll/m2d0;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->picUrl:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v5, v6}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 158
    .line 159
    .line 160
    move-result-object v5

    .line 161
    sget v6, Ll/dbc0;->Js:I

    .line 162
    .line 163
    invoke-virtual {v5, v6}, Ll/lr2;->j(I)Ll/lr2;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    check-cast v5, Ll/a2d0;

    .line 168
    .line 169
    invoke-virtual {v5, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 170
    .line 171
    .line 172
    :goto_1
    sget v2, Lcom/p1/mobile/putong/core/R$string;->F8:I

    .line 173
    .line 174
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(I)V

    .line 175
    .line 176
    .line 177
    :goto_2
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 178
    .line 179
    if-eqz v2, :cond_5

    .line 180
    .line 181
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->title:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 184
    .line 185
    .line 186
    move-result v2

    .line 187
    if-nez v2, :cond_3

    .line 188
    .line 189
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 190
    .line 191
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->title:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 194
    .line 195
    .line 196
    :cond_3
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 197
    .line 198
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->content:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result v2

    .line 204
    if-nez v2, :cond_4

    .line 205
    .line 206
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 207
    .line 208
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->content:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 211
    .line 212
    .line 213
    :cond_4
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 214
    .line 215
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->learnMore:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    if-nez v2, :cond_5

    .line 222
    .line 223
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->texts:Lcom/p1/mobile/putong/core/data/MigrateTextsData;

    .line 224
    .line 225
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MigrateTextsData;->learnMore:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 228
    .line 229
    .line 230
    :cond_5
    new-instance p1, Ll/bbl$a;

    .line 231
    .line 232
    invoke-direct {p1, p0, v0}, Ll/bbl$a;-><init>(Lcom/p1/mobile/android/app/Dialog;Ljava/util/HashMap;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v1, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 236
    .line 237
    .line 238
    new-instance p0, Ll/q4f;

    .line 239
    .line 240
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 241
    .line 242
    .line 243
    const-string p1, "p_clone_get_free_privilege"

    .line 244
    .line 245
    iput-object p1, p0, Ll/q4f;->n:Ljava/lang/String;

    .line 246
    .line 247
    sget-object p1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 248
    .line 249
    iput-object p1, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 250
    .line 251
    invoke-static {p0, v0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 252
    .line 253
    .line 254
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 255
    .line 256
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 257
    .line 258
    invoke-virtual {p0}, Ll/dcb;->u3()V

    .line 259
    .line 260
    .line 261
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 262
    .line 263
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 264
    .line 265
    invoke-virtual {p0}, Ll/joa;->y4()Lrx/c;

    .line 266
    .line 267
    .line 268
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 269
    .line 270
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 271
    .line 272
    invoke-virtual {p0}, Ll/dkb;->H9()Lrx/c;

    .line 273
    .line 274
    .line 275
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/e2m;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bbl;->c(Ll/p8l$a;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ll/e2m;)Z
    .locals 0

    .line 1
    check-cast p1, Ll/p8l$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bbl;->d(Ll/p8l$a;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Ll/p8l$a;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dcb;->v3()Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;->showDialog:Z

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1, p0}, Ll/bbl;->e(Ll/p8l$a;Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;)V

    .line 17
    .line 18
    .line 19
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0
.end method

.method public d(Ll/p8l$a;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->Q0:Ll/dcb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dcb;->v3()Lcom/p1/mobile/putong/core/data/MigrateAwardDialogData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
