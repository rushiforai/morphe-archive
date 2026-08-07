.class Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->p1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 1
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->c2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->d2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->e2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v2, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 56
    .line 57
    invoke-static {v2}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->g2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    iget-object v3, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 74
    .line 75
    invoke-static {v3}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->h2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v3

    .line 87
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    iget-object v4, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 92
    .line 93
    invoke-static {v4}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->i2(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 110
    .line 111
    invoke-static {v5}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->S1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/Button;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const/4 v6, 0x0

    .line 116
    invoke-virtual {v5, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 117
    .line 118
    .line 119
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v5}, Ll/afm;->t()Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    const-string v7, "OCR_ID_BACK"

    .line 128
    .line 129
    if-eqz v5, :cond_2

    .line 130
    .line 131
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-virtual {v5, v7}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 136
    .line 137
    .line 138
    move-result v5

    .line 139
    if-eqz v5, :cond_2

    .line 140
    .line 141
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 142
    .line 143
    invoke-static {v5}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->Z1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Z

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    if-nez v5, :cond_2

    .line 148
    .line 149
    iget-object v5, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 150
    .line 151
    invoke-static {v5}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->T1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    iget-object v8, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 160
    .line 161
    invoke-static {v8}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 162
    .line 163
    .line 164
    move-result-object v8

    .line 165
    invoke-virtual {v8}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 166
    .line 167
    .line 168
    move-result-object v8

    .line 169
    const/4 v9, 0x1

    .line 170
    if-eqz v5, :cond_1

    .line 171
    .line 172
    if-eqz v8, :cond_1

    .line 173
    .line 174
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 175
    .line 176
    .line 177
    move-result v10

    .line 178
    if-nez v10, :cond_1

    .line 179
    .line 180
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result v10

    .line 184
    if-eqz v10, :cond_0

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_0
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v8

    .line 195
    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v8

    .line 199
    invoke-static {v8}, Ll/n8c;->j(Ljava/lang/String;)Ljava/util/Calendar;

    .line 200
    .line 201
    .line 202
    move-result-object v8

    .line 203
    invoke-virtual {v5}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    invoke-static {v5}, Ll/n8c;->j(Ljava/lang/String;)Ljava/util/Calendar;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    invoke-static {v8, v5}, Ll/n8c;->h(Ljava/util/Calendar;Ljava/util/Calendar;)Z

    .line 212
    .line 213
    .line 214
    move-result v5

    .line 215
    if-nez v5, :cond_2

    .line 216
    .line 217
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 218
    .line 219
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->S1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/Button;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    invoke-virtual {p1, v9}, Landroid/view/View;->setEnabled(Z)V

    .line 224
    .line 225
    .line 226
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 227
    .line 228
    sget p1, Lcom/idv/identity/base/R$string;->Y:I

    .line 229
    .line 230
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    invoke-static {p0, p1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 239
    .line 240
    .line 241
    return-void

    .line 242
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 243
    .line 244
    invoke-static {p1}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->S1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/Button;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-virtual {p1, v9}, Landroid/view/View;->setEnabled(Z)V

    .line 249
    .line 250
    .line 251
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 252
    .line 253
    sget p1, Lcom/idv/identity/base/R$string;->t0:I

    .line 254
    .line 255
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    invoke-static {p0, p1, v6}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    .line 268
    .line 269
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 270
    .line 271
    .line 272
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 273
    .line 274
    .line 275
    move-result-object v6

    .line 276
    invoke-virtual {v6}, Ll/afm;->t()Ljava/util/List;

    .line 277
    .line 278
    .line 279
    move-result-object v6

    .line 280
    if-eqz v6, :cond_6

    .line 281
    .line 282
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    invoke-virtual {v6, v7}, Ll/afm;->d(Ljava/lang/String;)Z

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    if-eqz v6, :cond_6

    .line 291
    .line 292
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 293
    .line 294
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->V1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 295
    .line 296
    .line 297
    move-result-object v6

    .line 298
    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    if-eqz v6, :cond_3

    .line 303
    .line 304
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 305
    .line 306
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->V1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/EditText;

    .line 307
    .line 308
    .line 309
    move-result-object v6

    .line 310
    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 311
    .line 312
    .line 313
    move-result-object v6

    .line 314
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v6

    .line 318
    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    const-string v7, "originOfIssue"

    .line 323
    .line 324
    invoke-interface {v5, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    :cond_3
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 328
    .line 329
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 330
    .line 331
    .line 332
    move-result-object v6

    .line 333
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 334
    .line 335
    .line 336
    move-result-object v6

    .line 337
    const-string v7, ""

    .line 338
    .line 339
    const-string v8, "-"

    .line 340
    .line 341
    if-eqz v6, :cond_4

    .line 342
    .line 343
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 344
    .line 345
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 346
    .line 347
    .line 348
    move-result-object v6

    .line 349
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 350
    .line 351
    .line 352
    move-result-object v6

    .line 353
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 354
    .line 355
    .line 356
    move-result v6

    .line 357
    if-nez v6, :cond_4

    .line 358
    .line 359
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 360
    .line 361
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->U1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 362
    .line 363
    .line 364
    move-result-object v9

    .line 365
    invoke-virtual {v6, v9}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->q2(Landroid/widget/TextView;)Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v6

    .line 369
    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 370
    .line 371
    .line 372
    move-result-object v6

    .line 373
    const-string v9, "issueDate"

    .line 374
    .line 375
    invoke-interface {v5, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 376
    .line 377
    .line 378
    :cond_4
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 379
    .line 380
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->Z1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Z

    .line 381
    .line 382
    .line 383
    move-result v6

    .line 384
    const-string v9, "expiryDate"

    .line 385
    .line 386
    if-eqz v6, :cond_5

    .line 387
    .line 388
    const-string v6, "\u957f\u671f"

    .line 389
    .line 390
    invoke-interface {v5, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    goto :goto_1

    .line 394
    :cond_5
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 395
    .line 396
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->T1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 397
    .line 398
    .line 399
    move-result-object v6

    .line 400
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 401
    .line 402
    .line 403
    move-result-object v6

    .line 404
    if-eqz v6, :cond_6

    .line 405
    .line 406
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 407
    .line 408
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->T1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 413
    .line 414
    .line 415
    move-result-object v6

    .line 416
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 417
    .line 418
    .line 419
    move-result v6

    .line 420
    if-nez v6, :cond_6

    .line 421
    .line 422
    iget-object v6, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 423
    .line 424
    invoke-static {v6}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->T1(Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;)Landroid/widget/TextView;

    .line 425
    .line 426
    .line 427
    move-result-object v10

    .line 428
    invoke-virtual {v6, v10}, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;->q2(Landroid/widget/TextView;)Ljava/lang/String;

    .line 429
    .line 430
    .line 431
    move-result-object v6

    .line 432
    invoke-virtual {v6, v8, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v6

    .line 436
    invoke-interface {v5, v9, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    :cond_6
    :goto_1
    const-string v6, "name"

    .line 440
    .line 441
    invoke-interface {v5, v6, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 442
    .line 443
    .line 444
    const-string p1, "sex"

    .line 445
    .line 446
    invoke-interface {v5, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    const-string p1, "ethnicity"

    .line 450
    .line 451
    invoke-interface {v5, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    const-string p1, "birthDate"

    .line 455
    .line 456
    invoke-interface {v5, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    const-string p1, "idNumber"

    .line 460
    .line 461
    invoke-interface {v5, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    const-string p1, "address"

    .line 465
    .line 466
    invoke-interface {v5, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 467
    .line 468
    .line 469
    new-instance p1, Ljava/lang/StringBuilder;

    .line 470
    .line 471
    const-string v0, "params:----"

    .line 472
    .line 473
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 474
    .line 475
    .line 476
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 477
    .line 478
    .line 479
    move-result-object v0

    .line 480
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    const-string v0, "MainlandIDCard"

    .line 488
    .line 489
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 490
    .line 491
    .line 492
    iget-object p0, p0, Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity$g;->a:Lcom/idv/identity/ocr/ui/MainlandIDCardResultActivity;

    .line 493
    .line 494
    invoke-virtual {p0, v5}, Lcom/idv/identity/ocr/ui/BaseIDCardResultActivity;->r1(Ljava/util/Map;)V

    .line 495
    .line 496
    .line 497
    return-void
.end method
