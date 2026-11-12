.class public final synthetic Lha1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V
    .registers 6

    .line 16
    iput-byte p5, p0, Lha1;->a:B

    iput-object p1, p0, Lha1;->c:Ljava/lang/Object;

    iput-object p2, p0, Lha1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lha1;->e:Ljava/lang/Object;

    iput-boolean p4, p0, Lha1;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ZLjava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lha1;->a:B

    iput-object p1, p0, Lha1;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lha1;->b:Z

    iput-object p3, p0, Lha1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lha1;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;)V
    .registers 6

    const/4 v0, 0x4

    iput-byte v0, p0, Lha1;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lha1;->b:Z

    iput-object p2, p0, Lha1;->c:Ljava/lang/Object;

    iput-object p3, p0, Lha1;->d:Ljava/lang/Object;

    iput-object p4, p0, Lha1;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    iget-byte v1, v0, Lha1;->a:B

    const/4 v2, 0x3

    const/4 v3, 0x0

    const/4 v4, 0x4

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x2

    iget-boolean v8, v0, Lha1;->b:Z

    iget-object v9, v0, Lha1;->e:Ljava/lang/Object;

    iget-object v10, v0, Lha1;->d:Ljava/lang/Object;

    iget-object v11, v0, Lha1;->c:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_24e

    move-object v14, v11

    check-cast v14, Lkotlin/jvm/functions/Function0;

    move-object v15, v10

    check-cast v15, Lkotlin/jvm/functions/Function0;

    move-object/from16 v17, v9

    check-cast v17, Lkotlin/jvm/functions/Function1;

    move-object/from16 v16, p1

    check-cast v16, Lqej;

    new-instance v12, Lpej;

    iget-boolean v13, v0, Lha1;->b:Z

    invoke-direct/range {v12 .. v17}, Lpej;-><init>(ZLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lqej;Lkotlin/jvm/functions/Function1;)V

    return-object v12

    :pswitch_2b
    move-object v0, v11

    check-cast v0, Lvqi;

    check-cast v10, Liqi;

    check-cast v9, Ls4f;

    move-object/from16 v1, p1

    check-cast v1, Ljqi;

    iget-object v2, v0, Lvqi;->c:Lpqi;

    invoke-virtual {v2, v1}, Lpqi;->b(Ljqi;)Ljqi;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, v0, Lvqi;->e:Luqi;

    iget-object v4, v4, Luqi;->a:Lb59;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v11, "cache_control"

    invoke-interface {v5, v11, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_69

    sget-object v11, Le74;->n:Ld74;

    const-string v12, "Cache-Control"

    filled-new-array {v12, v5}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v7}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    invoke-static {v5}, Lokhttp3/internal/_HeadersCommonKt;->commonHeadersOf([Ljava/lang/String;)Le9a;

    move-result-object v5

    invoke-static {v11, v5}, Lokhttp3/internal/_CacheControlCommonKt;->commonParse(Ld74;Le9a;)Le74;

    move-result-object v5

    goto :goto_6a

    :cond_69
    move-object v5, v6

    :goto_6a
    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/SharedPreferences;

    const-string v12, "etag"

    invoke-interface {v11, v12, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    move-object v12, v4

    new-instance v4, Leof;

    const/16 v13, 0xf

    invoke-direct {v4, v0, v9, v13}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v13, Lmni;

    invoke-direct {v13, v9, v7}, Lmni;-><init>(Ljava/lang/Object;B)V

    new-instance v7, Lq2g;

    const/16 v14, 0x1d

    invoke-direct {v7, v0, v9, v14}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v5, :cond_121

    invoke-virtual {v1}, Ljqi;->a()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/content/SharedPreferences;

    const-string v15, "cashed_request_hash"

    invoke-interface {v14, v15, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/SharedPreferences;

    const-string v12, "cache_control_time"

    const-wide/16 v14, 0x0

    invoke-interface {v9, v12, v14, v15}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    sget-object v9, Lpn7;->b:Lon7;

    iget v9, v5, Le74;->c:I

    sget-object v12, Lun7;->e:Lun7;

    move-object/from16 p0, v0

    move-object/from16 p1, v1

    invoke-static {v9, v12}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    new-instance v9, Lpn7;

    invoke-direct {v9, v0, v1}, Lpn7;-><init>(J)V

    sget-wide v0, Lvqi;->g:J

    new-instance v12, Lpn7;

    invoke-direct {v12, v0, v1}, Lpn7;-><init>(J)V

    invoke-virtual {v9, v12}, Lpn7;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-lez v0, :cond_cf

    move-object v9, v12

    :cond_cf
    iget-wide v0, v9, Lpn7;->a:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    add-long/2addr v0, v14

    if-eqz v8, :cond_e8

    if-nez v10, :cond_dc

    sget-object v10, Liqi;->d:Liqi;

    :cond_dc
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object v6, v7

    move-object v2, v10

    move-object v3, v11

    move-object v5, v13

    invoke-virtual/range {v0 .. v6}, Lvqi;->a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V

    goto :goto_12c

    :cond_e8
    move-wide/from16 v18, v2

    move v2, v6

    move-object v6, v7

    move-wide/from16 v7, v18

    move-wide/from16 v18, v0

    move-object v0, v5

    move-object v5, v13

    move-wide/from16 v12, v18

    move-object/from16 v1, p1

    move-object v3, v11

    move-object/from16 v11, p0

    if-nez v2, :cond_105

    if-nez v10, :cond_ff

    sget-object v10, Liqi;->c:Liqi;

    :cond_ff
    move-object v2, v10

    move-object v0, v11

    invoke-virtual/range {v0 .. v6}, Lvqi;->a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V

    goto :goto_12c

    :cond_105
    cmp-long v2, v7, v12

    if-lez v2, :cond_113

    if-nez v10, :cond_10d

    sget-object v10, Liqi;->c:Liqi;

    :cond_10d
    move-object v2, v10

    move-object v0, v11

    invoke-virtual/range {v0 .. v6}, Lvqi;->a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V

    goto :goto_12c

    :cond_113
    iget-boolean v0, v0, Le74;->a:Z

    if-eqz v0, :cond_12c

    if-nez v10, :cond_11b

    sget-object v10, Liqi;->c:Liqi;

    :cond_11b
    move-object v2, v10

    move-object v0, v11

    invoke-virtual/range {v0 .. v6}, Lvqi;->a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V

    goto :goto_12c

    :cond_121
    move-object v6, v7

    move-object v3, v11

    move-object v5, v13

    if-nez v10, :cond_128

    sget-object v10, Liqi;->b:Liqi;

    :cond_128
    move-object v2, v10

    invoke-virtual/range {v0 .. v6}, Lvqi;->a(Ljqi;Liqi;Ljava/lang/String;Leof;Lmni;Lq2g;)V

    :cond_12c
    :goto_12c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12f
    check-cast v11, Lqk0;

    check-cast v10, Ltk0;

    check-cast v9, Lsk0;

    move-object/from16 v0, p1

    check-cast v0, Ltd0;

    iget-object v1, v0, Ltd0;->a:Lzpa;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lrk0;

    const/16 v6, 0x98b

    const/4 v12, -0x1

    invoke-direct {v1, v6, v12, v4}, Ljf0;-><init>(III)V

    iget-object v0, v0, Ltd0;->b:Lqd0;

    const/16 v4, 0x1b

    invoke-virtual {v0, v4}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    if-eqz v6, :cond_15e

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_15e

    new-instance v12, Lhf0;

    invoke-direct {v12, v0, v4, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_167

    :cond_15e
    invoke-static {v0, v4, v5}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v6

    new-instance v12, Lhf0;

    invoke-direct {v12, v0, v4, v6}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_167
    invoke-virtual {v12, v1}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    if-nez v11, :cond_16e

    move v0, v3

    goto :goto_16f

    :cond_16e
    move v0, v5

    :goto_16f
    invoke-virtual {v1, v3, v0, v11}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v10, :cond_175

    move v3, v5

    :cond_175
    invoke-virtual {v1, v7, v3, v10}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v9, :cond_17d

    invoke-virtual {v1, v5, v5, v9}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_17d
    invoke-virtual {v1, v2, v5, v8}, Ljf0;->r(IIZ)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_183
    check-cast v11, Lcd5;

    check-cast v10, Lh07;

    check-cast v9, Ldg9;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Throwable;

    if-eqz v0, :cond_194

    invoke-virtual {v11, v0}, Lcd5;->B0(Ljava/lang/Throwable;)Z

    goto/16 :goto_1fc

    :cond_194
    invoke-interface {v10}, Lh07;->m()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr0i;

    const-string v1, "CXCP"

    invoke-static {v2, v1}, Lgyg;->G(ILjava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1a5

    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    :cond_1a5
    iget-byte v1, v0, Lr0i;->a:B

    if-ne v1, v4, :cond_1af

    const-string v0, "Camera is not active."

    invoke-static {v0, v11}, Lam2;->z(Ljava/lang/String;Lcd5;)V

    goto :goto_1fc

    :cond_1af
    if-ne v1, v7, :cond_1ba

    new-instance v0, Leg9;

    invoke-direct {v0, v3}, Leg9;-><init>(Z)V

    invoke-virtual {v11, v0}, Lxob;->j0(Ljava/lang/Object;)Z

    goto :goto_1fc

    :cond_1ba
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-byte v1, v0, Lr0i;->a:B

    iget-object v0, v0, Lr0i;->b:Lx61;

    if-nez v1, :cond_1f4

    if-eqz v0, :cond_1ce

    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    invoke-virtual {v0, v1}, Lx61;->c(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Ljava/lang/Integer;

    :cond_1ce
    if-eqz v8, :cond_1ee

    sget-object v1, Lv40;->b:Ljava/util/List;

    iget-object v1, v9, Ldg9;->m:Ljava/util/ArrayList;

    if-nez v1, :cond_1d8

    move v1, v3

    goto :goto_1e1

    :cond_1d8
    new-instance v2, Lv40;

    invoke-direct {v2, v5}, Lv40;-><init>(I)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    :goto_1e1
    if-eqz v1, :cond_1ed

    if-eqz v0, :cond_1ee

    if-eqz v6, :cond_1ed

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, v4, :cond_1ee

    :cond_1ed
    move v3, v5

    :cond_1ee
    new-instance v0, Leg9;

    invoke-direct {v0, v3}, Leg9;-><init>(Z)V

    goto :goto_1f9

    :cond_1f4
    new-instance v0, Leg9;

    invoke-direct {v0, v3}, Leg9;-><init>(Z)V

    :goto_1f9
    invoke-virtual {v11, v0}, Lxob;->j0(Ljava/lang/Object;)Z

    :goto_1fc
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ff
    check-cast v11, Lkotlin/jvm/functions/Function0;

    check-cast v10, Lj71;

    check-cast v9, Lkh3;

    move-object/from16 v0, p1

    check-cast v0, Lo3c;

    invoke-virtual {v0}, Lo3c;->a()V

    iget-object v1, v0, Lo3c;->a:Luh4;

    invoke-interface {v11}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_21d

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_24c

    :cond_21d
    if-eqz v8, :cond_247

    invoke-interface {v1}, Lmk7;->w0()J

    move-result-wide v2

    iget-object v1, v1, Luh4;->b:Ld5o;

    invoke-virtual {v1}, Ld5o;->D()J

    move-result-wide v4

    invoke-virtual {v1}, Ld5o;->A()Lsh4;

    move-result-object v6

    invoke-interface {v6}, Lsh4;->j()V

    :try_start_230
    iget-object v6, v1, Ld5o;->a:Ljava/lang/Object;

    check-cast v6, Lwth;

    const/high16 v7, -0x40800000    # -1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual {v6, v7, v8, v2, v3}, Lwth;->N(FFJ)V

    invoke-static {v0, v10, v9}, Lmk7;->u0(Lo3c;Lj71;Lkh3;)V
    :try_end_23e
    .catchall {:try_start_230 .. :try_end_23e} :catchall_242

    invoke-static {v1, v4, v5}, Lam2;->w(Ld5o;J)V

    goto :goto_24a

    :catchall_242
    move-exception v0

    invoke-static {v1, v4, v5}, Lam2;->w(Ld5o;J)V

    throw v0

    :cond_247
    invoke-static {v0, v10, v9}, Lmk7;->u0(Lo3c;Lj71;Lkh3;)V

    :goto_24a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_24c
    return-object v0

    nop

    :pswitch_data_24e
    .packed-switch 0x0
        :pswitch_1ff
        :pswitch_183
        :pswitch_12f
        :pswitch_2b
    .end packed-switch
.end method
