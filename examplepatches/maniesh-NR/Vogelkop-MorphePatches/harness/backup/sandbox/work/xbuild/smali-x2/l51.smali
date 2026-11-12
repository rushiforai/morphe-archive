.class public final synthetic Ll51;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;)V
    .registers 3

    const/16 v0, 0x8

    iput-byte v0, p0, Ll51;->a:B

    sget-object v0, Lmnj;->a:Lmnj;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll51;->b:Ljava/util/ArrayList;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/util/ArrayList;B)V
    .registers 3

    .line 12
    iput-byte p2, p0, Ll51;->a:B

    iput-object p1, p0, Ll51;->b:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Ll51;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v0, v0, Ll51;->b:Ljava/util/ArrayList;

    packed-switch v1, :pswitch_data_1a6

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_15
    move-object/from16 v1, p1

    check-cast v1, Lkotlin/text/MatchResult;

    invoke-interface {v1}, Lkotlin/text/MatchResult;->a()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    sub-int/2addr v1, v3

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    return-object v0

    :pswitch_2f
    sget-object v1, Lmnj;->a:Lmnj;

    move-object/from16 v4, p1

    check-cast v4, Lonj;

    instance-of v5, v4, Lpnj;

    if-eqz v5, :cond_49

    check-cast v4, Lpnj;

    iget-object v5, v4, Lpnj;->b:Llnj;

    iget-object v5, v5, Llnj;->a:Lmnj;

    if-ne v5, v1, :cond_49

    iget-object v1, v4, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    if-eqz v1, :cond_48

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_48
    move v2, v3

    :cond_49
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_4e
    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v3

    move v4, v2

    :goto_57
    if-ge v4, v3, :cond_65

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lifg;

    invoke-static {v1, v5, v2, v2}, Lp1d;->f(Lp1d;Lifg;II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_57

    :cond_65
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_68
    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v3

    move v4, v2

    :goto_71
    if-ge v4, v3, :cond_7f

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lifg;

    invoke-static {v1, v5, v2, v2}, Lp1d;->l(Lp1d;Lifg;II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_71

    :cond_7f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_82
    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v4

    move v5, v2

    :goto_8b
    if-ge v5, v4, :cond_dd

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwfd;

    iget-object v7, v6, Lwfd;->b:Ljava/util/List;

    iget-boolean v8, v6, Lwfd;->g:Z

    iget v9, v6, Lwfd;->k:I

    const/high16 v10, -0x80000000

    if-ne v9, v10, :cond_a2

    const-string v9, "position() should be called first"

    invoke-static {v9}, Ld8b;->a(Ljava/lang/String;)V

    :cond_a2
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v9

    move v10, v2

    :goto_a7
    if-ge v10, v9, :cond_d8

    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lifg;

    iget-object v12, v6, Lwfd;->i:[I

    shl-int/lit8 v13, v10, 0x1

    aget v14, v12, v13

    add-int/2addr v13, v3

    aget v12, v12, v13

    int-to-long v13, v14

    const/16 v15, 0x20

    shl-long/2addr v13, v15

    int-to-long v2, v12

    const-wide v16, 0xffffffffL

    and-long v2, v2, v16

    or-long/2addr v13, v2

    iget-wide v2, v6, Lwfd;->c:J

    invoke-static {v13, v14, v2, v3}, Lybb;->c(JJ)J

    move-result-wide v2

    if-eqz v8, :cond_d1

    invoke-static {v1, v11, v2, v3}, Lp1d;->r(Lp1d;Lifg;J)V

    goto :goto_d4

    :cond_d1
    invoke-static {v1, v11, v2, v3}, Lp1d;->n(Lp1d;Lifg;J)V

    :goto_d4
    add-int/lit8 v10, v10, 0x1

    const/4 v3, 0x1

    goto :goto_a7

    :cond_d8
    add-int/lit8 v5, v5, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    goto :goto_8b

    :cond_dd
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_e0
    move-object/from16 v1, p1

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->i()Lbt0;

    move-result-object v1

    iget-object v1, v1, Lbt0;->a:Le66;

    const/16 v2, 0x1e

    invoke-virtual {v1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    if-eqz v3, :cond_100

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_100

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_10e

    :cond_100
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v15, 0x1

    invoke-virtual {v1, v2, v15, v3}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v4, Lhf0;

    invoke-direct {v4, v1, v2, v3}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_10e
    invoke-virtual {v4, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_114
    move-object/from16 v1, p1

    check-cast v1, Lck0;

    invoke-virtual {v1}, Lck0;->c()Ltb0;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_121
    if-ge v3, v2, :cond_152

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Ljava/lang/String;

    iget-object v5, v1, Ltb0;->a:Lzpa;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lzc0;

    const/4 v6, -0x1

    const/4 v7, 0x2

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    iget-object v6, v1, Ltb0;->b:Lq56;

    invoke-virtual {v6}, Lq56;->B()Lhf0;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    const-wide/16 v6, 0x1d

    const/4 v8, 0x0

    const/4 v15, 0x1

    invoke-virtual {v5, v8, v15, v6, v7}, Ljf0;->p(IIJ)V

    if-nez v4, :cond_14d

    const/4 v6, 0x0

    goto :goto_14e

    :cond_14d
    move v6, v15

    :goto_14e
    invoke-virtual {v5, v15, v6, v4}, Ljf0;->q(IILjava/lang/Object;)V

    goto :goto_121

    :cond_152
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_155
    move-object/from16 v1, p1

    check-cast v1, Lkotlin/Unit;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_15e
    if-ge v2, v1, :cond_16c

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_15e

    :cond_16c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_16f
    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v8, 0x0

    :goto_178
    if-ge v8, v2, :cond_187

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lifg;

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v4}, Lp1d;->h(Lp1d;Lifg;II)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_178

    :cond_187
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_18a
    move-object/from16 v1, p1

    check-cast v1, Lp1d;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v2

    const/4 v8, 0x0

    :goto_193
    if-ge v8, v2, :cond_1a2

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lifg;

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v4}, Lp1d;->h(Lp1d;Lifg;II)V

    add-int/lit8 v8, v8, 0x1

    goto :goto_193

    :cond_1a2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_1a6
    .packed-switch 0x0
        :pswitch_18a
        :pswitch_16f
        :pswitch_155
        :pswitch_114
        :pswitch_e0
        :pswitch_82
        :pswitch_68
        :pswitch_4e
        :pswitch_2f
        :pswitch_15
    .end packed-switch
.end method
