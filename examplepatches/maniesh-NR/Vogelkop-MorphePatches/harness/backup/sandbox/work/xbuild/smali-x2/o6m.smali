.class public final Lo6m;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"


# instance fields
.field public final d:Lm6m;


# direct methods
.method public constructor <init>(Lm6m;)V
    .registers 3

    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p1, p0, Lo6m;->d:Lm6m;

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 22

    move-object/from16 v0, p4

    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_100

    move-object/from16 v1, p0

    iget-object v1, v1, Lo6m;->d:Lm6m;

    iget-object v2, v1, Lm6m;->c:Ldpj;

    const-string v3, ""

    if-nez v2, :cond_16

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto/16 :goto_c0

    :cond_16
    iget v2, v1, Lm6m;->p:I

    const/4 v4, 0x0

    if-eqz v2, :cond_33

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    if-nez v2, :cond_33

    iget-object v2, v1, Lm6m;->h:Llg;

    invoke-virtual {v2}, Llg;->b()Leri;

    move-result-object v2

    const/4 v5, 0x2

    sget-object v6, Lp6l;->a:Lp6l;

    invoke-interface {v2, v5, v6, v3}, Leri;->a(ILp6l;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ldti;->a(Ljava/lang/String;)Z

    move-result v2

    goto :goto_34

    :cond_33
    move v2, v4

    :goto_34
    if-nez v2, :cond_3a

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto/16 :goto_c0

    :cond_3a
    iget-object v2, v1, Lm6m;->d:Lqq8;

    if-nez v2, :cond_bc

    iget-object v2, v1, Lm6m;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    new-instance v5, Lqq8;

    const-string v6, "trending"

    invoke-interface {v2, v6, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_9b

    :try_start_55
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    :goto_63
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v4, v9, :cond_9d

    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    if-eqz v9, :cond_8c

    const-string v10, "search"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lj6m;

    const-string v12, "query"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v10, :cond_84

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    goto :goto_85

    :cond_84
    move-object v10, v8

    :goto_85
    invoke-direct {v11, v9, v10}, Lj6m;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_98

    :cond_8c
    new-instance v9, Lj6m;

    invoke-virtual {v7, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v8}, Lj6m;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_98
    .catch Lorg/json/JSONException; {:try_start_55 .. :try_end_98} :catch_9b

    :goto_98
    add-int/lit8 v4, v4, 0x1

    goto :goto_63

    :catch_9b
    :cond_9b
    sget-object v6, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_9d
    const-string v4, "expires"

    const-wide/16 v9, 0x0

    invoke-interface {v2, v4, v9, v10}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v9

    new-instance v4, Lk6m;

    const-string v7, "country_code"

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v11, "language_code"

    invoke-interface {v2, v11, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v7, v2}, Lk6m;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v5, v6, v9, v10, v4}, Lqq8;-><init>(Ljava/util/List;JLk6m;)V

    iput-object v5, v1, Lm6m;->d:Lqq8;

    move-object v2, v5

    :cond_bc
    iget-object v1, v2, Lqq8;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    :goto_c0
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_cd
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_fc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lj6m;

    iget-object v7, v4, Lj6m;->a:Ljava/lang/String;

    iget-object v4, v4, Lj6m;->b:Landroid/net/Uri;

    if-eqz v4, :cond_e5

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v9, v4

    goto :goto_e6

    :cond_e5
    move-object v9, v3

    :goto_e6
    new-instance v5, Lcom/opera/android/suggestion/Suggestion;

    const/4 v11, 0x0

    const/4 v14, 0x0

    const/16 v6, 0xa

    const-string v8, ""

    const/4 v10, 0x0

    const/16 v12, 0x3e8

    const/4 v15, -0x1

    const/16 v16, 0x0

    move-object v13, v8

    invoke-direct/range {v5 .. v16}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_cd

    :cond_fc
    invoke-virtual {v0, v2}, Lyv4;->d(Ljava/util/List;)V

    return-void

    :cond_100
    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {v0, v1}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method
