.class public final Le/e/a/LocalReload244;
.super Ljava/lang/Object;
.source "LocalReload244.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/LocalReload244$Job;,
        Le/e/a/LocalReload244$CachePull;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/widget/ListView;",
            "Le/e/a/LocalReload244$Job;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 24
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;

    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/LocalReload244;->MAIN:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Le/e/a/LocalReload244$Job;)V
    .registers 1

    .line 23
    invoke-static {p0}, Le/e/a/LocalReload244;->launch(Le/e/a/LocalReload244$Job;)V

    return-void
.end method

.method static synthetic access$100()Landroid/os/Handler;
    .registers 1

    .line 23
    sget-object v0, Le/e/a/LocalReload244;->MAIN:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$200()Ljava/util/Map;
    .registers 1

    .line 23
    sget-object v0, Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;

    return-object v0
.end method

.method static history(Landroid/content/Context;Z)Ljava/util/ArrayList;
    .registers 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z)",
            "Ljava/util/ArrayList<",
            "Le/e/a/x1;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 129
    move-object/from16 v1, p0

    const-string v2, "title"

    const-string v3, "posttime"

    const-string v4, "videoinfo"

    const-string v5, "length"

    const-string v6, "videourl"

    new-instance v0, Le/e/a/CacheFile;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1}, Le/e/a/CacheFolders;->privateRoot(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/nicoid/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v8, "history.json"

    invoke-direct {v0, v7, v8}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 131
    invoke-virtual {v0}, Le/e/a/CacheFile;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    return-object v7

    .line 132
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 133
    new-instance v9, Ljava/io/BufferedReader;

    new-instance v10, Ljava/io/InputStreamReader;

    new-instance v11, Le/e/a/CacheInputStream;

    invoke-direct {v11, v0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    const-string v0, "UTF-8"

    invoke-direct {v10, v11, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v9, v10}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    :goto_0
    :try_start_0
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V

    .line 134
    new-instance v9, Lorg/json/JSONArray;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 135
    new-instance v8, Ljava/text/SimpleDateFormat;

    const v0, 0x7f0f004d

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 136
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    move v10, v0

    :goto_1
    if-ltz v10, :cond_3

    .line 138
    :try_start_1
    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v11, Le/e/a/x1;

    invoke-direct {v11}, Le/e/a/x1;-><init>()V

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 139
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v6, v13}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v13, "videoid"

    invoke-virtual {v11, v13, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 140
    const-string v13, "thumbnail"

    if-eqz p1, :cond_2

    :try_start_2
    invoke-virtual {v0, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    :cond_2
    invoke-virtual {v11, v13, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "<b>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "</b>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v11, v5, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v11, v4, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 142
    const v12, 0x7f0f0215

    invoke-virtual {v1, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/util/Date;

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    invoke-direct {v13, v14, v15}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v8, v13}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "viewCount"

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    filled-new-array {v13, v14}, [Ljava/lang/Object;

    move-result-object v13

    invoke-static {v12, v13}, Le/e/a/HistorySupport;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12

    invoke-virtual {v11, v3, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 143
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v2, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    invoke-static {v11, v0}, Le/e/a/ContentFilter;->restoreHistory(Ljava/lang/Object;Lorg/json/JSONObject;)V

    invoke-virtual {v7, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 145
    goto :goto_2

    :catch_0
    move-exception v0

    const-string v11, "nicoid-refresh244"

    const-string v12, "Invalid saved history row"

    invoke-static {v11, v12, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 136
    :goto_2
    add-int/lit8 v10, v10, -0x1

    goto/16 :goto_1

    .line 147
    :cond_3
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-lez v0, :cond_4

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/io/IOException;

    const-string v1, "No valid saved history rows"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_4
    return-object v7

    .line 133
    :catchall_0
    move-exception v0

    move-object v1, v0

    :try_start_3
    invoke-virtual {v9}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_3

    :catchall_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v1
.end method

.method public static installCache(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;)V
    .registers 7

    .line 59
    iget-object v0, p0, Lcom/sauzask/nicoid/NicoidCacheManagerActivity;->A:Landroid/widget/ListView;

    .line 60
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_5

    .line 61
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    :goto_0
    instance-of v2, v1, Landroid/view/View;

    if-eqz v2, :cond_1

    instance-of v2, v1, Le/e/a/FeedRefresh209;

    if-eqz v2, :cond_0

    return-void

    :cond_0
    invoke-interface {v1}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    .line 63
    if-gez v2, :cond_2

    return-void

    .line 64
    :cond_2
    invoke-virtual {v0}, Landroid/widget/ListView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    .line 65
    new-instance v4, Le/e/a/LocalReload244$CachePull;

    invoke-direct {v4, p0, v0}, Le/e/a/LocalReload244$CachePull;-><init>(Lcom/sauzask/nicoid/NicoidCacheManagerActivity;Landroid/widget/ListView;)V

    .line 66
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 68
    :try_start_0
    new-instance p0, Le/e/a/FeedRefresh209;

    invoke-virtual {v0}, Landroid/widget/ListView;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {p0, v5, v0, v4}, Le/e/a/FeedRefresh209;-><init>(Landroid/content/Context;Landroid/view/View;Ljava/lang/Runnable;)V

    iput-object p0, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    .line 69
    iget-object p0, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    iget-object p0, p0, Le/e/a/FeedRefresh209;->swipe:Landroid/view/ViewGroup;

    check-cast p0, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    invoke-virtual {p0, v4}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnChildScrollUpCallback(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$OnChildScrollUpCallback;)V

    .line 70
    iget-object p0, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v1, p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    goto :goto_1

    .line 71
    :catch_0
    move-exception p0

    .line 72
    iget-object v5, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    if-eqz v5, :cond_3

    iget-object v5, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v5}, Le/e/a/FeedRefresh209;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-ne v5, v1, :cond_3

    iget-object v4, v4, Le/e/a/LocalReload244$CachePull;->wrapper:Le/e/a/FeedRefresh209;

    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 73
    :cond_3
    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup;

    if-eqz v4, :cond_4

    invoke-virtual {v0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 74
    :cond_4
    invoke-virtual {v1, v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 75
    const-string v0, "nicoid-refresh244"

    const-string v1, "Cache refresh binding failed"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    :goto_1
    return-void

    .line 60
    :cond_5
    return-void
.end method

.method private static launch(Le/e/a/LocalReload244$Job;)V
    .registers 4

    .line 85
    iget-object v0, p0, Le/e/a/LocalReload244$Job;->list:Landroid/widget/ListView;

    .line 86
    sget-object v1, Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 87
    :cond_0
    invoke-virtual {v0}, Landroid/widget/ListView;->isEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Landroid/widget/ListView;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->canScrollVertically(I)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Le/e/a/LocalReload244$Job;->activity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_1

    .line 88
    sget-object v1, Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;

    invoke-interface {v1, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setEnabled(Z)V

    .line 89
    :try_start_0
    iget-object v1, p0, Le/e/a/LocalReload244$Job;->fragment:Lcom/sauzask/nicoid/NicoidVideoListFragment;

    invoke-static {v1, v0}, Le/e/a/LocalReload244;->top(Ljava/lang/Object;Landroid/widget/ListView;)V

    new-instance v1, Ljava/lang/Thread;

    const-string v2, "nicoid-local-refresh"

    invoke-direct {v1, p0, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    goto :goto_0

    :catch_0
    move-exception v1

    sget-object v2, Le/e/a/LocalReload244;->ACTIVE:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setEnabled(Z)V

    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    const-string p0, "nicoid-refresh244"

    const-string v0, "Local refresh start failed"

    invoke-static {p0, v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 91
    :goto_0
    return-void

    .line 87
    :cond_1
    invoke-virtual {p0}, Le/e/a/LocalReload244$Job;->stop()V

    return-void
.end method

.method public static local(Ljava/lang/Object;)Z
    .registers 2

    .line 28
    instance-of v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget p0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->g0:I

    invoke-static {p0}, Le/e/a/LocalReload244;->localType(I)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static localType(I)Z
    .registers 2

    .line 30
    const/16 v0, 0x8

    if-eq p0, v0, :cond_0

    const/16 v0, 0xb

    if-eq p0, v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method public static pulling(Landroid/widget/ListView;)Z
    .registers 3

    .line 32
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    .line 33
    :cond_0
    invoke-virtual {p0}, Landroid/widget/ListView;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    .line 34
    :goto_0
    instance-of v1, p0, Landroid/view/View;

    if-eqz v1, :cond_2

    .line 35
    instance-of v1, p0, Le/e/a/SearchSwipe;

    if-eqz v1, :cond_1

    check-cast p0, Le/e/a/SearchSwipe;

    iget-boolean p0, p0, Le/e/a/SearchSwipe;->refreshing:Z

    return p0

    .line 36
    :cond_1
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    goto :goto_0

    .line 38
    :cond_2
    return v0
.end method

.method public static start(Le/e/a/SearchSwipe;)V
    .registers 8

    .line 54
    iget-object v0, p0, Le/e/a/SearchSwipe;->fragment:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    .line 55
    invoke-static {v2}, Le/e/a/LocalReload244;->local(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->l0:Z

    if-eqz v0, :cond_1

    iget-boolean v0, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->k0:Z

    if-nez v0, :cond_1

    iget-object v0, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->b0:Landroid/widget/ListView;

    iget-object v1, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    if-ne v0, v1, :cond_1

    iget-object v0, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    if-nez v0, :cond_0

    move-object v5, p0

    goto :goto_0

    .line 56
    :cond_0
    new-instance v1, Le/e/a/LocalReload244$Job;

    iget-object v3, v2, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    iget-object v4, p0, Le/e/a/SearchSwipe;->list:Landroid/widget/ListView;

    const/4 v6, 0x0

    move-object v5, p0

    invoke-direct/range {v1 .. v6}, Le/e/a/LocalReload244$Job;-><init>(Lcom/sauzask/nicoid/NicoidVideoListFragment;Landroid/app/Activity;Landroid/widget/ListView;Le/e/a/SearchSwipe;Le/e/a/LocalReload244$CachePull;)V

    invoke-static {v1}, Le/e/a/LocalReload244;->launch(Le/e/a/LocalReload244$Job;)V

    .line 57
    return-void

    .line 55
    :cond_1
    move-object v5, p0

    :goto_0
    const/4 p0, 0x0

    invoke-virtual {v5, p0}, Le/e/a/SearchSwipe;->setRefreshing(Z)V

    return-void
.end method

.method public static top(Ljava/lang/Object;Landroid/widget/ListView;)V
    .registers 5

    .line 41
    if-nez p1, :cond_0

    return-void

    .line 42
    :cond_0
    invoke-static {p1}, Le/e/a/SmoothTabRestore204;->cancel244(Landroid/widget/ListView;)V

    .line 43
    instance-of v0, p0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 44
    move-object v0, p0

    check-cast v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;

    iget-object v0, v0, Lcom/sauzask/nicoid/NicoidVideoListFragment;->o0:Landroid/app/Activity;

    .line 45
    sget-object v2, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    .line 46
    if-eqz v0, :cond_1

    iget-object v2, v0, Le/e/a/MultiTabs227$Host;->current:Ljava/lang/Object;

    if-ne v2, p0, :cond_1

    .line 47
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object p0

    iget-object v0, v0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-virtual {p0, v0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object p0

    .line 48
    if-eqz p0, :cond_1

    iput v1, p0, Le/e/a/SavedTabs227$Tab;->position:I

    iput v1, p0, Le/e/a/SavedTabs227$Tab;->top:I

    .line 51
    :cond_1
    invoke-virtual {p1, v1, v1}, Landroid/widget/ListView;->setSelectionFromTop(II)V

    .line 52
    return-void
.end method
