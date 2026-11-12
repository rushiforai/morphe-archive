.class public final Lm3h;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:Li07;

.field public u:Z

.field public final synthetic v:Ln3h;

.field public final synthetic w:F

.field public final synthetic x:Ljava/lang/String;

.field public final synthetic y:J


# direct methods
.method public constructor <init>(Ln3h;FLjava/lang/String;JLmt5;)V
    .registers 7

    iput-object p1, p0, Lm3h;->v:Ln3h;

    iput p2, p0, Lm3h;->w:F

    iput-object p3, p0, Lm3h;->x:Ljava/lang/String;

    iput-wide p4, p0, Lm3h;->y:J

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 10

    new-instance v0, Lm3h;

    iget-object v3, p0, Lm3h;->x:Ljava/lang/String;

    iget-wide v4, p0, Lm3h;->y:J

    iget-object v1, p0, Lm3h;->v:Ln3h;

    iget v2, p0, Lm3h;->w:F

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lm3h;-><init>(Ln3h;FLjava/lang/String;JLmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lm3h;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lm3h;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lm3h;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 18

    move-object/from16 v0, p0

    iget-object v1, v0, Lm3h;->v:Ln3h;

    iget-object v2, v1, Ln3h;->l:Lx5f;

    sget-object v3, Lpx5;->a:Lpx5;

    iget-boolean v4, v0, Lm3h;->u:Z

    const/4 v5, 0x0

    const/4 v6, 0x2

    iget-object v7, v0, Lm3h;->x:Ljava/lang/String;

    iget v8, v0, Lm3h;->w:F

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v4, :cond_25

    if-ne v4, v9, :cond_1f

    iget-object v3, v0, Lm3h;->t:Li07;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    move-object/from16 v11, p1

    goto/16 :goto_c5

    :cond_1f
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v10

    :cond_25
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v4, v1, Ln3h;->e:Ljjg;

    invoke-virtual {v4}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    iget-object v11, v1, Ln3h;->f:Ljjg;

    invoke-virtual {v11}, Ljjg;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    iget-object v12, v1, Ln3h;->g:Lkw3;

    invoke-virtual {v12}, Lkw3;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    if-eqz v11, :cond_f8

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    sget-object v13, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v11, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v12, v13}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v4, v11}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "v1/search/suggest"

    invoke-virtual {v4, v11}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "type"

    const-string v12, "product"

    invoke-virtual {v4, v11, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "limit"

    const-string v12, "1"

    invoke-virtual {v4, v11, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "score"

    invoke-static {v8}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v4, v11, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "query"

    invoke-virtual {v4, v11, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v11, "surface"

    const-string v12, "ptb-ofa-ss"

    invoke-virtual {v4, v11, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    new-instance v11, Lfvh;

    invoke-direct {v11}, Lfvh;-><init>()V

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Lfvh;->h(Ljava/lang/String;)V

    new-instance v4, Lkvh;

    invoke-direct {v4, v11}, Lkvh;-><init>(Lfvh;)V

    iget-object v11, v1, Ln3h;->d:Lfrk;

    invoke-virtual {v11}, Lfrk;->get()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lt9f;

    iget-object v12, v1, Ln3h;->j:Lddc;

    iget-object v13, v1, Ln3h;->k:Ljg8;

    new-instance v14, Lqmb;

    const/16 v15, 0x1b

    invoke-direct {v14, v11, v4, v10, v15}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v12, v13, v10, v14, v6}, Lna2;->g(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Li07;

    move-result-object v4

    iget-wide v11, v1, Ln3h;->m:J

    new-instance v13, Ll3h;

    invoke-direct {v13, v4, v10, v5}, Ll3h;-><init>(Li07;Lmt5;B)V

    iput-object v4, v0, Lm3h;->t:Li07;

    iput-boolean v9, v0, Lm3h;->u:Z

    invoke-static {v11, v12, v13, v0}, Luyg;->x(JLkotlin/jvm/functions/Function2;Lnt5;)Ljava/lang/Object;

    move-result-object v11

    if-ne v11, v3, :cond_c4

    return-object v3

    :cond_c4
    move-object v3, v4

    :goto_c5
    check-cast v11, Ljava/lang/String;

    const-wide/16 v12, 0x1

    if-nez v11, :cond_f9

    invoke-interface {v3}, Lunb;->isActive()Z

    move-result v0

    if-eqz v0, :cond_f8

    iget-boolean v0, v2, Lx5f;->h:Z

    if-eqz v0, :cond_f8

    iget-object v0, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v0, v3, Lck0;->p:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo0;

    iget-object v0, v0, Lvo0;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnn0;

    iget-object v0, v0, Lnn0;->a:Lmn0;

    invoke-virtual {v0, v6, v9, v12, v13}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v1}, Lx5f;->U0(Lx56;)V

    :cond_f8
    return-object v10

    :cond_f9
    sget v3, Ln3h;->q:I

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_105

    sget-object v10, Ll08;->a:Ll08;

    goto/16 :goto_1bf

    :cond_105
    :try_start_105
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v11}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "code"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    const/16 v6, 0xc8

    if-ne v4, v6, :cond_1bf

    const-string v4, "data"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "suggestions"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-nez v4, :cond_12a

    sget-object v10, Ll08;->a:Ll08;

    goto/16 :goto_1bf

    :cond_12a
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-static {v5, v4}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v4

    new-instance v6, Ljava/util/ArrayList;

    const/16 v11, 0xa

    invoke-static {v4, v11}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v11

    invoke-direct {v6, v11}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v4}, Lkotlin/ranges/a;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_141
    move-object v11, v4

    check-cast v11, Lacb;

    iget-boolean v11, v11, Lacb;->c:Z

    if-eqz v11, :cond_15c

    move-object v11, v4

    check-cast v11, Lubb;

    invoke-virtual {v11}, Lubb;->nextInt()I

    move-result v11

    new-instance v14, Lorb;

    invoke-virtual {v3, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    invoke-direct {v14, v11}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v6, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_141

    :cond_15c
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v11, v5

    :goto_166
    if-ge v11, v4, :cond_188

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    add-int/lit8 v11, v11, 0x1

    move-object v15, v14

    check-cast v15, Lorb;

    const-string v10, "final_score"

    iget-object v15, v15, Lorb;->a:Lorg/json/JSONObject;

    move-object/from16 p1, v6

    const-wide/16 v5, 0x0

    invoke-virtual {v15, v10, v5, v6}, Lorg/json/JSONObject;->optDouble(Ljava/lang/String;D)D

    move-result-wide v5

    float-to-double v9, v8

    cmpl-double v5, v5, v9

    if-ltz v5, :cond_185

    invoke-virtual {v3, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_185
    move-object/from16 v6, p1

    goto :goto_166

    :cond_188
    new-instance v4, Lau9;

    const/16 v5, 0xd

    invoke-direct {v4, v5}, Lau9;-><init>(B)V

    invoke-static {v4, v3}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_199
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1ad

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lorb;

    invoke-virtual {v1, v5}, Ln3h;->h(Lorb;)Z

    move-result v5

    if-eqz v5, :cond_199

    goto :goto_1ae

    :cond_1ad
    const/4 v4, 0x0

    :goto_1ae
    check-cast v4, Lorb;

    if-nez v4, :cond_1b5

    sget-object v10, Ll08;->a:Ll08;

    goto :goto_1bf

    :cond_1b5
    invoke-virtual {v1, v4, v7}, Ln3h;->j(Lorb;Ljava/lang/String;)Lcom/opera/android/suggestion/Suggestion;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v10
    :try_end_1bd
    .catch Lorg/json/JSONException; {:try_start_105 .. :try_end_1bd} :catch_1be
    .catch Ljava/lang/NumberFormatException; {:try_start_105 .. :try_end_1bd} :catch_1be

    goto :goto_1bf

    :catch_1be
    const/4 v10, 0x0

    :cond_1bf
    :goto_1bf
    if-eqz v10, :cond_257

    iget-wide v0, v0, Lm3h;->y:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    iget-boolean v0, v2, Lx5f;->h:Z

    iget-object v1, v2, Lx5f;->d:Lzpa;

    if-eqz v0, :cond_1f1

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v5, Lck0;

    invoke-direct {v5, v1, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v5, v5, Lck0;->p:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lvo0;

    iget-object v5, v5, Lvo0;->c:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lnn0;

    iget-object v5, v5, Lnn0;->a:Lmn0;

    const/4 v6, 0x0

    const/4 v15, 0x1

    invoke-virtual {v5, v6, v15, v12, v13}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v0}, Lx5f;->U0(Lx56;)V

    :cond_1f1
    const-wide/16 v5, 0x14

    div-long/2addr v3, v5

    sget-wide v5, Ln3h;->p:J

    cmp-long v0, v3, v5

    if-lez v0, :cond_1fb

    move-wide v3, v5

    :cond_1fb
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v0, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v0

    iget-boolean v3, v2, Lx5f;->h:Z

    if-eqz v3, :cond_228

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v5, Lw37;

    const/4 v15, 0x1

    invoke-direct {v5, v0, v15}, Lw37;-><init>(Ljava/util/Map;B)V

    iget-object v0, v4, Lck0;->p:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lvo0;

    invoke-interface {v5, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2, v3}, Lx5f;->U0(Lx56;)V

    :cond_228
    move-object v0, v10

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_257

    iget-boolean v0, v2, Lx5f;->h:Z

    if-eqz v0, :cond_257

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v3, Lck0;->p:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvo0;

    iget-object v1, v1, Lvo0;->c:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnn0;

    iget-object v1, v1, Lnn0;->a:Lmn0;

    const/4 v15, 0x1

    invoke-virtual {v1, v15, v15, v12, v13}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v0}, Lx5f;->U0(Lx56;)V

    :cond_257
    return-object v10
.end method
