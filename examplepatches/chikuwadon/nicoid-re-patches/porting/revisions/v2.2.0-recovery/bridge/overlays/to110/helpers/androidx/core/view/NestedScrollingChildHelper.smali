.class public Landroidx/core/view/NestedScrollingChildHelper;
.super Ljava/lang/Object;
.source "NestedScrollingChildHelper.java"


# static fields
.field private static final TYPE_NON_TOUCH:I = 0x1

.field private static final TYPE_TOUCH:I


# instance fields
.field private final mLegacy:Ld/h/l/g;

.field private final mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 58
    new-instance v0, Ld/h/l/g;

    invoke-direct {v0, p1}, Ld/h/l/g;-><init>(Landroid/view/View;)V

    invoke-direct {p0, v0}, Landroidx/core/view/NestedScrollingChildHelper;-><init>(Ld/h/l/g;)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ld/h/l/g;)V
    .registers 2

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    .line 64
    iget-object p1, p1, Ld/h/l/g;->c:Landroid/view/View;

    iput-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    .line 65
    return-void
.end method

.method private getNestedScrollingParentForType(I)Landroid/view/ViewParent;
    .registers 2

    .line 412
    packed-switch p1, :pswitch_data_0

    .line 418
    const/4 p1, 0x0

    return-object p1

    .line 416
    :pswitch_0
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-object p1, p1, Ld/h/l/g;->b:Landroid/view/ViewParent;

    return-object p1

    .line 414
    :pswitch_1
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-object p1, p1, Ld/h/l/g;->a:Landroid/view/ViewParent;

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getTempNestedScrollConsumed()[I
    .registers 3

    .line 433
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-object v0, v0, Ld/h/l/g;->e:[I

    if-nez v0, :cond_0

    .line 434
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    const/4 v1, 0x2

    new-array v1, v1, [I

    iput-object v1, v0, Ld/h/l/g;->e:[I

    .line 436
    :cond_0
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-object v0, v0, Ld/h/l/g;->e:[I

    return-object v0
.end method

.method private setNestedScrollingParentForType(ILandroid/view/ViewParent;)V
    .registers 3

    .line 422
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 427
    :pswitch_0
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iput-object p2, p1, Ld/h/l/g;->b:Landroid/view/ViewParent;

    goto :goto_0

    .line 424
    :pswitch_1
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iput-object p2, p1, Ld/h/l/g;->a:Landroid/view/ViewParent;

    .line 425
    nop

    .line 430
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .registers 6

    .line 356
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 357
    invoke-direct {p0, v1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 358
    if-eqz v0, :cond_0

    .line 359
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2, p3}, Landroidx/core/view/ViewParentCompat;->onNestedFling(Landroid/view/ViewParent;Landroid/view/View;FFZ)Z

    move-result p1

    return p1

    .line 363
    :cond_0
    return v1
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 5

    .line 376
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 377
    invoke-direct {p0, v1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 378
    if-eqz v0, :cond_0

    .line 379
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1, p2}, Landroidx/core/view/ViewParentCompat;->onNestedPreFling(Landroid/view/ViewParent;Landroid/view/View;FF)Z

    move-result p1

    return p1

    .line 383
    :cond_0
    return v1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 11

    .line 296
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedPreScroll(II[I[II)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[II)Z
    .registers 16

    .line 310
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    .line 311
    invoke-direct {p0, p5}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v2

    .line 312
    if-nez v2, :cond_0

    .line 313
    return v1

    .line 316
    :cond_0
    const/4 v0, 0x1

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    .line 338
    if-eqz p4, :cond_6

    .line 339
    aput v1, p4, v1

    .line 340
    aput v1, p4, v0

    goto :goto_3

    .line 317
    :cond_1
    nop

    .line 318
    nop

    .line 319
    if-eqz p4, :cond_2

    .line 320
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v3, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 321
    aget v3, p4, v1

    .line 322
    aget v4, p4, v0

    move v8, v3

    move v9, v4

    goto :goto_0

    .line 319
    :cond_2
    move v8, v1

    move v9, v8

    .line 325
    :goto_0
    if-nez p3, :cond_3

    .line 326
    invoke-direct {p0}, Landroidx/core/view/NestedScrollingChildHelper;->getTempNestedScrollConsumed()[I

    move-result-object p3

    move-object v6, p3

    goto :goto_1

    .line 325
    :cond_3
    move-object v6, p3

    .line 328
    :goto_1
    aput v1, v6, v1

    .line 329
    aput v1, v6, v0

    .line 330
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v4, p1

    move v5, p2

    move v7, p5

    invoke-static/range {v2 .. v7}, Landroidx/core/view/ViewParentCompat;->onNestedPreScroll(Landroid/view/ViewParent;Landroid/view/View;II[II)V

    .line 332
    if-eqz p4, :cond_4

    .line 333
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->getLocationInWindow([I)V

    .line 334
    aget p1, p4, v1

    sub-int/2addr p1, v8

    aput p1, p4, v1

    .line 335
    aget p1, p4, v0

    sub-int/2addr p1, v9

    aput p1, p4, v0

    .line 337
    :cond_4
    aget p1, v6, v1

    if-nez p1, :cond_5

    aget p1, v6, v0

    if-nez p1, :cond_5

    goto :goto_2

    :cond_5
    move v1, v0

    :goto_2
    return v1

    .line 343
    :cond_6
    :goto_3
    return v1
.end method

.method public dispatchNestedScroll(IIII[II[I)V
    .registers 8

    .line 239
    invoke-virtual/range {p0 .. p7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    .line 241
    return-void
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 14

    .line 212
    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[II)Z
    .registers 15

    .line 226
    const/4 v7, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Landroidx/core/view/NestedScrollingChildHelper;->dispatchNestedScrollInternal(IIII[II[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScrollInternal(IIII[II[I)Z
    .registers 21

    .line 246
    move-object/from16 v0, p5

    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_5

    .line 247
    move/from16 v9, p6

    invoke-direct {p0, v9}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v3

    .line 248
    if-nez v3, :cond_0

    .line 249
    return v2

    .line 252
    :cond_0
    const/4 v1, 0x1

    if-nez p1, :cond_1

    if-nez p2, :cond_1

    if-nez p3, :cond_1

    if-nez p4, :cond_1

    .line 276
    if-eqz v0, :cond_5

    .line 278
    aput v2, v0, v2

    .line 279
    aput v2, v0, v1

    goto :goto_2

    .line 253
    :cond_1
    nop

    .line 254
    nop

    .line 255
    if-eqz v0, :cond_2

    .line 256
    iget-object v4, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v4, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 257
    aget v4, v0, v2

    .line 258
    aget v5, v0, v1

    move v11, v4

    move v12, v5

    goto :goto_0

    .line 255
    :cond_2
    move v11, v2

    move v12, v11

    .line 261
    :goto_0
    if-nez p7, :cond_3

    .line 262
    invoke-direct {p0}, Landroidx/core/view/NestedScrollingChildHelper;->getTempNestedScrollConsumed()[I

    move-result-object v4

    .line 263
    aput v2, v4, v2

    .line 264
    aput v2, v4, v1

    move-object v10, v4

    goto :goto_1

    .line 261
    :cond_3
    move-object/from16 v10, p7

    .line 267
    :goto_1
    iget-object v4, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    move v5, p1

    move v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    invoke-static/range {v3 .. v10}, Landroidx/core/view/ViewParentCompat;->onNestedScroll(Landroid/view/ViewParent;Landroid/view/View;IIIII[I)V

    .line 270
    if-eqz v0, :cond_4

    .line 271
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 272
    aget p1, v0, v2

    sub-int/2addr p1, v11

    aput p1, v0, v2

    .line 273
    aget p1, v0, v1

    sub-int/2addr p1, v12

    aput p1, v0, v1

    .line 275
    :cond_4
    return v1

    .line 282
    :cond_5
    :goto_2
    return v2
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    .line 107
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/core/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent(I)Z
    .registers 2

    .line 121
    invoke-direct {p0, p1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    .line 93
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-boolean v0, v0, Ld/h/l/g;->d:Z

    return v0
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 395
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->stopNestedScroll()V

    .line 396
    return-void
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 2

    .line 408
    iget-object p1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->stopNestedScroll()V

    .line 409
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    .line 77
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iget-boolean v0, v0, Ld/h/l/g;->d:Z

    if-eqz v0, :cond_0

    .line 78
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->stopNestedScroll()V

    .line 80
    :cond_0
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mLegacy:Ld/h/l/g;

    iput-boolean p1, v0, Ld/h/l/g;->d:Z

    .line 81
    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 3

    .line 136
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroidx/core/view/NestedScrollingChildHelper;->startNestedScroll(II)Z

    move-result p1

    return p1
.end method

.method public startNestedScroll(II)Z
    .registers 7

    .line 153
    invoke-virtual {p0, p2}, Landroidx/core/view/NestedScrollingChildHelper;->hasNestedScrollingParent(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 155
    return v1

    .line 157
    :cond_0
    invoke-virtual {p0}, Landroidx/core/view/NestedScrollingChildHelper;->isNestedScrollingEnabled()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 158
    iget-object v0, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 159
    iget-object v2, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    .line 160
    :goto_0
    if-eqz v0, :cond_3

    .line 161
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroidx/core/view/ViewParentCompat;->onStartNestedScroll(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 162
    invoke-direct {p0, p2, v0}, Landroidx/core/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    .line 163
    iget-object v3, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v2, v3, p1, p2}, Landroidx/core/view/ViewParentCompat;->onNestedScrollAccepted(Landroid/view/ViewParent;Landroid/view/View;Landroid/view/View;II)V

    .line 164
    return v1

    .line 166
    :cond_1
    instance-of v3, v0, Landroid/view/View;

    if-eqz v3, :cond_2

    .line 167
    move-object v2, v0

    check-cast v2, Landroid/view/View;

    .line 169
    :cond_2
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    goto :goto_0

    .line 172
    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public stopNestedScroll()V
    .registers 2

    .line 183
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/core/view/NestedScrollingChildHelper;->stopNestedScroll(I)V

    .line 184
    return-void
.end method

.method public stopNestedScroll(I)V
    .registers 4

    .line 194
    invoke-direct {p0, p1}, Landroidx/core/view/NestedScrollingChildHelper;->getNestedScrollingParentForType(I)Landroid/view/ViewParent;

    move-result-object v0

    .line 195
    if-eqz v0, :cond_0

    .line 196
    iget-object v1, p0, Landroidx/core/view/NestedScrollingChildHelper;->mView:Landroid/view/View;

    invoke-static {v0, v1, p1}, Landroidx/core/view/ViewParentCompat;->onStopNestedScroll(Landroid/view/ViewParent;Landroid/view/View;I)V

    .line 197
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/core/view/NestedScrollingChildHelper;->setNestedScrollingParentForType(ILandroid/view/ViewParent;)V

    .line 199
    :cond_0
    return-void
.end method
