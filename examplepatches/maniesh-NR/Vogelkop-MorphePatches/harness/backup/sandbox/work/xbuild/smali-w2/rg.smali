.class public final synthetic Lrg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Laog;Lkotlin/jvm/functions/Function0;Lgog;Ljava/lang/String;Ld2c;)V
    .registers 6

    const/4 p4, 0x1

    iput-byte p4, p0, Lrg;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrg;->b:Ljava/lang/Object;

    iput-object p2, p0, Lrg;->c:Ljava/lang/Object;

    iput-object p3, p0, Lrg;->d:Ljava/lang/Object;

    iput-object p5, p0, Lrg;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lrg;->a:B

    iput-object p1, p0, Lrg;->b:Ljava/lang/Object;

    iput-object p2, p0, Lrg;->c:Ljava/lang/Object;

    iput-object p3, p0, Lrg;->d:Ljava/lang/Object;

    iput-object p4, p0, Lrg;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p0

    iget-byte v1, v0, Lrg;->a:B

    const/4 v2, 0x4

    const/16 v3, 0x98b

    const/4 v4, -0x1

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    iget-object v10, v0, Lrg;->e:Ljava/lang/Object;

    iget-object v11, v0, Lrg;->d:Ljava/lang/Object;

    iget-object v12, v0, Lrg;->c:Ljava/lang/Object;

    iget-object v0, v0, Lrg;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_648

    check-cast v0, Lcn1;

    check-cast v12, Ljfo;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lspa;

    sget-object v2, Lapa;->b:Lapa;

    const-string v2, "POST"

    invoke-static {v2}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v2

    iput-object v2, v1, Lspa;->b:Lapa;

    iget-object v2, v1, Lspa;->a:Ltgm;

    iget-object v3, v12, Ljfo;->a:Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Ll75;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "api/v3/user/missions/"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/report-counter"

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    const-class v2, Lcn1;

    if-nez v0, :cond_5f

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, v1, Lspa;->d:Ljava/lang/Object;

    goto :goto_61

    :cond_5f
    iput-object v0, v1, Lspa;->d:Ljava/lang/Object;

    :goto_61
    invoke-static {v2}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_65
    invoke-static {v2}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v9
    :try_end_69
    .catchall {:try_start_65 .. :try_end_69} :catchall_69

    :catchall_69
    invoke-static {v0, v9, v1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object v0, Lvpa;->a:Ljf2;

    iget-object v0, v1, Lspa;->c:Lg9a;

    const-string v1, "x-clientversion"

    invoke-virtual {v0, v1, v10}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Authorization"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Accept-Language"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Content-Type"

    const-string v2, "application/json"

    invoke-virtual {v0, v1, v2}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8b
    check-cast v0, Llqh;

    check-cast v12, Lcom/opera/android/BrowserActivity;

    check-cast v11, Lumi;

    check-cast v10, Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-boolean v1, v0, Llqh;->a:Z

    if-eqz v1, :cond_9e

    iput-boolean v6, v0, Llqh;->a:Z

    goto :goto_c7

    :cond_9e
    sget-object v0, Ljlm;->a:Lnx1;

    new-instance v1, Landroid/util/Pair;

    invoke-direct {v1, v12, v11}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhlm;

    const-string v1, "ga_usage_statistics"

    invoke-virtual {v10, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c4

    new-instance v1, Lilm;

    invoke-direct {v1, v0, v6}, Lilm;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lcak;->d:Lavj;

    new-instance v0, Ln32;

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Ln32;-><init>(Lcom/opera/api/Callback;B)V

    invoke-static {v8, v0}, Lavj;->g(ILjava/lang/Runnable;)V

    goto :goto_c7

    :cond_c4
    invoke-virtual {v0, v9}, Lhlm;->a(Ljava/lang/String;)V

    :goto_c7
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_ca
    check-cast v0, Lc8l;

    check-cast v12, Lmcj;

    check-cast v11, Lrv3;

    check-cast v10, Ld7l;

    move-object/from16 v1, p1

    check-cast v1, Lb8l;

    instance-of v2, v1, La8l;

    if-eqz v2, :cond_fb

    move-object v2, v1

    check-cast v2, La8l;

    iget-object v2, v2, La8l;->a:Lm7l;

    iget-object v3, v12, Lmcj;->a:Ljava/lang/Object;

    check-cast v3, Lf7l;

    iget-object v0, v0, Lc8l;->c:Ldeg;

    iget-object v4, v2, Lm7l;->b:Ll7l;

    iget-object v4, v4, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v3, v4}, Lf7l;->d(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v4}, Ldeg;->f(Landroid/net/Uri;)V

    iget-object v2, v2, Lm7l;->c:Ll7l;

    iget-object v2, v2, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v3, v2}, Lf7l;->d(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Ldeg;->f(Landroid/net/Uri;)V

    :cond_fb
    iget-object v0, v10, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-virtual {v11, v0, v1}, Lrv3;->b(ILb8l;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_107
    check-cast v0, Lcdk;

    check-cast v12, Lh07;

    check-cast v11, Lzck;

    check-cast v10, Lzrm;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    instance-of v2, v1, Lgwa;

    if-eqz v2, :cond_12b

    move-object v2, v1

    check-cast v2, Lgwa;

    iget-byte v2, v2, Lgwa;->a:B

    if-ne v2, v5, :cond_12b

    iget-object v1, v0, Lcdk;->b:Lctm;

    iget-object v1, v1, Lctm;->f:La64;

    new-instance v2, Logb;

    invoke-direct {v2, v0, v10, v11, v9}, Logb;-><init>(Lcdk;Lzrm;Lzck;Lmt5;)V

    invoke-static {v1, v9, v9, v2, v5}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_144

    :cond_12b
    iget-object v0, v11, Lzck;->d:Lcd5;

    if-eqz v1, :cond_13d

    instance-of v2, v1, Ljava/util/concurrent/CancellationException;

    if-eqz v2, :cond_139

    check-cast v1, Ljava/util/concurrent/CancellationException;

    invoke-virtual {v0, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    goto :goto_144

    :cond_139
    invoke-virtual {v0, v1}, Lcd5;->B0(Ljava/lang/Throwable;)Z

    goto :goto_144

    :cond_13d
    invoke-interface {v12}, Lh07;->m()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lxob;->j0(Ljava/lang/Object;)Z

    :goto_144
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_147
    check-cast v0, Lafe;

    check-cast v12, Lafe;

    move-object v15, v11

    check-cast v15, Lt2i;

    check-cast v10, Lafe;

    move-object/from16 v1, p1

    check-cast v1, Lh6c;

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lutm;

    iget-object v2, v2, Lutm;->a:Ljava/lang/Long;

    if-nez v2, :cond_16c

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lutm;

    iget-object v2, v2, Lutm;->b:Lg1b;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_184

    :cond_16c
    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lutm;

    new-instance v2, Lx6d;

    invoke-direct {v2, v0, v8}, Lx6d;-><init>(Lutm;B)V

    new-instance v0, Lue5;

    const v3, 0xc6bae3d

    invoke-direct {v0, v3, v2, v8}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const-string v2, "balances"

    invoke-static {v1, v2, v0, v7}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    :cond_184
    invoke-interface {v12}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lad2;

    invoke-interface {v0}, Lad2;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lg1b;

    if-eqz v0, :cond_218

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1a1

    const-string v0, "empty"

    sget-object v2, Lwxe;->c:Lue5;

    invoke-static {v1, v0, v2, v7}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    goto/16 :goto_218

    :cond_1a1
    invoke-interface {v10}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v20, Lldh;

    const/16 v19, 0x0

    move-object/from16 v13, v20

    const/16 v20, 0xa

    const/4 v14, 0x1

    const-class v16, Lt2i;

    const-string v17, "onClick"

    const-string v18, "onClick(Lcom/opera/momi/clientsdk/ui/rewards/RewardItem;)V"

    invoke-direct/range {v13 .. v20}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v3, v13

    new-instance v19, Lldh;

    move-object/from16 v13, v19

    const/16 v19, 0x0

    const/16 v20, 0xb

    const-string v17, "onImpression"

    const-string v18, "onImpression(Lcom/opera/momi/clientsdk/ui/rewards/RewardItem;)V"

    invoke-direct/range {v13 .. v20}, Lldh;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    check-cast v15, Lh3i;

    iget-object v4, v15, Lh3i;->n:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljbc;

    new-instance v5, Lu4h;

    const/16 v6, 0x13

    invoke-direct {v5, v6}, Lu4h;-><init>(B)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    new-instance v9, Lc4i;

    invoke-direct {v9, v5, v0}, Lc4i;-><init>(Lu4h;Lg1b;)V

    new-instance v5, Lc4i;

    invoke-direct {v5, v0}, Lc4i;-><init>(Lg1b;)V

    new-instance v16, Lccc;

    const/16 v21, 0x1

    move-object/from16 v17, v0

    move-object/from16 v18, v2

    move-object/from16 v20, v3

    move-object/from16 v19, v13

    invoke-direct/range {v16 .. v21}, Lccc;-><init>(Ljava/util/List;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Ljava/lang/Object;B)V

    move-object/from16 v0, v16

    new-instance v2, Lue5;

    const v3, 0x2fd4df92

    invoke-direct {v2, v3, v0, v8}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-virtual {v1, v6, v9, v5, v2}, Lh6c;->P(ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lue5;)V

    new-instance v0, Lj04;

    const/16 v2, 0xe

    invoke-direct {v0, v4, v2}, Lj04;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lue5;

    const v3, -0x4d4ba6cb

    invoke-direct {v2, v3, v0, v8}, Lue5;-><init>(ILjava/lang/Object;Z)V

    const-string v0, "legal-disclaimer"

    invoke-static {v1, v0, v2, v7}, Lh6c;->O(Lh6c;Ljava/lang/String;Lue5;I)V

    :cond_218
    :goto_218
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_21b
    check-cast v0, Ljava/util/ArrayList;

    check-cast v12, Ljava/util/ArrayList;

    check-cast v11, Ljava/util/ArrayList;

    check-cast v10, Ljava/util/ArrayList;

    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v6

    move v4, v3

    move v5, v4

    :goto_22e
    if-ge v5, v2, :cond_299

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v13, v3, 0x1

    if-ltz v3, :cond_293

    check-cast v8, Ljava/util/List;

    check-cast v8, Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    move v14, v6

    :goto_243
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_285

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v16, v14, 0x1

    if-ltz v14, :cond_27f

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v15

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lifg;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, [I

    aget v14, v17, v14

    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/Number;

    move-object/from16 v18, v9

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Number;->intValue()I

    move-result v9

    iget v6, v15, Lifg;->b:I

    invoke-static {v9, v6, v7, v4}, Lz1m;->d(IIII)I

    move-result v6

    invoke-static {v1, v15, v14, v6}, Lp1d;->f(Lp1d;Lifg;II)V

    move/from16 v14, v16

    move-object/from16 v9, v18

    goto :goto_243

    :cond_27f
    move-object/from16 v18, v9

    invoke-static {}, Lj95;->n()V

    throw v18

    :cond_285
    invoke-virtual {v12, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v3

    add-int/2addr v4, v3

    move v3, v13

    const/4 v6, 0x0

    goto :goto_22e

    :cond_293
    move-object/from16 v18, v9

    invoke-static {}, Lj95;->n()V

    throw v18

    :cond_299
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_29c
    move-object/from16 v18, v9

    check-cast v0, Lnqh;

    check-cast v12, Lv04;

    check-cast v11, Lami;

    check-cast v10, Lkotlin/coroutines/CoroutineContext;

    move-object/from16 v1, p1

    check-cast v1, Ljava/nio/ByteBuffer;

    :try_start_2aa
    invoke-interface {v12, v1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v1
    :try_end_2ae
    .catchall {:try_start_2aa .. :try_end_2ae} :catchall_2b3

    iput v1, v0, Lnqh;->a:I

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_2b3
    move-exception v0

    move-object v1, v0

    :try_start_2b5
    sget-object v0, Lt0i;->b:Lp0i;

    invoke-static {v10}, Lo0g;->U(Lkotlin/coroutines/CoroutineContext;)Lunb;

    move-result-object v0

    invoke-interface {v0}, Lunb;->p()Ljava/util/concurrent/CancellationException;

    move-result-object v0
    :try_end_2bf
    .catchall {:try_start_2b5 .. :try_end_2bf} :catchall_2c0

    goto :goto_2c9

    :catchall_2c0
    move-exception v0

    sget-object v2, Lt0i;->b:Lp0i;

    new-instance v2, Lq0i;

    invoke-direct {v2, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v2

    :goto_2c9
    sget-object v2, Lt0i;->b:Lp0i;

    instance-of v2, v0, Lq0i;

    if-eqz v2, :cond_2d2

    move-object/from16 v9, v18

    goto :goto_2d3

    :cond_2d2
    move-object v9, v0

    :goto_2d3
    check-cast v9, Ljava/util/concurrent/CancellationException;

    if-eqz v9, :cond_2d8

    move-object v1, v9

    :cond_2d8
    instance-of v0, v1, Ljava/net/SocketTimeoutException;

    if-eqz v0, :cond_2e0

    invoke-static {v11, v1}, Ldra;->a(Lami;Ljava/lang/Throwable;)Ljava/net/SocketTimeoutException;

    move-result-object v1

    :cond_2e0
    throw v1

    :pswitch_2e1
    check-cast v0, Lwm0;

    check-cast v12, Ljava/lang/String;

    check-cast v11, Ljava/lang/String;

    check-cast v10, Lxm0;

    move-object/from16 v1, p1

    check-cast v1, Ltd0;

    iget-object v6, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lre0;

    invoke-direct {v6, v3, v4, v2}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v2, 0x42

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_30f

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_30f

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_318

    :cond_30f
    invoke-static {v1, v2, v8}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v3

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_318
    invoke-virtual {v4, v6}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    invoke-virtual {v6, v1, v8, v0}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez v12, :cond_323

    const/4 v0, 0x0

    goto :goto_324

    :cond_323
    move v0, v8

    :goto_324
    invoke-virtual {v6, v7, v0, v12}, Ljf0;->q(IILjava/lang/Object;)V

    if-nez v11, :cond_32b

    const/4 v0, 0x0

    goto :goto_32c

    :cond_32b
    move v0, v8

    :goto_32c
    invoke-virtual {v6, v5, v0, v11}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v6, v8, v8, v10}, Ljf0;->q(IILjava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_335
    check-cast v0, Lw2b;

    check-cast v12, Lc3b;

    check-cast v11, Lv2b;

    check-cast v10, Leb0;

    move-object/from16 v1, p1

    check-cast v1, Ltd0;

    iget-object v0, v0, Lw2b;->a:Ljava/lang/String;

    new-instance v2, Lyo7;

    const/16 v5, 0x16

    invoke-direct {v2, v12, v11, v10, v5}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v5, v1, Ltd0;->a:Lzpa;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lzf0;

    invoke-direct {v6, v3, v4, v8}, Ljf0;-><init>(III)V

    iget-object v1, v1, Ltd0;->b:Lqd0;

    const/16 v3, 0x3a

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    if-eqz v4, :cond_36c

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_36c

    new-instance v7, Lif0;

    invoke-direct {v7, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    goto :goto_379

    :cond_36c
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v1, v3, v8, v4}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v7, Lif0;

    invoke-direct {v7, v1, v3, v4}, Lif0;-><init>(Ljf0;ILjava/util/Map;)V

    :goto_379
    invoke-virtual {v7, v0, v6}, Lif0;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lag0;

    invoke-direct {v0, v5, v6}, Lag0;-><init>(Lzpa;Lzf0;)V

    invoke-virtual {v2, v0}, Lyo7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_387
    check-cast v0, Lmqh;

    check-cast v12, Lsae;

    check-cast v11, Lqpi;

    check-cast v10, Lai;

    move-object/from16 v1, p1

    check-cast v1, Lve1;

    iget-object v2, v1, Lve1;->e:Lt0g;

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->floatValue()F

    move-result v2

    iget v3, v0, Lmqh;->a:F

    sub-float/2addr v2, v3

    invoke-static {v2}, Lp37;->T(F)Z

    move-result v3

    if-nez v3, :cond_3bf

    invoke-virtual {v12, v11, v2}, Lsae;->f(Lqpi;F)F

    move-result v3

    sub-float v3, v2, v3

    invoke-static {v3}, Lp37;->T(F)Z

    move-result v3

    if-nez v3, :cond_3ba

    invoke-virtual {v1}, Lve1;->a()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_3d6

    :cond_3ba
    iget v3, v0, Lmqh;->a:F

    add-float/2addr v3, v2

    iput v3, v0, Lmqh;->a:F

    :cond_3bf
    iget v0, v0, Lmqh;->a:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {v10, v0}, Lai;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3d4

    invoke-virtual {v1}, Lve1;->a()V

    :cond_3d4
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_3d6
    return-object v0

    :pswitch_3d7
    move-object/from16 v18, v9

    move-object v2, v0

    check-cast v2, Lg1b;

    move-object v3, v12

    check-cast v3, Lruj;

    move-object v4, v11

    check-cast v4, Lkotlin/jvm/functions/Function1;

    move-object v5, v10

    check-cast v5, Ljbg;

    move-object/from16 v0, p1

    check-cast v0, Lh6c;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    new-instance v10, Loda;

    invoke-direct {v10, v2, v7}, Loda;-><init>(Ljava/util/List;B)V

    new-instance v1, Lccc;

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lccc;-><init>(Ljava/util/List;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;Ljava/lang/Object;B)V

    new-instance v2, Lue5;

    const v3, 0x799532c4

    invoke-direct {v2, v3, v1, v8}, Lue5;-><init>(ILjava/lang/Object;Z)V

    move-object/from16 v1, v18

    invoke-virtual {v0, v9, v1, v10, v2}, Lh6c;->P(ILkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lue5;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_408
    check-cast v0, Lu5c;

    check-cast v12, Lj5c;

    check-cast v11, Lhkk;

    check-cast v10, Lxsg;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    new-instance v1, Ltn;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v12, v1, Ltn;->b:Ljava/lang/Object;

    iput-object v11, v1, Ltn;->c:Ljava/lang/Object;

    iput-object v10, v1, Ltn;->d:Ljava/lang/Object;

    iput-boolean v8, v1, Ltn;->a:Z

    iput-object v1, v0, Lu5c;->c:Ltn;

    new-instance v1, Lci;

    const/16 v2, 0xa

    invoke-direct {v1, v0, v2}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_42b
    check-cast v0, Lafe;

    check-cast v12, Ld7b;

    check-cast v11, Lmqh;

    check-cast v10, Lnx5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liak;

    if-eqz v0, :cond_44e

    invoke-interface {v0}, Liak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v3

    goto :goto_44f

    :cond_44e
    move-wide v3, v1

    :goto_44f
    iget-wide v5, v12, Ld7b;->c:J

    iget-object v0, v12, Ld7b;->a:Ldfe;

    const-wide/high16 v13, -0x8000000000000000L

    cmp-long v5, v5, v13

    if-eqz v5, :cond_467

    iget v5, v11, Lmqh;->a:F

    invoke-interface {v10}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object v6

    invoke-static {v6}, Lmfh;->p(Lkotlin/coroutines/CoroutineContext;)F

    move-result v6

    cmpg-float v5, v5, v6

    if-eqz v5, :cond_483

    :cond_467
    iput-wide v1, v12, Ld7b;->c:J

    iget-object v1, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v2, v0, Ldfe;->c:I

    const/4 v5, 0x0

    :goto_46e
    if-ge v5, v2, :cond_479

    aget-object v6, v1, v5

    check-cast v6, Lb7b;

    iput-boolean v8, v6, Lb7b;->f:Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_46e

    :cond_479
    invoke-interface {v10}, Lnx5;->l()Lkotlin/coroutines/CoroutineContext;

    move-result-object v1

    invoke-static {v1}, Lmfh;->p(Lkotlin/coroutines/CoroutineContext;)F

    move-result v1

    iput v1, v11, Lmqh;->a:F

    :cond_483
    iget v1, v11, Lmqh;->a:F

    const/4 v2, 0x0

    cmpg-float v2, v1, v2

    if-nez v2, :cond_4a3

    iget-object v1, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    const/4 v6, 0x0

    :goto_48f
    if-ge v6, v0, :cond_4f2

    aget-object v2, v1, v6

    check-cast v2, Lb7b;

    iget-object v3, v2, Lb7b;->d:Lecl;

    iget-object v3, v3, Lecl;->c:Ljava/lang/Object;

    iget-object v4, v2, Lb7b;->c:Lt0g;

    invoke-virtual {v4, v3}, Lt0g;->setValue(Ljava/lang/Object;)V

    iput-boolean v8, v2, Lb7b;->f:Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_48f

    :cond_4a3
    iget-wide v5, v12, Ld7b;->c:J

    sub-long/2addr v3, v5

    long-to-float v2, v3

    div-float/2addr v2, v1

    float-to-long v1, v2

    iget-object v3, v0, Ldfe;->a:[Ljava/lang/Object;

    iget v0, v0, Ldfe;->c:I

    move v5, v8

    const/4 v4, 0x0

    :goto_4af
    if-ge v4, v0, :cond_4e8

    aget-object v6, v3, v4

    check-cast v6, Lb7b;

    iget-boolean v7, v6, Lb7b;->e:Z

    if-nez v7, :cond_4e2

    iget-object v7, v6, Lb7b;->h:Ld7b;

    iget-object v7, v7, Ld7b;->b:Lt0g;

    sget-object v9, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v9}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-boolean v7, v6, Lb7b;->f:Z

    if-eqz v7, :cond_4cb

    const/4 v7, 0x0

    iput-boolean v7, v6, Lb7b;->f:Z

    iput-wide v1, v6, Lb7b;->g:J

    :cond_4cb
    iget-wide v9, v6, Lb7b;->g:J

    sub-long v9, v1, v9

    iget-object v7, v6, Lb7b;->d:Lecl;

    invoke-virtual {v7, v9, v10}, Lecl;->g(J)Ljava/lang/Object;

    move-result-object v7

    iget-object v11, v6, Lb7b;->c:Lt0g;

    invoke-virtual {v11, v7}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object v7, v6, Lb7b;->d:Lecl;

    invoke-interface {v7, v9, v10}, Lme1;->d(J)Z

    move-result v7

    iput-boolean v7, v6, Lb7b;->e:Z

    :cond_4e2
    if-nez v7, :cond_4e5

    const/4 v5, 0x0

    :cond_4e5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4af

    :cond_4e8
    xor-int/2addr v5, v8

    iget-object v0, v12, Ld7b;->d:Lt0g;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lt0g;->setValue(Ljava/lang/Object;)V

    :cond_4f2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_4f5
    check-cast v0, Lev7;

    check-cast v12, Lhri;

    check-cast v11, Lx83;

    check-cast v10, Lgri;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    iget-object v2, v0, Lev7;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    invoke-virtual {v2, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lgri;

    if-eqz v3, :cond_53c

    iget-object v0, v0, Lev7;->f:Ljava/lang/Object;

    check-cast v0, Lvs;

    iget-object v0, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/chip/ChipGroup;

    invoke-virtual {v0, v11}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    if-eq v0, v4, :cond_52b

    iget-wide v4, v3, Lgri;->a:J

    const-wide/16 v6, -0x1

    cmp-long v0, v4, v6

    if-eqz v0, :cond_52b

    iget-wide v6, v10, Lgri;->a:J

    cmp-long v0, v4, v6

    if-nez v0, :cond_52b

    move-object v9, v3

    goto :goto_52c

    :cond_52b
    const/4 v9, 0x0

    :goto_52c
    if-eqz v9, :cond_53c

    sget-object v0, Lfri;->a:Lfri;

    const/16 v0, 0x1cf

    invoke-static {v9, v1, v0}, Lgri;->a(Lgri;Landroid/graphics/drawable/Drawable;I)Lgri;

    move-result-object v0

    invoke-interface {v2, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v11, v0}, Lx83;->p(Lgri;)V

    :cond_53c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_53f
    check-cast v0, Ljava/util/List;

    check-cast v12, Lkotlin/jvm/functions/Function1;

    check-cast v11, Lafe;

    check-cast v10, Lafe;

    move-object/from16 v1, p1

    check-cast v1, Lh6c;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-instance v3, Lfy5;

    const/4 v7, 0x0

    invoke-direct {v3, v0, v7}, Lfy5;-><init>(Ljava/util/List;B)V

    new-instance v4, Lgy5;

    invoke-direct {v4, v0, v12, v11, v10}, Lgy5;-><init>(Ljava/util/List;Lkotlin/jvm/functions/Function1;Lafe;Lafe;)V

    new-instance v0, Lue5;

    const v5, 0x1c35d92f

    invoke-direct {v0, v5, v4, v8}, Lue5;-><init>(ILjava/lang/Object;Z)V

    invoke-static {v1, v2, v3, v0}, Lh6c;->Q(Lh6c;ILkotlin/jvm/functions/Function1;Lue5;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_568
    check-cast v0, Lgbc;

    check-cast v12, Lajl;

    check-cast v11, Lmil;

    check-cast v10, Lk0b;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    invoke-virtual {v0}, Lgbc;->b()Z

    move-result v1

    if-eqz v1, :cond_59f

    iget-object v1, v0, Lgbc;->d:Lc37;

    iget-object v2, v0, Lgbc;->v:Llw5;

    iget-object v3, v0, Lgbc;->w:Llw5;

    new-instance v4, Lpqh;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v5, Ltmi;

    const/16 v6, 0xd

    invoke-direct {v5, v1, v2, v4, v6}, Ltmi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v12, Lajl;->a:Lchg;

    invoke-interface {v1, v11, v10, v5, v3}, Lchg;->a(Lmil;Lk0b;Ltmi;Llw5;)V

    new-instance v2, Ldjl;

    invoke-direct {v2, v12, v1}, Ldjl;-><init>(Lajl;Lchg;)V

    iget-object v1, v12, Lajl;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iput-object v2, v4, Lpqh;->a:Ljava/lang/Object;

    iput-object v2, v0, Lgbc;->e:Ldjl;

    :cond_59f
    new-instance v0, Lt91;

    invoke-direct {v0, v7}, Lt91;-><init>(B)V

    return-object v0

    :pswitch_5a5
    check-cast v0, Liy1;

    check-cast v12, Ljava/lang/String;

    check-cast v11, Ljava/io/File;

    check-cast v10, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Loy1;

    if-eqz v1, :cond_5bb

    sget-object v3, Lhy1;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v4, v3, v1

    :cond_5bb
    if-eq v4, v8, :cond_5d2

    if-eq v4, v7, :cond_5ca

    if-eq v4, v5, :cond_5ca

    if-ne v4, v2, :cond_5c5

    const/4 v9, 0x0

    goto :goto_5d9

    :cond_5c5
    invoke-static {}, Lh9o;->p()V

    const/4 v9, 0x0

    goto :goto_5ef

    :cond_5ca
    const v1, 0x7f140800

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    goto :goto_5d9

    :cond_5d2
    const v1, 0x7f1406c2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_5d9
    if-eqz v9, :cond_5ea

    invoke-virtual {v0, v12, v8}, Liy1;->g(Ljava/lang/String;Z)V

    iget-object v0, v0, Liy1;->h:Lgy1;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-interface {v0, v1}, Lgy1;->o(I)V

    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_5ef

    :cond_5ea
    invoke-virtual {v0, v11, v12, v10}, Liy1;->i(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_5ef
    return-object v9

    :pswitch_5f0
    check-cast v0, Laog;

    check-cast v12, Lkotlin/jvm/functions/Function0;

    check-cast v11, Lgog;

    check-cast v10, Ld2c;

    move-object/from16 v1, p1

    check-cast v1, Lvb7;

    iget-object v1, v0, Laog;->m:Landroid/view/WindowManager;

    iget-object v2, v0, Laog;->n:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v1, v0, v2}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v0, v12, v11, v10}, Laog;->p(Lkotlin/jvm/functions/Function0;Lgog;Ld2c;)V

    new-instance v1, Lci;

    invoke-direct {v1, v0, v7}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object v1

    :pswitch_60c
    check-cast v0, Lpqh;

    check-cast v12, Lya9;

    check-cast v11, Lddc;

    check-cast v10, Lfb9;

    move-object/from16 v1, p1

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_62b

    iget-object v1, v0, Lpqh;->a:Ljava/lang/Object;

    if-nez v1, :cond_63f

    invoke-static {v12, v11, v10}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    move-result-object v1

    iput-object v1, v0, Lpqh;->a:Ljava/lang/Object;

    goto :goto_63f

    :cond_62b
    sget-object v2, Log;->a:Log;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_642

    iget-object v1, v0, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Lunb;

    const/4 v2, 0x0

    if-eqz v1, :cond_63d

    invoke-interface {v1, v2}, Lunb;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_63d
    iput-object v2, v0, Lpqh;->a:Ljava/lang/Object;

    :cond_63f
    :goto_63f
    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_647

    :cond_642
    const/4 v2, 0x0

    invoke-static {}, Lh9o;->p()V

    move-object v9, v2

    :goto_647
    return-object v9

    :pswitch_data_648
    .packed-switch 0x0
        :pswitch_60c
        :pswitch_5f0
        :pswitch_5a5
        :pswitch_568
        :pswitch_53f
        :pswitch_4f5
        :pswitch_42b
        :pswitch_408
        :pswitch_3d7
        :pswitch_387
        :pswitch_335
        :pswitch_2e1
        :pswitch_29c
        :pswitch_21b
        :pswitch_147
        :pswitch_107
        :pswitch_ca
        :pswitch_8b
    .end packed-switch
.end method
