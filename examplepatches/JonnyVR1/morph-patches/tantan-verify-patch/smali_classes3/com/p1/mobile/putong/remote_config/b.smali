.class public Lcom/p1/mobile/putong/remote_config/b;
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

.method public static a(Landroid/content/Context;)V
    .locals 10

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->r()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_0

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Ljava/lang/String;

    .line 45
    .line 46
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    check-cast v4, Ll/hyc0;

    .line 51
    .line 52
    new-instance v5, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string v6, "\u3010"

    .line 55
    .line 56
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-interface {v4}, Ll/hyc0;->a()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v6, "\u3011 -Key:"

    .line 67
    .line 68
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v6, "\n\t-Value:"

    .line 75
    .line 76
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-interface {v4}, Ll/hyc0;->asString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_0
    new-instance v1, Landroid/widget/LinearLayout;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    const/4 v3, 0x1

    .line 100
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 101
    .line 102
    .line 103
    const/high16 v4, 0x40a00000    # 5.0f

    .line 104
    .line 105
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    const/4 v5, 0x0

    .line 110
    invoke-virtual {v1, v5, v4, v5, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 111
    .line 112
    .line 113
    new-instance v4, Landroid/widget/TextView;

    .line 114
    .line 115
    invoke-direct {v4, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    invoke-virtual {v6}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->K()Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 123
    .line 124
    .line 125
    move-result-object v6

    .line 126
    sget-object v7, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->UID:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 127
    .line 128
    if-eq v6, v7, :cond_2

    .line 129
    .line 130
    sget-object v7, Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;->USER:Lcom/p1/mobile/putong/remote_config/RemoteConfig$ConfigStep;

    .line 131
    .line 132
    if-ne v6, v7, :cond_1

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->C()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    goto :goto_2

    .line 140
    :cond_2
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->D()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    :goto_2
    new-instance v8, Ljava/lang/StringBuilder;

    .line 145
    .line 146
    const-string v9, " RemoteConfig in step: "

    .line 147
    .line 148
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    const-string v6, "\n MD5: "

    .line 155
    .line 156
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    const-string v6, "\n K-V Size: "

    .line 163
    .line 164
    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-interface {v0}, Ljava/util/Map;->size()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 179
    .line 180
    .line 181
    const/high16 v6, -0x10000

    .line 182
    .line 183
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 184
    .line 185
    .line 186
    const/high16 v6, 0x41400000    # 12.0f

    .line 187
    .line 188
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    .line 189
    .line 190
    .line 191
    new-instance v6, Landroidx/appcompat/widget/AppCompatEditText;

    .line 192
    .line 193
    invoke-direct {v6, p0}, Landroidx/appcompat/widget/AppCompatEditText;-><init>(Landroid/content/Context;)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {v6, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 197
    .line 198
    .line 199
    const v7, 0x104000c

    .line 200
    .line 201
    .line 202
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setHint(I)V

    .line 203
    .line 204
    .line 205
    const/high16 v7, 0x41800000    # 16.0f

    .line 206
    .line 207
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setTextSize(F)V

    .line 208
    .line 209
    .line 210
    const/16 v8, 0x13

    .line 211
    .line 212
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setGravity(I)V

    .line 213
    .line 214
    .line 215
    const/high16 v8, 0x41c00000    # 24.0f

    .line 216
    .line 217
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 218
    .line 219
    .line 220
    move-result v8

    .line 221
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 226
    .line 227
    .line 228
    move-result v7

    .line 229
    invoke-virtual {v6, v8, v9, v8, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v6}, Landroid/widget/TextView;->setSingleLine()V

    .line 236
    .line 237
    .line 238
    const/4 v7, 0x3

    .line 239
    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setImeOptions(I)V

    .line 240
    .line 241
    .line 242
    new-instance v7, Lcom/p1/mobile/putong/remote_config/b$a;

    .line 243
    .line 244
    sget v8, Ll/gec0;->B:I

    .line 245
    .line 246
    invoke-direct {v7, p0, v8}, Lcom/p1/mobile/putong/remote_config/b$a;-><init>(Landroid/content/Context;I)V

    .line 247
    .line 248
    .line 249
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 250
    .line 251
    .line 252
    move-result-object v8

    .line 253
    invoke-virtual {v7, v8}, Landroid/widget/ArrayAdapter;->addAll(Ljava/util/Collection;)V

    .line 254
    .line 255
    .line 256
    new-instance v8, Lcom/p1/mobile/putong/remote_config/b$b;

    .line 257
    .line 258
    invoke-direct {v8, v7, v2, v4, v0}, Lcom/p1/mobile/putong/remote_config/b$b;-><init>(Landroid/widget/ArrayAdapter;Ljava/util/Map;Landroid/widget/TextView;Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 262
    .line 263
    .line 264
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 265
    .line 266
    const/4 v2, -0x1

    .line 267
    const/4 v8, -0x2

    .line 268
    invoke-direct {v0, v2, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v1, v6, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 272
    .line 273
    .line 274
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 275
    .line 276
    invoke-direct {v0, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1, v4, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 280
    .line 281
    .line 282
    new-instance v0, Lv/VList;

    .line 283
    .line 284
    invoke-direct {v0, p0}, Lv/VList;-><init>(Landroid/content/Context;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {v0, v7}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 288
    .line 289
    .line 290
    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    .line 291
    .line 292
    const/high16 v6, 0x3f800000    # 1.0f

    .line 293
    .line 294
    invoke-direct {v4, v2, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {v1, v0, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 298
    .line 299
    .line 300
    new-instance v0, Lcom/p1/mobile/android/app/Dialog$e;

    .line 301
    .line 302
    invoke-direct {v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;-><init>(Landroid/content/Context;)V

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0, v1, v5}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    const/16 v2, 0x10

    .line 318
    .line 319
    invoke-virtual {v0, v2}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 323
    .line 324
    .line 325
    invoke-virtual {v1, v3}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 326
    .line 327
    .line 328
    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 329
    .line 330
    .line 331
    return-void
.end method
