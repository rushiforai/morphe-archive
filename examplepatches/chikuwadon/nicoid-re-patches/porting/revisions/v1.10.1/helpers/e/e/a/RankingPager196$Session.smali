.class final Le/e/a/RankingPager196$Session;
.super Ljava/lang/Object;
.source "RankingPager196.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/RankingPager196;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Session"
.end annotation


# instance fields
.field ended:Z

.field genreIndex:I

.field final genres:[Le/e/a/RankingPager196$Genre;

.field final matches:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field

.field rank:I

.field final rules:Lorg/json/JSONArray;

.field scope:Le/e/a/RankingPager196$Scope;

.field final signature:Ljava/lang/String;

.field final source:Le/e/a/RankingPager196$Source;

.field final term:Ljava/lang/String;

.field final unique:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field warnings:I


# direct methods
.method constructor <init>(Lorg/json/JSONObject;Ljava/lang/String;Le/e/a/RankingPager196$Source;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    .line 47
    invoke-static {p1}, Le/e/a/RankingRules190;->validate(Lorg/json/JSONObject;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/RankingPager196$Session;->signature:Ljava/lang/String;

    iput-object p2, p0, Le/e/a/RankingPager196$Session;->term:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/RankingPager196$Session;->source:Le/e/a/RankingPager196$Source;

    const-string p2, "rules"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p2

    iput-object p2, p0, Le/e/a/RankingPager196$Session;->rules:Lorg/json/JSONArray;

    .line 48
    const-string p2, "genres"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result p2

    new-array p2, p2, [Le/e/a/RankingPager196$Genre;

    iput-object p2, p0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    const/4 p2, 0x0

    :goto_4c
    iget-object p3, p0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length p3, p3

    if-lt p2, p3, :cond_52

    .line 49
    return-void

    .line 48
    :cond_52
    iget-object p3, p0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    new-instance v0, Le/e/a/RankingPager196$Genre;

    invoke-virtual {p1, p2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Le/e/a/RankingPager196$Genre;-><init>(Ljava/lang/String;)V

    aput-object v0, p3, p2

    add-int/lit8 p2, p2, 0x1

    goto :goto_4c
.end method


# virtual methods
.method candidate(Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 52
    move-object/from16 v0, p0

    :cond_2
    :goto_2
    iget-boolean v1, v0, Le/e/a/RankingPager196$Session;->ended:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_8

    .line 70
    return-object v2

    .line 53
    :cond_8
    invoke-virtual/range {p0 .. p1}, Le/e/a/RankingPager196$Session;->checkScope(Le/e/a/NetworkTask;)V

    iget-object v1, v0, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    const/16 v3, 0x3e8

    const/4 v4, 0x1

    if-ge v1, v3, :cond_131

    iget v1, v0, Le/e/a/RankingPager196$Session;->rank:I

    if-lt v1, v3, :cond_1c

    goto/16 :goto_131

    .line 54
    :cond_1c
    iget-object v1, v0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v3, v1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    :goto_22
    if-lt v6, v3, :cond_111

    .line 55
    if-eqz v7, :cond_29

    iput-boolean v4, v0, Le/e/a/RankingPager196$Session;->ended:Z

    return-object v2

    .line 56
    :cond_29
    iget-object v1, v0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    iget v3, v0, Le/e/a/RankingPager196$Session;->genreIndex:I

    aget-object v1, v1, v3

    iget v3, v0, Le/e/a/RankingPager196$Session;->rank:I

    div-int/lit8 v3, v3, 0x64

    iget v6, v0, Le/e/a/RankingPager196$Session;->rank:I

    rem-int/lit8 v6, v6, 0x64

    .line 57
    iget-boolean v7, v1, Le/e/a/RankingPager196$Genre;->ended:Z

    const-string v8, "watchId"

    const-string v9, "content"

    const-string v10, "id"

    if-nez v7, :cond_c5

    iget v7, v1, Le/e/a/RankingPager196$Genre;->page:I

    if-eq v7, v3, :cond_c5

    .line 58
    iget-object v7, v0, Le/e/a/RankingPager196$Session;->source:Le/e/a/RankingPager196$Source;

    iget-object v11, v1, Le/e/a/RankingPager196$Genre;->id:Ljava/lang/String;

    iget-object v12, v0, Le/e/a/RankingPager196$Session;->term:Ljava/lang/String;

    add-int/lit8 v13, v3, 0x1

    move-object/from16 v14, p1

    invoke-interface {v7, v11, v12, v13, v14}, Le/e/a/RankingPager196$Source;->page(Ljava/lang/String;Ljava/lang/String;ILe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual/range {p0 .. p1}, Le/e/a/RankingPager196$Session;->checkScope(Le/e/a/NetworkTask;)V

    .line 59
    const-string v11, "items"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v11

    .line 60
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    .line 61
    const/4 v13, 0x0

    :goto_62
    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-lt v13, v15, :cond_a0

    .line 62
    invoke-interface {v12}, Ljava/util/Set;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_7f

    iget-object v13, v1, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    invoke-interface {v13, v12}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v13

    if-nez v13, :cond_77

    goto :goto_7f

    :cond_77
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Repeated ranking page"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 63
    :cond_7f
    :goto_7f
    iget-object v13, v1, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    invoke-interface {v13, v12}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iput v3, v1, Le/e/a/RankingPager196$Genre;->page:I

    iput-object v11, v1, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    invoke-virtual {v11}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-eqz v11, :cond_9c

    const-string v11, "hasNext"

    invoke-virtual {v7, v11, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_9c

    const/16 v7, 0x9

    if-ge v3, v7, :cond_9c

    const/4 v7, 0x0

    goto :goto_9d

    :cond_9c
    const/4 v7, 0x1

    :goto_9d
    iput-boolean v7, v1, Le/e/a/RankingPager196$Genre;->ended:Z

    goto :goto_c7

    .line 61
    :cond_a0
    invoke-virtual {v11, v13}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    if-eqz v15, :cond_c1

    invoke-virtual {v15, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v16

    if-nez v16, :cond_ae

    move-object v2, v15

    goto :goto_b0

    :cond_ae
    move-object/from16 v2, v16

    :goto_b0
    invoke-virtual {v15, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v10, v15}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_c1

    invoke-interface {v12, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_c1
    add-int/lit8 v13, v13, 0x1

    const/4 v2, 0x0

    goto :goto_62

    .line 57
    :cond_c5
    move-object/from16 v14, p1

    .line 65
    :goto_c7
    iget v2, v1, Le/e/a/RankingPager196$Genre;->page:I

    if-ne v2, v3, :cond_d2

    iget-object v1, v1, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    goto :goto_d3

    :cond_d2
    const/4 v2, 0x0

    .line 66
    :goto_d3
    iget v1, v0, Le/e/a/RankingPager196$Session;->genreIndex:I

    add-int/2addr v1, v4

    iput v1, v0, Le/e/a/RankingPager196$Session;->genreIndex:I

    iget v1, v0, Le/e/a/RankingPager196$Session;->genreIndex:I

    iget-object v3, v0, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v3, v3

    if-ne v1, v3, :cond_e6

    iput v5, v0, Le/e/a/RankingPager196$Session;->genreIndex:I

    iget v1, v0, Le/e/a/RankingPager196$Session;->rank:I

    add-int/2addr v1, v4

    iput v1, v0, Le/e/a/RankingPager196$Session;->rank:I

    .line 67
    :cond_e6
    if-nez v2, :cond_ea

    goto/16 :goto_2

    :cond_ea
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-nez v1, :cond_f1

    move-object v1, v2

    .line 68
    :cond_f1
    const-string v3, ""

    invoke-virtual {v2, v8, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v10, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "(?:sm|nm|so|ss)[0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, v0, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_10d

    goto/16 :goto_2

    .line 69
    :cond_10d
    invoke-virtual {v1, v10, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    return-object v1

    .line 54
    :cond_111
    move-object/from16 v14, p1

    aget-object v2, v1, v6

    iget-boolean v8, v2, Le/e/a/RankingPager196$Genre;->ended:Z

    if-eqz v8, :cond_12a

    iget v8, v0, Le/e/a/RankingPager196$Session;->rank:I

    iget v9, v2, Le/e/a/RankingPager196$Genre;->page:I

    mul-int/lit8 v9, v9, 0x64

    iget-object v2, v2, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    add-int/2addr v9, v2

    if-lt v8, v9, :cond_12a

    const/4 v2, 0x1

    goto :goto_12b

    :cond_12a
    const/4 v2, 0x0

    :goto_12b
    and-int/2addr v7, v2

    add-int/lit8 v6, v6, 0x1

    const/4 v2, 0x0

    goto/16 :goto_22

    .line 53
    :cond_131
    :goto_131
    iput-boolean v4, v0, Le/e/a/RankingPager196$Session;->ended:Z

    const/4 v1, 0x0

    return-object v1
.end method

.method checkScope(Le/e/a/NetworkTask;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/InterruptedIOException;
        }
    .end annotation

    .line 45
    iget-object v0, p0, Le/e/a/RankingPager196$Session;->scope:Le/e/a/RankingPager196$Scope;

    if-eqz v0, :cond_f

    iget-object v0, p0, Le/e/a/RankingPager196$Session;->scope:Le/e/a/RankingPager196$Scope;

    invoke-interface {v0}, Le/e/a/RankingPager196$Scope;->active()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancel()V

    :cond_f
    invoke-static {p1}, Le/e/a/RankingPager196;->check(Le/e/a/NetworkTask;)V

    return-void
.end method

.method synthetic lambda$0$e-e-a-RankingPager196$Session(Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONArray;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 90
    iget-object v0, p0, Le/e/a/RankingPager196$Session;->source:Le/e/a/RankingPager196$Source;

    invoke-interface {v0, p1, p2}, Le/e/a/RankingPager196$Source;->tags(Lorg/json/JSONObject;Le/e/a/NetworkTask;)Lorg/json/JSONArray;

    move-result-object p1

    return-object p1
.end method

.method more()Z
    .registers 2

    .line 50
    iget-boolean v0, p0, Le/e/a/RankingPager196$Session;->ended:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method declared-synchronized page(ILe/e/a/NetworkTask;)Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 72
    const/4 v0, 0x0

    :try_start_2
    invoke-virtual {p0, p1, p2, v0}, Le/e/a/RankingPager196$Session;->page(ILe/e/a/NetworkTask;Le/e/a/RankingPager196$Scope;)Ljava/util/ArrayList;

    move-result-object p1
    :try_end_6
    .catchall {:try_start_2 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-object p1

    .line 72
    :catchall_8
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized page(ILe/e/a/NetworkTask;Le/e/a/RankingPager196$Scope;)Ljava/util/ArrayList;
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Le/e/a/NetworkTask;",
            "Le/e/a/RankingPager196$Scope;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object v1, p0

    monitor-enter p0

    .line 74
    move-object/from16 v0, p3

    :try_start_4
    iput-object v0, v1, Le/e/a/RankingPager196$Session;->scope:Le/e/a/RankingPager196$Scope;

    .line 75
    iget v2, v1, Le/e/a/RankingPager196$Session;->rank:I

    iget v3, v1, Le/e/a/RankingPager196$Session;->genreIndex:I

    iget v4, v1, Le/e/a/RankingPager196$Session;->warnings:I

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-boolean v6, v1, Le/e/a/RankingPager196$Session;->ended:Z

    .line 76
    new-instance v7, Ljava/util/HashSet;

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-direct {v7, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v0, v0

    new-array v8, v0, [I

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v0, v0

    new-array v9, v0, [Z

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v0, v0

    new-array v10, v0, [Lorg/json/JSONArray;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 77
    const/4 v12, 0x0

    const/4 v0, 0x0

    :goto_31
    iget-object v13, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v13, v13
    :try_end_34
    .catchall {:try_start_4 .. :try_end_34} :catchall_d2

    if-lt v0, v13, :cond_a8

    .line 78
    const/4 v13, 0x0

    :try_start_37
    invoke-virtual/range {p0 .. p2}, Le/e/a/RankingPager196$Session;->readPage(ILe/e/a/NetworkTask;)Ljava/util/ArrayList;

    move-result-object v0
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_3b} :catch_41
    .catchall {:try_start_37 .. :try_end_3b} :catchall_3f

    .line 81
    :try_start_3b
    iput-object v13, v1, Le/e/a/RankingPager196$Session;->scope:Le/e/a/RankingPager196$Scope;
    :try_end_3d
    .catchall {:try_start_3b .. :try_end_3d} :catchall_d2

    .line 78
    monitor-exit p0

    return-object v0

    .line 81
    :catchall_3f
    move-exception v0

    goto :goto_a5

    .line 78
    :catch_41
    move-exception v0

    move-object v14, v0

    .line 79
    :try_start_43
    iput v2, v1, Le/e/a/RankingPager196$Session;->rank:I

    iput v3, v1, Le/e/a/RankingPager196$Session;->genreIndex:I

    iput v4, v1, Le/e/a/RankingPager196$Session;->warnings:I

    iput-boolean v6, v1, Le/e/a/RankingPager196$Session;->ended:Z

    :goto_4b
    iget-object v0, v1, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gt v0, v5, :cond_97

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-interface {v0, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 80
    nop

    :goto_5e
    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    array-length v0, v0

    if-ge v12, v0, :cond_96

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v0, v0, v12

    aget v2, v8, v12

    iput v2, v0, Le/e/a/RankingPager196$Genre;->page:I

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v0, v0, v12

    aget-boolean v2, v9, v12

    iput-boolean v2, v0, Le/e/a/RankingPager196$Genre;->ended:Z

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v0, v0, v12

    aget-object v2, v10, v12

    iput-object v2, v0, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v0, v0, v12

    iget-object v0, v0, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v0, v0, v12

    iget-object v0, v0, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v0, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v12, v12, 0x1

    goto :goto_5e

    :cond_96
    throw v14

    .line 79
    :cond_97
    iget-object v0, v1, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    iget-object v2, v1, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_a4
    .catchall {:try_start_43 .. :try_end_a4} :catchall_3f

    goto :goto_4b

    .line 81
    :goto_a5
    :try_start_a5
    iput-object v13, v1, Le/e/a/RankingPager196$Session;->scope:Le/e/a/RankingPager196$Scope;

    throw v0

    .line 77
    :cond_a8
    iget-object v13, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v13, v13, v0

    iget v13, v13, Le/e/a/RankingPager196$Genre;->page:I

    aput v13, v8, v0

    iget-object v13, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v13, v13, v0

    iget-boolean v13, v13, Le/e/a/RankingPager196$Genre;->ended:Z

    aput-boolean v13, v9, v0

    iget-object v13, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v13, v13, v0

    iget-object v13, v13, Le/e/a/RankingPager196$Genre;->items:Lorg/json/JSONArray;

    aput-object v13, v10, v0

    new-instance v13, Ljava/util/HashSet;

    iget-object v14, v1, Le/e/a/RankingPager196$Session;->genres:[Le/e/a/RankingPager196$Genre;

    aget-object v14, v14, v0

    iget-object v14, v14, Le/e/a/RankingPager196$Genre;->seen:Ljava/util/Set;

    invoke-direct {v13, v14}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ce
    .catchall {:try_start_a5 .. :try_end_ce} :catchall_d2

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_31

    .line 73
    :catchall_d2
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method readPage(ILe/e/a/NetworkTask;)Ljava/util/ArrayList;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Le/e/a/NetworkTask;",
            ")",
            "Ljava/util/ArrayList<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 84
    add-int/lit8 v0, p1, 0x64

    const/16 v1, 0x3e8

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 85
    nop

    :goto_9
    iget-object v2, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v0, :cond_ef

    iget-boolean v2, p0, Le/e/a/RankingPager196$Session;->ended:Z

    if-eqz v2, :cond_18

    goto/16 :goto_ef

    .line 87
    :cond_18
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 89
    const/4 v6, 0x0

    :try_start_28
    iget-object v7, p0, Le/e/a/RankingPager196$Session;->rules:Lorg/json/JSONArray;

    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-nez v7, :cond_32

    const/4 v7, 0x1

    goto :goto_3f

    :cond_32
    iget-object v7, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    sub-int v7, v0, v7

    const/4 v8, 0x4

    invoke-static {v8, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    .line 90
    :goto_3f
    const/4 v8, 0x0

    :goto_40
    if-lt v8, v7, :cond_43

    :goto_42
    goto :goto_4a

    :cond_43
    invoke-virtual {p0, p2}, Le/e/a/RankingPager196$Session;->candidate(Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v9

    if-nez v9, :cond_ad

    goto :goto_42

    .line 91
    :goto_4a
    const/4 v7, 0x0

    :goto_4b
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8
    :try_end_4f
    .catchall {:try_start_28 .. :try_end_4f} :catchall_d2

    if-lt v7, v8, :cond_6e

    .line 96
    nop

    :goto_52
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt v6, v2, :cond_59

    goto :goto_9

    :cond_59
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/NetworkTask;

    invoke-virtual {v2}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/Future;

    invoke-interface {v2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_52

    .line 92
    :cond_6e
    :try_start_6e
    iget-object v8, p0, Le/e/a/RankingPager196$Session;->rules:Lorg/json/JSONArray;

    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v8
    :try_end_74
    .catchall {:try_start_6e .. :try_end_74} :catchall_d2

    if-nez v8, :cond_78

    const/4 v8, 0x1

    goto :goto_79

    :cond_78
    const/4 v8, 0x0

    .line 93
    :goto_79
    if-nez v8, :cond_9d

    :goto_7b
    :try_start_7b
    invoke-virtual {p0, p2}, Le/e/a/RankingPager196$Session;->checkScope(Le/e/a/NetworkTask;)V
    :try_end_7e
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_7b .. :try_end_7e} :catch_97
    .catchall {:try_start_7b .. :try_end_7e} :catchall_d2

    :try_start_7e
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/concurrent/Future;

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v11, 0x64

    invoke-interface {v9, v11, v12, v10}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONArray;
    :try_end_8e
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_7e .. :try_end_8e} :catch_95
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_7e .. :try_end_8e} :catch_97
    .catchall {:try_start_7e .. :try_end_8e} :catchall_d2

    :try_start_8e
    iget-object v10, p0, Le/e/a/RankingPager196$Session;->rules:Lorg/json/JSONArray;

    invoke-static {v9, v10}, Le/e/a/RankingRules190;->matches(Lorg/json/JSONArray;Lorg/json/JSONArray;)Z

    move-result v8
    :try_end_94
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_8e .. :try_end_94} :catch_97
    .catchall {:try_start_8e .. :try_end_94} :catchall_d2

    goto :goto_9d

    :catch_95
    move-exception v9

    goto :goto_7b

    :catch_97
    move-exception v9

    :try_start_98
    iget v9, p0, Le/e/a/RankingPager196$Session;->warnings:I

    add-int/2addr v9, v3

    iput v9, p0, Le/e/a/RankingPager196$Session;->warnings:I

    .line 94
    :cond_9d
    :goto_9d
    if-eqz v8, :cond_aa

    iget-object v8, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_aa
    add-int/lit8 v7, v7, 0x1

    goto :goto_4b

    .line 90
    :cond_ad
    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v10, p0, Le/e/a/RankingPager196$Session;->rules:Lorg/json/JSONArray;

    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-lez v10, :cond_ce

    new-instance v10, Le/e/a/NetworkTask;

    invoke-direct {v10}, Le/e/a/NetworkTask;-><init>()V

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v11, Le/e/a/RankingPager196;->TAGS:Ljava/util/concurrent/ExecutorService;

    new-instance v12, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;

    invoke-direct {v12, p0, v9, v10}, Le/e/a/RankingPager196$Session$$ExternalSyntheticLambda0;-><init>(Le/e/a/RankingPager196$Session;Lorg/json/JSONObject;Le/e/a/NetworkTask;)V

    invoke-interface {v11, v12}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_ce
    .catchall {:try_start_98 .. :try_end_ce} :catchall_d2

    :cond_ce
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_40

    .line 96
    :catchall_d2
    move-exception p1

    :goto_d3
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ge v6, p2, :cond_ee

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Le/e/a/NetworkTask;

    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancel()V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/Future;

    invoke-interface {p2, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_d3

    :cond_ee
    throw p1

    .line 98
    :cond_ef
    :goto_ef
    iget-object v2, p0, Le/e/a/RankingPager196$Session;->unique:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    if-lt v2, v1, :cond_f9

    iput-boolean v3, p0, Le/e/a/RankingPager196$Session;->ended:Z

    .line 99
    :cond_f9
    invoke-virtual {p0, p2}, Le/e/a/RankingPager196$Session;->checkScope(Le/e/a/NetworkTask;)V

    new-instance p2, Ljava/util/ArrayList;

    iget-object v1, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    iget-object v2, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-object v2, p0, Le/e/a/RankingPager196$Session;->matches:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v1, p1, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object p2
.end method
