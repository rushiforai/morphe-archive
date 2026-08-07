.class public Ll/u73;
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

.method public static A(Lcom/p1/mobile/android/app/Act;FLl/x20;Ll/x20;)V
    .locals 7

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v1, "x"

    .line 10
    .line 11
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v1, " %.1f%s "

    .line 16
    .line 17
    invoke-static {v0, v1, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    const-string p1, "dialog"

    .line 21
    .line 22
    const-string v0, "p_boost_end_view"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v5, "anywhere"

    .line 29
    .line 30
    const-string v6, "boost_end"

    .line 31
    .line 32
    const-string v1, "passive"

    .line 33
    .line 34
    const-string v2, "alert"

    .line 35
    .line 36
    const-string v3, "alert_self_definition_basic"

    .line 37
    .line 38
    const-string v4, "null"

    .line 39
    .line 40
    invoke-static/range {v1 .. v6}, Ll/i6e;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p1, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 45
    .line 46
    .line 47
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 50
    .line 51
    invoke-virtual {v1}, Ll/m27;->J3()Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    invoke-static {}, Ll/pa3;->f()Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-nez v1, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->n:I

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    :goto_0
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->o:I

    .line 72
    .line 73
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 80
    .line 81
    const/4 v3, 0x1

    .line 82
    iput-boolean v3, v2, Ll/m27;->q0:Z

    .line 83
    .line 84
    invoke-static {}, Ll/pa3;->f()Z

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->o:Ll/gta;

    .line 89
    .line 90
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Vd()Z

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    if-eqz v4, :cond_2

    .line 99
    .line 100
    const-string v2, "e_intl_boost_ultra_renew_btn"

    .line 101
    .line 102
    invoke-static {v2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ll/imo$a;

    .line 106
    .line 107
    invoke-direct {v0, p0}, Ll/imo$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 108
    .line 109
    .line 110
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->t0:I

    .line 111
    .line 112
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    new-instance v4, Ll/d73;

    .line 117
    .line 118
    invoke-direct {v4, p0}, Ll/d73;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0, v2, v4}, Ll/imo$a;->u(Ljava/lang/CharSequence;Ll/y20;)Ll/imo$a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v2, "#FE7E1D"

    .line 126
    .line 127
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    invoke-virtual {v0, v2}, Ll/imo$a;->s(I)Ll/imo$a;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->i:I

    .line 136
    .line 137
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    new-instance v4, Ll/e73;

    .line 142
    .line 143
    invoke-direct {v4, p3}, Ll/e73;-><init>(Ll/x20;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0, v2, v4}, Ll/imo$a;->r(Ljava/lang/CharSequence;Ll/y20;)Ll/imo$a;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    invoke-virtual {p3, v3}, Ll/imo$a;->b(Z)Ll/imo$a;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    new-instance v0, Ll/f73;

    .line 155
    .line 156
    invoke-direct {v0, p2}, Ll/f73;-><init>(Ll/x20;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p3, v0}, Ll/imo$a;->c(Ll/y20;)Ll/imo$a;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    new-instance v0, Ll/g73;

    .line 164
    .line 165
    invoke-direct {v0, p2}, Ll/g73;-><init>(Ll/x20;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p3, v0}, Ll/imo$a;->v(Landroid/content/DialogInterface$OnDismissListener;)Ll/imo$a;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p2}, Ll/imo$a;->a()Ll/imo;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    const/4 v2, 0x0

    .line 177
    goto :goto_2

    .line 178
    :cond_2
    new-instance v0, Ll/imo$a;

    .line 179
    .line 180
    invoke-direct {v0, p0}, Ll/imo$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 181
    .line 182
    .line 183
    sget v4, Lcom/p1/mobile/putong/core/member/R$string;->i:I

    .line 184
    .line 185
    invoke-virtual {p0, v4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v4

    .line 189
    new-instance v5, Ll/h73;

    .line 190
    .line 191
    invoke-direct {v5, p3}, Ll/h73;-><init>(Ll/x20;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0, v4, v5}, Ll/imo$a;->u(Ljava/lang/CharSequence;Ll/y20;)Ll/imo$a;

    .line 195
    .line 196
    .line 197
    move-result-object p3

    .line 198
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->q:I

    .line 199
    .line 200
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    new-instance v4, Ll/i73;

    .line 205
    .line 206
    invoke-direct {v4, p0}, Ll/i73;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p3, v0, v4}, Ll/imo$a;->r(Ljava/lang/CharSequence;Ll/y20;)Ll/imo$a;

    .line 210
    .line 211
    .line 212
    move-result-object p3

    .line 213
    invoke-virtual {p3, v3}, Ll/imo$a;->b(Z)Ll/imo$a;

    .line 214
    .line 215
    .line 216
    move-result-object p3

    .line 217
    new-instance v0, Ll/j73;

    .line 218
    .line 219
    invoke-direct {v0, p2}, Ll/j73;-><init>(Ll/x20;)V

    .line 220
    .line 221
    .line 222
    invoke-virtual {p3, v0}, Ll/imo$a;->c(Ll/y20;)Ll/imo$a;

    .line 223
    .line 224
    .line 225
    move-result-object p3

    .line 226
    new-instance v0, Ll/k73;

    .line 227
    .line 228
    invoke-direct {v0, p2}, Ll/k73;-><init>(Ll/x20;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p3, v0}, Ll/imo$a;->v(Landroid/content/DialogInterface$OnDismissListener;)Ll/imo$a;

    .line 232
    .line 233
    .line 234
    move-result-object p2

    .line 235
    invoke-virtual {p2}, Ll/imo$a;->a()Ll/imo;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {p2}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 240
    .line 241
    .line 242
    move-result-object p3

    .line 243
    iget-object p3, p3, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B:Landroid/widget/TextView;

    .line 244
    .line 245
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 246
    .line 247
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 248
    .line 249
    invoke-virtual {v0}, Ll/m27;->J3()Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 254
    .line 255
    .line 256
    :goto_2
    invoke-static {p2, v3}, Ll/u73;->w(Ll/imo;I)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p2}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 260
    .line 261
    .line 262
    move-result-object p3

    .line 263
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->p:I

    .line 264
    .line 265
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    invoke-virtual {p3, p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    sget p3, Ll/gbc0;->x:I

    .line 278
    .line 279
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->S(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 284
    .line 285
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 286
    .line 287
    invoke-virtual {p3}, Ll/m27;->y3()I

    .line 288
    .line 289
    .line 290
    move-result p3

    .line 291
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->P(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 296
    .line 297
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 298
    .line 299
    invoke-virtual {p3}, Ll/m27;->C3()I

    .line 300
    .line 301
    .line 302
    move-result p3

    .line 303
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->O(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->T(Z)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 308
    .line 309
    .line 310
    invoke-virtual {p2, p1}, Ll/imo;->l(Ll/l4g0;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {p2}, Ll/imo;->m()V

    .line 314
    .line 315
    .line 316
    return-void
.end method

.method public static B(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, v0, Ll/m27;->q0:Z

    .line 7
    .line 8
    new-instance v0, Ll/imo$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/imo$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->h:I

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v0, v2}, Ll/imo$a;->t(Ljava/lang/CharSequence;)Ll/imo$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0, v1}, Ll/imo$a;->b(Z)Ll/imo$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/imo$a;->a()Ll/imo;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/4 v2, -0x1

    .line 32
    invoke-static {v0, v2}, Ll/u73;->w(Ll/imo;I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B:Landroid/widget/TextView;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->A:Lv/VImage;

    .line 50
    .line 51
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->o:Lv/VRelative;

    .line 59
    .line 60
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->h:Lv/VText;

    .line 68
    .line 69
    invoke-static {}, Ll/joa;->D3()Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    xor-int/2addr v1, v3

    .line 74
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->i:Lv/VLinear;

    .line 82
    .line 83
    const/high16 v2, 0x43310000    # 177.0f

    .line 84
    .line 85
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    invoke-static {v1, v2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->l:I

    .line 97
    .line 98
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->R(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->m:I

    .line 107
    .line 108
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->Q(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    sget v1, Ll/gbc0;->x:I

    .line 117
    .line 118
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->S(I)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->V()V

    .line 123
    .line 124
    .line 125
    invoke-static {}, Ll/y63;->j()Ll/y63;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    new-instance v1, Ll/a73;

    .line 130
    .line 131
    invoke-direct {v1, v0}, Ll/a73;-><init>(Ll/imo;)V

    .line 132
    .line 133
    .line 134
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    invoke-virtual {p0, v1}, Ll/y63;->p(Ll/bb50;)Ll/kcg0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    new-instance v1, Ll/l73;

    .line 143
    .line 144
    invoke-direct {v1, p0}, Ll/l73;-><init>(Ll/kcg0;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ll/imo;->k(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v0}, Ll/imo;->m()V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public static C(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ll/ugy$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->p0:I

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->o0:I

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x0

    .line 27
    invoke-virtual {v0, v1}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->m0:I

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    new-instance v2, Ll/o73;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/o73;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/ugy$a;->t()Ll/ugy;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    sget v2, Ll/gbc0;->V:I

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->F(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->c6()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->R(I)V

    .line 76
    .line 77
    .line 78
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->K0:Ll/cza;

    .line 81
    .line 82
    invoke-virtual {v1}, Ll/cza;->y3()Lrx/subjects/a;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance v1, Ll/p73;

    .line 99
    .line 100
    invoke-direct {v1, v0}, Ll/p73;-><init>(Ll/ugy;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {p0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    new-instance v1, Ll/q73;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/q73;-><init>(Ll/kcg0;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ll/ugy;->l(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ll/ugy;->n()V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public static D(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;ZZ)V
    .locals 4

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/pa3;->f()Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/m27;->B3()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/m27;->z3()I

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    :goto_0
    new-instance v0, Ll/ugy$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->j:I

    .line 24
    .line 25
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {}, Ll/u73;->t()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object p3

    .line 45
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    const-string v3, " %d "

    .line 50
    .line 51
    invoke-static {v2, v3, p3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    filled-new-array {p3}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p0, v1, p3}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    sget v1, Ll/f9c0;->d:I

    .line 64
    .line 65
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v2, 0x2

    .line 70
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-static {p3, v1, v2}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    invoke-virtual {v0, p3}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    const/4 v0, 0x1

    .line 83
    invoke-virtual {p3, v0}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 84
    .line 85
    .line 86
    move-result-object p3

    .line 87
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->o1:I

    .line 88
    .line 89
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    new-instance v2, Ll/b73;

    .line 94
    .line 95
    invoke-direct {v2, p1, p2}, Ll/b73;-><init>(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p3, v1, v2}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget p3, Lcom/p1/mobile/putong/core/member/R$string;->a:I

    .line 103
    .line 104
    invoke-virtual {p0, p3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-virtual {p1, p0}, Ll/ugy$a;->u(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ya()Z

    .line 121
    .line 122
    .line 123
    move-result p1

    .line 124
    invoke-virtual {p0, p1}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->W0:I

    .line 129
    .line 130
    if-eqz p4, :cond_1

    .line 131
    .line 132
    new-instance p3, Ll/c73;

    .line 133
    .line 134
    invoke-direct {p3}, Ll/c73;-><init>()V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_1
    const/4 p3, 0x0

    .line 139
    :goto_1
    invoke-virtual {p0, p1, p3}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->r:Landroid/widget/TextView;

    .line 152
    .line 153
    sget-object p3, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 154
    .line 155
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->w:Landroid/widget/TextView;

    .line 163
    .line 164
    const-string p3, "#33000000"

    .line 165
    .line 166
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result p3

    .line 170
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->d:Landroid/widget/FrameLayout;

    .line 178
    .line 179
    const/high16 p3, 0x43480000    # 200.0f

    .line 180
    .line 181
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 182
    .line 183
    .line 184
    move-result p3

    .line 185
    invoke-static {p1, p3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    invoke-static {p0, v0}, Ll/u73;->v(Ll/ugy;I)V

    .line 189
    .line 190
    .line 191
    if-eqz p2, :cond_2

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-interface {p1, p2}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ok(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-virtual {p0, p1}, Ll/ugy;->m(Ll/l4g0;)V

    .line 206
    .line 207
    .line 208
    :cond_2
    invoke-virtual {p0}, Ll/ugy;->n()V

    .line 209
    .line 210
    .line 211
    return-void
.end method

.method public static E(Lcom/p1/mobile/android/app/Act;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Z)V
    .locals 4

    .line 1
    invoke-static {}, Ll/m27;->E3()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ll/ugy$a;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->p0:I

    .line 11
    .line 12
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz p4, :cond_0

    .line 21
    .line 22
    sget p4, Lcom/p1/mobile/putong/core/member/R$string;->d0:I

    .line 23
    .line 24
    invoke-virtual {p0, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p4

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    sget p4, Lcom/p1/mobile/putong/core/member/R$string;->n0:I

    .line 30
    .line 31
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-string v3, " %d "

    .line 44
    .line 45
    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, p4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    :goto_0
    sget v0, Ll/f9c0;->d:I

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const/4 v2, 0x2

    .line 64
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const/4 v3, 0x0

    .line 69
    invoke-static {p4, v3, v0, v2, v3}, Ll/u73;->u(Ljava/lang/String;IILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    invoke-virtual {v1, p4}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 74
    .line 75
    .line 76
    move-result-object p4

    .line 77
    invoke-virtual {p4, v3}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 78
    .line 79
    .line 80
    move-result-object p4

    .line 81
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->o1:I

    .line 82
    .line 83
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/r73;

    .line 88
    .line 89
    invoke-direct {v1, p1}, Ll/r73;-><init>(Ll/x20;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p4, v0, v1}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    sget p4, Lcom/p1/mobile/putong/core/member/R$string;->a:I

    .line 97
    .line 98
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance p4, Ll/s73;

    .line 103
    .line 104
    invoke-direct {p4}, Ll/s73;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, p0, p4}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Ya()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    invoke-virtual {p0, p1}, Ll/ugy$a;->z(Z)Ll/ugy$a;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    sget p1, Lcom/p1/mobile/putong/core/member/R$string;->W0:I

    .line 128
    .line 129
    const/4 p4, 0x0

    .line 130
    invoke-virtual {p0, p1, p4}, Ll/ugy$a;->w(ILandroid/widget/CompoundButton$OnCheckedChangeListener;)Ll/ugy$a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    sget p4, Ll/gbc0;->V:I

    .line 143
    .line 144
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->F(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 152
    .line 153
    .line 154
    move-result-object p4

    .line 155
    invoke-virtual {p4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 156
    .line 157
    .line 158
    move-result-object p4

    .line 159
    invoke-interface {p4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->c6()I

    .line 160
    .line 161
    .line 162
    move-result p4

    .line 163
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->B(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->j0()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    const-string p4, "#999999"

    .line 178
    .line 179
    invoke-static {p4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    move-result p4

    .line 183
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->f0(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 184
    .line 185
    .line 186
    if-eqz p3, :cond_1

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-interface {p1, p3}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->ok(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/l4g0;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0, p1}, Ll/ugy;->m(Ll/l4g0;)V

    .line 201
    .line 202
    .line 203
    :cond_1
    const/4 p1, 0x1

    .line 204
    invoke-static {p1, p1}, Ll/u73;->F(ZZ)V

    .line 205
    .line 206
    .line 207
    invoke-static {v3, p1}, Ll/u73;->F(ZZ)V

    .line 208
    .line 209
    .line 210
    new-instance p1, Ll/u73$a;

    .line 211
    .line 212
    invoke-direct {p1, p2}, Ll/u73$a;-><init>(Ll/x20;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, p1}, Ll/ugy;->l(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Ll/ugy;->n()V

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public static F(ZZ)V
    .locals 4

    .line 1
    const-string v0, "e_purchase_spotlight_confirm_popup_confirm"

    .line 2
    .line 3
    const-string v1, "e_purchase_spotlight_confirm_popup_cancel"

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    move-object v2, v1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move-object v2, v0

    .line 10
    :goto_0
    const-string v3, "p_purchase_spotlight_confirm_popup"

    .line 11
    .line 12
    invoke-static {v2, v3}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_2

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    move-object v0, v1

    .line 20
    :cond_1
    invoke-static {v0, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_2
    return-void
.end method

.method public static G(Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;Ljava/lang/String;J)V
    .locals 2

    .line 1
    invoke-static {}, Ll/joa;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2, p3}, Ll/pa3;->c(J)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->Y(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 17
    .line 18
    invoke-virtual {p2}, Ll/m27;->y3()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->X(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->s:I

    .line 34
    .line 35
    invoke-virtual {p3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p3

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->r:I

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    filled-new-array {p1, p3, v0}, [Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p3, "%s %s%s"

    .line 54
    .line 55
    invoke-static {p2, p3, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic a(Ll/x20;Ll/imo;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p1, Ll/m27;->q0:Z

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p1, Ll/m27;->q0:Z

    .line 7
    .line 8
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p1, Ll/m27;->q0:Z

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->sb(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic e(Ll/x20;Landroid/content/DialogInterface;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p1, Ll/m27;->q0:Z

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Ll/x20;Ll/imo;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p1, Ll/m27;->q0:Z

    .line 7
    .line 8
    invoke-interface {p0}, Ll/x20;->call()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic g(Ll/kcg0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/android/app/Act;Ll/imo;)V
    .locals 6

    .line 1
    const-string p1, "e_intl_boost_ultra_renew_btn"

    .line 2
    .line 3
    const-string v0, "p_boost_end_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v3, Lcom/p1/mobile/putong/core/data/Privilege;->full_boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    const/4 v5, 0x0

    .line 20
    const-string v2, "p_boost_end_view,e_intl_boost_ultra_renew_btn,click"

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    invoke-interface/range {v0 .. v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->r6(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic i(Ll/x20;Ll/imo;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/ugy;)V
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-static {p0, v0}, Ll/u73;->F(ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic k(Ll/x20;Ll/imo;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Ll/imo;Landroid/util/Pair;)V
    .locals 3

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ll/bkj0;

    .line 27
    .line 28
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Ljava/lang/String;

    .line 31
    .line 32
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Ljava/lang/Long;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    invoke-static {p0, v0, v1, v2}, Ll/u73;->G(Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;Ljava/lang/String;J)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/imo;->f()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public static synthetic m(Ll/x20;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-static {p0, p0}, Ll/u73;->F(ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/core/data/Privilege;Ll/ugy;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    if-ne p0, p1, :cond_1

    .line 4
    .line 5
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p1, Ljava/util/Date;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-direct {p1, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 19
    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/lit8 p0, p0, 0x1

    .line 27
    .line 28
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 31
    .line 32
    iget-object p1, p1, Ll/m27;->i0:Ll/vxd0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    div-int/lit8 p1, p1, 0xa

    .line 45
    .line 46
    rem-int/lit8 p1, p1, 0x64

    .line 47
    .line 48
    if-ne p0, p1, :cond_0

    .line 49
    .line 50
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 53
    .line 54
    iget-object p0, p0, Ll/m27;->i0:Ll/vxd0;

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    add-int/lit8 p1, p1, 0x1

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 79
    .line 80
    iget-object p1, p1, Ll/m27;->i0:Ll/vxd0;

    .line 81
    .line 82
    mul-int/lit8 p0, p0, 0xa

    .line 83
    .line 84
    add-int/lit16 p0, p0, 0x3e9

    .line 85
    .line 86
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    :cond_1
    return-void
.end method

.method public static synthetic o(Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    if-ne p1, p0, :cond_0

    .line 7
    .line 8
    const-string p0, "e_messages_boost_guide_confirm"

    .line 9
    .line 10
    const-string p1, "p_messages_boost_guide"

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic p(Ll/x20;Lcom/p1/mobile/putong/core/data/PurchaseType;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->I8(Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/android/app/Act;Ll/imo;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->J6(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic r(Ll/x20;Ll/ugy;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic s(Ll/ugy;Landroid/util/Pair;)V
    .locals 4

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    iget-object v0, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Landroid/util/Pair;

    .line 23
    .line 24
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 33
    .line 34
    const-string v1, "mm:ss"

    .line 35
    .line 36
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ljava/util/Date;

    .line 44
    .line 45
    int-to-long v2, p1

    .line 46
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->k0(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    invoke-virtual {p0}, Ll/ugy;->e()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static t()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->p1:I

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    sget v0, Lcom/p1/mobile/putong/core/member/R$string;->n1:I

    .line 15
    .line 16
    return v0
.end method

.method public static u(Ljava/lang/String;IILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 1
    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "-?[0-9]\\d*"

    .line 6
    .line 7
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_1

    .line 26
    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    add-int/lit8 p0, p0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance v2, Lv/text/CustomTypefaceSpan;

    .line 33
    .line 34
    const-string v3, "sans-serif"

    .line 35
    .line 36
    invoke-direct {v2, v3, p3, p2, p4}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    add-int/2addr v3, p1

    .line 44
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    add-int/2addr v4, p1

    .line 49
    const/16 v5, 0x21

    .line 50
    .line 51
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-object v1
.end method

.method public static v(Ll/ugy;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlZEQ05XUTdKU1pOWFFDUktYTVFZWVRHWFFDS09YNDE0IiwidyI6NjIyLCJoIjo0NTAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NzE0MTgyNX0.webp"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->C(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget p1, Ll/gbc0;->x:I

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->F(I)Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static w(Ll/imo;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/imo;->i()Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IlZEQ05XUTdKU1pOWFFDUktYTVFZWVRHWFFDS09YNDE0IiwidyI6NjIyLCJoIjo0NTAsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo2NzE0MTgyNX0.webp"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;->B(Ljava/lang/String;)Lcom/p1/mobile/putong/core/ui/dlg/IntlMemberAnimView;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static x(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 3

    .line 1
    const-class v0, Ll/ugy;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_boost_confirm_use"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "tooltips_trigger_mode"

    .line 14
    .line 15
    const-string v2, "passive"

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    filled-new-array {v1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/ugy$a;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 31
    .line 32
    .line 33
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->j:I

    .line 34
    .line 35
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v1, v2}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->e:I

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v1, v2}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    new-instance v2, Ll/t73;

    .line 54
    .line 55
    invoke-direct {v2, p2}, Ll/t73;-><init>(Ll/x20;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p1, v2}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const/4 p2, 0x1

    .line 63
    invoke-virtual {p1, p2}, Ll/ugy$a;->A(Z)Ll/ugy$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    sget v1, Lcom/p1/mobile/putong/core/member/R$string;->T0:I

    .line 68
    .line 69
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Ll/ugy$a;->u(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/ugy$a;->t()Ll/ugy;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {p0, p2}, Ll/u73;->v(Ll/ugy;I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/ugy;->m(Ll/l4g0;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/ugy;->n()V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static y(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Ll/u73;->z(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static z(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/m27;->z3()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    if-ne p2, v1, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/m27;->D3()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/Privilege;->boost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 14
    .line 15
    if-ne p2, v2, :cond_1

    .line 16
    .line 17
    const-string v2, "e_messages_boost_guide_confirm"

    .line 18
    .line 19
    const-string v3, "p_messages_boost_guide"

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 27
    .line 28
    iget-object v2, v2, Ll/m27;->f0:Ll/byd0;

    .line 29
    .line 30
    invoke-static {}, Ll/pzi0;->o()J

    .line 31
    .line 32
    .line 33
    move-result-wide v3

    .line 34
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v2, v3}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    new-instance v2, Ll/ugy$a;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/ugy$a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 44
    .line 45
    .line 46
    if-eq p2, v1, :cond_2

    .line 47
    .line 48
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->R:I

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->T:I

    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v2, v3}, Ll/ugy$a;->D(Ljava/lang/String;)Ll/ugy$a;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    if-eq p2, v1, :cond_3

    .line 62
    .line 63
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->Q:I

    .line 64
    .line 65
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->S:I

    .line 71
    .line 72
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    :goto_1
    invoke-virtual {v2, v3}, Ll/ugy$a;->C(Ljava/lang/CharSequence;)Ll/ugy$a;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    sget v3, Lcom/p1/mobile/putong/core/member/R$string;->O:I

    .line 81
    .line 82
    invoke-virtual {p0, v3}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    new-instance v4, Ll/m73;

    .line 87
    .line 88
    invoke-direct {v4, p1, p2}, Ll/m73;-><init>(Ll/x20;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2, v3, v4}, Ll/ugy$a;->x(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    sget v2, Lcom/p1/mobile/putong/core/member/R$string;->P:I

    .line 96
    .line 97
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    new-instance v3, Ll/n73;

    .line 102
    .line 103
    invoke-direct {v3, p2}, Ll/n73;-><init>(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v2, v3}, Ll/ugy$a;->v(Ljava/lang/CharSequence;Ll/y20;)Ll/ugy$a;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-virtual {p1}, Ll/ugy$a;->t()Ll/ugy;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    const/4 v2, 0x1

    .line 115
    invoke-static {p1, v2}, Ll/u73;->v(Ll/ugy;I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->d:Landroid/widget/FrameLayout;

    .line 123
    .line 124
    const/high16 v4, 0x43480000    # 200.0f

    .line 125
    .line 126
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 127
    .line 128
    .line 129
    move-result v4

    .line 130
    invoke-static {v3, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->q:Lv/VCheckBox;

    .line 138
    .line 139
    const/4 v4, 0x0

    .line 140
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    if-ne p2, v1, :cond_4

    .line 144
    .line 145
    invoke-virtual {p1}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->p:Landroid/widget/LinearLayout;

    .line 150
    .line 151
    invoke-static {p0, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :cond_4
    invoke-virtual {p1}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 156
    .line 157
    .line 158
    move-result-object p2

    .line 159
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->p:Landroid/widget/LinearLayout;

    .line 160
    .line 161
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Ll/ugy;->g()Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    iget-object p2, p2, Lcom/p1/mobile/putong/core/ui/dlg/MemberAnimView;->r:Landroid/widget/TextView;

    .line 169
    .line 170
    invoke-static {}, Ll/u73;->t()I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    const-string v3, " %d "

    .line 187
    .line 188
    invoke-static {v2, v3, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    sget v1, Ll/f9c0;->d:I

    .line 201
    .line 202
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    const/4 v1, 0x2

    .line 207
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    invoke-static {v0, p0, v1}, Ll/q8g0;->N(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 216
    .line 217
    .line 218
    :goto_2
    invoke-virtual {p1}, Ll/ugy;->n()V

    .line 219
    .line 220
    .line 221
    return-void
.end method
