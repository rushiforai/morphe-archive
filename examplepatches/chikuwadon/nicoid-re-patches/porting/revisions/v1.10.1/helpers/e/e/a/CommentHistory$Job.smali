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

.field final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final response:Ljava/lang/String;

.field final url:Ljava/lang/String;

.field final video:Ljava/lang/String;

.field final watch:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/ref/WeakReference;

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
    iget-object v0, p0, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_a

    return v1

    :cond_a
    :try_start_a
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v3, "a"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0, v3}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_16
    .catch Ljava/lang/NoSuchFieldException; {:try_start_a .. :try_end_16} :catch_1b
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_16} :catch_19

    if-eqz v2, :cond_1c

    return v1

    :catch_19
    move-exception v0

    goto :goto_44

    :catch_1b
    move-exception v2

    :cond_1c
    :try_start_1c
    iget-object v2, p0, Le/e/a/CommentHistory$Job;->watch:Ljava/lang/Object;

    const-string v3, "modernWatch"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0, v3}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    if-ne v2, v3, :cond_44

    iget-object v2, p0, Le/e/a/CommentHistory$Job;->video:Ljava/lang/String;

    const-string v3, "d"

    # invokes: Le/e/a/CommentHistory;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    invoke-static {v0, v3}, Le/e/a/CommentHistory;->access$0(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_40} :catch_19

    if-nez v0, :cond_44

    const/4 v0, 0x1

    return v0

    :cond_44
    :goto_44
    return v1
.end method

.method public run()V
    .registers 39

    .line 55
    move-object/from16 v1, p0

    const-string v2, "targets"

    const-string v3, "params"

    const-string v4, "threads"

    const-string v5, "data"

    iget-object v0, v1, Le/e/a/CommentHistory$Job;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_13

    return-void

    .line 57
    :cond_13
    :try_start_13
    new-instance v7, Lorg/json/JSONObject;

    iget-object v0, v1, Le/e/a/CommentHistory$Job;->response:Ljava/lang/String;

    invoke-direct {v7, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v0, Lorg/json/JSONObject;

    iget-object v8, v1, Le/e/a/CommentHistory$Job;->body:Ljava/lang/String;

    invoke-direct {v0, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v7, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 59
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9}, Ljava/util/LinkedHashMap;-><init>()V

    .line 60
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10}, Ljava/util/HashSet;-><init>()V

    .line 61
    new-instance v11, Ljava/util/HashMap;

    invoke-direct {v11}, Ljava/util/HashMap;-><init>()V

    .line 62
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    .line 63
    nop

    .line 64
    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_40
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v13
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_44} :catch_464

    const-wide/16 v16, 0x0

    move-object/from16 v18, v7

    const-string v7, "no"

    move-object/from16 v19, v10

    const-string v10, "id"

    move-object/from16 v20, v7

    const-string v7, ":"

    move-object/from16 v21, v8

    const-string v8, "comments"

    if-lt v14, v13, :cond_38d

    .line 69
    :try_start_58
    invoke-interface {v11, v12}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 70
    iget v12, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-lt v15, v12, :cond_60

    return-void

    .line 71
    :cond_60
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 72
    nop

    .line 73
    const/4 v0, 0x0

    const/4 v14, 0x0

    const/16 v22, 0x0

    :goto_6d
    move/from16 v23, v0

    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v0

    move-object/from16 v24, v9

    if-ge v14, v0, :cond_31f

    iget v0, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-ge v15, v0, :cond_31f

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v0

    if-nez v0, :cond_83

    goto/16 :goto_31f

    .line 74
    :cond_83
    invoke-virtual {v13, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v26, v13

    invoke-static/range {v25 .. v25}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v9, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v13, "fork"

    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v11, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    .line 75
    if-nez v9, :cond_c8

    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v25, v11

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v2, v21

    move/from16 v0, v23

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_306

    :cond_c8
    move/from16 v13, v22

    .line 76
    :goto_ca
    move-object/from16 v25, v11

    iget v11, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-ge v15, v11, :cond_2f0

    add-int/lit8 v22, v13, 0x1

    const/16 v11, 0x50

    if-ge v13, v11, :cond_2d8

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v11

    if-nez v11, :cond_f0

    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_2ea

    .line 77
    :cond_f0
    const-wide/16 v27, 0x1f4

    invoke-static/range {v27 .. v28}, Ljava/lang/Thread;->sleep(J)V

    .line 78
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v11

    if-nez v11, :cond_10f

    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_2ea

    .line 79
    :cond_10f
    new-instance v11, Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v13, "res_from"

    move-object/from16 v27, v0

    const/16 v0, -0x3e8

    invoke-virtual {v11, v13, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 80
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v0, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v13, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v11

    invoke-virtual {v0, v2, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    new-instance v11, Lorg/json/JSONObject;

    iget-object v13, v1, Le/e/a/CommentHistory$Job;->body:Ljava/lang/String;

    invoke-direct {v11, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "additionals"

    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13}, Lorg/json/JSONObject;-><init>()V

    move-object/from16 v28, v2

    const-string v2, "when"

    invoke-virtual {v13, v2, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v11, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_152
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_152} :catch_464

    .line 82
    :try_start_152
    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, v1, Le/e/a/CommentHistory$Job;->url:Ljava/lang/String;

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v13, 0x0

    # invokes: Le/e/a/CommentHistory;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    invoke-static {v6, v2, v11, v13}, Le/e/a/CommentHistory;->access$3(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_162
    .catch Ljava/lang/Exception; {:try_start_152 .. :try_end_162} :catch_2ac

    .line 83
    :try_start_162
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_17a

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_2ea

    .line 84
    :cond_17a
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    if-nez v0, :cond_192

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_2ea

    .line 85
    :cond_192
    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v29

    .line 86
    const/4 v2, 0x0

    const/4 v11, 0x0

    :goto_198
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-lt v2, v13, :cond_1cb

    .line 95
    if-eqz v11, :cond_1b7

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v31

    cmp-long v0, v29, v31

    if-ltz v0, :cond_1a9

    goto :goto_1b7

    :cond_1a9
    invoke-static/range {v29 .. v30}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    move/from16 v13, v22

    move-object/from16 v11, v25

    move-object/from16 v0, v27

    move-object/from16 v2, v28

    goto/16 :goto_ca

    .line 73
    :cond_1b7
    :goto_1b7
    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v2, v21

    move/from16 v0, v23

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    goto/16 :goto_306

    .line 87
    :cond_1cb
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v13

    move-object/from16 v31, v0

    # invokes: Le/e/a/CommentHistory;->threadId(Lorg/json/JSONObject;)Ljava/lang/String;
    invoke-static {v13}, Le/e/a/CommentHistory;->access$1(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v32, v3

    invoke-virtual {v13, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    if-nez v3, :cond_1ef

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v21, v9

    move-object/from16 v24, v12

    goto/16 :goto_294

    .line 88
    :cond_1ef
    move-object/from16 v33, v4

    move-object/from16 v4, v24

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Lorg/json/JSONObject;

    if-nez v24, :cond_217

    move-object/from16 v34, v5

    new-instance v5, Lorg/json/JSONObject;

    invoke-virtual {v13}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v5, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    new-instance v13, Lorg/json/JSONArray;

    invoke-direct {v13}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v5, v8, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-interface {v4, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v13, v21

    invoke-virtual {v13, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_21d

    :cond_217
    move-object/from16 v34, v5

    move-object/from16 v13, v21

    move-object/from16 v5, v24

    .line 89
    :goto_21d
    invoke-virtual {v5, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 90
    move-object/from16 v21, v9

    const/4 v9, 0x0

    :goto_224
    move-object/from16 v24, v12

    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-ge v9, v12, :cond_28e

    iget v12, v1, Le/e/a/CommentHistory$Job;->limit:I

    if-lt v15, v12, :cond_237

    move-object/from16 v36, v13

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    goto :goto_294

    .line 91
    :cond_237
    invoke-virtual {v3, v9}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v12

    # invokes: Le/e/a/CommentHistory;->posted(Lorg/json/JSONObject;)J
    invoke-static {v12}, Le/e/a/CommentHistory;->access$2(Lorg/json/JSONObject;)J

    move-result-wide v35

    cmp-long v37, v35, v16

    if-lez v37, :cond_249

    cmp-long v37, v35, v29

    if-gez v37, :cond_249

    move-wide/from16 v29, v35

    .line 92
    :cond_249
    move-object/from16 v35, v3

    new-instance v3, Ljava/lang/StringBuilder;

    move-object/from16 v36, v13

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v3, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v13, v20

    move-object/from16 v20, v0

    invoke-virtual {v12, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v10, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    move-object/from16 v3, v19

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27f

    invoke-virtual {v5, v12}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v11, v11, 0x1

    add-int/lit8 v15, v15, 0x1

    add-int/lit8 v23, v23, 0x1

    .line 90
    :cond_27f
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v19, v3

    move-object/from16 v0, v20

    move-object/from16 v12, v24

    move-object/from16 v3, v35

    move-object/from16 v20, v13

    move-object/from16 v13, v36

    goto :goto_224

    :cond_28e
    move-object/from16 v36, v13

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    .line 86
    :goto_294
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v19, v3

    move-object/from16 v20, v13

    move-object/from16 v9, v21

    move-object/from16 v12, v24

    move-object/from16 v0, v31

    move-object/from16 v3, v32

    move-object/from16 v5, v34

    move-object/from16 v21, v36

    move-object/from16 v24, v4

    move-object/from16 v4, v33

    goto/16 :goto_198

    .line 82
    :catch_2ac
    move-exception v0

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v5, "Comment history request stopped: "

    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/CommentHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/CommentHistory;->access$4(Ljava/lang/String;)V

    goto :goto_2ea

    .line 76
    :cond_2d8
    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v13, v20

    move-object/from16 v36, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    .line 73
    :goto_2ea
    move-object v5, v13

    move/from16 v0, v23

    move-object/from16 v2, v36

    goto :goto_306

    .line 76
    :cond_2f0
    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v2, v21

    move-object/from16 v4, v24

    move-object/from16 v24, v12

    move/from16 v22, v13

    move/from16 v0, v23

    .line 73
    :goto_306
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v21, v2

    move-object/from16 v19, v3

    move-object v9, v4

    move-object/from16 v20, v5

    move-object/from16 v12, v24

    move-object/from16 v11, v25

    move-object/from16 v13, v26

    move-object/from16 v2, v28

    move-object/from16 v3, v32

    move-object/from16 v4, v33

    move-object/from16 v5, v34

    goto/16 :goto_6d

    .line 98
    :cond_31f
    :goto_31f
    if-lez v23, :cond_361

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentHistory$Job;->current()Z

    move-result v0

    if-eqz v0, :cond_361

    .line 99
    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_332
    .catch Ljava/lang/Exception; {:try_start_162 .. :try_end_332} :catch_464

    .line 100
    :try_start_332
    const-string v0, "e.e.a.ModernComments"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v2, "load"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    const/4 v9, 0x0

    aput-object v5, v4, v9

    invoke-virtual {v0, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v6, v2, v9

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_350
    .catchall {:try_start_332 .. :try_end_350} :catchall_358

    .line 101
    :try_start_350
    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    goto :goto_361

    :catchall_358
    move-exception v0

    # getter for: Le/e/a/CommentHistory;->replay:Ljava/lang/ThreadLocal;
    invoke-static {}, Le/e/a/CommentHistory;->access$5()Ljava/lang/ThreadLocal;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/ThreadLocal;->remove()V

    throw v0

    .line 103
    :cond_361
    :goto_361
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Comment history: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

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

    move/from16 v2, v22

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    # invokes: Le/e/a/CommentHistory;->log(Ljava/lang/String;)V
    invoke-static {v0}, Le/e/a/CommentHistory;->access$4(Ljava/lang/String;)V

    .line 104
    goto/16 :goto_47f

    .line 65
    :cond_38d
    move-object/from16 v28, v2

    move-object/from16 v32, v3

    move-object/from16 v33, v4

    move-object/from16 v34, v5

    move-object v4, v9

    move-object/from16 v25, v11

    move-object/from16 v3, v19

    move-object/from16 v5, v20

    move-object/from16 v2, v21

    const/4 v9, 0x0

    invoke-virtual {v2, v14}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    # invokes: Le/e/a/CommentHistory;->threadId(Lorg/json/JSONObject;)Ljava/lang/String;
    invoke-static {v11}, Le/e/a/CommentHistory;->access$1(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v4, v13, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    if-nez v8, :cond_3b1

    goto :goto_3b8

    .line 67
    :cond_3b1
    const/4 v11, 0x0

    :goto_3b2
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-lt v11, v9, :cond_3cb

    .line 64
    :goto_3b8
    add-int/lit8 v14, v14, 0x1

    move-object v8, v2

    move-object v10, v3

    move-object v9, v4

    move-object/from16 v7, v18

    move-object/from16 v11, v25

    move-object/from16 v2, v28

    move-object/from16 v3, v32

    move-object/from16 v4, v33

    move-object/from16 v5, v34

    goto/16 :goto_40

    .line 67
    :cond_3cb
    invoke-virtual {v8, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    move-object/from16 v19, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {v13}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v10, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v3, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    add-int/lit8 v15, v15, 0x1

    # invokes: Le/e/a/CommentHistory;->posted(Lorg/json/JSONObject;)J
    invoke-static {v9}, Le/e/a/CommentHistory;->access$2(Lorg/json/JSONObject;)J

    move-result-wide v0

    cmp-long v20, v0, v16

    if-lez v20, :cond_421

    move-object/from16 v21, v2

    move-object/from16 v2, v25

    invoke-interface {v2, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_417

    invoke-interface {v2, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Ljava/lang/Long;

    invoke-virtual/range {v22 .. v22}, Ljava/lang/Long;->longValue()J

    move-result-wide v22

    cmp-long v24, v0, v22

    if-gez v24, :cond_414

    goto :goto_417

    :cond_414
    move-object/from16 v22, v3

    goto :goto_427

    :cond_417
    :goto_417
    move-object/from16 v22, v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v2, v13, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_427

    :cond_421
    move-object/from16 v21, v2

    move-object/from16 v22, v3

    move-object/from16 v2, v25

    :goto_427
    if-lez v20, :cond_455

    const-string v3, "trunk"

    move-object/from16 v25, v2

    const-string v2, "source"

    invoke-virtual {v9, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_457

    invoke-interface {v12, v13}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_44d

    invoke-interface {v12, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v9, v0, v2

    if-gez v9, :cond_457

    :cond_44d
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v12, v13, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_454
    .catch Ljava/lang/Exception; {:try_start_350 .. :try_end_454} :catch_464

    goto :goto_457

    :cond_455
    move-object/from16 v25, v2

    :cond_457
    :goto_457
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v1, p0

    move-object/from16 v0, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v22

    const/4 v9, 0x0

    goto/16 :goto_3b2

    .line 104
    :catch_464
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

    .line 105
    :goto_47f
    return-void
.end method
