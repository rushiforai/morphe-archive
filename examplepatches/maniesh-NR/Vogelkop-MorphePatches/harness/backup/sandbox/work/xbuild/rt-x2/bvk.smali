.class public final synthetic Lbvk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lbvk;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    iget-byte v0, v0, Lbvk;->a:B

    const-string v1, "telemetry_events"

    const/4 v2, -0x1

    const/4 v3, 0x1

    const-wide v4, 0xffffffffL

    const/4 v6, 0x0

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_2cc

    move-object/from16 v0, p1

    check-cast v0, Lrf1;

    iget-object v1, v0, Lrf1;->a:Ljava/lang/Object;

    instance-of v2, v1, Lpfc;

    if-eqz v2, :cond_73

    check-cast v1, Lpfc;

    invoke-virtual {v1}, Lpfc;->b()Ltjl;

    move-result-object v1

    if-eqz v1, :cond_73

    iget-object v2, v1, Ltjl;->a:Lrwj;

    if-nez v2, :cond_34

    iget-object v2, v1, Ltjl;->b:Lrwj;

    if-nez v2, :cond_34

    iget-object v2, v1, Ltjl;->c:Lrwj;

    if-nez v2, :cond_34

    iget-object v1, v1, Ltjl;->d:Lrwj;

    if-eqz v1, :cond_73

    :cond_34
    new-instance v1, Lrf1;

    iget-object v2, v0, Lrf1;->a:Ljava/lang/Object;

    check-cast v2, Lpfc;

    invoke-virtual {v2}, Lpfc;->b()Ltjl;

    move-result-object v2

    if-eqz v2, :cond_44

    iget-object v2, v2, Ltjl;->a:Lrwj;

    if-nez v2, :cond_63

    :cond_44
    new-instance v3, Lrwj;

    const/16 v21, 0x0

    const v22, 0xffff

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v3 .. v22}, Lrwj;-><init>(JJLki9;Lgi9;Lhi9;Llh9;Ljava/lang/String;JLua3;Lvil;Lawc;JLbgl;Ljaj;I)V

    move-object v2, v3

    :cond_63
    iget v3, v0, Lrf1;->b:I

    iget v4, v0, Lrf1;->c:I

    invoke-direct {v1, v2, v3, v4}, Lrf1;-><init>(Ljava/lang/Object;II)V

    filled-new-array {v0, v1}, [Lrf1;

    move-result-object v0

    invoke-static {v0}, Lj95;->d([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_7b

    :cond_73
    filled-new-array {v0}, [Lrf1;

    move-result-object v0

    invoke-static {v0}, Lj95;->d([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    :goto_7b
    return-object v0

    :pswitch_7c
    move-object/from16 v0, p1

    check-cast v0, Lnjl;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_83
    move-object/from16 v0, p1

    check-cast v0, Lh0b;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8a
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_91
    move-object/from16 v0, p1

    check-cast v0, Lh0b;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_98
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_9f
    move-object/from16 v0, p1

    check-cast v0, Lmil;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a6
    move-object/from16 v0, p1

    check-cast v0, Ljava/util/List;

    new-instance v1, Lvhl;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_bb

    sget-object v2, Lfsf;->a:Lfsf;

    goto :goto_bd

    :cond_bb
    sget-object v2, Lfsf;->b:Lfsf;

    :goto_bd
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-direct {v1, v2, v0}, Lvhl;-><init>(Lfsf;F)V

    return-object v1

    :pswitch_cb
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    invoke-virtual {v0}, Lqhl;->b()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_e5

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    sget v0, Lxjl;->c:I

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v1, v0

    invoke-direct {v6, v7, v1}, Ld27;-><init>(II)V

    :cond_e5
    return-object v6

    :pswitch_e6
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    invoke-virtual {v0}, Lqhl;->c()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_100

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    sget v0, Lxjl;->c:I

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v0, v1

    invoke-direct {v6, v0, v7}, Ld27;-><init>(II)V

    :cond_100
    return-object v6

    :pswitch_101
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    invoke-virtual {v0}, Lqhl;->d()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_11b

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    sget v0, Lxjl;->c:I

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v1, v0

    invoke-direct {v6, v7, v1}, Ld27;-><init>(II)V

    :cond_11b
    return-object v6

    :pswitch_11c
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    invoke-virtual {v0}, Lqhl;->e()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_136

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    sget v0, Lxjl;->c:I

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v0, v1

    invoke-direct {v6, v0, v7}, Ld27;-><init>(II)V

    :cond_136
    return-object v6

    :pswitch_137
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    iget-wide v8, v0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    and-long/2addr v8, v4

    long-to-int v3, v8

    invoke-static {v3, v1}, Lnxg;->m(ILjava/lang/String;)I

    move-result v1

    if-eq v1, v2, :cond_155

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v1, v0

    invoke-direct {v6, v7, v1}, Ld27;-><init>(II)V

    :cond_155
    return-object v6

    :pswitch_156
    move-object/from16 v0, p1

    check-cast v0, Lqhl;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    iget-wide v8, v0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    and-long/2addr v8, v4

    long-to-int v3, v8

    if-lez v3, :cond_17d

    invoke-static {}, Lnxg;->p()Lxx7;

    move-result-object v8

    if-nez v8, :cond_173

    if-lez v3, :cond_17d

    invoke-static {v1, v3, v2}, Ljava/lang/Character;->offsetByCodePoints(Ljava/lang/CharSequence;II)I

    move-result v1

    goto :goto_185

    :cond_173
    add-int/lit8 v9, v3, -0x1

    invoke-virtual {v8, v9, v1}, Lxx7;->b(ILjava/lang/CharSequence;)I

    move-result v8

    if-gez v8, :cond_184

    if-gtz v3, :cond_17f

    :cond_17d
    move v1, v2

    goto :goto_185

    :cond_17f
    invoke-static {v1, v3, v2}, Ljava/lang/Character;->offsetByCodePoints(Ljava/lang/CharSequence;II)I

    move-result v1

    goto :goto_185

    :cond_184
    move v1, v8

    :goto_185
    if-eq v1, v2, :cond_191

    new-instance v6, Ld27;

    iget-wide v2, v0, Lqhl;->f:J

    and-long/2addr v2, v4

    long-to-int v0, v2

    sub-int/2addr v0, v1

    invoke-direct {v6, v0, v7}, Ld27;-><init>(II)V

    :cond_191
    return-object v6

    :pswitch_192
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    sget-object v0, Lwgl;->a:Ljava/lang/String;

    return-object v0

    :pswitch_19c
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/Pair;

    sget-object v1, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    iget-object v0, v0, Lkotlin/Pair;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :pswitch_1af
    sget-object v1, Lmdl;->a:Lmdl;

    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v7}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v3}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v0, v5}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x4

    invoke-virtual {v0, v6}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lmdl;->m(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1d1
    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v7}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    return-object v0

    :pswitch_1dd
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1e7
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f1
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1fb
    move-object/from16 v0, p1

    check-cast v0, Laqb;

    iput-boolean v3, v0, Laqb;->c:Z

    iput-boolean v7, v0, Laqb;->n:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_206
    move-object/from16 v0, p1

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->a:Ln6h;

    instance-of v1, v0, Lnxj;

    if-eqz v1, :cond_215

    check-cast v0, Lnxj;

    iget-object v6, v0, Lnxj;->f:Lcyj;

    goto :goto_227

    :cond_215
    instance-of v1, v0, Llxj;

    if-nez v1, :cond_225

    sget-object v1, Lmxj;->a:Lmxj;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_225

    invoke-static {}, Lh9o;->p()V

    goto :goto_227

    :cond_225
    sget-object v6, Leyj;->H:Lcyj;

    :goto_227
    return-object v6

    :pswitch_228
    move-object/from16 v0, p1

    check-cast v0, Leyj;

    iget-object v0, v0, Leyj;->k:Lcyj;

    return-object v0

    :pswitch_22f
    move-object/from16 v0, p1

    check-cast v0, Laqb;

    iput-boolean v3, v0, Laqb;->c:Z

    iput-boolean v7, v0, Laqb;->n:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23a
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_244
    move-object/from16 v0, p1

    check-cast v0, Landroidx/recyclerview/widget/i;

    instance-of v1, v0, Ljal;

    if-eqz v1, :cond_259

    check-cast v0, Ljal;

    invoke-virtual {v0}, Ljal;->X()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lb2l;

    :cond_259
    return-object v6

    :pswitch_25a
    move-object/from16 v0, p1

    check-cast v0, Lm2l;

    invoke-interface {v0}, Lm2l;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :pswitch_267
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x1

    const v3, 0x7f1404aa

    const v4, 0x7f0a0261

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x2

    const v3, 0x7f1407ad

    const v4, 0x7f0a073a

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x3

    const v3, 0x7f1411f6

    const v4, 0x7f0a0389

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f1410b8

    const v4, 0x7f0a0a04

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x5

    const v3, 0x7f1410b1

    const v4, 0x7f0a0a03

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x6

    const v3, 0x7f1410b7

    const v4, 0x7f0a0a06

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x7

    const v3, 0x7f1410b9

    const v4, 0x7f0a0a05

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2b8
    move-object/from16 v0, p1

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_2cc
    .packed-switch 0x0
        :pswitch_2b8
        :pswitch_267
        :pswitch_25a
        :pswitch_244
        :pswitch_23a
        :pswitch_22f
        :pswitch_228
        :pswitch_206
        :pswitch_1fb
        :pswitch_1f1
        :pswitch_1e7
        :pswitch_1dd
        :pswitch_1d1
        :pswitch_1af
        :pswitch_19c
        :pswitch_192
        :pswitch_156
        :pswitch_137
        :pswitch_11c
        :pswitch_101
        :pswitch_e6
        :pswitch_cb
        :pswitch_a6
        :pswitch_9f
        :pswitch_98
        :pswitch_91
        :pswitch_8a
        :pswitch_83
        :pswitch_7c
    .end packed-switch
.end method
