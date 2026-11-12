.class public final Lwlc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

.field public final b:Lnb2;

.field public final c:Lnb2;

.field public final d:Lnb2;

.field public final e:Lnb2;

.field public final f:Lnb2;

.field public final g:Lnb2;

.field public final h:Lnb2;

.field public final i:Lnb2;

.field public final j:Lli3;

.field public final k:Lli3;

.field public final l:Lli3;


# direct methods
.method public constructor <init>(Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance p1, Lnb2;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->b:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->c:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0x9

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->d:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0xa

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->e:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0xb

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->f:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0xc

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->g:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0xd

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->h:Lnb2;

    new-instance p1, Lnb2;

    const/16 v0, 0xe

    invoke-direct {p1, v0}, Lnb2;-><init>(B)V

    iput-object p1, p0, Lwlc;->i:Lnb2;

    new-instance p1, Lli3;

    const/4 v0, 0x5

    invoke-direct {p1, v0}, Lli3;-><init>(B)V

    iput-object p1, p0, Lwlc;->j:Lli3;

    new-instance p1, Lli3;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Lli3;-><init>(B)V

    iput-object p1, p0, Lwlc;->k:Lli3;

    new-instance p1, Lli3;

    const/4 v0, 0x4

    invoke-direct {p1, v0}, Lli3;-><init>(B)V

    iput-object p1, p0, Lwlc;->l:Lli3;

    return-void
.end method

.method public static a(Lwlc;Ljava/util/ArrayList;Lmt5;)Ljava/lang/Object;
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    instance-of v3, v2, Lolc;

    if-eqz v3, :cond_19

    move-object v3, v2

    check-cast v3, Lolc;

    iget v4, v3, Lolc;->x:I

    const/high16 v5, -0x80000000

    and-int v6, v4, v5

    if-eqz v6, :cond_19

    sub-int/2addr v4, v5

    iput v4, v3, Lolc;->x:I

    goto :goto_1e

    :cond_19
    new-instance v3, Lolc;

    invoke-direct {v3, v0, v2}, Lolc;-><init>(Lwlc;Lmt5;)V

    :goto_1e
    iget-object v2, v3, Lolc;->v:Ljava/lang/Object;

    sget-object v4, Lpx5;->a:Lpx5;

    iget v5, v3, Lolc;->x:I

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/16 v8, 0xa

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v5, :cond_48

    if-eq v5, v9, :cond_3b

    if-ne v5, v7, :cond_35

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1bb

    :cond_35
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v10

    :cond_3b
    iget-object v0, v3, Lolc;->u:Ljava/util/ArrayList;

    iget-object v1, v3, Lolc;->t:Lwlc;

    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v28, v1

    move-object v1, v0

    move-object/from16 v0, v28

    goto :goto_aa

    :cond_48
    invoke-static {v2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v1, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v11, v6

    :goto_59
    if-ge v11, v5, :cond_6e

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lruc;

    iget-wide v12, v12, Lruc;->a:J

    new-instance v14, Ljava/lang/Long;

    invoke-direct {v14, v12, v13}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v2, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_59

    :cond_6e
    iput-object v0, v3, Lolc;->t:Lwlc;

    iput-object v1, v3, Lolc;->u:Ljava/util/ArrayList;

    iput v9, v3, Lolc;->x:I

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v11, "SELECT * from football_events  WHERE oscoreId IN ("

    invoke-direct {v5, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v11

    move v12, v6

    :goto_80
    if-ge v12, v11, :cond_93

    const-string v13, "?"

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v13, v11, -0x1

    if-ge v12, v13, :cond_90

    const-string v13, ","

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_90
    add-int/lit8 v12, v12, 0x1

    goto :goto_80

    :cond_93
    const-string v11, ") ORDER BY `startTimestamp` ASC"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iget-object v11, v0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v12, Ljkc;

    const/4 v13, 0x3

    invoke-direct {v12, v5, v2, v13}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3, v11, v9, v6, v12}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v4, :cond_1ba

    :goto_aa
    check-cast v2, Ljava/lang/Iterable;

    invoke-static {v2, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-static {v5}, Lqbd;->a(I)I

    move-result v5

    const/16 v11, 0x10

    if-ge v5, v11, :cond_b9

    move v5, v11

    :cond_b9
    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11, v5}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_da

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lruc;

    iget-wide v12, v12, Lruc;->a:J

    new-instance v14, Ljava/lang/Long;

    invoke-direct {v14, v12, v13}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v11, v14, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_c2

    :cond_da
    new-instance v2, Ljava/util/ArrayList;

    invoke-static {v1, v8}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v8, v6

    :goto_e8
    if-ge v8, v5, :cond_1a2

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v8, v8, 0x1

    move-object v13, v12

    check-cast v13, Lruc;

    iget-wide v14, v13, Lruc;->a:J

    new-instance v12, Ljava/lang/Long;

    invoke-direct {v12, v14, v15}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v11, v12}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lruc;

    if-eqz v12, :cond_106

    iget-object v14, v12, Lruc;->b:Loi9;

    if-nez v14, :cond_108

    :cond_106
    iget-object v14, v13, Lruc;->b:Loi9;

    :cond_108
    iget-object v15, v13, Lruc;->l:Ljava/lang/String;

    if-nez v15, :cond_112

    if-eqz v12, :cond_111

    iget-object v15, v12, Lruc;->l:Ljava/lang/String;

    goto :goto_112

    :cond_111
    move-object v15, v10

    :cond_112
    :goto_112
    iget-wide v6, v13, Lruc;->n:J

    const-wide/16 v16, 0x0

    cmp-long v18, v6, v16

    if-eqz v18, :cond_11d

    :goto_11a
    move-wide/from16 v16, v6

    goto :goto_122

    :cond_11d
    if-eqz v12, :cond_122

    iget-wide v6, v12, Lruc;->n:J

    goto :goto_11a

    :cond_122
    :goto_122
    iget-object v6, v13, Lruc;->o:Ljava/lang/Long;

    if-nez v6, :cond_12a

    if-eqz v12, :cond_12d

    iget-object v6, v12, Lruc;->o:Ljava/lang/Long;

    :cond_12a
    move-object/from16 v18, v6

    goto :goto_12f

    :cond_12d
    move-object/from16 v18, v10

    :goto_12f
    iget-object v6, v13, Lruc;->p:Ljava/lang/Long;

    if-nez v6, :cond_137

    if-eqz v12, :cond_13a

    iget-object v6, v12, Lruc;->p:Ljava/lang/Long;

    :cond_137
    move-object/from16 v19, v6

    goto :goto_13c

    :cond_13a
    move-object/from16 v19, v10

    :goto_13c
    iget-object v6, v13, Lruc;->q:Ljava/lang/Long;

    if-nez v6, :cond_144

    if-eqz v12, :cond_147

    iget-object v6, v12, Lruc;->q:Ljava/lang/Long;

    :cond_144
    move-object/from16 v20, v6

    goto :goto_149

    :cond_147
    move-object/from16 v20, v10

    :goto_149
    iget-object v6, v13, Lruc;->r:Ljava/lang/Long;

    if-nez v6, :cond_151

    if-eqz v12, :cond_154

    iget-object v6, v12, Lruc;->r:Ljava/lang/Long;

    :cond_151
    move-object/from16 v21, v6

    goto :goto_156

    :cond_154
    move-object/from16 v21, v10

    :goto_156
    iget-object v6, v13, Lruc;->s:Ljava/lang/Long;

    if-nez v6, :cond_15e

    if-eqz v12, :cond_161

    iget-object v6, v12, Lruc;->s:Ljava/lang/Long;

    :cond_15e
    move-object/from16 v22, v6

    goto :goto_163

    :cond_161
    move-object/from16 v22, v10

    :goto_163
    iget-object v6, v13, Lruc;->t:Ljava/lang/Long;

    if-nez v6, :cond_16b

    if-eqz v12, :cond_16e

    iget-object v6, v12, Lruc;->t:Ljava/lang/Long;

    :cond_16b
    move-object/from16 v23, v6

    goto :goto_170

    :cond_16e
    move-object/from16 v23, v10

    :goto_170
    iget-object v6, v13, Lruc;->u:Ljava/lang/Long;

    if-nez v6, :cond_178

    if-eqz v12, :cond_17b

    iget-object v6, v12, Lruc;->u:Ljava/lang/Long;

    :cond_178
    move-object/from16 v24, v6

    goto :goto_17d

    :cond_17b
    move-object/from16 v24, v10

    :goto_17d
    iget-object v6, v13, Lruc;->v:Ljava/lang/Long;

    if-nez v6, :cond_185

    if-eqz v12, :cond_188

    iget-object v6, v12, Lruc;->v:Ljava/lang/Long;

    :cond_185
    move-object/from16 v25, v6

    goto :goto_18a

    :cond_188
    move-object/from16 v25, v10

    :goto_18a
    iget-object v6, v13, Lruc;->w:Ljava/lang/Long;

    if-nez v6, :cond_192

    if-eqz v12, :cond_195

    iget-object v6, v12, Lruc;->w:Ljava/lang/Long;

    :cond_192
    move-object/from16 v26, v6

    goto :goto_197

    :cond_195
    move-object/from16 v26, v10

    :goto_197
    const/16 v27, 0x17fd

    invoke-static/range {v13 .. v27}, Lruc;->a(Lruc;Loi9;Ljava/lang/String;JLjava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/Long;I)Lruc;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e8

    :cond_1a2
    iput-object v10, v3, Lolc;->t:Lwlc;

    iput-object v10, v3, Lolc;->u:Ljava/util/ArrayList;

    const/4 v1, 0x2

    iput v1, v3, Lolc;->x:I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v5, Lvlc;

    const/4 v6, 0x0

    invoke-direct {v5, v0, v2, v6}, Lvlc;-><init>(Lwlc;Ljava/util/List;B)V

    invoke-static {v3, v1, v6, v9, v5}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    if-ne v0, v4, :cond_1bb

    :cond_1ba
    return-object v4

    :cond_1bb
    :goto_1bb
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method

.method public static c(Lwlc;JLmt5;)Ljava/lang/Object;
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    instance-of v2, v1, Lplc;

    if-eqz v2, :cond_17

    move-object v2, v1

    check-cast v2, Lplc;

    iget v3, v2, Lplc;->C:I

    const/high16 v4, -0x80000000

    and-int v5, v3, v4

    if-eqz v5, :cond_17

    sub-int/2addr v3, v4

    iput v3, v2, Lplc;->C:I

    goto :goto_1c

    :cond_17
    new-instance v2, Lplc;

    invoke-direct {v2, v0, v1}, Lplc;-><init>(Lwlc;Lmt5;)V

    :goto_1c
    iget-object v1, v2, Lplc;->A:Ljava/lang/Object;

    sget-object v3, Lpx5;->a:Lpx5;

    iget v4, v2, Lplc;->C:I

    const/4 v5, 0x0

    const/4 v6, 0x5

    const/4 v7, 0x4

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v4, :cond_a1

    if-eq v4, v10, :cond_99

    if-eq v4, v9, :cond_88

    if-eq v4, v8, :cond_6f

    if-eq v4, v7, :cond_56

    if-ne v4, v6, :cond_50

    iget-wide v7, v2, Lplc;->z:J

    iget-object v0, v2, Lplc;->y:Lruc;

    check-cast v0, Lr0f;

    iget-object v0, v2, Lplc;->x:Ljava/util/Iterator;

    iget-object v4, v2, Lplc;->w:Ljava/util/List;

    check-cast v4, Ljava/util/List;

    iget-object v4, v2, Lplc;->v:Ljava/util/Set;

    check-cast v4, Ljava/util/Set;

    iget-object v9, v2, Lplc;->u:Ljava/util/List;

    check-cast v9, Ljava/util/List;

    iget-object v9, v2, Lplc;->t:Lwlc;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_1a5

    :cond_50
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v11

    :cond_56
    iget-wide v12, v2, Lplc;->z:J

    iget-object v0, v2, Lplc;->y:Lruc;

    iget-object v4, v2, Lplc;->x:Ljava/util/Iterator;

    iget-object v9, v2, Lplc;->w:Ljava/util/List;

    check-cast v9, Ljava/util/List;

    iget-object v14, v2, Lplc;->v:Ljava/util/Set;

    check-cast v14, Ljava/util/Set;

    iget-object v15, v2, Lplc;->u:Ljava/util/List;

    check-cast v15, Ljava/util/List;

    iget-object v15, v2, Lplc;->t:Lwlc;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_18c

    :cond_6f
    iget-wide v12, v2, Lplc;->z:J

    iget-object v0, v2, Lplc;->y:Lruc;

    iget-object v4, v2, Lplc;->x:Ljava/util/Iterator;

    iget-object v9, v2, Lplc;->w:Ljava/util/List;

    check-cast v9, Ljava/util/List;

    iget-object v14, v2, Lplc;->v:Ljava/util/Set;

    check-cast v14, Ljava/util/Set;

    iget-object v15, v2, Lplc;->u:Ljava/util/List;

    check-cast v15, Ljava/util/List;

    iget-object v15, v2, Lplc;->t:Lwlc;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_163

    :cond_88
    iget-wide v12, v2, Lplc;->z:J

    iget-object v0, v2, Lplc;->v:Ljava/util/Set;

    check-cast v0, Ljava/util/Set;

    iget-object v4, v2, Lplc;->u:Ljava/util/List;

    check-cast v4, Ljava/util/List;

    iget-object v9, v2, Lplc;->t:Lwlc;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_10a

    :cond_99
    iget-wide v12, v2, Lplc;->z:J

    iget-object v0, v2, Lplc;->t:Lwlc;

    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_bb

    :cond_a1
    invoke-static {v1}, Lybh;->y(Ljava/lang/Object;)V

    iput-object v0, v2, Lplc;->t:Lwlc;

    move-wide/from16 v12, p1

    iput-wide v12, v2, Lplc;->z:J

    iput v10, v2, Lplc;->C:I

    iget-object v1, v0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v4, Lg8c;

    const/16 v14, 0xc

    invoke-direct {v4, v14}, Lg8c;-><init>(B)V

    invoke-static {v2, v1, v10, v5, v4}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v3, :cond_1ee

    :goto_bb
    move-object v4, v1

    check-cast v4, Ljava/util/List;

    move-object v1, v4

    check-cast v1, Ljava/lang/Iterable;

    new-instance v14, Ljava/util/ArrayList;

    const/16 v15, 0xa

    invoke-static {v1, v15}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v15

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_e7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lruc;

    iget-wide v6, v15, Lruc;->a:J

    new-instance v15, Ljava/lang/Long;

    invoke-direct {v15, v6, v7}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v14, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d0

    :cond_e7
    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object v1

    iput-object v0, v2, Lplc;->t:Lwlc;

    move-object v6, v4

    check-cast v6, Ljava/util/List;

    iput-object v6, v2, Lplc;->u:Ljava/util/List;

    iput-object v1, v2, Lplc;->v:Ljava/util/Set;

    iput-wide v12, v2, Lplc;->z:J

    iput v9, v2, Lplc;->C:I

    iget-object v6, v0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v7, Lg8c;

    const/16 v9, 0xd

    invoke-direct {v7, v9}, Lg8c;-><init>(B)V

    invoke-static {v2, v6, v10, v5, v7}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v6

    if-eq v6, v3, :cond_1ee

    move-object v9, v0

    move-object v0, v1

    move-object v1, v6

    :goto_10a
    check-cast v1, Ljava/util/List;

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_112
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_19c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lruc;

    iget-wide v14, v6, Lruc;->n:J

    sget-object v7, Lpn7;->b:Lon7;

    sget-object v7, Lun7;->h:Lun7;

    invoke-static {v10, v7}, Lcs5;->x0(ILun7;)J

    move-result-wide v16

    invoke-static/range {v16 .. v17}, Lpn7;->f(J)J

    move-result-wide v16

    sub-long v16, v12, v16

    cmp-long v7, v14, v16

    if-gez v7, :cond_199

    new-instance v7, Lfh9;

    iget-wide v14, v6, Lruc;->a:J

    sget-object v5, Lapc;->c:Lapc;

    invoke-direct {v7, v14, v15, v5}, Lfh9;-><init>(JLapc;)V

    iput-object v9, v2, Lplc;->t:Lwlc;

    iput-object v11, v2, Lplc;->u:Ljava/util/List;

    move-object v5, v0

    check-cast v5, Ljava/util/Set;

    iput-object v5, v2, Lplc;->v:Ljava/util/Set;

    move-object v5, v1

    check-cast v5, Ljava/util/List;

    iput-object v5, v2, Lplc;->w:Ljava/util/List;

    iput-object v4, v2, Lplc;->x:Ljava/util/Iterator;

    iput-object v6, v2, Lplc;->y:Lruc;

    iput-wide v12, v2, Lplc;->z:J

    iput v8, v2, Lplc;->C:I

    iget-object v5, v9, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v14, Ltlc;

    invoke-direct {v14, v9, v7, v10}, Ltlc;-><init>(Lwlc;Lfh9;B)V

    const/4 v7, 0x0

    invoke-static {v2, v5, v7, v10, v14}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v3, :cond_1ee

    move-object v14, v0

    move-object v0, v6

    move-object v15, v9

    move-object v9, v1

    :goto_163
    iget-wide v5, v0, Lruc;->a:J

    iput-object v15, v2, Lplc;->t:Lwlc;

    iput-object v11, v2, Lplc;->u:Ljava/util/List;

    move-object v1, v14

    check-cast v1, Ljava/util/Set;

    iput-object v1, v2, Lplc;->v:Ljava/util/Set;

    move-object v1, v9

    check-cast v1, Ljava/util/List;

    iput-object v1, v2, Lplc;->w:Ljava/util/List;

    iput-object v4, v2, Lplc;->x:Ljava/util/Iterator;

    iput-object v0, v2, Lplc;->y:Lruc;

    iput-wide v12, v2, Lplc;->z:J

    const/4 v7, 0x4

    iput v7, v2, Lplc;->C:I

    iget-object v1, v15, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v7, Lx41;

    const/16 v8, 0x9

    invoke-direct {v7, v5, v6, v8}, Lx41;-><init>(JB)V

    const/4 v5, 0x0

    invoke-static {v2, v1, v5, v10, v7}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, v3, :cond_1ee

    :goto_18c
    iget-wide v0, v0, Lruc;->a:J

    new-instance v5, Ljava/lang/Long;

    invoke-direct {v5, v0, v1}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v14, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-object v1, v9

    move-object v0, v14

    move-object v9, v15

    :cond_199
    const/4 v8, 0x3

    goto/16 :goto_112

    :cond_19c
    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move-object v4, v0

    move-object v0, v1

    move-wide v7, v12

    :cond_1a5
    :goto_1a5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1ef

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lr0f;

    iget-object v5, v1, Lr0f;->b:Lapc;

    iget-wide v12, v1, Lr0f;->a:J

    sget-object v6, Lapc;->c:Lapc;

    if-ne v5, v6, :cond_1a5

    iget-wide v5, v1, Lr0f;->c:J

    cmp-long v5, v7, v5

    if-lez v5, :cond_1a5

    new-instance v5, Ljava/lang/Long;

    invoke-direct {v5, v12, v13}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v4, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1a5

    iget-object v1, v1, Lr0f;->b:Lapc;

    iput-object v9, v2, Lplc;->t:Lwlc;

    iput-object v11, v2, Lplc;->u:Ljava/util/List;

    move-object v5, v4

    check-cast v5, Ljava/util/Set;

    iput-object v5, v2, Lplc;->v:Ljava/util/Set;

    iput-object v11, v2, Lplc;->w:Ljava/util/List;

    iput-object v0, v2, Lplc;->x:Ljava/util/Iterator;

    iput-object v11, v2, Lplc;->y:Lruc;

    iput-wide v7, v2, Lplc;->z:J

    const/4 v5, 0x5

    iput v5, v2, Lplc;->C:I

    iget-object v6, v9, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    new-instance v14, Lrlc;

    const/4 v15, 0x0

    invoke-direct {v14, v12, v13, v1, v15}, Lrlc;-><init>(JLapc;B)V

    invoke-static {v2, v6, v15, v10, v14}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    if-ne v1, v3, :cond_1a5

    :cond_1ee
    return-object v3

    :cond_1ef
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method


# virtual methods
.method public final b(Ljava/util/List;Lkuk;)Ljava/lang/Object;
    .registers 8

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DELETE FROM football_events WHERE source IN ("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_d
    if-ge v3, v1, :cond_20

    const-string v4, "?"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v1, -0x1

    if-ge v3, v4, :cond_1d

    const-string v4, ","

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_20
    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljkc;

    const/4 v3, 0x5

    invoke-direct {v1, v0, p1, v3}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lwlc;->a:Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;

    const/4 p1, 0x1

    invoke-static {p2, p0, v2, p1, v1}, Lkfo;->a0(Lmt5;Ly5i;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
