.class public final Lxvo;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# static fields
.field public static final j:Lxvo;

.field public static final k:Lxvo;

.field public static final l:Lxvo;

.field public static final m:Lxvo;

.field public static final n:Lxvo;

.field public static final o:Lxvo;

.field public static final p:Lxvo;

.field public static final q:Lxvo;

.field public static final r:Lxvo;

.field public static final s:Lxvo;

.field public static final t:Lxvo;

.field public static final u:Lxvo;


# instance fields
.field public final synthetic i:B


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 3

    new-instance v0, Lxvo;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->j:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->k:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x2

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->l:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x3

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->m:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x4

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->n:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x5

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->o:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x6

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->p:Lxvo;

    new-instance v0, Lxvo;

    const/4 v2, 0x7

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->q:Lxvo;

    new-instance v0, Lxvo;

    const/16 v2, 0x8

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->r:Lxvo;

    new-instance v0, Lxvo;

    const/16 v2, 0x9

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->s:Lxvo;

    new-instance v0, Lxvo;

    const/16 v2, 0xa

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->t:Lxvo;

    new-instance v0, Lxvo;

    const/16 v2, 0xb

    invoke-direct {v0, v2, v1}, Lxvo;-><init>(BI)V

    sput-object v0, Lxvo;->u:Lxvo;

    return-void
.end method

.method public synthetic constructor <init>(BI)V
    .registers 3

    .line 9
    iput-byte p1, p0, Lxvo;->i:B

    invoke-direct {p0, p2}, Lozb;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Landroidx/work/Worker;)V
    .registers 2

    const/16 p1, 0xc

    iput-byte p1, p0, Lxvo;->i:B

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 31

    move-object/from16 v0, p0

    iget-byte v0, v0, Lxvo;->i:B

    const/16 v1, 0xf

    const/16 v2, 0xa

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_222

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Expedited WorkRequests require a Worker to provide an implementation for `getForegroundInfo()`"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_15
    filled-new-array {v4}, [I

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v3, v3, v1}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :pswitch_20
    sget-object v0, Lwlp;->d:Lwlp;

    sget-object v1, Lwlp;->e:Lwlp;

    sget-object v3, Lwlp;->f:Lwlp;

    sget-object v4, Lwlp;->g:Lwlp;

    sget-object v5, Lwlp;->h:Lwlp;

    sget-object v6, Lwlp;->i:Lwlp;

    filled-new-array {v1, v3, v4, v5, v6}, [Lwlp;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/EnumSet;->of(Ljava/lang/Enum;[Ljava/lang/Enum;)Ljava/util/EnumSet;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_41
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_53

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwlp;

    iget-object v2, v2, Lwlp;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_41

    :cond_53
    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    return-object v0

    :pswitch_58
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_61
    sget-object v0, Lp9p;->k:Lp9p;

    sget-object v1, Lrpb;->d:Lqpb;

    invoke-static {v1, v0}, Lphj;->o(Lrpb;Lkotlin/jvm/functions/Function1;)Lcrb;

    move-result-object v0

    return-object v0

    :pswitch_6a
    sget-object v0, Lesd;->e:Lkotlin/text/Regex;

    const-string v0, "application/json; charset=utf-8"

    invoke-static {v0}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v0

    return-object v0

    :pswitch_73
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sget-object v2, Lfko;->a:Lejo;

    new-instance v2, Llmo;

    new-instance v3, Lqqo;

    invoke-direct {v3, v0, v1}, Lqqo;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v2, v3, v4}, Llmo;-><init>(Lkotlin/jvm/functions/Function0;B)V

    sget-object v1, Lfko;->b:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    return-object v0

    :pswitch_8a
    invoke-static {}, Lpfp;->b()Z

    new-instance v0, Lz8p;

    invoke-direct {v0}, Lz8p;-><init>()V

    return-object v0

    :pswitch_93
    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Lmr6;->b:Lmr6;

    const/4 v0, 0x0

    sget-object v1, Lkmm;->b:Lkmm;

    invoke-virtual {v1, v3, v0}, Lkmm;->K(ILjava/lang/String;)Ldx5;

    move-result-object v0

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    return-object v0

    :pswitch_a7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_b5
    move v0, v1

    new-instance v1, Lyqi;

    const-class v5, Lp8p;

    invoke-static {v5}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v5

    const-class v6, Lxjo;

    invoke-static {v6}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v6

    const-class v7, Lsoo;

    invoke-static {v7}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v7

    const-class v8, Lrro;

    invoke-static {v8}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v8

    const-class v9, Lqxo;

    invoke-static {v9}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v9

    const-class v10, Lizo;

    invoke-static {v10}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v10

    const-class v11, Li1p;

    invoke-static {v11}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v11

    const-class v12, Lx2p;

    invoke-static {v12}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v12

    const-class v13, Lr5p;

    invoke-static {v13}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v13

    const-class v14, Lb9p;

    invoke-static {v14}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v14

    const-class v15, Lcap;

    invoke-static {v15}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v15

    const-class v16, Lebp;

    invoke-static/range {v16 .. v16}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v16

    const-class v17, Lbdp;

    invoke-static/range {v17 .. v17}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v17

    const-class v18, Ltep;

    invoke-static/range {v18 .. v18}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v18

    const-class v19, Lwfp;

    invoke-static/range {v19 .. v19}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v19

    const-class v20, Lfnp;

    invoke-static/range {v20 .. v20}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v20

    const-class v21, Lnio;

    invoke-static/range {v21 .. v21}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v21

    const-class v22, Lc1p;

    invoke-static/range {v22 .. v22}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v22

    const-class v23, Ln8p;

    invoke-static/range {v23 .. v23}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v23

    const-class v24, Lacp;

    invoke-static/range {v24 .. v24}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v24

    const-class v25, Lxcp;

    invoke-static/range {v25 .. v25}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v25

    const-class v26, Lrdp;

    invoke-static/range {v26 .. v26}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v26

    const-class v27, Lqep;

    invoke-static/range {v27 .. v27}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v27

    const-class v28, Lqfp;

    invoke-static/range {v28 .. v28}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v28

    move/from16 p0, v0

    const/16 v0, 0x17

    move/from16 v29, v2

    new-array v2, v0, [Litb;

    aput-object v6, v2, v4

    aput-object v7, v2, v3

    const/4 v6, 0x2

    aput-object v8, v2, v6

    const/4 v7, 0x3

    aput-object v9, v2, v7

    const/4 v8, 0x4

    aput-object v10, v2, v8

    const/4 v9, 0x5

    aput-object v11, v2, v9

    const/4 v10, 0x6

    aput-object v12, v2, v10

    const/4 v11, 0x7

    aput-object v13, v2, v11

    const/16 v12, 0x8

    aput-object v14, v2, v12

    const/16 v13, 0x9

    aput-object v15, v2, v13

    aput-object v16, v2, v29

    const/16 v14, 0xb

    aput-object v17, v2, v14

    const/16 v15, 0xc

    aput-object v18, v2, v15

    const/16 v16, 0xd

    aput-object v19, v2, v16

    const/16 v17, 0xe

    aput-object v20, v2, v17

    aput-object v21, v2, p0

    const/16 v18, 0x10

    aput-object v22, v2, v18

    const/16 v19, 0x11

    aput-object v23, v2, v19

    const/16 v20, 0x12

    aput-object v24, v2, v20

    const/16 v21, 0x13

    aput-object v25, v2, v21

    const/16 v22, 0x14

    aput-object v26, v2, v22

    const/16 v23, 0x15

    aput-object v27, v2, v23

    const/16 v23, 0x16

    aput-object v28, v2, v23

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    sget-object v23, Lmgo;->a:Lmgo;

    aput-object v23, v0, v4

    sget-object v23, Lkmo;->a:Lkmo;

    aput-object v23, v0, v3

    sget-object v3, Llqo;->a:Llqo;

    aput-object v3, v0, v6

    sget-object v3, Lsvo;->a:Lsvo;

    aput-object v3, v0, v7

    sget-object v3, Loyo;->a:Loyo;

    aput-object v3, v0, v8

    sget-object v3, Ld0p;->a:Ld0p;

    aput-object v3, v0, v9

    sget-object v3, Lb2p;->a:Lb2p;

    aput-object v3, v0, v10

    sget-object v3, Lv3p;->a:Lv3p;

    aput-object v3, v0, v11

    sget-object v3, Lc8p;->a:Lc8p;

    aput-object v3, v0, v12

    sget-object v3, Lk9p;->a:Lk9p;

    aput-object v3, v0, v13

    sget-object v3, Luap;->a:Luap;

    aput-object v3, v0, v29

    sget-object v3, Lrcp;->a:Lrcp;

    aput-object v3, v0, v14

    sget-object v3, Lhep;->a:Lhep;

    aput-object v3, v0, v15

    sget-object v3, Lifp;->a:Lifp;

    aput-object v3, v0, v16

    sget-object v3, Lbnp;->a:Lbnp;

    aput-object v3, v0, v17

    sget-object v3, Ljio;->a:Ljio;

    aput-object v3, v0, p0

    sget-object v3, Lz0p;->a:Lz0p;

    aput-object v3, v0, v18

    sget-object v3, Ll8p;->a:Ll8p;

    aput-object v3, v0, v19

    sget-object v3, Lybp;->a:Lybp;

    aput-object v3, v0, v20

    sget-object v3, Lvcp;->a:Lvcp;

    aput-object v3, v0, v21

    sget-object v3, Lodp;->a:Lodp;

    aput-object v3, v0, v22

    sget-object v3, Lmep;->a:Lmep;

    const/16 v6, 0x15

    aput-object v3, v0, v6

    sget-object v3, Lnfp;->a:Lnfp;

    const/16 v6, 0x16

    aput-object v3, v0, v6

    new-array v6, v4, [Ljava/lang/annotation/Annotation;

    move-object v4, v2

    const-string v2, "com.opera.ads.internal.analytics.TrackEventImpl"

    move-object v3, v5

    move-object v5, v0

    invoke-direct/range {v1 .. v6}, Lyqi;-><init>(Ljava/lang/String;Ls15;[Litb;[Lkotlinx/serialization/KSerializer;[Ljava/lang/annotation/Annotation;)V

    return-object v1

    :pswitch_20b
    new-instance v0, Long;

    const-class v1, Lf4p;

    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v1

    new-array v2, v4, [Ljava/lang/annotation/Annotation;

    invoke-direct {v0, v1, v2}, Long;-><init>(Ls15;[Ljava/lang/annotation/Annotation;)V

    return-object v0

    :pswitch_219
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_data_222
    .packed-switch 0x0
        :pswitch_219
        :pswitch_20b
        :pswitch_b5
        :pswitch_a7
        :pswitch_93
        :pswitch_8a
        :pswitch_73
        :pswitch_6a
        :pswitch_61
        :pswitch_58
        :pswitch_20
        :pswitch_15
    .end packed-switch
.end method
