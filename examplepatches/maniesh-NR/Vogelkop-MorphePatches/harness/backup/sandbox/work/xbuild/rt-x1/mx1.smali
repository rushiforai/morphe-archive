.class public final Lmx1;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic A:Ljava/util/List;

.field public final synthetic B:Lole;

.field public final synthetic C:Ljava/util/LinkedHashMap;

.field public final synthetic D:Lqca;

.field public t:Ljava/io/File;

.field public u:Lole;

.field public v:Ljava/util/Map;

.field public w:Lqca;

.field public x:Ljava/util/Iterator;

.field public y:Z

.field public final synthetic z:Lesk;


# direct methods
.method public constructor <init>(Lesk;Ljava/util/List;Lole;Ljava/util/LinkedHashMap;Lqca;Lmt5;)V
    .registers 7

    iput-object p1, p0, Lmx1;->z:Lesk;

    iput-object p2, p0, Lmx1;->A:Ljava/util/List;

    iput-object p3, p0, Lmx1;->B:Lole;

    iput-object p4, p0, Lmx1;->C:Ljava/util/LinkedHashMap;

    iput-object p5, p0, Lmx1;->D:Lqca;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 10

    new-instance v0, Lmx1;

    iget-object v4, p0, Lmx1;->C:Ljava/util/LinkedHashMap;

    iget-object v5, p0, Lmx1;->D:Lqca;

    iget-object v1, p0, Lmx1;->z:Lesk;

    iget-object v2, p0, Lmx1;->A:Ljava/util/List;

    iget-object v3, p0, Lmx1;->B:Lole;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lmx1;-><init>(Lesk;Ljava/util/List;Lole;Ljava/util/LinkedHashMap;Lqca;Lmt5;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lmx1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lmx1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lmx1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25

    move-object/from16 v0, p0

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v2, v0, Lmx1;->y:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_23

    if-ne v2, v4, :cond_1d

    iget-object v2, v0, Lmx1;->x:Ljava/util/Iterator;

    iget-object v5, v0, Lmx1;->w:Lqca;

    iget-object v6, v0, Lmx1;->v:Ljava/util/Map;

    check-cast v6, Ljava/util/Map;

    iget-object v7, v0, Lmx1;->u:Lole;

    iget-object v8, v0, Lmx1;->t:Ljava/io/File;

    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_21c

    :cond_1d
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_23
    invoke-static/range {p1 .. p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object v2, v0, Lmx1;->z:Lesk;

    invoke-interface {v2}, Lesk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    iget-object v5, v0, Lmx1;->A:Ljava/util/List;

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    iget-object v6, v0, Lmx1;->B:Lole;

    iget-object v7, v0, Lmx1;->C:Ljava/util/LinkedHashMap;

    iget-object v8, v0, Lmx1;->D:Lqca;

    move-object/from16 v22, v8

    move-object v8, v2

    move-object v2, v5

    move-object/from16 v5, v22

    move-object/from16 v22, v7

    move-object v7, v6

    move-object/from16 v6, v22

    :goto_4a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_223

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lsfb;

    if-eqz v9, :cond_21c

    iget-wide v10, v9, Lsfb;->a:J

    new-instance v12, Ljava/lang/Long;

    invoke-direct {v12, v10, v11}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v6, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    if-nez v12, :cond_69

    sget-object v12, Ll08;->a:Ll08;

    :cond_69
    iput-object v8, v0, Lmx1;->t:Ljava/io/File;

    iput-object v7, v0, Lmx1;->u:Lole;

    move-object v13, v6

    check-cast v13, Ljava/util/Map;

    iput-object v13, v0, Lmx1;->v:Ljava/util/Map;

    iput-object v5, v0, Lmx1;->w:Lqca;

    iput-object v2, v0, Lmx1;->x:Ljava/util/Iterator;

    iput-boolean v4, v0, Lmx1;->y:Z

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v13, v9, Lsfb;->b:Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v14

    if-nez v14, :cond_95

    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_95

    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    move-object/from16 p1, v2

    move-object/from16 v16, v3

    move-object/from16 v17, v6

    move-object/from16 v21, v7

    goto/16 :goto_1ef

    :cond_95
    const-string v14, "ai-chat-"

    invoke-static {v10, v11, v14}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v14

    new-instance v15, Ljava/io/File;

    move-object/from16 v16, v3

    const-string v3, ".data"

    invoke-virtual {v14, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v15, v8, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    move-object/from16 p1, v2

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2, v4}, Lorb;->r(Ljava/lang/String;Z)V

    check-cast v12, Ljava/lang/Iterable;

    instance-of v2, v12, Ljava/util/Collection;

    if-eqz v2, :cond_c5

    move-object v2, v12

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_136

    :cond_c5
    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_c9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_136

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v4, v17

    check-cast v4, Ltfb;

    move-object/from16 v17, v2

    instance-of v2, v4, Lkfb;

    if-eqz v2, :cond_eb

    check-cast v4, Lkfb;

    iget-object v2, v4, Lkfb;->h:Lmfb;

    sget-object v4, Lmfb;->c:Lmfb;

    move-object/from16 v19, v3

    if-ne v2, v4, :cond_e9

    const/4 v2, 0x1

    goto :goto_12d

    :catch_e9
    :cond_e9
    :goto_e9
    const/4 v2, 0x0

    goto :goto_12d

    :cond_eb
    instance-of v2, v4, Lpfb;

    if-eqz v2, :cond_12a

    :try_start_ef
    check-cast v4, Lpfb;

    iget-object v2, v4, Lpfb;->b:Ljava/lang/String;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "type"

    invoke-virtual {v4, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_111

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "aria-storage-chat-item"

    invoke-virtual {v2, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    move-object/from16 v19, v3

    goto :goto_12d

    :cond_111
    new-instance v4, Lorg/json/JSONException;
    :try_end_113
    .catch Lorg/json/JSONException; {:try_start_ef .. :try_end_113} :catch_12a

    move-object/from16 v19, v3

    :try_start_115
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " is null"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_12a
    .catch Lorg/json/JSONException; {:try_start_115 .. :try_end_12a} :catch_e9

    :catch_12a
    :cond_12a
    move-object/from16 v19, v3

    goto :goto_e9

    :goto_12d
    if-eqz v2, :cond_131

    const/4 v4, 0x1

    goto :goto_139

    :cond_131
    move-object/from16 v2, v17

    move-object/from16 v3, v19

    goto :goto_c9

    :cond_136
    move-object/from16 v19, v3

    const/4 v4, 0x0

    :goto_139
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "activeChatId"

    :try_start_140
    invoke-virtual {v2, v3, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_143
    .catch Lorg/json/JSONException; {:try_start_140 .. :try_end_143} :catch_217

    const-string v3, "chatList"

    move-object/from16 v17, v6

    :try_start_147
    invoke-static/range {v19 .. v19}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_14e
    .catch Lorg/json/JSONException; {:try_start_147 .. :try_end_14e} :catch_212

    const-string v3, "firstChatId"

    :try_start_150
    invoke-virtual {v2, v3, v10, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_153
    .catch Lorg/json/JSONException; {:try_start_150 .. :try_end_153} :catch_20d

    const-string v3, "haveSuccessfulResponse"

    :try_start_155
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_158
    .catch Lorg/json/JSONException; {:try_start_155 .. :try_end_158} :catch_208

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "app-state"

    const/4 v6, 0x0

    :try_start_160
    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_163
    .catch Lorg/json/JSONException; {:try_start_160 .. :try_end_163} :catch_203

    const-string v4, "clearableStorage-usedKeys"

    :try_start_165
    invoke-virtual {v3, v4, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_168
    .catch Lorg/json/JSONException; {:try_start_165 .. :try_end_168} :catch_1fe

    new-instance v4, Ljava/util/LinkedHashMap;

    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    const-string v6, "chat/"

    move-object/from16 v18, v2

    invoke-static {v10, v11, v6}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v19, v3

    invoke-virtual {v9}, Lsfb;->a()Lorb;

    move-result-object v3

    iget-object v3, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v12}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_188
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1bb

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltfb;

    move-object v12, v2

    move-object/from16 v20, v3

    invoke-interface/range {v20 .. v20}, Ltfb;->c()J

    move-result-wide v2

    move-object/from16 v21, v7

    const-string v7, "/item/"

    invoke-static {v10, v11, v6, v7}, Lp3p;->q(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface/range {v20 .. v20}, Ltfb;->a()Lorb;

    move-result-object v3

    iget-object v3, v3, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v12

    move-object/from16 v7, v21

    goto :goto_188

    :cond_1bb
    move-object/from16 v21, v7

    const-string v2, "aria-app-state"

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "aria-clearableStorage-usedKeys"

    invoke-virtual/range {v19 .. v19}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_1cf
    invoke-static {v15, v4}, Lk1g;->k0(Ljava/io/File;Ljava/util/Map;)V
    :try_end_1d2
    .catch Ljava/io/IOException; {:try_start_1cf .. :try_end_1d2} :catch_1f9

    iget-wide v2, v9, Lsfb;->j:J

    invoke-virtual {v15, v2, v3}, Ljava/io/File;->setLastModified(J)Z

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1ed

    new-instance v2, Lyca;

    invoke-direct {v2, v14, v13}, Lyca;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v2, v0}, Lqca;->a(Lyca;Lkuk;)Ljava/lang/Object;

    move-result-object v9

    sget-object v2, Lpx5;->a:Lpx5;

    if-eq v9, v2, :cond_1ef

    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1ef

    :cond_1ed
    sget-object v9, Lkotlin/Unit;->a:Lkotlin/Unit;

    :cond_1ef
    :goto_1ef
    if-ne v9, v1, :cond_1f2

    return-object v1

    :cond_1f2
    move-object/from16 v2, p1

    move-object/from16 v6, v17

    move-object/from16 v7, v21

    goto :goto_21e

    :catch_1f9
    move-exception v0

    invoke-static {v0}, Lrqd;->p(Ljava/lang/Throwable;)V

    return-object v16

    :catch_1fe
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :catch_203
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :catch_208
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :catch_20d
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :catch_212
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :catch_217
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v16

    :cond_21c
    :goto_21c
    move-object/from16 v16, v3

    :goto_21e
    move-object/from16 v3, v16

    const/4 v4, 0x1

    goto/16 :goto_4a

    :cond_223
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0
.end method
