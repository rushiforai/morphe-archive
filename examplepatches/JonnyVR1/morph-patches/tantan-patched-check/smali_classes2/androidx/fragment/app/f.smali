.class public Landroidx/fragment/app/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/LayoutInflater$Factory2;


# instance fields
.field public final a:Landroidx/fragment/app/FragmentManager;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentManager;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 7
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-class v0, Landroidx/fragment/app/FragmentContainerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance p1, Landroidx/fragment/app/FragmentContainerView;

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 16
    .line 17
    invoke-direct {p1, p3, p4, p0}, Landroidx/fragment/app/FragmentContainerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroidx/fragment/app/FragmentManager;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    const-string v0, "fragment"

    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    const/4 v0, 0x0

    .line 28
    if-nez p2, :cond_1

    .line 29
    .line 30
    return-object v0

    .line 31
    :cond_1
    const-string p2, "class"

    .line 32
    .line 33
    invoke-interface {p4, v0, p2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    sget-object v1, Ll/cic0;->a:[I

    .line 38
    .line 39
    invoke-virtual {p3, p4, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    sget p2, Ll/cic0;->b:I

    .line 46
    .line 47
    invoke-virtual {v1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    :cond_2
    sget v2, Ll/cic0;->c:I

    .line 52
    .line 53
    const/4 v3, -0x1

    .line 54
    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    sget v4, Ll/cic0;->d:I

    .line 59
    .line 60
    invoke-virtual {v1, v4}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 65
    .line 66
    .line 67
    if-eqz p2, :cond_11

    .line 68
    .line 69
    invoke-virtual {p3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-static {v1, p2}, Landroidx/fragment/app/e;->isFragmentClass(Ljava/lang/ClassLoader;Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_3

    .line 78
    .line 79
    goto/16 :goto_5

    .line 80
    .line 81
    :cond_3
    if-eqz p1, :cond_4

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_0

    .line 88
    :cond_4
    const/4 v1, 0x0

    .line 89
    :goto_0
    if-ne v1, v3, :cond_6

    .line 90
    .line 91
    if-ne v2, v3, :cond_6

    .line 92
    .line 93
    if-eqz v4, :cond_5

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 97
    .line 98
    invoke-interface {p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance p3, Ljava/lang/StringBuilder;

    .line 103
    .line 104
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string p1, ": Must specify unique android:id, android:tag, or have a parent with an id for "

    .line 111
    .line 112
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    throw p0

    .line 126
    :cond_6
    :goto_1
    if-eq v2, v3, :cond_7

    .line 127
    .line 128
    iget-object v5, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 129
    .line 130
    invoke-virtual {v5, v2}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    goto :goto_2

    .line 135
    :cond_7
    move-object v5, v0

    .line 136
    :goto_2
    if-nez v5, :cond_8

    .line 137
    .line 138
    if-eqz v4, :cond_8

    .line 139
    .line 140
    iget-object v5, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 141
    .line 142
    invoke-virtual {v5, v4}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    :cond_8
    if-nez v5, :cond_9

    .line 147
    .line 148
    if-eq v1, v3, :cond_9

    .line 149
    .line 150
    iget-object v3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 151
    .line 152
    invoke-virtual {v3, v1}, Landroidx/fragment/app/FragmentManager;->h0(I)Landroidx/fragment/app/Fragment;

    .line 153
    .line 154
    .line 155
    move-result-object v5

    .line 156
    :cond_9
    const/4 v3, 0x2

    .line 157
    const/4 v6, 0x1

    .line 158
    if-nez v5, :cond_b

    .line 159
    .line 160
    iget-object v5, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 161
    .line 162
    invoke-virtual {v5}, Landroidx/fragment/app/FragmentManager;->r0()Landroidx/fragment/app/e;

    .line 163
    .line 164
    .line 165
    move-result-object v5

    .line 166
    invoke-virtual {p3}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 167
    .line 168
    .line 169
    move-result-object p3

    .line 170
    invoke-virtual {v5, p3, p2}, Landroidx/fragment/app/e;->instantiate(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 171
    .line 172
    .line 173
    move-result-object v5

    .line 174
    iput-boolean v6, v5, Landroidx/fragment/app/Fragment;->mFromLayout:Z

    .line 175
    .line 176
    if-eqz v2, :cond_a

    .line 177
    .line 178
    move p3, v2

    .line 179
    goto :goto_3

    .line 180
    :cond_a
    move p3, v1

    .line 181
    :goto_3
    iput p3, v5, Landroidx/fragment/app/Fragment;->mFragmentId:I

    .line 182
    .line 183
    iput v1, v5, Landroidx/fragment/app/Fragment;->mContainerId:I

    .line 184
    .line 185
    iput-object v4, v5, Landroidx/fragment/app/Fragment;->mTag:Ljava/lang/String;

    .line 186
    .line 187
    iput-boolean v6, v5, Landroidx/fragment/app/Fragment;->mInLayout:Z

    .line 188
    .line 189
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 190
    .line 191
    iput-object p3, v5, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 192
    .line 193
    invoke-virtual {p3}, Landroidx/fragment/app/FragmentManager;->u0()Ll/q5j;

    .line 194
    .line 195
    .line 196
    move-result-object p3

    .line 197
    iput-object p3, v5, Landroidx/fragment/app/Fragment;->mHost:Ll/q5j;

    .line 198
    .line 199
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 200
    .line 201
    invoke-virtual {p3}, Landroidx/fragment/app/FragmentManager;->u0()Ll/q5j;

    .line 202
    .line 203
    .line 204
    move-result-object p3

    .line 205
    invoke-virtual {p3}, Ll/q5j;->f()Landroid/content/Context;

    .line 206
    .line 207
    .line 208
    move-result-object p3

    .line 209
    iget-object v1, v5, Landroidx/fragment/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    .line 210
    .line 211
    invoke-virtual {v5, p3, p4, v1}, Landroidx/fragment/app/Fragment;->onInflate(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/os/Bundle;)V

    .line 212
    .line 213
    .line 214
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 215
    .line 216
    invoke-virtual {p3, v5}, Landroidx/fragment/app/FragmentManager;->g(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/h;

    .line 217
    .line 218
    .line 219
    move-result-object p3

    .line 220
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 221
    .line 222
    .line 223
    move-result p4

    .line 224
    if-eqz p4, :cond_c

    .line 225
    .line 226
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    goto :goto_4

    .line 233
    :cond_b
    iget-boolean p3, v5, Landroidx/fragment/app/Fragment;->mInLayout:Z

    .line 234
    .line 235
    if-nez p3, :cond_10

    .line 236
    .line 237
    iput-boolean v6, v5, Landroidx/fragment/app/Fragment;->mInLayout:Z

    .line 238
    .line 239
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 240
    .line 241
    iput-object p3, v5, Landroidx/fragment/app/Fragment;->mFragmentManager:Landroidx/fragment/app/FragmentManager;

    .line 242
    .line 243
    invoke-virtual {p3}, Landroidx/fragment/app/FragmentManager;->u0()Ll/q5j;

    .line 244
    .line 245
    .line 246
    move-result-object p3

    .line 247
    iput-object p3, v5, Landroidx/fragment/app/Fragment;->mHost:Ll/q5j;

    .line 248
    .line 249
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 250
    .line 251
    invoke-virtual {p3}, Landroidx/fragment/app/FragmentManager;->u0()Ll/q5j;

    .line 252
    .line 253
    .line 254
    move-result-object p3

    .line 255
    invoke-virtual {p3}, Ll/q5j;->f()Landroid/content/Context;

    .line 256
    .line 257
    .line 258
    move-result-object p3

    .line 259
    iget-object v1, v5, Landroidx/fragment/app/Fragment;->mSavedFragmentState:Landroid/os/Bundle;

    .line 260
    .line 261
    invoke-virtual {v5, p3, p4, v1}, Landroidx/fragment/app/Fragment;->onInflate(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/os/Bundle;)V

    .line 262
    .line 263
    .line 264
    iget-object p3, p0, Landroidx/fragment/app/f;->a:Landroidx/fragment/app/FragmentManager;

    .line 265
    .line 266
    invoke-virtual {p3, v5}, Landroidx/fragment/app/FragmentManager;->v(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/h;

    .line 267
    .line 268
    .line 269
    move-result-object p3

    .line 270
    invoke-static {v3}, Landroidx/fragment/app/FragmentManager;->G0(I)Z

    .line 271
    .line 272
    .line 273
    move-result p4

    .line 274
    if-eqz p4, :cond_c

    .line 275
    .line 276
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    :cond_c
    :goto_4
    check-cast p1, Landroid/view/ViewGroup;

    .line 283
    .line 284
    iput-object p1, v5, Landroidx/fragment/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    .line 285
    .line 286
    invoke-virtual {p3}, Landroidx/fragment/app/h;->m()V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p3}, Landroidx/fragment/app/h;->j()V

    .line 290
    .line 291
    .line 292
    iget-object p1, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 293
    .line 294
    if-eqz p1, :cond_f

    .line 295
    .line 296
    if-eqz v2, :cond_d

    .line 297
    .line 298
    invoke-virtual {p1, v2}, Landroid/view/View;->setId(I)V

    .line 299
    .line 300
    .line 301
    :cond_d
    iget-object p1, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 302
    .line 303
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    if-nez p1, :cond_e

    .line 308
    .line 309
    iget-object p1, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 310
    .line 311
    invoke-virtual {p1, v4}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 312
    .line 313
    .line 314
    :cond_e
    iget-object p1, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 315
    .line 316
    new-instance p2, Landroidx/fragment/app/f$a;

    .line 317
    .line 318
    invoke-direct {p2, p0, p3}, Landroidx/fragment/app/f$a;-><init>(Landroidx/fragment/app/f;Landroidx/fragment/app/h;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {p1, p2}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 322
    .line 323
    .line 324
    iget-object p0, v5, Landroidx/fragment/app/Fragment;->mView:Landroid/view/View;

    .line 325
    .line 326
    return-object p0

    .line 327
    :cond_f
    const-string p0, "Fragment "

    .line 328
    .line 329
    const-string p1, " did not create a view."

    .line 330
    .line 331
    invoke-static {p0, p2, p1}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 332
    .line 333
    .line 334
    return-object v0

    .line 335
    :cond_10
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 336
    .line 337
    invoke-interface {p4}, Landroid/util/AttributeSet;->getPositionDescription()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p3

    .line 345
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p4

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    const-string p1, ": Duplicate id 0x"

    .line 358
    .line 359
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    const-string p1, ", tag "

    .line 366
    .line 367
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    const-string p1, ", or parent id 0x"

    .line 374
    .line 375
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    const-string p1, " with another fragment for "

    .line 382
    .line 383
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    .line 388
    .line 389
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    throw p0

    .line 397
    :cond_11
    :goto_5
    return-object v0
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    .line 398
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/fragment/app/f;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
