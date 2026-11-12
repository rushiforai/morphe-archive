.class public final Lhu9;
.super Lk43;
.source "SourceFile"


# instance fields
.field public final k:J

.field public final synthetic l:Liu9;


# direct methods
.method public constructor <init>(Liu9;Lzy;Ldl;J)V
    .registers 6

    iput-object p1, p0, Lhu9;->l:Liu9;

    invoke-direct {p0, p1, p2, p3}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    iput-wide p4, p0, Lhu9;->k:J

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v0, p0, Lhu9;->l:Liu9;

    iget-object v2, v0, Liu9;->q:Li5o;

    iget-object v1, v0, Liu9;->r:Ljava/lang/String;

    iget-object v6, v0, Liu9;->s:Ljava/lang/String;

    iget-object v7, v0, Liu9;->t:Ljava/lang/String;

    new-instance v4, Ldg7;

    const/16 v0, 0x1c

    invoke-direct {v4, p0, v0}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v2, Li5o;->i:Ljava/lang/Object;

    check-cast p0, Lsy;

    invoke-virtual {p0}, Lsy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lr9i;

    iget-object p0, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p0, Landroid/net/Uri;

    invoke-virtual {p0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "ads"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    const-string v0, "search"

    invoke-virtual {p0, v0}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    iget-object p0, v2, Li5o;->a:Ljava/lang/Object;

    check-cast p0, Liy;

    new-instance v1, Lmy;

    iget-object v0, v2, Li5o;->b:Ljava/lang/Object;

    check-cast v0, Ljy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lt9f;

    invoke-direct/range {v1 .. v7}, Lmy;-><init>(Li5o;Landroid/net/Uri$Builder;Ldg7;Lt9f;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method

.method public final g(Ljava/lang/String;ZZ)V
    .registers 14

    const/4 v0, 0x0

    iget-object v1, p0, Lhu9;->l:Liu9;

    iput-boolean v0, v1, Liu9;->x:Z

    iget-wide v2, p0, Lhu9;->k:J

    iput-wide v2, v1, Liu9;->w:J

    sget-object v8, Lv50;->b:Lv50;

    const/4 v9, 0x0

    move-object v4, p0

    move-object v6, p1

    move v5, p2

    move v7, p3

    invoke-virtual/range {v4 .. v9}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 21

    move-object/from16 v0, p0

    new-instance v1, Lorg/json/JSONObject;

    move-object/from16 v2, p1

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v2, "expirationTimestamp"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    const-string v4, "ads"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long v5, v2, v5

    const-wide/16 v7, 0x7530

    cmp-long v5, v5, v7

    const/4 v6, 0x1

    if-gez v5, :cond_26

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto/16 :goto_b4

    :cond_26
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v5}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v9, 0x0

    :goto_30
    if-ge v9, v5, :cond_b3

    new-instance v10, Lorb;

    invoke-virtual {v1, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    invoke-direct {v10, v11}, Lorb;-><init>(Lorg/json/JSONObject;)V

    const-string v12, "adType"

    invoke-virtual {v10, v12}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x2

    invoke-static {v13}, Lvep;->B(I)[I

    move-result-object v14

    array-length v15, v14

    const/4 v8, 0x0

    :goto_48
    const/16 v16, 0x0

    if-ge v8, v15, :cond_af

    move-object/from16 v17, v1

    aget v1, v14, v8

    if-eq v1, v6, :cond_5a

    if-ne v1, v13, :cond_59

    const-string v18, "GRID"

    :goto_56
    move-object/from16 v13, v18

    goto :goto_5d

    :cond_59
    throw v16

    :cond_5a
    const-string v18, "SINGLE"

    goto :goto_56

    :goto_5d
    invoke-virtual {v13, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a9

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_9d

    if-ne v1, v6, :cond_97

    const-string v1, "rowCount"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    const-string v1, "columnCount"

    invoke-virtual {v11, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    invoke-virtual {v10, v4}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v1

    iget-object v8, v1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8

    new-array v10, v8, [Lnlj;

    const/4 v11, 0x0

    :goto_82
    if-ge v11, v8, :cond_91

    invoke-virtual {v1, v11}, Lvpb;->c(I)Lorb;

    move-result-object v12

    invoke-static {v12, v2, v3}, Lnlj;->b(Lorb;J)Lnlj;

    move-result-object v12

    aput-object v12, v10, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_82

    :cond_91
    new-instance v1, Lc4a;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_a1

    :cond_97
    const-string v0, "Unknown ad type."

    invoke-static {v0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v16

    :cond_9d
    invoke-static {v10, v2, v3}, Lnlj;->b(Lorb;J)Lnlj;

    move-result-object v1

    :goto_a1
    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v1, v17

    goto :goto_30

    :cond_a9
    add-int/lit8 v8, v8, 0x1

    move-object/from16 v1, v17

    const/4 v13, 0x2

    goto :goto_48

    :cond_af
    invoke-static {v12}, Lqp2;->o(Ljava/lang/String;)V

    return-object v16

    :cond_b3
    move-object v1, v7

    :goto_b4
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_101

    new-instance v7, Lami;

    iget-object v3, v0, Lhu9;->l:Liu9;

    iget-object v8, v3, Liu9;->s:Ljava/lang/String;

    iget-object v10, v3, Lbqi;->e:Lyo;

    iget-object v11, v3, Lbqi;->f:Lrm;

    iget-object v12, v3, Liu9;->r:Ljava/lang/String;

    iget-object v13, v3, Lbqi;->h:Li3j;

    iget-object v14, v3, Lbqi;->i:Lap;

    const/16 v15, 0x9

    iget-object v9, v0, Lk43;->d:Ldl;

    invoke-direct/range {v7 .. v15}, Lami;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_de
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_101

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsi;

    new-instance v4, Lez;

    iget-object v5, v3, Lbqi;->j:Landroid/content/Context;

    iget-object v8, v3, Liu9;->p:Lcom/opera/android/Lazy;

    invoke-direct {v4, v5, v8, v6}, Lez;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget v5, Liu9;->y:I

    add-int/lit8 v8, v5, 0x1

    sput v8, Liu9;->y:I

    invoke-virtual {v1, v4, v7, v5}, Lsi;->a(Lez;Lami;I)Lyz;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_de

    :cond_101
    return-object v2
.end method
