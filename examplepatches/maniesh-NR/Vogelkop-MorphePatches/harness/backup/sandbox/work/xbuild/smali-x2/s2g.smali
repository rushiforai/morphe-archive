.class public final synthetic Ls2g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5

    .line 16
    iput-byte p1, p0, Ls2g;->a:B

    iput-object p2, p0, Ls2g;->b:Ljava/lang/Object;

    iput-object p4, p0, Ls2g;->d:Ljava/lang/Object;

    iput-object p3, p0, Ls2g;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lg0h;Ljava/lang/String;Llag;Lkag;)V
    .registers 5

    .line 14
    const/4 p1, 0x2

    iput-byte p1, p0, Ls2g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ls2g;->d:Ljava/lang/Object;

    iput-object p3, p0, Ls2g;->b:Ljava/lang/Object;

    iput-object p4, p0, Ls2g;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    .line 15
    iput-byte p4, p0, Ls2g;->a:B

    iput-object p1, p0, Ls2g;->b:Ljava/lang/Object;

    iput-object p2, p0, Ls2g;->c:Ljava/lang/Object;

    iput-object p3, p0, Ls2g;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lshf;Lbha;)V
    .registers 5

    const/16 v0, 0x9

    iput-byte v0, p0, Ls2g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls2g;->d:Ljava/lang/Object;

    iput-object p2, p0, Ls2g;->b:Ljava/lang/Object;

    iput-object p3, p0, Ls2g;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Ls2g;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, v0, Ls2g;->d:Ljava/lang/Object;

    iget-object v6, v0, Ls2g;->c:Ljava/lang/Object;

    iget-object v0, v0, Ls2g;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_3bc

    check-cast v0, Lp12;

    check-cast v6, Lp94;

    check-cast v5, Ln1;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/lang/ref/WeakReference;

    iget-object v3, v0, Lp12;->d:Ljava/lang/Object;

    check-cast v3, Leej;

    new-instance v4, Lqsh;

    iget-object v7, v0, Lp12;->f:Ljava/lang/Object;

    check-cast v7, Lx5f;

    const/16 v8, 0xc

    invoke-direct {v4, v5, v7, v8}, Lqsh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lv4g;

    invoke-direct {v5, v6, v4, v1}, Lv4g;-><init>(Lp94;Lqsh;Landroid/graphics/Bitmap;)V

    iget-object v1, v3, Leej;->a:Lnej;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lijm;->b:Lijm;

    invoke-virtual {v1, v5, v3}, Lr22;->b(Ljjm;Lijm;)V

    invoke-direct {v2, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Lp12;->h:Ljava/lang/Object;

    return-void

    :pswitch_46
    check-cast v0, Ll45;

    check-cast v6, Landroid/content/Context;

    check-cast v5, Lilm;

    move-object/from16 v1, p1

    check-cast v1, Lqmn;

    new-instance v2, Lwtm;

    invoke-direct {v2, v4, v0, v6, v5}, Lwtm;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lqmn;->a(Lnmn;)V

    return-void

    :pswitch_59
    check-cast v0, Ljvg;

    check-cast v6, Landroid/view/View;

    check-cast v5, Lqf;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v6}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_91

    invoke-virtual {v5}, Ldej;->b()V

    iget-object v0, v0, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lbmn;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    new-instance v5, Lcmn;

    const/4 v8, 0x0

    const/4 v9, 0x5

    const/4 v6, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-object v1, v0, Lbmn;->i:Lgjm;

    new-instance v2, Ldmn;

    iget-byte v0, v0, Lbmn;->a:B

    const/4 v3, 0x2

    if-ne v0, v3, :cond_89

    sget-object v0, Lwln;->c:Lwln;

    goto :goto_8b

    :cond_89
    sget-object v0, Lwln;->c:Lwln;

    :goto_8b
    invoke-direct {v2, v0, v5}, Ldmn;-><init>(Lwln;Lcmn;)V

    invoke-virtual {v1, v2, v4}, Lgjm;->e(Ln37;Z)V

    :cond_91
    return-void

    :pswitch_92
    check-cast v0, Lbmn;

    check-cast v5, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ldnn;

    new-instance v2, Loam;

    invoke-direct {v2, v0, v5, v6}, Loam;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_a5
    check-cast v0, Lvq8;

    check-cast v6, Ljava/util/Set;

    check-cast v5, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {v2, v1}, Ljava/util/stream/Stream;->concat(Ljava/util/stream/Stream;Ljava/util/stream/Stream;)Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lnn;

    invoke-direct {v2, v0}, Lnn;-><init>(Lvq8;)V

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lmn;

    const/16 v2, 0x19

    invoke-direct {v1, v2}, Lmn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lnn;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lnn;-><init>(B)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-interface {v5, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_e8
    move-object v7, v0

    check-cast v7, Lc8l;

    move-object v10, v6

    check-cast v10, Ld7l;

    move-object v9, v5

    check-cast v9, Lrv3;

    move-object/from16 v0, p1

    check-cast v0, Lyni;

    if-eqz v0, :cond_fd

    new-instance v1, Ls7l;

    invoke-direct {v1, v0}, Ls7l;-><init>(Lyni;)V

    goto :goto_ff

    :cond_fd
    sget-object v1, Lr7l;->b:Lr7l;

    :goto_ff
    invoke-interface {v10}, Lb9l;->T()Lp6l;

    move-result-object v2

    invoke-virtual {v7, v2}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object v8

    iget-object v2, v10, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getId()I

    move-result v2

    invoke-virtual {v9, v2, v1}, Lrv3;->a(ILdyg;)V

    if-eqz v0, :cond_18c

    iget-object v1, v0, Lyni;->a:Landroid/graphics/Bitmap;

    new-instance v2, Lx7l;

    iget-object v5, v10, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getId()I

    move-result v5

    iget-object v6, v7, Lc8l;->a:Landroid/content/Context;

    invoke-static {v6}, Lf03;->I(Landroid/content/Context;)Z

    move-result v6

    xor-int/lit8 v15, v6, 0x1

    const v3, 0x3f266666    # 0.65f

    invoke-virtual {v7, v3, v1}, Lc8l;->a(FLandroid/graphics/Bitmap;)Landroid/util/Size;

    move-result-object v3

    new-instance v11, Ll7l;

    const-string v6, "med"

    invoke-static {v5, v6}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    move-result v13

    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    move-result v14

    iget v3, v0, Lyni;->b:F

    move/from16 v16, v3

    invoke-direct/range {v11 .. v16}, Ll7l;-><init>(Ljava/lang/String;IIZF)V

    move-object v3, v11

    const v6, 0x3e4ccccd    # 0.2f

    invoke-virtual {v7, v6, v1}, Lc8l;->a(FLandroid/graphics/Bitmap;)Landroid/util/Size;

    move-result-object v1

    new-instance v11, Ll7l;

    const-string v6, "min"

    invoke-static {v5, v6}, Lu35;->g(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v13

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v14

    iget v1, v0, Lyni;->b:F

    move/from16 v16, v1

    invoke-direct/range {v11 .. v16}, Ll7l;-><init>(Ljava/lang/String;IIZF)V

    new-instance v1, Lm7l;

    invoke-direct {v1, v5, v3, v11}, Lm7l;-><init>(ILl7l;Ll7l;)V

    invoke-direct {v2, v8, v0, v1}, Lx7l;-><init>(Lmcj;Lyni;Lm7l;)V

    new-instance v6, Lrg;

    const/16 v11, 0x10

    invoke-direct/range {v6 .. v11}, Lrg;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v7, Lc8l;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v7, Lc8l;->b:Lumi;

    new-instance v1, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v3, v0}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v0, Lq7l;

    invoke-direct {v0, v7, v2, v6, v4}, Lq7l;-><init>(Lc8l;Lx7l;Lrg;B)V

    invoke-virtual {v1, v0}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    iget-object v1, v7, Lc8l;->f:Lqie;

    invoke-virtual {v0, v1}, Lplk;->m(Lqie;)Lp1j;

    :cond_18c
    return-void

    :pswitch_18d
    check-cast v0, Lxbf;

    check-cast v6, Lfxk;

    check-cast v5, Lvr9;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_1ae

    iget-object v0, v0, Lxbf;->d:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lglh;

    iget-object v0, v6, Lfxk;->a:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v6, Lfxk;->c:Ljava/lang/String;

    iget-object v10, v6, Lfxk;->b:Ljava/lang/String;

    const-wide/16 v11, -0x1

    const/4 v13, 0x0

    invoke-virtual/range {v7 .. v13}, Lglh;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLxx1;)V

    :cond_1ae
    invoke-virtual {v5}, Lvr9;->run()V

    return-void

    :pswitch_1b2
    check-cast v5, Ljava/lang/String;

    check-cast v0, Lshf;

    check-cast v6, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v7, Lrma;

    const/4 v8, 0x4

    invoke-direct {v7, v8}, Lrma;-><init>(B)V

    invoke-virtual {v7, v1, v2}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v7}, Lrma;->d()Lhra;

    move-result-object v1

    const-string v2, "api/v1/subscriptions/"

    invoke-virtual {v1, v2}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object v1

    if-eqz v1, :cond_20c

    new-instance v2, Lfvh;

    invoke-direct {v2}, Lfvh;-><init>()V

    iput-object v1, v2, Lfvh;->a:Lhra;

    const-string v1, "Bearer "

    invoke-virtual {v1, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "Authorization"

    invoke-virtual {v2, v5, v1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lkvh;

    invoke-direct {v1, v2}, Lkvh;-><init>(Lfvh;)V

    iget-object v2, v0, Lshf;->c:Ljava/lang/Object;

    check-cast v2, Lii;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt9f;

    invoke-virtual {v2, v1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object v1

    new-instance v2, Lgnk;

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v5, Lb94;

    invoke-direct {v5, v0, v6, v4}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v5, v4, v3}, Lgnk;-><init>(Lb94;ZB)V

    invoke-interface {v1, v2}, Lv84;->enqueue(Lf94;)V

    goto :goto_211

    :cond_20c
    const-string v0, "Required value was null."

    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_211
    return-void

    :pswitch_212
    check-cast v0, Lslk;

    check-cast v5, Ljava/lang/String;

    check-cast v6, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Lh0d;

    iget-object v0, v0, Lslk;->c:Lpy9;

    invoke-virtual {v0, v1, v5, v6}, Lpy9;->b(Lh0d;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void

    :pswitch_222
    check-cast v0, Lslk;

    check-cast v6, Lu3k;

    check-cast v5, Lbha;

    move-object/from16 v1, p1

    check-cast v1, Lh4k;

    instance-of v4, v1, Lf4k;

    if-eqz v4, :cond_25e

    iget-object v4, v0, Lslk;->e:Lzkk;

    iget v6, v6, Lu3k;->c:I

    iget-object v4, v4, Lzkk;->a:Lx5f;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    iget-object v9, v4, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v10

    new-instance v11, Lck0;

    invoke-direct {v11, v9, v10}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v11}, Lck0;->i()Lbt0;

    move-result-object v9

    iget-object v11, v9, Lbt0;->a:Le66;

    const/16 v12, 0x1b

    invoke-virtual {v11, v12, v3, v7, v8}, Ljf0;->p(IIJ)V

    int-to-long v6, v6

    iget-object v8, v9, Lbt0;->a:Le66;

    const/16 v9, 0x1c

    invoke-virtual {v8, v9, v3, v6, v7}, Ljf0;->p(IIJ)V

    invoke-virtual {v4, v10}, Lx5f;->U0(Lx56;)V

    invoke-virtual {v0, v2}, Lslk;->b(Ljava/lang/Runnable;)V

    :cond_25e
    invoke-virtual {v5, v1}, Lbha;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_262
    check-cast v0, Lw6j;

    check-cast v6, Lozj;

    check-cast v5, Ljava/util/concurrent/atomic/AtomicInteger;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v3, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast v3, Landroid/util/SparseBooleanArray;

    invoke-interface {v6}, Lozj;->b()I

    move-result v4

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v3, v4, v1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v1

    if-nez v1, :cond_293

    iget-object v1, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v1, Lmni;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v1, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    if-eqz v1, :cond_293

    invoke-interface {v1, v3}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    iput-object v2, v0, Lw6j;->b:Ljava/lang/Object;

    :cond_293
    return-void

    :pswitch_294
    check-cast v0, Lolh;

    check-cast v6, Lcom/opera/android/settings/SettingsManager;

    check-cast v5, Landroid/net/Uri;

    move-object/from16 v1, p1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "offline_pages_location"

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v2, v4}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c3

    iget-object v0, v0, Lolh;->a:Lglh;

    iget-object v0, v0, Lglh;->f:Lsyd;

    iget-boolean v1, v0, Lsyd;->f:Z

    if-eqz v1, :cond_2c3

    iget-object v1, v0, Lsyd;->c:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-virtual {v0, v1, v3}, Lsyd;->a(Landroid/content/SharedPreferences;Z)V

    :cond_2c3
    return-void

    :pswitch_2c4
    check-cast v0, Lsjh;

    check-cast v6, Lz1i;

    move-object v15, v5

    check-cast v15, Ljava/lang/Long;

    move-object/from16 v1, p1

    check-cast v1, Lpjh;

    iget-object v5, v1, Lpjh;->b:Leo0;

    sget-object v7, Leo0;->e:Leo0;

    if-eq v5, v7, :cond_2e8

    iget-object v5, v0, Lsjh;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {v5}, Ltjh;->a(Landroid/content/Context;)Ltjh;

    move-result-object v5

    iget-object v5, v5, Ltjh;->a:Lb59;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const-string v7, "hasRated"

    invoke-static {v5, v7, v3}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_2e8
    iget-object v9, v1, Lpjh;->a:Lee0;

    iget-object v8, v1, Lpjh;->b:Leo0;

    iget-object v5, v1, Lpjh;->c:Ljava/lang/String;

    iget-object v1, v1, Lpjh;->d:Ljava/lang/Integer;

    iget-object v7, v0, Lsjh;->d:Lorm;

    iget-object v10, v0, Lsjh;->h:Lxi5;

    invoke-virtual {v10}, Lxi5;->b()J

    move-result-wide v10

    iget-object v12, v0, Lsjh;->i:Loji;

    iget-object v12, v12, Loji;->a:Ljava/lang/Object;

    check-cast v12, Lb59;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/content/SharedPreferences;

    const-string v13, "TOTAL_PAGE_LOADS"

    invoke-interface {v12, v13, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    int-to-long v12, v12

    if-eqz v6, :cond_30f

    move v14, v3

    goto :goto_310

    :cond_30f
    move v14, v4

    :goto_310
    if-eqz v1, :cond_31b

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    :cond_31b
    move-object/from16 v16, v2

    sget-object v17, Lho0;->b:Lho0;

    check-cast v7, Lx5f;

    invoke-virtual/range {v7 .. v17}, Lx5f;->u0(Leo0;Lee0;JJZLjava/lang/Long;Ljava/lang/Long;Lho0;)V

    iget-object v0, v0, Lsjh;->e:Lskm;

    check-cast v0, Lx5f;

    invoke-virtual {v0, v5}, Lx5f;->t0(Ljava/lang/String;)V

    return-void

    :pswitch_32c
    check-cast v0, Lueh;

    check-cast v6, Landroid/net/Uri;

    check-cast v5, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lre7;

    iget-object v0, v0, Lueh;->A:Lnqi;

    invoke-virtual {v0, v6, v5}, Lnqi;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_33c
    move-object v9, v5

    check-cast v9, Ljava/lang/String;

    move-object v10, v0

    check-cast v10, Llag;

    move-object v11, v6

    check-cast v11, Lkag;

    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_356

    sget-object v7, Ls9g;->h:Ls9g;

    const/4 v8, 0x0

    const/4 v12, 0x1

    invoke-virtual/range {v7 .. v12}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_356
    return-void

    :pswitch_357
    check-cast v0, Lp3g;

    check-cast v6, Lq3g;

    check-cast v5, Ltu;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    :try_start_361
    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    new-instance v4, Ld82;

    invoke-direct {v4, v2, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lo5f;

    invoke-direct {v2, v0, v6}, Lo5f;-><init>(Lp3g;Lq3g;)V

    invoke-static {v4, v2}, Ly1j;->c(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)Lv39;

    move-result-object v2

    new-instance v3, Lm3g;

    invoke-direct {v3, v0, v1}, Lm3g;-><init>(Lp3g;La4g;)V

    new-instance v0, Lm2m;

    invoke-direct {v0, v2, v3}, Lm2m;-><init>(Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function1;)V

    invoke-static {v0}, Ly1j;->g(Lkotlin/sequences/Sequence;)Ljava/util/List;

    move-result-object v0
    :try_end_385
    .catch Ljava/lang/IllegalArgumentException; {:try_start_361 .. :try_end_385} :catch_386

    goto :goto_388

    :catch_386
    sget-object v0, Ll08;->a:Ll08;

    :goto_388
    new-instance v2, Lo3g;

    invoke-direct {v2, v0}, Lo3g;-><init>(Ljava/util/List;)V

    invoke-virtual {v5, v2}, Ltu;->run(Ljava/lang/Object;)V

    invoke-virtual {v1}, La4g;->a()V

    return-void

    :pswitch_394
    move-object v7, v0

    check-cast v7, Lx79;

    move-object v8, v6

    check-cast v8, Lr2g;

    move-object v10, v5

    check-cast v10, Ljava/lang/String;

    move-object/from16 v9, p1

    check-cast v9, Ljava/lang/String;

    if-nez v9, :cond_3aa

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8, v2}, Lr2g;->run(Ljava/lang/Object;)V

    goto :goto_3bb

    :cond_3aa
    iget-object v0, v7, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-static {v0}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v11

    new-instance v6, Li61;

    const/4 v12, 0x6

    invoke-direct/range {v6 .. v12}, Li61;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v11, v6}, Lno7;->b(Ljava/lang/Runnable;)V

    :goto_3bb
    return-void

    :pswitch_data_3bc
    .packed-switch 0x0
        :pswitch_394
        :pswitch_357
        :pswitch_33c
        :pswitch_32c
        :pswitch_2c4
        :pswitch_294
        :pswitch_262
        :pswitch_222
        :pswitch_212
        :pswitch_1b2
        :pswitch_18d
        :pswitch_e8
        :pswitch_a5
        :pswitch_92
        :pswitch_59
        :pswitch_46
    .end packed-switch
.end method
