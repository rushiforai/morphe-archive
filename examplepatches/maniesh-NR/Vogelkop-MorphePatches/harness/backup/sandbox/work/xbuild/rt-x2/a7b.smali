.class public final synthetic La7b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, La7b;->a:B

    iput-object p1, p0, La7b;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;IB)V
    .registers 4

    .line 8
    iput-byte p3, p0, La7b;->a:B

    iput-object p1, p0, La7b;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 41

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-byte v2, v0, La7b;->a:B

    const/16 v3, 0x13

    const/4 v8, 0x7

    const/16 v9, 0x8

    const/4 v12, 0x0

    const/4 v13, 0x2

    const/4 v14, 0x0

    const/4 v15, 0x1

    packed-switch v2, :pswitch_data_a8c

    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/qr/ScanQrCodeActivity;

    move-object/from16 v2, p1

    check-cast v2, [B

    check-cast v1, Landroid/util/Size;

    sget v3, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const-string v4, "google-lens-image-data"

    invoke-virtual {v3, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    const-string v2, "google-lens-image-width"

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v4

    invoke-virtual {v3, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v2, "google-lens-image-height"

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-virtual {v3, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_44
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lwj9;

    move-object/from16 v2, p1

    check-cast v2, Landroid/view/View;

    check-cast v1, Lef;

    iget-object v0, v0, Lwj9;->e:Ljava/lang/Object;

    check-cast v0, Lzu3;

    sget v1, Lcom/opera/android/qr/ScanQrCodeActivity;->k:I

    iget-object v0, v0, Lzu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->Z0:Lhv3;

    const-string v2, "android.permission.CAMERA"

    invoke-static {v0, v2}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_7b

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-static {v2}, Lq9n;->v(Landroid/view/Window;)Z

    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/opera/android/qr/ScanQrCodeActivity;

    invoke-direct {v2, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v3, Lqj2;

    const/16 v4, 0xc

    invoke-direct {v3, v1, v4}, Lqj2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v3}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    goto :goto_85

    :cond_7b
    iget-object v3, v0, Ldx3;->j:Lqi;

    new-instance v4, Lrli;

    invoke-direct {v4, v0, v1}, Lrli;-><init>(Lcom/opera/android/BrowserActivity;Lhv3;)V

    invoke-static {v3, v2, v4}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    :goto_85
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_88
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lxgi;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    check-cast v1, Lkotlin/coroutines/CoroutineContext$Element;

    invoke-interface {v1}, Lkotlin/coroutines/CoroutineContext$Element;->getKey()Lkotlin/coroutines/g;

    move-result-object v3

    iget-object v0, v0, Lxgi;->u:Lkotlin/coroutines/CoroutineContext;

    invoke-interface {v0, v3}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/g;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v0

    sget-object v4, Lulp;->h:Lulp;

    if-eq v3, v4, :cond_a9

    if-eq v1, v0, :cond_bb

    const/high16 v2, -0x80000000

    goto :goto_bd

    :cond_a9
    move-object v3, v0

    check-cast v3, Lunb;

    check-cast v1, Lunb;

    :goto_ae
    if-eqz v1, :cond_b7

    if-eq v1, v3, :cond_b6

    instance-of v0, v1, Ljni;

    if-nez v0, :cond_e7

    :cond_b6
    move-object v12, v1

    :cond_b7
    if-ne v12, v3, :cond_c2

    if-eqz v3, :cond_bd

    :cond_bb
    add-int/lit8 v2, v2, 0x1

    :cond_bd
    :goto_bd
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_c2
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Flow invariant is violated:\n\t\tEmission from another coroutine is detected.\n\t\tChild of "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", expected child of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ".\n\t\tFlowCollector is not thread-safe and concurrent emissions are prohibited.\n\t\tTo mitigate this restriction please use \'channelFlow\' builder instead of \'flow\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e7
    check-cast v1, Ljni;

    invoke-virtual {v1}, Lxob;->b0()Lwv4;

    move-result-object v0

    if-eqz v0, :cond_f5

    invoke-interface {v0}, Lwv4;->getParent()Lunb;

    move-result-object v0

    move-object v1, v0

    goto :goto_ae

    :cond_f5
    move-object v1, v12

    goto :goto_ae

    :pswitch_f7
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lhoh;

    move-object/from16 v2, p1

    check-cast v2, Ljava/util/Set;

    check-cast v1, Lttj;

    iget-object v1, v0, Lhoh;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_104
    iget-object v3, v0, Lhoh;->u:Lnak;

    invoke-virtual {v3}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Leoh;

    const-wide/16 v16, 0x80

    sget-object v4, Leoh;->e:Leoh;

    invoke-virtual {v3, v4}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-ltz v3, :cond_19e

    iget-object v3, v0, Lhoh;->h:Ltee;

    instance-of v4, v2, Lkmi;

    if-eqz v4, :cond_179

    check-cast v2, Lkmi;

    iget-object v2, v2, Lkmi;->a:Ltee;

    iget-object v4, v2, Ltee;->b:[Ljava/lang/Object;

    iget-object v2, v2, Ltee;->a:[J

    array-length v5, v2

    sub-int/2addr v5, v13

    if-ltz v5, :cond_19a

    move v12, v14

    const-wide/16 v18, 0xff

    :goto_12b
    aget-wide v6, v2, v12

    const-wide v20, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    not-long v10, v6

    shl-long/2addr v10, v8

    and-long/2addr v10, v6

    and-long v10, v10, v20

    cmp-long v10, v10, v20

    if-eqz v10, :cond_170

    sub-int v10, v12, v5

    not-int v10, v10

    ushr-int/lit8 v10, v10, 0x1f

    rsub-int/lit8 v10, v10, 0x8

    move v11, v14

    :goto_143
    if-ge v11, v10, :cond_16b

    and-long v22, v6, v18

    cmp-long v13, v22, v16

    if-gez v13, :cond_163

    shl-int/lit8 v13, v12, 0x3

    add-int/2addr v13, v11

    aget-object v13, v4, v13

    move/from16 v22, v8

    instance-of v8, v13, Lwak;

    if-eqz v8, :cond_15f

    move-object v8, v13

    check-cast v8, Lwak;

    invoke-virtual {v8, v15}, Lwak;->f(I)Z

    move-result v8

    if-eqz v8, :cond_165

    :cond_15f
    invoke-virtual {v3, v13}, Ltee;->a(Ljava/lang/Object;)Z

    goto :goto_165

    :cond_163
    move/from16 v22, v8

    :cond_165
    :goto_165
    shr-long/2addr v6, v9

    add-int/lit8 v11, v11, 0x1

    move/from16 v8, v22

    goto :goto_143

    :cond_16b
    move/from16 v22, v8

    if-ne v10, v9, :cond_19a

    goto :goto_172

    :cond_170
    move/from16 v22, v8

    :goto_172
    if-eq v12, v5, :cond_19a

    add-int/lit8 v12, v12, 0x1

    move/from16 v8, v22

    goto :goto_12b

    :cond_179
    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_17f
    :goto_17f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_19a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lwak;

    if-eqz v5, :cond_196

    move-object v5, v4

    check-cast v5, Lwak;

    invoke-virtual {v5, v15}, Lwak;->f(I)Z

    move-result v5

    if-eqz v5, :cond_17f

    :cond_196
    invoke-virtual {v3, v4}, Ltee;->a(Ljava/lang/Object;)Z

    goto :goto_17f

    :cond_19a
    invoke-virtual {v0}, Lhoh;->y()Lmh4;

    move-result-object v12
    :try_end_19e
    .catchall {:try_start_104 .. :try_end_19e} :catchall_1ad

    :cond_19e
    monitor-exit v1

    if-eqz v12, :cond_1aa

    sget-object v0, Lt0i;->b:Lp0i;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    check-cast v12, Lnh4;

    invoke-virtual {v12, v0}, Lnh4;->resumeWith(Ljava/lang/Object;)V

    :cond_1aa
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_1ad
    move-exception v0

    monitor-exit v1

    throw v0

    :pswitch_1b0
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Laog;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Laog;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c7
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lfsl;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_1db

    move v3, v15

    goto :goto_1dc

    :cond_1db
    move v3, v14

    :goto_1dc
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_225

    if-eqz v0, :cond_21b

    const v1, 0x60672d9a

    invoke-virtual {v2, v1}, Lvt9;->W(I)V

    invoke-static {v0}, Lu0h;->i(Lfsl;)Ljava/lang/String;

    move-result-object v15

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    goto :goto_228

    :cond_21b
    const v0, 0x60684364

    invoke-virtual {v2, v0}, Lvt9;->W(I)V

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    goto :goto_228

    :cond_225
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_228
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_22b
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lshk;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_23e

    move v14, v15

    :cond_23e
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_272

    invoke-static {v0, v2}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v15

    const/16 v35, 0x0

    const v36, 0x3fffe

    const/16 v16, 0x0

    const-wide/16 v17, 0x0

    const-wide/16 v19, 0x0

    const/16 v21, 0x0

    const-wide/16 v22, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v34, 0x0

    move-object/from16 v33, v2

    invoke-static/range {v15 .. v36}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_277

    :cond_272
    move-object/from16 v33, v2

    invoke-virtual/range {v33 .. v33}, Lvt9;->Q()V

    :goto_277
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27a
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_28e

    move v3, v15

    goto :goto_28f

    :cond_28e
    move v3, v14

    :goto_28f
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_2f1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_29c
    if-ge v14, v1, :cond_2f6

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v16, v3

    check-cast v16, Ljava/lang/String;

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    sget-object v4, Lhh5;->a:Lzpa;

    if-ne v3, v4, :cond_2ba

    new-instance v3, Lm3g;

    const/16 v5, 0x9

    invoke-direct {v3, v5}, Lm3g;-><init>(B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_2ba
    check-cast v3, Lkotlin/jvm/functions/Function1;

    sget-object v5, Lh0j;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v5, Lh25;

    invoke-direct {v5, v3}, Lh25;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v4, :cond_2d3

    new-instance v3, Lkof;

    const/16 v4, 0xb

    invoke-direct {v3, v4}, Lkof;-><init>(B)V

    invoke-virtual {v2, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_2d3
    move-object v15, v3

    check-cast v15, Lkotlin/jvm/functions/Function0;

    const v26, 0x180006

    const/16 v27, 0xfb8

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x1

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v25, v2

    move-object/from16 v17, v5

    invoke-static/range {v15 .. v27}, Lvtp;->j(Lkotlin/jvm/functions/Function0;Ljava/lang/String;Lc8e;Likl;Lu8i;Lgyi;ZFLhyf;Lgo3;Lih5;II)V

    goto :goto_29c

    :cond_2f1
    move-object/from16 v25, v2

    invoke-virtual/range {v25 .. v25}, Lvt9;->Q()V

    :cond_2f6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2f9
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lgsj;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v4, v1, 0x3

    if-eq v4, v13, :cond_30d

    move v4, v15

    goto :goto_30e

    :cond_30d
    move v4, v14

    :goto_30e
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v4}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_3c3

    sget-object v1, Lrbe;->l:Lsd3;

    new-instance v4, Lx62;

    new-instance v5, Lt40;

    invoke-direct {v5, v3}, Lt40;-><init>(B)V

    const/high16 v3, 0x41400000    # 12.0f

    invoke-direct {v4, v3, v15, v5}, Lx62;-><init>(FZLy62;)V

    sget-object v3, Lz7e;->b:Lz7e;

    const/16 v5, 0x36

    invoke-static {v4, v1, v2, v5}, Lm9i;->a(Lw62;Lsd3;Lih5;I)Lo9i;

    move-result-object v1

    iget-wide v4, v2, Lvt9;->T:J

    invoke-static {v4, v5}, Ljava/lang/Long;->hashCode(J)I

    move-result v4

    invoke-virtual {v2}, Lvt9;->l()Loag;

    move-result-object v5

    invoke-static {v2, v3}, Lqyn;->P(Lih5;Lc8e;)Lc8e;

    move-result-object v3

    sget-object v6, Lbh5;->To:Lujp;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lm3c;->S:Lfza;

    invoke-virtual {v2}, Lvt9;->a0()V

    iget-boolean v7, v2, Lvt9;->S:Z

    if-eqz v7, :cond_34d

    invoke-virtual {v2, v6}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_350

    :cond_34d
    invoke-virtual {v2}, Lvt9;->j0()V

    :goto_350
    sget-object v6, Lujp;->f:Lah5;

    invoke-static {v2, v1, v6}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    sget-object v1, Lujp;->e:Lah5;

    invoke-static {v2, v5, v1}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sget-object v4, Lujp;->g:Lah5;

    invoke-static {v2, v1, v4}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v2}, Ly4h;->m(Lih5;)V

    sget-object v1, Lujp;->d:Lah5;

    invoke-static {v2, v3, v1}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v1, -0x2affd1b

    invoke-virtual {v2, v1}, Lvt9;->W(I)V

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    iget-object v0, v0, Lgsj;->a:Lpxh;

    sget-object v1, Lj41;->c:Lyi5;

    invoke-virtual {v2, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/res/Resources;

    invoke-virtual {v0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v16

    new-instance v0, Lg4c;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v15}, Lg4c;-><init>(FZ)V

    const/16 v36, 0x6180

    const v37, 0x3affc

    const-wide/16 v18, 0x0

    const-wide/16 v20, 0x0

    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const-wide/16 v27, 0x0

    const/16 v29, 0x2

    const/16 v30, 0x0

    const/16 v31, 0x3

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v35, 0x0

    move-object/from16 v17, v0

    move-object/from16 v34, v2

    invoke-static/range {v16 .. v37}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    const v0, -0x2a83823

    invoke-virtual {v2, v0}, Lvt9;->W(I)V

    invoke-virtual {v2, v14}, Lvt9;->p(Z)V

    invoke-virtual {v2, v15}, Lvt9;->p(Z)V

    goto :goto_3c6

    :cond_3c3
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_3c6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3c9
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Laif;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_3dc

    move v14, v15

    :cond_3dc
    and-int/2addr v1, v15

    move-object v8, v2

    check-cast v8, Lvt9;

    invoke-virtual {v8, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_404

    sget-object v1, Lz7e;->b:Lz7e;

    sget v2, Lgkf;->b:F

    invoke-static {v1, v2}, Lmpj;->h(Lc8e;F)Lc8e;

    move-result-object v5

    iget-object v3, v0, Laif;->a:Lhyf;

    sget-object v0, Lpof;->a:Lunf;

    invoke-static {v8}, Lpof;->a(Lih5;)Lakf;

    move-result-object v0

    iget-object v0, v0, Lakf;->a:Ls7;

    invoke-interface {v0}, Ls7;->w()J

    move-result-wide v6

    const/16 v9, 0x38

    const/4 v10, 0x0

    const/4 v4, 0x0

    invoke-static/range {v3 .. v10}, Lwta;->b(Lhyf;Ljava/lang/String;Lc8e;JLih5;II)V

    goto :goto_407

    :cond_404
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_407
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_40a
    move/from16 v22, v8

    const-wide/16 v16, 0x80

    const-wide/16 v18, 0xff

    const-wide v20, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lice;

    move-object/from16 v2, p1

    check-cast v2, Ljava/util/Set;

    check-cast v1, Lttj;

    new-instance v1, Lpqh;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-object v4, v0, La7f;->b:Ljava/lang/Object;

    monitor-enter v4

    :try_start_427
    iget-object v5, v0, Lice;->c:Lsee;

    new-instance v6, Lyo7;

    invoke-direct {v6, v2, v0, v1, v3}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v15, v6}, Ly9m;->t(ILjava/lang/Object;)V

    iget-object v0, v5, Lsee;->b:[Ljava/lang/Object;

    iget-object v2, v5, Lsee;->a:[J

    array-length v3, v2

    sub-int/2addr v3, v13

    if-ltz v3, :cond_469

    move v5, v14

    :goto_43a
    aget-wide v7, v2, v5

    not-long v10, v7

    shl-long v10, v10, v22

    and-long/2addr v10, v7

    and-long v10, v10, v20

    cmp-long v10, v10, v20

    if-eqz v10, :cond_464

    sub-int v10, v5, v3

    not-int v10, v10

    ushr-int/lit8 v10, v10, 0x1f

    rsub-int/lit8 v10, v10, 0x8

    move v11, v14

    :goto_44e
    if-ge v11, v10, :cond_462

    and-long v12, v7, v18

    cmp-long v12, v12, v16

    if-gez v12, :cond_45e

    shl-int/lit8 v12, v5, 0x3

    add-int/2addr v12, v11

    aget-object v12, v0, v12

    invoke-virtual {v6, v12}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_45e
    shr-long/2addr v7, v9

    add-int/lit8 v11, v11, 0x1

    goto :goto_44e

    :cond_462
    if-ne v10, v9, :cond_469

    :cond_464
    if-eq v5, v3, :cond_469

    add-int/lit8 v5, v5, 0x1

    goto :goto_43a

    :cond_469
    iget-object v0, v1, Lpqh;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_486

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_476
    if-ge v14, v1, :cond_486

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc1j;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-interface {v2, v3}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_483
    .catchall {:try_start_427 .. :try_end_483} :catchall_48a

    add-int/lit8 v14, v14, 0x1

    goto :goto_476

    :cond_486
    monitor-exit v4

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_48a
    move-exception v0

    monitor-exit v4

    throw v0

    :pswitch_48d
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lpej;

    move-object/from16 v2, p1

    check-cast v2, Lgcb;

    check-cast v1, Lyo5;

    iget-wide v3, v1, Lyo5;->a:J

    invoke-static {v3, v4}, Lyo5;->g(J)I

    move-result v1

    int-to-float v1, v1

    new-instance v3, Lx9d;

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v5, Lqej;->a:Lqej;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-wide v6, v2, Lgcb;->a:J

    const-wide v8, 0xffffffffL

    and-long/2addr v6, v8

    long-to-int v6, v6

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float v7, v1, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_4cd

    iget-boolean v6, v0, Lpej;->a:Z

    if-nez v6, :cond_4cd

    sget-object v6, Lqej;->c:Lqej;

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-interface {v4, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4cd
    iget-wide v6, v2, Lgcb;->a:J

    and-long/2addr v6, v8

    long-to-int v2, v6

    if-eqz v2, :cond_4e3

    sget-object v6, Lqej;->b:Lqej;

    int-to-float v2, v2

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-interface {v4, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_4e3
    invoke-direct {v3, v4}, Lx9d;-><init>(Ljava/util/Map;)V

    iget-object v0, v0, Lpej;->d:La21;

    iget-object v0, v0, La21;->j:Ljava/lang/Object;

    check-cast v0, Li37;

    invoke-virtual {v0}, Li37;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lqej;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_51a

    if-eq v0, v15, :cond_511

    if-ne v0, v13, :cond_50d

    sget-object v0, Lqej;->c:Lqej;

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_519

    sget-object v0, Lqej;->b:Lqej;

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51a

    goto :goto_519

    :cond_50d
    invoke-static {}, Lh9o;->p()V

    goto :goto_51f

    :cond_511
    sget-object v0, Lqej;->b:Lqej;

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51a

    :cond_519
    :goto_519
    move-object v5, v0

    :cond_51a
    new-instance v12, Lkotlin/Pair;

    invoke-direct {v12, v3, v5}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_51f
    return-object v12

    :pswitch_520
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lt6e;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Lt6e;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_537
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lk6e;

    move-object/from16 v2, p1

    check-cast v2, Lnx5;

    check-cast v1, Lmt5;

    iget-object v0, v0, Lk6e;->b:Lplh;

    invoke-static {v0, v1}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_548
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lt9f;

    move-object/from16 v2, p1

    check-cast v2, Lini;

    check-cast v1, Lf0g;

    const-class v1, Lu9f;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    invoke-virtual {v2, v1, v12, v12}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu9f;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lt9f;->b()Ls9f;

    move-result-object v0

    iget-object v1, v1, Lu9f;->c:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_56b
    if-ge v14, v2, :cond_57b

    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v14, v14, 0x1

    check-cast v3, Leeb;

    iget-object v4, v0, Ls9f;->c:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_56b

    :cond_57b
    new-instance v1, Lt9f;

    invoke-direct {v1, v0}, Lt9f;-><init>(Ls9f;)V

    return-object v1

    :pswitch_581
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Li2e;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v2, v1}, Li41;->b(Li2e;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_598
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lmk8;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_5ab

    move v14, v15

    :cond_5ab
    and-int/2addr v1, v15

    move-object v8, v2

    check-cast v8, Lvt9;

    invoke-virtual {v8, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_5de

    iget-wide v6, v0, Lmk8;->a:J

    sget-object v0, Ltk7;->o:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldl7;

    invoke-static {v0, v8}, Liza;->a(Ldl7;Lih5;)Lhyf;

    move-result-object v3

    sget-object v0, Lahk;->D0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lshk;

    invoke-static {v0, v8}, Luyg;->q(Lshk;Lih5;)Ljava/lang/String;

    move-result-object v4

    sget-object v0, Lz7e;->b:Lz7e;

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1}, Lmpj;->h(Lc8e;F)Lc8e;

    move-result-object v5

    const/16 v9, 0x188

    const/4 v10, 0x0

    invoke-static/range {v3 .. v10}, Lwta;->b(Lhyf;Ljava/lang/String;Lc8e;JLih5;II)V

    goto :goto_5e1

    :cond_5de
    invoke-virtual {v8}, Lvt9;->Q()V

    :goto_5e1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5e4
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lcrd;

    iget-object v0, v3, Lcrd;->g:Lzyk;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget-object v9, Lhh5;->a:Lzpa;

    and-int/lit8 v4, v1, 0x3

    if-eq v4, v13, :cond_5fc

    move v14, v15

    :cond_5fc
    and-int/2addr v1, v15

    move-object v10, v2

    check-cast v10, Lvt9;

    invoke-virtual {v10, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_6fc

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfrd;

    iget-object v1, v1, Lfrd;->h:Lrlh;

    invoke-static {v1, v10}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lerd;

    invoke-virtual {v10, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_625

    if-ne v2, v9, :cond_638

    :cond_625
    new-instance v1, Lobc;

    const-class v4, Lcrd;

    const-string v5, "close"

    const-string v6, "close()V"

    const/4 v7, 0x0

    const/16 v8, 0x16

    const/4 v2, 0x0

    invoke-direct/range {v1 .. v8}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v10, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v2, v1

    :cond_638
    check-cast v2, Lmtb;

    move-object/from16 v16, v2

    check-cast v16, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfrd;

    invoke-virtual {v10, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_650

    if-ne v4, v9, :cond_668

    :cond_650
    new-instance v17, Lobc;

    const-class v20, Lfrd;

    const-string v21, "onSearchClick"

    const-string v22, "onSearchClick()V"

    const/16 v23, 0x0

    const/16 v24, 0x17

    const/16 v18, 0x0

    move-object/from16 v19, v1

    invoke-direct/range {v17 .. v24}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v17

    invoke-virtual {v10, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_668
    check-cast v4, Lmtb;

    move-object/from16 v17, v4

    check-cast v17, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfrd;

    invoke-virtual {v10, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_680

    if-ne v4, v9, :cond_698

    :cond_680
    new-instance v18, Lci7;

    const-class v21, Lfrd;

    const-string v22, "onBackgroundPlayCheckedChanged"

    const-string v23, "onBackgroundPlayCheckedChanged(Z)V"

    const/16 v24, 0x0

    const/16 v25, 0x1d

    const/16 v19, 0x1

    move-object/from16 v20, v1

    invoke-direct/range {v18 .. v25}, Lci7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v18

    invoke-virtual {v10, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_698
    check-cast v4, Lmtb;

    move-object/from16 v18, v4

    check-cast v18, Lkotlin/jvm/functions/Function1;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfrd;

    invoke-virtual {v10, v0}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_6b0

    if-ne v2, v9, :cond_6c8

    :cond_6b0
    new-instance v19, Lobc;

    const-class v22, Lfrd;

    const-string v23, "onProtectedContentClicked"

    const-string v24, "onProtectedContentClicked()V"

    const/16 v25, 0x0

    const/16 v26, 0x18

    const/16 v20, 0x0

    move-object/from16 v21, v0

    invoke-direct/range {v19 .. v26}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v2, v19

    invoke-virtual {v10, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_6c8
    check-cast v2, Lmtb;

    move-object/from16 v19, v2

    check-cast v19, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v10, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {v10}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    if-nez v0, :cond_6da

    if-ne v1, v9, :cond_6ec

    :cond_6da
    new-instance v1, Lobc;

    const-class v4, Lcrd;

    const-string v5, "openAppSettings"

    const-string v6, "openAppSettings()V"

    const/4 v7, 0x0

    const/16 v8, 0x19

    const/4 v2, 0x0

    invoke-direct/range {v1 .. v8}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v10, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_6ec
    check-cast v1, Lmtb;

    move-object/from16 v20, v1

    check-cast v20, Lkotlin/jvm/functions/Function0;

    const/16 v21, 0x0

    const/16 v23, 0x0

    move-object/from16 v22, v10

    invoke-static/range {v15 .. v23}, Lgyg;->f(Lerd;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    goto :goto_701

    :cond_6fc
    move-object/from16 v22, v10

    invoke-virtual/range {v22 .. v22}, Lvt9;->Q()V

    :goto_701
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_704
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lsul;

    move-object/from16 v2, p1

    check-cast v2, Lrji;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v1}, Lsul;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_71f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_73a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_71f

    :cond_73a
    return-object v3

    :pswitch_73b
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lu8d;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v2, v1}, Lsfe;->n(Lu8d;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_752
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Li8d;

    move-object/from16 v0, p1

    check-cast v0, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget-object v9, Lhh5;->a:Lzpa;

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v13, :cond_768

    move v14, v15

    :cond_768
    and-int/2addr v1, v15

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v14}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_8df

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    iget-object v1, v1, La9d;->q:Lrlh;

    invoke-static {v1, v0}, Ldyg;->h(Llak;Lih5;)Lafe;

    move-result-object v1

    invoke-interface {v1}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v15, v1

    check-cast v15, Lv8d;

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_78e

    if-ne v2, v9, :cond_7a1

    :cond_78e
    new-instance v1, Lobc;

    const-class v4, Li8d;

    const-string v5, "close"

    const-string v6, "close()V"

    const/4 v7, 0x0

    const/16 v8, 0xc

    const/4 v2, 0x0

    invoke-direct/range {v1 .. v8}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v0, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    move-object v2, v1

    :cond_7a1
    check-cast v2, Lmtb;

    move-object/from16 v16, v2

    check-cast v16, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_7b7

    if-ne v4, v9, :cond_7cf

    :cond_7b7
    new-instance v17, Lobc;

    const-class v20, La9d;

    const-string v21, "openHelp"

    const-string v22, "openHelp()V"

    const/16 v23, 0x0

    const/16 v24, 0xd

    const/16 v18, 0x0

    move-object/from16 v19, v1

    invoke-direct/range {v17 .. v24}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v17

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_7cf
    check-cast v4, Lmtb;

    move-object/from16 v17, v4

    check-cast v17, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_7e5

    if-ne v4, v9, :cond_7fd

    :cond_7e5
    new-instance v18, Lobc;

    const-class v21, La9d;

    const-string v22, "changePlan"

    const-string v23, "changePlan()V"

    const/16 v24, 0x0

    const/16 v25, 0xe

    const/16 v19, 0x0

    move-object/from16 v20, v1

    invoke-direct/range {v18 .. v25}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v18

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_7fd
    check-cast v4, Lmtb;

    move-object/from16 v18, v4

    check-cast v18, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_813

    if-ne v4, v9, :cond_82b

    :cond_813
    new-instance v19, Lobc;

    const-class v22, La9d;

    const-string v23, "requestSwitchToFree"

    const-string v24, "requestSwitchToFree()V"

    const/16 v25, 0x0

    const/16 v26, 0xf

    const/16 v20, 0x0

    move-object/from16 v21, v1

    invoke-direct/range {v19 .. v26}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v19

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_82b
    check-cast v4, Lmtb;

    move-object/from16 v19, v4

    check-cast v19, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_841

    if-ne v4, v9, :cond_859

    :cond_841
    new-instance v20, Lobc;

    const-class v23, La9d;

    const-string v24, "switchToPro"

    const-string v25, "switchToPro()V"

    const/16 v26, 0x0

    const/16 v27, 0x10

    const/16 v21, 0x0

    move-object/from16 v22, v1

    invoke-direct/range {v20 .. v27}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v20

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_859
    check-cast v4, Lmtb;

    move-object/from16 v20, v4

    check-cast v20, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v4

    if-nez v2, :cond_86f

    if-ne v4, v9, :cond_887

    :cond_86f
    new-instance v21, Lobc;

    const-class v24, La9d;

    const-string v25, "resubscribe"

    const-string v26, "resubscribe()V"

    const/16 v27, 0x0

    const/16 v28, 0x11

    const/16 v22, 0x0

    move-object/from16 v23, v1

    invoke-direct/range {v21 .. v28}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v4, v21

    invoke-virtual {v0, v4}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_887
    check-cast v4, Lmtb;

    move-object/from16 v21, v4

    check-cast v21, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v0, v3}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v2

    if-nez v1, :cond_899

    if-ne v2, v9, :cond_8a3

    :cond_899
    new-instance v2, Lq4b;

    const/16 v1, 0x16

    invoke-direct {v2, v3, v1}, Lq4b;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_8a3
    move-object/from16 v22, v2

    check-cast v22, Lkotlin/jvm/functions/Function0;

    invoke-virtual {v3}, Li8d;->o0()La9d;

    move-result-object v1

    invoke-virtual {v0, v1}, Lvt9;->h(Ljava/lang/Object;)Z

    move-result v2

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v3

    if-nez v2, :cond_8b7

    if-ne v3, v9, :cond_8cf

    :cond_8b7
    new-instance v23, Lobc;

    const-class v26, La9d;

    const-string v27, "requestSubscribe"

    const-string v28, "requestSubscribe()V"

    const/16 v29, 0x0

    const/16 v30, 0x12

    const/16 v24, 0x0

    move-object/from16 v25, v1

    invoke-direct/range {v23 .. v30}, Lobc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v3, v23

    invoke-virtual {v0, v3}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_8cf
    check-cast v3, Lmtb;

    move-object/from16 v23, v3

    check-cast v23, Lkotlin/jvm/functions/Function0;

    const/16 v24, 0x0

    const/16 v26, 0x0

    move-object/from16 v25, v0

    invoke-static/range {v15 .. v26}, Lsfe;->k(Lv8d;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lc8e;Lih5;I)V

    goto :goto_8e4

    :cond_8df
    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lvt9;->Q()V

    :goto_8e4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8e7
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lu5d;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_8fb

    move v3, v15

    goto :goto_8fc

    :cond_8fb
    move v3, v14

    :goto_8fc
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_913

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljbc;

    invoke-static {v0, v12, v2, v14}, Lalo;->c(Ljbc;Lc8e;Lih5;I)V

    goto :goto_916

    :cond_913
    invoke-virtual {v2}, Lvt9;->Q()V

    :goto_916
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_919
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lmgl;

    move-object/from16 v2, p1

    check-cast v2, Llmg;

    check-cast v1, Ly8f;

    iget-wide v1, v1, Ly8f;->a:J

    invoke-interface {v0, v1, v2}, Lmgl;->d(J)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_92b
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lxvf;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v2, v1}, Lsgb;->e(Lxvf;Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_942
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Ldka;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    check-cast v1, Ljava/lang/String;

    new-instance v3, Llia;

    new-instance v4, Lmia;

    int-to-long v5, v2

    invoke-direct {v4, v5, v6, v1}, Lmia;-><init>(JLjava/lang/String;)V

    invoke-direct {v3, v4}, Llia;-><init>(Lmia;)V

    new-instance v1, Lsw7;

    invoke-direct {v1, v3}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldka;->n(Ltw7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_966
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Ldka;

    move-object/from16 v2, p1

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    check-cast v1, Ljava/lang/String;

    new-instance v3, Lcia;

    new-instance v4, Ldia;

    int-to-long v5, v2

    invoke-direct {v4, v5, v6, v1}, Ldia;-><init>(JLjava/lang/String;)V

    invoke-direct {v3, v4}, Lcia;-><init>(Ldia;)V

    new-instance v1, Lsw7;

    invoke-direct {v1, v3}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldka;->n(Ltw7;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_98a
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lkotlin/jvm/functions/Function2;

    move-object/from16 v2, p1

    check-cast v2, Lrji;

    invoke-interface {v0, v2, v1}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_99f
    if-ge v14, v3, :cond_9d4

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_9d1

    iget-object v5, v2, Lrji;->b:Lvji;

    if-eqz v5, :cond_9d1

    invoke-interface {v5, v4}, Lvji;->c(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_9d1

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "item at index "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " can\'t be saved: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9d1
    add-int/lit8 v14, v14, 0x1

    goto :goto_99f

    :cond_9d4
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9df

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    :cond_9df
    return-object v12

    :pswitch_9e0
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v3, v1, 0x3

    if-eq v3, v13, :cond_9f4

    move v3, v15

    goto :goto_9f5

    :cond_9f4
    move v3, v14

    :goto_9f5
    and-int/2addr v1, v15

    check-cast v2, Lvt9;

    invoke-virtual {v2, v1, v3}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_a3f

    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v1

    move v3, v14

    :goto_a06
    if-ge v3, v1, :cond_a42

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkotlin/jvm/functions/Function2;

    iget-wide v5, v2, Lvt9;->T:J

    invoke-static {v5, v6}, Ljava/lang/Long;->hashCode(J)I

    move-result v5

    sget-object v6, Lbh5;->To:Lujp;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lujp;->c:Lmf5;

    invoke-virtual {v2}, Lvt9;->a0()V

    iget-boolean v7, v2, Lvt9;->S:Z

    if-eqz v7, :cond_a26

    invoke-virtual {v2, v6}, Lvt9;->k(Lkotlin/jvm/functions/Function0;)V

    goto :goto_a29

    :cond_a26
    invoke-virtual {v2}, Lvt9;->j0()V

    :goto_a29
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, Lujp;->g:Lah5;

    invoke-static {v2, v5, v6}, Ly4h;->o(Lih5;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)V

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v4, v2, v5}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v15}, Lvt9;->p(Z)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_a06

    :cond_a3f
    invoke-virtual {v2}, Lvt9;->Q()V

    :cond_a42
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a45
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Lh1c;

    move-object/from16 v2, p1

    check-cast v2, Lg0c;

    check-cast v1, [I

    iget-object v0, v0, Lh1c;->d:Le5m;

    iget-boolean v0, v0, Le5m;->a:Z

    if-eqz v0, :cond_a5e

    array-length v0, v1

    invoke-static {v1, v0}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v0

    invoke-virtual {v2, v0}, Lg0c;->a([I)V

    goto :goto_a71

    :cond_a5e
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, La0c;

    invoke-direct {v0}, La0c;-><init>()V

    const/16 v1, 0x1003

    invoke-static {v0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v0

    iget-object v1, v2, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, v1}, Lzhj;->c(Landroid/content/Context;)V

    :goto_a71
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a74
    iget-object v0, v0, La7b;->b:Ljava/lang/Object;

    check-cast v0, Ld7b;

    move-object/from16 v2, p1

    check-cast v2, Lih5;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v15}, Laoh;->m(I)I

    move-result v1

    invoke-virtual {v0, v2, v1}, Ld7b;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_a8c
    .packed-switch 0x0
        :pswitch_a74
        :pswitch_a45
        :pswitch_9e0
        :pswitch_98a
        :pswitch_966
        :pswitch_942
        :pswitch_92b
        :pswitch_919
        :pswitch_8e7
        :pswitch_752
        :pswitch_73b
        :pswitch_704
        :pswitch_5e4
        :pswitch_598
        :pswitch_581
        :pswitch_548
        :pswitch_537
        :pswitch_520
        :pswitch_48d
        :pswitch_40a
        :pswitch_3c9
        :pswitch_2f9
        :pswitch_27a
        :pswitch_22b
        :pswitch_1c7
        :pswitch_1b0
        :pswitch_f7
        :pswitch_88
        :pswitch_44
    .end packed-switch
.end method
