.class public final Le/e/a/Refresh192;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Refresh192$Session;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Le/e/a/Refresh192$Session;",
            ">;"
        }
    .end annotation
.end field

.field private static final FRESH:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "[J>;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final WORK:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/Refresh192;->MAIN:Landroid/os/Handler;

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/Refresh192;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/Refresh192;->FRESH:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static before(Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/Refresh192$Session;

    if-nez v0, :cond_b

    return-void

    :cond_b
    :try_start_b
    const-string v1, "a0"

    invoke-static {p0, v1}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    const/4 p0, 0x1

    iput-boolean p0, v0, Le/e/a/Refresh192$Session;->replaced:Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_19} :catch_1a

    goto :goto_22

    :catch_1a
    move-exception p0

    const-string v0, "nicoid-refresh"

    const-string v1, "Row replacement failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_22
    return-void
.end method

.method static counts(Ljava/lang/Object;)[J
    .registers 2

    sget-object v0, Le/e/a/Refresh192;->FRESH:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [J

    return-object p0
.end method

.method public static detach(Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/Refresh192$Session;

    if-eqz p0, :cond_26

    iget-object v0, p0, Le/e/a/Refresh192$Session;->tasks:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1c

    iget-object p0, p0, Le/e/a/Refresh192$Session;->swipe:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/Refresh192;->stop(Ljava/lang/Object;)V

    goto :goto_26

    :cond_1c
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/NetworkTask;

    invoke-virtual {v1}, Le/e/a/NetworkTask;->cancel()V

    goto :goto_10

    :cond_26
    :goto_26
    return-void
.end method

.method public static done(Ljava/lang/Object;Z)V
    .registers 21

    move-object/from16 v7, p0

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Le/e/a/Refresh192$Session;

    if-nez v8, :cond_e

    return-void

    :cond_e
    const/4 v9, 0x0

    if-nez p1, :cond_15

    invoke-static {v7, v8, v9}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    return-void

    :cond_15
    iget-boolean v0, v8, Le/e/a/Refresh192$Session;->metadata:Z

    if-eqz v0, :cond_1a

    return-void

    :cond_1a
    const/4 v0, 0x1

    iput-boolean v0, v8, Le/e/a/Refresh192$Session;->metadata:Z

    :try_start_1d
    const-string v1, "a0"

    invoke-static {v7, v1}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget v3, v8, Le/e/a/Refresh192$Session;->position:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr v4, v0

    invoke-static {v9, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget-object v5, v8, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {v5}, Landroid/widget/ListView;->getChildCount()I

    move-result v5

    const/4 v6, 0x4

    add-int/2addr v5, v6

    const/16 v10, 0xa

    invoke-static {v10, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    const/16 v10, 0x19

    invoke-static {v10, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    add-int/2addr v5, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    :goto_56
    if-lt v3, v4, :cond_9b

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_62

    invoke-static {v7, v8, v0}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    return-void

    :cond_62
    new-instance v10, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {v10, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    new-instance v11, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v11}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_74
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_7b

    goto :goto_d7

    :cond_7b
    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    new-instance v13, Le/e/a/NetworkTask;

    invoke-direct {v13}, Le/e/a/NetworkTask;-><init>()V

    iget-object v0, v8, Le/e/a/Refresh192$Session;->tasks:Ljava/util/List;

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v14, Le/e/a/Refresh192;->WORK:Ljava/util/concurrent/ExecutorService;

    new-instance v15, Le/e/a/Refresh192$$ExternalSyntheticLambda2;

    move-object v0, v15

    move-object/from16 v1, p0

    move-object v2, v8

    move-object v3, v10

    move-object v4, v11

    move-object v6, v13

    invoke-direct/range {v0 .. v6}, Le/e/a/Refresh192$$ExternalSyntheticLambda2;-><init>(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Object;Le/e/a/NetworkTask;)V

    invoke-virtual {v13, v14, v15}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    goto :goto_74

    :cond_9b
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Le/e/a/HistorySupport;->counts(Ljava/lang/Object;)[J

    move-result-object v10

    if-eqz v10, :cond_b2

    array-length v11, v10

    if-ne v11, v6, :cond_b2

    iget-object v11, v8, Le/e/a/Refresh192$Session;->old:Ljava/util/ArrayList;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_b2

    const/4 v11, 0x1

    goto :goto_b3

    :cond_b2
    const/4 v11, 0x0

    :goto_b3
    if-eqz v11, :cond_c6

    array-length v12, v10
    :try_end_b6
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_b6} :catch_d4

    const/4 v13, 0x0

    :goto_b7
    if-lt v13, v12, :cond_ba

    goto :goto_c6

    :cond_ba
    aget-wide v14, v10, v13

    const-wide/16 v16, 0x0

    cmp-long v18, v14, v16

    if-gez v18, :cond_c3

    const/4 v11, 0x0

    :cond_c3
    add-int/lit8 v13, v13, 0x1

    goto :goto_b7

    :cond_c6
    :goto_c6
    if-eqz v11, :cond_ce

    :try_start_c8
    sget-object v11, Le/e/a/Refresh192;->FRESH:Ljava/util/Map;

    invoke-interface {v11, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d1

    :cond_ce
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_d1
    .catch Ljava/lang/Exception; {:try_start_c8 .. :try_end_d1} :catch_d4

    :goto_d1
    add-int/lit8 v3, v3, 0x1

    goto :goto_56

    :catch_d4
    invoke-static {v7, v8, v9}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    :goto_d7
    return-void
.end method

.method private static finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V
    .registers 7

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_9

    return-void

    :cond_9
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :try_start_c
    const-string v0, "a0"

    invoke-static {p0, v0}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez p2, :cond_49

    iget-boolean p2, p1, Le/e/a/Refresh192$Session;->replaced:Z

    if-eqz p2, :cond_22

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object p2, p1, Le/e/a/Refresh192$Session;->old:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_22
    iget-object p2, p1, Le/e/a/Refresh192$Session;->paging:Ljava/util/Map;

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_2c
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_33

    goto :goto_49

    :cond_33
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iget-object v2, p1, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v2, v3, v1}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2c

    :cond_49
    :goto_49
    const-string p2, "p0"

    invoke-static {p0, p2}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/widget/BaseAdapter;

    invoke-virtual {p2}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
    :try_end_54
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_54} :catch_a5
    .catchall {:try_start_c .. :try_end_54} :catchall_a3

    const/4 p2, 0x0

    :try_start_55
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "c"

    new-array v3, p2, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, p2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_66} :catch_66
    .catchall {:try_start_55 .. :try_end_66} :catchall_a3

    :catch_66
    :try_start_66
    iget-object p0, p1, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {p0, p2}, Landroid/widget/ListView;->setVisibility(I)V

    const/4 p0, 0x0

    :goto_6c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p0, v1, :cond_74

    const/4 p0, -0x1

    goto :goto_86

    :cond_74
    iget-object v1, p1, Le/e/a/Refresh192$Session;->anchor:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "videourl"

    invoke-static {v2, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a0

    :goto_86
    iget-object v1, p1, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    if-gez p0, :cond_9a

    iget p0, p1, Le/e/a/Refresh192$Session;->position:I

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    move-result p0

    :cond_9a
    iget p2, p1, Le/e/a/Refresh192$Session;->top:I

    invoke-virtual {v1, p0, p2}, Landroid/widget/ListView;->setSelectionFromTop(II)V
    :try_end_9f
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_9f} :catch_a5
    .catchall {:try_start_66 .. :try_end_9f} :catchall_a3

    goto :goto_ad

    :cond_a0
    add-int/lit8 p0, p0, 0x1

    goto :goto_6c

    :catchall_a3
    move-exception p0

    goto :goto_b3

    :catch_a5
    move-exception p0

    :try_start_a6
    const-string p2, "nicoid-refresh"

    const-string v0, "Refresh completion failed"

    invoke-static {p2, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_ad
    .catchall {:try_start_a6 .. :try_end_ad} :catchall_a3

    :goto_ad
    iget-object p0, p1, Le/e/a/Refresh192$Session;->swipe:Ljava/lang/Object;

    invoke-static {p0}, Le/e/a/Refresh192;->stop(Ljava/lang/Object;)V

    return-void

    :goto_b3
    iget-object p1, p1, Le/e/a/Refresh192$Session;->swipe:Ljava/lang/Object;

    invoke-static {p1}, Le/e/a/Refresh192;->stop(Ljava/lang/Object;)V

    throw p0
.end method

.method static get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p0, p1}, Le/e/a/Review181;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/lang/Object;Le/e/a/NetworkTask;)V
    .registers 15

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "videourl"

    invoke-static {p4, v1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p5}, Le/e/a/VideoMetadata192;->watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p5

    const-string v1, "video"

    invoke-virtual {p5, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p5

    if-eqz p5, :cond_2e

    const-string v1, "count"

    invoke-virtual {p5, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1d} :catch_39
    .catchall {:try_start_1 .. :try_end_1d} :catchall_36

    if-eqz v7, :cond_2d

    sget-object p5, Le/e/a/Refresh192;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v8, p4

    invoke-direct/range {v2 .. v8}, Le/e/a/Refresh192$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V

    goto :goto_4a

    :cond_2d
    move-object v0, v7

    :cond_2e
    :try_start_2e
    new-instance p5, Ljava/io/IOException;

    const-string v1, "Missing statistics"

    invoke-direct {p5, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p5
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_36} :catch_39
    .catchall {:try_start_2e .. :try_end_36} :catchall_36

    :catchall_36
    move-exception p5

    move-object v5, v0

    goto :goto_50

    :catch_39
    move-object v6, v0

    :try_start_3a
    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_4e

    sget-object p5, Le/e/a/Refresh192;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/Refresh192$$ExternalSyntheticLambda3;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v7, p4

    invoke-direct/range {v1 .. v7}, Le/e/a/Refresh192$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V

    :goto_4a
    invoke-virtual {p5, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_4e
    move-exception p5

    move-object v5, v6

    :goto_50
    sget-object v7, Le/e/a/Refresh192;->MAIN:Landroid/os/Handler;

    new-instance v8, Le/e/a/Refresh192$$ExternalSyntheticLambda3;

    move-object v0, v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Le/e/a/Refresh192$$ExternalSyntheticLambda3;-><init>(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    throw p5
.end method

.method static synthetic lambda$1(Ljava/lang/Object;Le/e/a/Refresh192$Session;Ljava/util/concurrent/atomic/AtomicInteger;Ljava/util/concurrent/atomic/AtomicInteger;Lorg/json/JSONObject;Ljava/lang/Object;)V
    .registers 15

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eq v0, p1, :cond_9

    return-void

    :cond_9
    const-string v0, "\u4e00\u90e8\u306e\u7d71\u8a08\u60c5\u5831\u3092\u66f4\u65b0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p4, :cond_84

    :try_start_f
    sget-object v3, Le/e/a/Refresh192;->FRESH:Ljava/util/Map;

    invoke-static {p4}, Le/e/a/HistorySupport;->statistics(Lorg/json/JSONObject;)[J

    move-result-object v4

    invoke-interface {v3, p5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "a"

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/Class;

    const-class v7, Ljava/lang/String;

    aput-object v7, v6, v2

    const-class v7, Ljava/lang/Object;

    aput-object v7, v6, v1

    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    new-array v4, v5, [Ljava/lang/Object;

    const-string v5, "videoinfo"

    aput-object v5, v4, v2

    const-string v5, "e.e.a.ModernRanking"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "countInfo"

    new-array v7, v1, [Ljava/lang/Class;

    const-class v8, Lorg/json/JSONObject;

    aput-object v8, v7, v2

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v6, v1, [Ljava/lang/Object;

    aput-object p4, v6, v2

    const/4 p4, 0x0

    invoke-virtual {v5, p4, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    aput-object p4, v4, v1

    invoke-virtual {v3, p5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_53
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_53} :catch_76
    .catchall {:try_start_f .. :try_end_53} :catchall_54

    goto :goto_84

    :catchall_54
    move-exception p4

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p2

    if-nez p2, :cond_75

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    if-lez p2, :cond_72

    iget-object p2, p1, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {p2}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-static {p2}, Le/e/a/RefreshNotice199;->partial(Landroid/widget/Toast;)V

    :cond_72
    invoke-static {p0, p1, v1}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    :cond_75
    throw p4

    :catch_76
    nop

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p2

    if-nez p2, :cond_a4

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    if-lez p2, :cond_a1

    goto :goto_90

    :cond_84
    :goto_84
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result p2

    if-nez p2, :cond_a4

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    if-lez p2, :cond_a1

    :goto_90
    iget-object p2, p1, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {p2}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {v0}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, v2}, Le/e/a/FeedbackHud219;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p2

    invoke-static {p2}, Le/e/a/RefreshNotice199;->partial(Landroid/widget/Toast;)V

    :cond_a1
    invoke-static {p0, p1, v1}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    :cond_a4
    return-void
.end method

.method static set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static start(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11

    sget-object v0, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    new-instance v0, Le/e/a/Refresh192$Session;

    invoke-direct {v0, p1}, Le/e/a/Refresh192$Session;-><init>(Ljava/lang/Object;)V

    const/4 v1, 0x0

    :try_start_f
    const-string v2, "c0"

    invoke-static {p0, v2}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    iput-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    if-eqz v2, :cond_105

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v3, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    const-string v4, "n"

    invoke-static {v3, v4}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2d

    goto/16 :goto_105

    :cond_2d
    const-string v2, "b0"

    invoke-static {p0, v2}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    iput-object v2, v0, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    iget-object v2, v0, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    move-result v2

    iput v2, v0, Le/e/a/Refresh192$Session;->position:I

    iget-object v2, v0, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getChildCount()I

    move-result v2

    if-lez v2, :cond_52

    iget-object v2, v0, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {v2, v1}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    goto :goto_53

    :cond_52
    const/4 v2, 0x0

    :goto_53
    iput v2, v0, Le/e/a/Refresh192$Session;->top:I

    new-instance v2, Ljava/util/ArrayList;

    const-string v3, "a0"

    invoke-static {p0, v3}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v0, Le/e/a/Refresh192$Session;->old:Ljava/util/ArrayList;

    iget v2, v0, Le/e/a/Refresh192$Session;->position:I

    iget-object v3, v0, Le/e/a/Refresh192$Session;->old:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_7e

    iget-object v2, v0, Le/e/a/Refresh192$Session;->old:Ljava/util/ArrayList;

    iget v3, v0, Le/e/a/Refresh192$Session;->position:I

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    const-string v3, "videourl"

    invoke-static {v2, v3}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Le/e/a/Refresh192$Session;->anchor:Ljava/lang/String;
    :try_end_7e
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_7e} :catch_109

    :cond_7e
    const/4 v2, 0x0

    :goto_7f
    const-string v3, "o"

    const-string v4, "i"

    const-string v5, "f"

    const-string v6, "j"

    const/4 v7, 0x5

    const-string v8, "a"

    if-lt v2, v7, :cond_e4

    :try_start_8c
    sget-object v2, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Le/e/a/PageCache;->refresh()V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->list:Landroid/widget/ListView;

    invoke-virtual {v2}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Le/e/a/VideoDetails;->initializeCookies(Landroid/content/Context;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v2, v6, v7}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v2, v5, v6}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    const/16 v5, 0x19

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v4, v5}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v2, v3, v4}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    iget-object v3, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    const-string v4, "b"

    invoke-static {v3, v4}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v8, v3}, Le/e/a/Refresh192;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v2, v8, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iget-object v3, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    new-array v4, v1, [Ljava/lang/Object;

    invoke-virtual {v2, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_11f

    :cond_e4
    new-array v7, v7, [Ljava/lang/String;

    aput-object v6, v7, v1

    const/4 v6, 0x1

    aput-object v5, v7, v6

    const/4 v5, 0x2

    aput-object v4, v7, v5

    const/4 v4, 0x3

    aput-object v3, v7, v4

    const/4 v3, 0x4

    aput-object v8, v7, v3

    aget-object v3, v7, v2

    iget-object v4, v0, Le/e/a/Refresh192$Session;->paging:Ljava/util/Map;

    iget-object v5, v0, Le/e/a/Refresh192$Session;->loader:Ljava/lang/Object;

    invoke-static {v5, v3}, Le/e/a/Refresh192;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_7f

    :cond_105
    :goto_105
    invoke-static {p1}, Le/e/a/Refresh192;->stop(Ljava/lang/Object;)V
    :try_end_108
    .catch Ljava/lang/Exception; {:try_start_8c .. :try_end_108} :catch_109

    return-void

    :catch_109
    move-exception v2

    sget-object v3, Le/e/a/Refresh192;->ACTIVE:Ljava/util/Map;

    invoke-interface {v3, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-ne v3, v0, :cond_115

    invoke-static {p0, v0, v1}, Le/e/a/Refresh192;->finish(Ljava/lang/Object;Le/e/a/Refresh192$Session;Z)V

    :cond_115
    invoke-static {p1}, Le/e/a/Refresh192;->stop(Ljava/lang/Object;)V

    const-string p0, "nicoid-refresh"

    const-string p1, "Refresh start failed"

    invoke-static {p0, p1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_11f
    return-void
.end method

.method static stop(Ljava/lang/Object;)V
    .registers 7

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setRefreshing"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1d} :catch_1d

    :catch_1d
    return-void
.end method
