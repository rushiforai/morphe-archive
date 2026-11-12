.class public final synthetic Lv5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:J

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/util/List;Lg1b;Lclg;JJ)V
    .registers 9

    .line 17
    const/4 v0, 0x1

    iput-byte v0, p0, Lv5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv5f;->d:Ljava/lang/Object;

    iput-object p2, p0, Lv5f;->e:Ljava/lang/Object;

    iput-object p3, p0, Lv5f;->f:Ljava/lang/Object;

    iput-wide p4, p0, Lv5f;->b:J

    iput-wide p6, p0, Lv5f;->c:J

    return-void
.end method

.method public synthetic constructor <init>(Ljd0;Ljava/lang/String;JJLjava/lang/String;)V
    .registers 9

    const/4 v0, 0x0

    iput-byte v0, p0, Lv5f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv5f;->d:Ljava/lang/Object;

    iput-object p2, p0, Lv5f;->e:Ljava/lang/Object;

    iput-wide p3, p0, Lv5f;->b:J

    iput-wide p5, p0, Lv5f;->c:J

    iput-object p7, p0, Lv5f;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lv5f;->a:B

    const/4 v2, 0x0

    iget-object v3, v0, Lv5f;->f:Ljava/lang/Object;

    iget-object v4, v0, Lv5f;->e:Ljava/lang/Object;

    iget-object v5, v0, Lv5f;->d:Ljava/lang/Object;

    const/4 v6, 0x1

    packed-switch v1, :pswitch_data_17a

    check-cast v5, Ljava/util/List;

    check-cast v4, Lg1b;

    check-cast v3, Lclg;

    move-object/from16 v7, p1

    check-cast v7, Lmk7;

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/high16 v13, 0x3f800000    # 1.0f

    const-wide v8, 0xffffffffL

    if-eqz v5, :cond_79

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ltol;

    iget v5, v5, Ltol;->a:I

    invoke-virtual {v3, v5}, Lclg;->a(I)F

    move-result v5

    const/high16 v10, 0x40000000    # 2.0f

    invoke-interface {v7, v10}, Ln27;->o0(F)F

    move-result v10

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v11

    int-to-long v11, v11

    invoke-static {v10}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v10

    int-to-long v14, v10

    const/16 v10, 0x20

    shl-long/2addr v11, v10

    and-long/2addr v14, v8

    or-long/2addr v11, v14

    invoke-interface {v7}, Lmk7;->e()J

    move-result-wide v14

    and-long/2addr v14, v8

    long-to-int v14, v14

    invoke-static {v14}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v14

    invoke-static {v5}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    move-wide v15, v8

    int-to-long v8, v5

    invoke-static {v14}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v5

    move/from16 p1, v10

    move-wide/from16 v17, v11

    int-to-long v10, v5

    shl-long v8, v8, p1

    and-long/2addr v10, v15

    or-long/2addr v8, v10

    invoke-interface {v7, v13}, Ln27;->o0(F)F

    move-result v14

    const/16 v15, 0x1e0

    move-wide v12, v8

    iget-wide v8, v0, Lv5f;->c:J

    move-wide/from16 v10, v17

    invoke-static/range {v7 .. v15}, Lmk7;->p0(Lmk7;JJJFI)V

    goto :goto_1f

    :cond_79
    move-wide v15, v8

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_134

    invoke-static {v4}, Lj95;->g(Ljava/util/Collection;)Lkotlin/ranges/IntRange;

    move-result-object v1

    invoke-static {}, Lf91;->a()Ld91;

    move-result-object v4

    invoke-virtual {v3, v2}, Lclg;->a(I)F

    move-result v5

    iget v8, v3, Lclg;->e:F

    invoke-virtual {v3, v2}, Lclg;->b(I)F

    move-result v9

    iget-object v10, v4, Ld91;->a:Landroid/graphics/Path;

    invoke-virtual {v10, v5, v9}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-static {v1, v6}, Lkotlin/collections/CollectionsKt;->G(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_9f
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_bb

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Number;

    invoke-virtual {v6}, Ljava/lang/Number;->intValue()I

    move-result v6

    invoke-virtual {v3, v6}, Lclg;->a(I)F

    move-result v9

    invoke-virtual {v3, v6}, Lclg;->b(I)F

    move-result v6

    invoke-virtual {v4, v9, v6}, Ld91;->e(FF)V

    goto :goto_9f

    :cond_bb
    invoke-static {}, Lf91;->a()Ld91;

    move-result-object v5

    invoke-static {v5, v4}, Ld91;->a(Ld91;Ld91;)V

    iget v1, v1, Lkotlin/ranges/a;->b:I

    invoke-virtual {v3, v1}, Lclg;->a(I)F

    move-result v1

    invoke-virtual {v5, v1, v8}, Ld91;->e(FF)V

    invoke-virtual {v3, v2}, Lclg;->a(I)F

    move-result v1

    invoke-virtual {v5, v1, v8}, Ld91;->e(FF)V

    iget-object v1, v5, Ld91;->a:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    const v1, 0x3ecccccd    # 0.4f

    iget-wide v9, v0, Lv5f;->b:J

    invoke-static {v9, v10, v1}, Lu95;->b(JF)J

    move-result-wide v0

    new-instance v2, Lu95;

    invoke-direct {v2, v0, v1}, Lu95;-><init>(J)V

    const/4 v0, 0x0

    invoke-static {v9, v10, v0}, Lu95;->b(JF)J

    move-result-wide v0

    new-instance v6, Lu95;

    invoke-direct {v6, v0, v1}, Lu95;-><init>(J)V

    filled-new-array {v2, v6}, [Lu95;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v18

    iget v0, v3, Lclg;->d:F

    invoke-static {v0}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    and-long v20, v0, v15

    invoke-static {v8}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result v0

    int-to-long v0, v0

    and-long v22, v0, v15

    new-instance v17, Lvec;

    const/16 v19, 0x0

    const/16 v24, 0x0

    invoke-direct/range {v17 .. v24}, Lvec;-><init>(Ljava/util/List;Ljava/util/ArrayList;JJI)V

    const/4 v11, 0x0

    const/16 v12, 0x3c

    move-wide v0, v9

    const/4 v10, 0x0

    move-object v8, v5

    move-object/from16 v9, v17

    invoke-static/range {v7 .. v12}, Lmk7;->m0(Lmk7;Ld91;Ldz3;FLnk7;I)V

    new-instance v14, Lqik;

    invoke-interface {v7, v13}, Ln27;->o0(F)F

    move-result v17

    const/16 v16, 0x0

    const/16 v19, 0x1e

    const/4 v15, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v14 .. v19}, Lqik;-><init>(IIFFI)V

    const/16 v13, 0x34

    const/4 v11, 0x0

    move-wide v9, v0

    move-object v8, v4

    move-object v12, v14

    invoke-static/range {v7 .. v13}, Lmk7;->F0(Lmk7;Ld91;JFLnk7;I)V

    :cond_134
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_137
    check-cast v5, Ljd0;

    check-cast v4, Ljava/lang/String;

    check-cast v3, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lnd0;

    iget-object v1, v1, Lnd0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lld0;

    iget-object v7, v1, Lld0;->b:Lkd0;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v8, 0x8

    invoke-virtual {v7, v8, v6, v5}, Ljf0;->q(IILjava/lang/Object;)V

    iget-object v1, v1, Lld0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lid0;

    iget-object v5, v1, Lid0;->a:Lhd0;

    invoke-virtual {v5, v2, v4}, Lhd0;->y(ILjava/lang/String;)V

    iget-object v2, v1, Lid0;->a:Lhd0;

    iget-wide v4, v0, Lv5f;->b:J

    invoke-virtual {v2, v6, v6, v4, v5}, Ljf0;->p(IIJ)V

    iget-object v2, v1, Lid0;->a:Lhd0;

    const/4 v4, 0x2

    iget-wide v7, v0, Lv5f;->c:J

    invoke-virtual {v2, v4, v6, v7, v8}, Ljf0;->p(IIJ)V

    if-eqz v3, :cond_177

    iget-object v0, v1, Lid0;->a:Lhd0;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v3}, Lhd0;->y(ILjava/lang/String;)V

    :cond_177
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_137
    .end packed-switch
.end method
