.class public final Loxo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Loxo;

.field public static final b:Ljava/util/List;

.field public static final c:Ljava/util/List;

.field public static final d:Ljava/util/List;

.field public static final e:Ljava/util/List;

.field public static final f:Lzyk;

.field public static final g:Ljava/util/List;

.field public static final h:Ljava/util/List;

.field public static final i:Lzyk;


# direct methods
.method static constructor <clinit>()V
    .registers 12

    new-instance v0, Loxo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Loxo;->a:Loxo;

    const/4 v0, 0x5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    filled-new-array {v3, v5}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->b:Ljava/util/List;

    const/16 v0, 0x140

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x1e0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lkotlin/Pair;

    invoke-direct {v2, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v4, Lkotlin/Pair;

    invoke-direct {v4, v1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    const/16 v0, 0x2d0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/16 v1, 0x438

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v6, Lkotlin/Pair;

    invoke-direct {v6, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    filled-new-array {v2, v4, v6}, [Lkotlin/Pair;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->c:Ljava/util/List;

    const-string v10, "image/webp"

    const-string v11, "text/html"

    const-string v6, "image/gif"

    const-string v7, "image/jpeg"

    const-string v8, "image/jpg"

    const-string v9, "image/png"

    filled-new-array/range {v6 .. v11}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->d:Ljava/util/List;

    const-string v0, "image/png"

    const-string v1, "image/webp"

    const-string v2, "image/gif"

    const-string v4, "image/jpeg"

    const-string v6, "image/jpg"

    filled-new-array {v2, v4, v6, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->e:Ljava/util/List;

    sget-object v0, La43;->M:La43;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Loxo;->f:Lzyk;

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v0, 0x6

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    filled-new-array/range {v1 .. v6}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->g:Ljava/util/List;

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0, v1, v2}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Loxo;->h:Ljava/util/List;

    sget-object v0, La43;->L:La43;

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    sput-object v0, Loxo;->i:Lzyk;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lhuo;
    .registers 8

    new-instance v5, Lxto;

    sget-object v0, Lynh;->c:Ljava/lang/String;

    sget-object v1, Lynh;->d:Ljava/lang/String;

    invoke-direct {v5, v0, v1}, Lxto;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lyro;->b(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lynh;->e:Ljava/lang/String;

    invoke-static {p0}, Lyro;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0}, Lyro;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_24

    new-instance p0, Lrto;

    invoke-direct {p0, v0}, Lrto;-><init>(Ljava/lang/String;)V

    :goto_22
    move-object v6, p0

    goto :goto_26

    :cond_24
    const/4 p0, 0x0

    goto :goto_22

    :goto_26
    new-instance v0, Lhuo;

    invoke-direct/range {v0 .. v6}, Lhuo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lxto;Lrto;)V

    return-object v0
.end method

.method public static b(Lwjo;I)Lmwo;
    .registers 4

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_6

    sget-object p0, Lwjo;->b:Lwjo;

    :cond_6
    new-instance p1, Lmwo;

    new-instance v0, Lqwo;

    iget-byte p0, p0, Lwjo;->a:B

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lqwo;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-direct {p1, v0}, Lmwo;-><init>(Lqwo;)V

    return-object p1
.end method

.method public static c(Landroid/content/Context;Z)Lwwo;
    .registers 4

    invoke-static {p0}, Luip;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz p1, :cond_14

    sget-object p1, Lr8p;->a:Ljava/util/List;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string p1, "IABTCF_TCString"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_15

    :cond_14
    move-object p0, v1

    :goto_15
    invoke-static {}, Laap;->f()Lz8p;

    move-result-object p1

    iget-object p1, p1, Lz8p;->K:Ljava/lang/String;

    if-eqz p1, :cond_22

    new-instance v1, Lzwo;

    invoke-direct {v1, p1}, Lzwo;-><init>(Ljava/lang/String;)V

    :cond_22
    new-instance p1, Lwwo;

    invoke-direct {p1, v0, p0, v1}, Lwwo;-><init>(Ljava/lang/String;Ljava/lang/String;Lzwo;)V

    return-object p1
.end method

.method public static d(Lsm;Leq;Ljava/lang/String;Ljava/lang/Boolean;)Lj1p;
    .registers 34

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v6, Lbwo;->a:[I

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v6, v6, v7

    sget-object v7, Loxo;->f:Lzyk;

    sget-object v8, Loxo;->b:Ljava/util/List;

    sget-object v9, Loxo;->d:Ljava/util/List;

    const/4 v10, 0x0

    const/4 v11, 0x0

    packed-switch v6, :pswitch_data_1be

    move/from16 v19, v2

    move v6, v10

    move-object v1, v11

    move-object/from16 v22, v1

    move-object/from16 v23, v22

    move-object/from16 v24, v23

    goto/16 :goto_16c

    :pswitch_2d
    new-instance v6, Ljava/util/ArrayList;

    const/16 v12, 0xa

    sget-object v13, Loxo;->c:Ljava/util/List;

    invoke-static {v13, v12}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v12

    invoke-direct {v6, v12}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_3e
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_67

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lkotlin/Pair;

    iget-object v15, v14, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v15, Ljava/lang/Number;

    invoke-virtual {v15}, Ljava/lang/Number;->intValue()I

    move-result v15

    iget-object v14, v14, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v14, Ljava/lang/Number;

    invoke-virtual {v14}, Ljava/lang/Number;->intValue()I

    move-result v14

    move/from16 v19, v2

    new-instance v2, Lo0p;

    invoke-direct {v2, v15, v14}, Lo0p;-><init>(II)V

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v2, v19

    goto :goto_3e

    :cond_67
    move/from16 v19, v2

    new-instance v2, Lk0p;

    invoke-direct {v2, v6, v9, v8}, Lk0p;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    move-object/from16 v17, v8

    new-instance v8, Ly0p;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    move-object v9, v6

    check-cast v9, Ljava/util/List;

    if-eqz v0, :cond_81

    iget-short v6, v0, Leq;->a:S

    iget-short v0, v0, Leq;->b:S

    :goto_7f
    move v12, v0

    goto :goto_9e

    :cond_81
    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    iget-object v0, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-interface {v13, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlin/Pair;

    iget-object v0, v0, Lkotlin/Pair;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    goto :goto_7f

    :goto_9e
    sget-object v0, Lsm;->f:Lsm;

    move-object/from16 v7, p0

    if-ne v7, v0, :cond_a6

    move v14, v10

    goto :goto_a8

    :cond_a6
    move/from16 v14, v19

    :goto_a8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b6

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_b4
    move-object v15, v0

    goto :goto_bf

    :cond_b6
    filled-new-array {v3, v5}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_b4

    :goto_bf
    const/4 v0, 0x7

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    sget-object v18, Loxo;->h:Ljava/util/List;

    move v0, v10

    sget-object v10, Loxo;->g:Ljava/util/List;

    const/4 v13, 0x5

    move/from16 v29, v6

    move v6, v0

    move-object v0, v11

    move/from16 v11, v29

    invoke-direct/range {v8 .. v18}, Ly0p;-><init>(Ljava/util/List;Ljava/util/List;IIIILjava/util/List;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;)V

    move-object v1, v0

    move-object/from16 v24, v1

    move-object/from16 v22, v2

    move-object/from16 v23, v8

    goto/16 :goto_16c

    :pswitch_dc
    move/from16 v19, v2

    move-object v2, v8

    move v6, v10

    move-object v8, v11

    if-eqz v0, :cond_140

    new-instance v10, Lk0p;

    new-instance v11, Lo0p;

    iget-short v12, v0, Leq;->a:S

    iget-short v13, v0, Leq;->b:S

    invoke-direct {v11, v12, v13}, Lo0p;-><init>(II)V

    invoke-static {v11}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    invoke-direct {v10, v11, v9, v2}, Lk0p;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    sget-object v9, Leq;->g:Ljava/util/Set;

    invoke-interface {v9, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_135

    move-object v9, v8

    new-instance v8, Ly0p;

    invoke-virtual {v7}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    iget-short v11, v0, Leq;->a:S

    iget-short v12, v0, Leq;->b:S

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_118

    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    :goto_116
    move-object v15, v0

    goto :goto_121

    :cond_118
    filled-new-array {v3, v5}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    goto :goto_116

    :goto_121
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/4 v13, 0x2

    const/4 v14, 0x0

    move-object v0, v10

    sget-object v10, Loxo;->g:Ljava/util/List;

    sget-object v18, Loxo;->h:Ljava/util/List;

    move-object/from16 v17, v2

    move-object v1, v9

    move-object v9, v7

    invoke-direct/range {v8 .. v18}, Ly0p;-><init>(Ljava/util/List;Ljava/util/List;IIIILjava/util/List;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;)V

    move-object v11, v8

    goto :goto_138

    :cond_135
    move-object v1, v8

    move-object v0, v10

    move-object v11, v1

    :goto_138
    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    move-object/from16 v29, v11

    move-object v11, v2

    move-object/from16 v2, v29

    goto :goto_144

    :cond_140
    move-object v1, v8

    move-object v0, v1

    move-object v2, v0

    move-object v11, v2

    :goto_144
    if-eqz v11, :cond_14d

    move-object/from16 v22, v0

    move-object/from16 v24, v1

    move-object/from16 v23, v2

    goto :goto_16c

    :cond_14d
    new-instance v0, Lvjo;

    const/16 v2, 0x66

    invoke-direct {v0, v2, v1}, Lvjo;-><init>(ILjava/lang/String;)V

    throw v0

    :pswitch_155
    move/from16 v19, v2

    move v6, v10

    move-object v1, v11

    new-instance v11, Lv0p;

    sget-object v0, Loxo;->i:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-direct {v11, v0}, Lv0p;-><init>(Ljava/lang/String;)V

    move-object/from16 v22, v1

    move-object/from16 v23, v22

    move-object/from16 v24, v11

    :goto_16c
    new-instance v20, Lj1p;

    invoke-static/range {v19 .. v19}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    sget-object v0, Lbwo;->a:[I

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v2, v0, v2

    const/4 v3, 0x6

    const/4 v5, 0x3

    const/4 v7, 0x5

    const/4 v8, 0x4

    if-eq v2, v5, :cond_189

    if-eq v2, v8, :cond_189

    if-eq v2, v7, :cond_189

    if-eq v2, v3, :cond_189

    move/from16 v25, v6

    goto :goto_18b

    :cond_189
    move/from16 v25, v19

    :goto_18b
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v2, v0, v2

    if-eq v2, v8, :cond_198

    if-eq v2, v7, :cond_198

    move/from16 v27, v6

    goto :goto_19a

    :cond_198
    move/from16 v27, v19

    :goto_19a
    new-instance v2, Ls0p;

    invoke-virtual/range {p0 .. p0}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v0, v0, v6

    packed-switch v0, :pswitch_data_1ce

    invoke-static {}, Lh9o;->p()V

    return-object v1

    :pswitch_1a9
    move v3, v7

    goto :goto_1b3

    :pswitch_1ab
    move v3, v8

    goto :goto_1b3

    :pswitch_1ad
    move v3, v5

    goto :goto_1b3

    :pswitch_1af
    move/from16 v3, v19

    goto :goto_1b3

    :pswitch_1b2
    move v3, v4

    :goto_1b3
    :pswitch_1b3
    invoke-direct {v2, v3}, Ls0p;-><init>(I)V

    move-object/from16 v26, p2

    move-object/from16 v28, v2

    invoke-direct/range {v20 .. v28}, Lj1p;-><init>(Ljava/lang/String;Lk0p;Ly0p;Lv0p;ILjava/lang/String;ILs0p;)V

    return-object v20

    :pswitch_data_1be
    .packed-switch 0x1
        :pswitch_155
        :pswitch_dc
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
        :pswitch_2d
    .end packed-switch

    :pswitch_data_1ce
    .packed-switch 0x1
        :pswitch_1b2
        :pswitch_1af
        :pswitch_1ad
        :pswitch_1ab
        :pswitch_1b3
        :pswitch_1a9
    .end packed-switch
.end method

.method public static e(Landroid/content/Context;Lkuk;)Ljava/lang/Object;
    .registers 6

    sget-object v0, Lbb7;->a:Lcv6;

    sget-object v0, Ls6d;->a:Ld7a;

    iget-object v0, v0, Ld7a;->e:Ld7a;

    new-instance v1, Lty7;

    const/4 v2, 0x0

    const/4 v3, 0x3

    invoke-direct {v1, p0, v2, v3}, Lty7;-><init>(Landroid/content/Context;Lmt5;B)V

    invoke-static {v0, v1, p1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static g(Landroid/content/Context;)Lhwo;
    .registers 9

    new-instance v0, Lhwo;

    sget-object v1, Lmzg;->a:Ljava/lang/Integer;

    const-string v2, "IABTCF_gdprApplies"

    :try_start_6
    sget-object v3, Lt0i;->b:Lp0i;

    sget-object v3, Lr8p;->a:Ljava/util/List;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    const/4 v4, -0x1

    invoke-interface {v3, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3
    :try_end_17
    .catchall {:try_start_6 .. :try_end_17} :catchall_18

    goto :goto_21

    :catchall_18
    move-exception v3

    sget-object v4, Lt0i;->b:Lp0i;

    new-instance v4, Lq0i;

    invoke-direct {v4, v3}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v3, v4

    :goto_21
    invoke-static {v3}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_48

    :try_start_28
    sget-object v3, Lr8p;->a:Ljava/util/List;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v2, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_3e

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2
    :try_end_3c
    .catchall {:try_start_28 .. :try_end_3c} :catchall_40

    move-object v3, v2

    goto :goto_48

    :cond_3e
    move-object v3, v5

    goto :goto_48

    :catchall_40
    move-exception v2

    sget-object v3, Lt0i;->b:Lp0i;

    new-instance v3, Lq0i;

    invoke-direct {v3, v2}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    :cond_48
    :goto_48
    instance-of v2, v3, Lq0i;

    if-eqz v2, :cond_4d

    move-object v3, v5

    :cond_4d
    check-cast v3, Ljava/lang/Integer;

    const/4 v2, 0x1

    if-eqz v3, :cond_5a

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v4

    if-eqz v4, :cond_5b

    if-eq v4, v2, :cond_5b

    :cond_5a
    move-object v3, v5

    :cond_5b
    sget-object v4, Lr8p;->a:Ljava/util/List;

    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v4, "IABUSPrivacy_String"

    invoke-interface {p0, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_97

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v6, 0x4

    if-ne v4, v6, :cond_97

    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x31

    if-ne v6, v7, :cond_97

    invoke-static {v2, p0}, Lpik;->y(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_7d
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v4, v6, :cond_96

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v7, 0x59

    if-eq v6, v7, :cond_93

    const/16 v7, 0x4e

    if-eq v6, v7, :cond_93

    const/16 v7, 0x2d

    if-ne v6, v7, :cond_97

    :cond_93
    add-int/lit8 v4, v4, 0x1

    goto :goto_7d

    :cond_96
    move-object v5, p0

    :cond_97
    invoke-direct {v0, v1, v3, v5}, Lhwo;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final f(Landroid/content/Context;Ljava/lang/String;Lsm;Ljava/lang/String;Leq;Lwjo;Ljava/lang/Boolean;Lako;Lnt5;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p9

    instance-of v1, v0, Lgwo;

    if-eqz v1, :cond_15

    move-object v1, v0

    check-cast v1, Lgwo;

    iget v2, v1, Lgwo;->v:I

    const/high16 v3, -0x80000000

    and-int v4, v2, v3

    if-eqz v4, :cond_15

    sub-int/2addr v2, v3

    iput v2, v1, Lgwo;->v:I

    goto :goto_1a

    :cond_15
    new-instance v1, Lgwo;

    invoke-direct {v1, p0, v0}, Lgwo;-><init>(Loxo;Lnt5;)V

    :goto_1a
    iget-object p0, v1, Lgwo;->t:Ljava/lang/Object;

    sget-object v0, Lpx5;->a:Lpx5;

    iget v2, v1, Lgwo;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_57

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p0}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance v4, Llwo;

    const/4 v7, 0x0

    move-object v10, p1

    move-object/from16 v13, p2

    move-object/from16 v5, p3

    move-object/from16 v12, p4

    move-object/from16 v6, p5

    move-object/from16 v8, p6

    move-object/from16 v11, p7

    move-object/from16 v9, p8

    invoke-direct/range {v4 .. v13}, Llwo;-><init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    iput v3, v1, Lgwo;->v:I

    invoke-static {p0, v4, v1}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_57

    return-object v0

    :cond_57
    :goto_57
    check-cast p0, Lt0i;

    iget-object p0, p0, Lt0i;->a:Ljava/lang/Object;

    return-object p0
.end method
