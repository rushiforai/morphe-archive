.class final Le/e/a/CommentHistory$Job;
.super Ljava/lang/Object;
.source "CommentHistory.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentHistory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Job"
.end annotation


# instance fields
.field final body:Ljava/lang/String;

.field final limit:I

.field final owner:Ljava/lang/Object;

.field final response:Ljava/lang/String;

.field final url:Ljava/lang/String;

.field final video:Ljava/lang/String;

.field final watch:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    iput-object p2, p0, Le/e/a/CommentHistory$Job;->url:Ljava/lang/String;

    iput-object p3, p0, Le/e/a/CommentHistory$Job;->body:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/CommentHistory$Job;->response:Ljava/lang/String;

    iput p5, p0, Le/e/a/CommentHistory$Job;->limit:I

    .line 51
    const-string p2, "modernWatch"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {p1, p2}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, Le/e/a/CommentHistory$Job;->watch:Ljava/lang/Object;

    const-string p2, "d"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {p1, p2}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/CommentHistory$Job;->video:Ljava/lang/String;

    .line 52
    return-void
.end method


# virtual methods
.method current()Z
    .registers 5

    .line 53
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Le/e/a/CommentHistory$Job;->watch:Ljava/lang/Object;

    iget-object v2, p0, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    const-string v3, "modernWatch"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v3}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_2c

    iget-object v1, p0, Le/e/a/CommentHistory$Job;->video:Ljava/lang/String;

    iget-object v2, p0, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    const-string v3, "d"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v2, v3}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v1
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_29} :catch_2d

    if-nez v1, :cond_2c

    const/4 v0, 0x1

    :cond_2c
    return v0

    :catch_2d
    move-exception v1

    return v0
.end method

.method public run()V
    .registers 39

    .line 56
    move-object/from16 v1, p0

    const-string v2, "targets"

    const-string v3, "params"

    const-string v4, "threads"

    const-string v5, "data"

    :try_start_a
    new-instance v6, Lorg/json/JSONObject;

    iget-object v0, v1, Le/e/a/CommentHistory$Job;->response:Ljava/lang/String;

    invoke-direct {v6, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    iget-object v7, v1, Le/e/a/CommentHistory$Job;->body:Ljava/lang/String;

    invoke-direct {v0, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    .line 58
    new-instance v8, Ljava/util/LinkedHashMap;

    invoke-direct {v8}, Ljava/util/LinkedHashMap;-><init>()V

    .line 59
    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    .line 60
    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    .line 61
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 62
    nop

    .line 63
    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_37
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v15
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_3b} :catch_40d

    const-wide/16 v16, 0x0

    const-string v12, "no"

    move-object/from16 v18, v6

    const-string v6, "id"

    move-object/from16 v19, v9

    const-string v9, ":"

    move-object/from16 v20, v12

    const-string v12, "comments"

    if-lt v13, v15, :cond_34c

    .line 68
    :try_start_4d
    invoke-interface {v10, v11}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 69
    iget v11, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-lt v14, v11, :cond_55

    return-void

    .line 70
    :cond_55
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 71
    nop

    .line 72
    const/4 v0, 0x0

    const/4 v15, 0x0

    const/16 v21, 0x0

    :goto_62
    move/from16 v22, v0

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v0

    move-object/from16 v23, v7

    if-ge v15, v0, :cond_2d9

    iget v0, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-ge v14, v0, :cond_2d9

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v0

    if-nez v0, :cond_78

    goto/16 :goto_2d9

    .line 73
    :cond_78
    invoke-virtual {v13, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v26, v13

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v7, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v13, "fork"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v10, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    .line 74
    if-nez v7, :cond_bb

    move-object/from16 v28, v2

    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v25, v10

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move/from16 v0, v22

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_2c2

    :cond_bb
    move/from16 v13, v21

    .line 75
    :goto_bd
    move-object/from16 v25, v10

    iget v10, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-ge v14, v10, :cond_2ae

    add-int/lit8 v21, v13, 0x1

    const/16 v10, 0x50

    if-ge v13, v10, :cond_29b

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v10

    if-nez v10, :cond_e1

    move-object/from16 v28, v2

    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_2ab

    .line 76
    :cond_e1
    const-wide/16 v27, 0x1f4

    invoke-static/range {v27 .. v28}, Ljava/lang/Thread;->sleep(J)V

    .line 77
    new-instance v10, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v10, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v13, "res_from"

    move-object/from16 v27, v0

    const/16 v0, -0x3e8

    invoke-virtual {v10, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 78
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v13, v10}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v10

    invoke-virtual {v0, v2, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    new-instance v10, Lorg/json/JSONObject;

    iget-object v13, v1, Le/e/a/CommentHistory$Job;->body:Ljava/lang/String;

    invoke-direct {v10, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v10, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "additionals"

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v28, v2

    const-string v2, "when"

    invoke-virtual {v13, v2, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v10, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_129
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_129} :catch_40d

    .line 80
    :try_start_129
    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, v1, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    iget-object v13, v1, Le/e/a/CommentHistory$Job;->url:Ljava/lang/String;

    invoke-virtual {v10}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v10
    :try_end_133
    .catch Ljava/lang/Exception; {:try_start_129 .. :try_end_133} :catch_271

    move-object/from16 v29, v3

    const/4 v3, 0x0

    :try_start_136
    # invokes: Le/e/a/CommentHistory;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v2, v13, v10, v3}, Le/e/a/CommentHistory;->access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_13d
    .catch Ljava/lang/Exception; {:try_start_136 .. :try_end_13d} :catch_26f

    .line 81
    :try_start_13d
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_151

    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_2ab

    .line 82
    :cond_151
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_165

    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_2ab

    .line 83
    :cond_165
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 84
    const/4 v10, 0x0

    const/4 v13, 0x0

    :goto_16b
    move-object/from16 v30, v4

    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-lt v10, v4, :cond_19e

    .line 93
    if-eqz v13, :cond_190

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v31

    cmp-long v0, v2, v31

    if-ltz v0, :cond_17e

    goto :goto_190

    :cond_17e
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move/from16 v13, v21

    move-object/from16 v10, v25

    move-object/from16 v0, v27

    move-object/from16 v2, v28

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    goto/16 :goto_bd

    .line 72
    :cond_190
    :goto_190
    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move/from16 v0, v22

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_2c2

    .line 85
    :cond_19e
    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v31, v0

    # invokes: Le/e/a/CommentHistory;->threadId(Lorg/json/JSONObject;)Ljava/lang/String;
    invoke-static {v4}, Le/e/a/CommentHistory;->access$1(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    move-wide/from16 v32, v2

    invoke-virtual {v4, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    if-nez v2, :cond_1be

    move-object/from16 v34, v7

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    goto/16 :goto_259

    .line 86
    :cond_1be
    invoke-interface {v8, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/json/JSONObject;

    if-nez v3, :cond_1e0

    new-instance v3, Lorg/json/JSONObject;

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v3, v12, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {v8, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v4, v23

    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1e2

    :cond_1e0
    move-object/from16 v4, v23

    .line 87
    :goto_1e2
    invoke-virtual {v3, v12}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 88
    move-object/from16 v23, v5

    const/4 v5, 0x0

    :goto_1e9
    move-object/from16 v34, v7

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_253

    iget v7, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-lt v14, v7, :cond_1fc

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    goto :goto_259

    .line 89
    :cond_1fc
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    # invokes: Le/e/a/CommentHistory;->posted(Lorg/json/JSONObject;)J
    invoke-static {v7}, Le/e/a/CommentHistory;->access$2(Lorg/json/JSONObject;)J

    move-result-wide v35

    cmp-long v37, v35, v16

    if-lez v37, :cond_20e

    cmp-long v37, v35, v32

    if-gez v37, :cond_20e

    move-wide/from16 v32, v35

    .line 90
    :cond_20e
    move-object/from16 v35, v2

    new-instance v2, Ljava/lang/StringBuilder;

    move-object/from16 v36, v11

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v2, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v11, v20

    move-object/from16 v20, v0

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v6, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v2, v19

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_244

    invoke-virtual {v3, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v13, v13, 0x1

    add-int/lit8 v14, v14, 0x1

    add-int/lit8 v22, v22, 0x1

    .line 88
    :cond_244
    add-int/lit8 v5, v5, 0x1

    move-object/from16 v19, v2

    move-object/from16 v0, v20

    move-object/from16 v7, v34

    move-object/from16 v2, v35

    move-object/from16 v20, v11

    move-object/from16 v11, v36

    goto :goto_1e9

    :cond_253
    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    .line 84
    :goto_259
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v19, v2

    move-object/from16 v20, v11

    move-object/from16 v5, v23

    move-object/from16 v0, v31

    move-wide/from16 v2, v32

    move-object/from16 v7, v34

    move-object/from16 v11, v36

    move-object/from16 v23, v4

    move-object/from16 v4, v30

    goto/16 :goto_16b

    .line 80
    :catch_26f
    move-exception v0

    goto :goto_274

    :catch_271
    move-exception v0

    move-object/from16 v29, v3

    :goto_274
    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v5, "Comment history request stopped: "

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/CommentHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/CommentHistory;->access$4(Ljava/lang/String;)V

    goto :goto_2ab

    .line 75
    :cond_29b
    move-object/from16 v28, v2

    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    .line 72
    :goto_2ab
    move/from16 v0, v22

    goto :goto_2c2

    .line 75
    :cond_2ae
    move-object/from16 v28, v2

    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v36, v11

    move-object/from16 v2, v19

    move-object/from16 v11, v20

    move-object/from16 v4, v23

    move-object/from16 v23, v5

    move/from16 v21, v13

    move/from16 v0, v22

    .line 72
    :goto_2c2
    add-int/lit8 v15, v15, 0x1

    move-object/from16 v19, v2

    move-object v7, v4

    move-object/from16 v20, v11

    move-object/from16 v5, v23

    move-object/from16 v10, v25

    move-object/from16 v13, v26

    move-object/from16 v2, v28

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    move-object/from16 v11, v36

    goto/16 :goto_62

    .line 96
    :cond_2d9
    :goto_2d9
    if-lez v22, :cond_320

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v0

    if-eqz v0, :cond_320

    .line 97
    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_2ec
    .catch Ljava/lang/Exception; {:try_start_13d .. :try_end_2ec} :catch_40d

    .line 98
    :try_start_2ec
    const-string v0, "e.e.a.ModernComments"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "load"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    iget-object v5, v1, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, v1, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v2, v5

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30f
    .catchall {:try_start_2ec .. :try_end_30f} :catchall_317

    .line 99
    :try_start_30f
    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    goto :goto_320

    :catchall_317
    move-exception v0

    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    throw v0

    .line 101
    :cond_320
    :goto_320
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Comment history: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " comments; target "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v2, v1, Le/e/a/CommentHistory$Job;->limit:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "; requests "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move/from16 v2, v21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/CommentHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/CommentHistory;->access$4(Ljava/lang/String;)V

    .line 102
    goto/16 :goto_428

    .line 64
    :cond_34c
    move-object/from16 v28, v2

    move-object/from16 v29, v3

    move-object/from16 v30, v4

    move-object/from16 v23, v5

    move-object v4, v7

    move-object/from16 v25, v10

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    const/4 v5, 0x0

    invoke-virtual {v4, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    # invokes: Le/e/a/CommentHistory;->threadId(Lorg/json/JSONObject;)Ljava/lang/String;
    invoke-static {v7}, Le/e/a/CommentHistory;->access$1(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v8, v10, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    if-nez v7, :cond_36e

    goto :goto_375

    .line 66
    :cond_36e
    const/4 v12, 0x0

    :goto_36f
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v15

    if-lt v12, v15, :cond_387

    .line 63
    :goto_375
    add-int/lit8 v13, v13, 0x1

    move-object v9, v2

    move-object v7, v4

    move-object/from16 v6, v18

    move-object/from16 v5, v23

    move-object/from16 v10, v25

    move-object/from16 v2, v28

    move-object/from16 v3, v29

    move-object/from16 v4, v30

    goto/16 :goto_37

    .line 66
    :cond_387
    invoke-virtual {v7, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v15

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v19, v0

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v15, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v15, v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v14, v14, 0x1

    # invokes: Le/e/a/CommentHistory;->posted(Lorg/json/JSONObject;)J
    invoke-static {v15}, Le/e/a/CommentHistory;->access$2(Lorg/json/JSONObject;)J

    move-result-wide v20

    cmp-long v0, v20, v16

    if-lez v0, :cond_3d5

    move-object/from16 v5, v25

    invoke-interface {v5, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_3cd

    invoke-interface {v5, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v24

    cmp-long v22, v20, v24

    if-gez v22, :cond_3d7

    :cond_3cd
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v5, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3d7

    :cond_3d5
    move-object/from16 v5, v25

    :cond_3d7
    :goto_3d7
    if-lez v0, :cond_402

    const-string v0, "trunk"

    const-string v1, "source"

    invoke-virtual {v15, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_402

    invoke-interface {v11, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3fb

    invoke-interface {v11, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    cmp-long v15, v20, v0

    if-gez v15, :cond_402

    :cond_3fb
    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v11, v10, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_402
    .catch Ljava/lang/Exception; {:try_start_30f .. :try_end_402} :catch_40d

    :cond_402
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v1, p0

    move-object/from16 v25, v5

    move-object/from16 v0, v19

    const/4 v5, 0x0

    goto/16 :goto_36f

    .line 102
    :catch_40d
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Comment history stopped: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/CommentHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/CommentHistory;->access$4(Ljava/lang/String;)V

    .line 103
    :goto_428
    return-void
.end method
