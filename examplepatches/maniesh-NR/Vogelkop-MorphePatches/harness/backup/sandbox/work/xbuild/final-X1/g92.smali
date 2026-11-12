.class public final Lg92;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final f:Ljava/util/HashMap;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/Lazy;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lg92;->e:B

    iput-object p1, p0, Lg92;->g:Ljava/lang/Object;

    iput-object p2, p0, Lg92;->h:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lg92;->f:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>(Lk5o;Lqre;Ljava/util/HashMap;Ljava/util/HashMap;)V
    .registers 5

    const/4 p1, 0x0

    iput-byte p1, p0, Lg92;->e:B

    .line 18
    iput-object p2, p0, Lg92;->g:Ljava/lang/Object;

    iput-object p3, p0, Lg92;->f:Ljava/util/HashMap;

    iput-object p4, p0, Lg92;->h:Ljava/lang/Object;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lbg1;)V
    .registers 5

    iget-byte v0, p0, Lg92;->e:B

    packed-switch v0, :pswitch_data_24

    invoke-super {p0, p1}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    return-void

    :pswitch_9
    new-instance v0, Lb94;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lg92;->f:Ljava/util/HashMap;

    monitor-enter v1

    :try_start_12
    iget-object v2, p0, Lg92;->f:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_12 .. :try_end_17} :catchall_20

    monitor-exit v1

    iget-object p0, p0, Lg92;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0, v0}, Lcom/opera/android/Lazy;->a(Lbg1;)V

    return-void

    :catchall_20
    move-exception p0

    monitor-exit v1

    throw p0

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final b(Lbg1;)V
    .registers 4

    iget-byte v0, p0, Lg92;->e:B

    packed-switch v0, :pswitch_data_22

    invoke-super {p0, p1}, Lcom/opera/android/Lazy;->b(Lbg1;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lg92;->f:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_c
    iget-object v1, p0, Lg92;->f:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lbg1;
    :try_end_14
    .catchall {:try_start_c .. :try_end_14} :catchall_1f

    monitor-exit v0

    if-eqz p1, :cond_1e

    iget-object p0, p0, Lg92;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0, p1}, Lcom/opera/android/Lazy;->b(Lbg1;)V

    :cond_1e
    return-void

    :catchall_1f
    move-exception p0

    monitor-exit v0

    throw p0

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final c()Z
    .registers 2

    iget-byte v0, p0, Lg92;->e:B

    packed-switch v0, :pswitch_data_1e

    invoke-super {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result p0

    return p0

    :pswitch_a
    iget-object v0, p0, Lg92;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->c()Z

    move-result v0

    if-nez v0, :cond_1c

    invoke-super {p0}, Lcom/opera/android/Lazy;->c()Z

    move-result p0

    if-nez p0, :cond_1c

    const/4 p0, 0x0

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x1

    :goto_1d
    return p0

    :pswitch_data_1e
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final d()Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lg92;->e:B

    iget-object v1, p0, Lg92;->g:Ljava/lang/Object;

    iget-object v2, p0, Lg92;->h:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_126

    check-cast v2, Lkotlin/jvm/functions/Function1;

    check-cast v1, Lcom/opera/android/Lazy;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-interface {v2, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast v1, Lqre;

    iget-object p0, p0, Lg92;->f:Ljava/util/HashMap;

    check-cast v2, Ljava/util/HashMap;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    :try_start_35
    const-string v7, "version"

    const/4 v8, 0x3

    invoke-virtual {v0, v7, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v7, "news_id_list"

    invoke-virtual {v0, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "video_id_list"

    invoke-virtual {v0, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "group_card_list"

    invoke-virtual {v0, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v7, "instaclip_id_list"

    invoke-virtual {v0, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_57
    :goto_57
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_cf

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lh92;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lh92;

    iget-object v9, v9, Lh92;->d:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v9}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v9

    if-nez v9, :cond_81

    iget-object v8, v8, Lh92;->c:Lqre;

    if-eqz v8, :cond_81

    invoke-virtual {v8, v1}, Lqre;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_57

    :cond_81
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lh92;

    iget-object v8, v8, Lh92;->a:Ljava/lang/String;

    const-string v9, "insta_clip"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_a3

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lh92;

    iget-object v7, v7, Lh92;->b:Ljava/lang/String;

    invoke-static {v6, v9, v8, v7}, Lk5o;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_57

    :cond_a3
    const-string v9, "video"

    invoke-virtual {v9, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_bd

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lh92;

    iget-object v7, v7, Lh92;->b:Ljava/lang/String;

    invoke-static {v4, v9, v8, v7}, Lk5o;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_57

    :cond_bd
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lh92;

    iget-object v7, v7, Lh92;->b:Ljava/lang/String;

    invoke-static {v3, v9, v8, v7}, Lk5o;->e(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_57

    :cond_cf
    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_d7
    :goto_d7
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_120

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Li92;

    iget-object v3, v3, Li92;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-nez v3, :cond_ff

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Li92;

    iget-object v3, v3, Li92;->b:Lqre;

    invoke-virtual {v3, v1}, Lqre;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d7

    :cond_ff
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Li92;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "id"

    invoke-virtual {v4, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "type"

    iget-object v2, v2, Li92;->a:Ljava/lang/String;

    invoke-virtual {v4, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_11f
    .catch Lorg/json/JSONException; {:try_start_35 .. :try_end_11f} :catch_120

    goto :goto_d7

    :catch_120
    :cond_120
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_126
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method
