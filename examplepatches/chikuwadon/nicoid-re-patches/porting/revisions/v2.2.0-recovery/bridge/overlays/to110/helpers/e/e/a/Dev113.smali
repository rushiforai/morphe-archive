.class public final Le/e/a/Dev113;
.super Ljava/lang/Object;
.source "Dev113.java"


# static fields
.field private static final INFO_PLAYLIST_ITEM:I = 0x46f0


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static dp(Landroid/content/Context;I)I
    .registers 4
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "value"    # I

    .line 30
    int-to-float v0, p1

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    mul-float v0, v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method private static enqueueVideo(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "page"    # Ljava/lang/Object;
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "videoId"    # Ljava/lang/String;

    .line 89
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    move-object v4, v0

    .line 90
    .local v4, "weak":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    .line 91
    .local v6, "app":Landroid/content/Context;
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/Dev113$5;

    move-object v5, p1

    move-object v3, p2

    move-object v2, p3

    .end local p1    # "page":Ljava/lang/Object;
    .end local p2    # "folder":Ljava/lang/String;
    .end local p3    # "videoId":Ljava/lang/String;
    .local v2, "videoId":Ljava/lang/String;
    .local v3, "folder":Ljava/lang/String;
    .local v5, "page":Ljava/lang/Object;
    invoke-direct/range {v1 .. v6}, Le/e/a/Dev113$5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/Object;Landroid/content/Context;)V

    const-string p1, "nicoid-playlist-url"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 161
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 162
    return-void
.end method

.method public static infoMenu(Landroid/app/Activity;Landroid/view/Menu;)V
    .registers 9
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "menu"    # Landroid/view/Menu;

    .line 168
    if-eqz p0, :cond_5

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_5

    .line 169
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.sauzask.nicoid.NicoidVideoInfoActivity"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 170
    :cond_0
    const/16 v0, 0x46f0

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 171
    .local v1, "current":Landroid/view/MenuItem;
    if-nez v1, :cond_4

    .line 172
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "language":Ljava/lang/String;
    const-string v3, "ja"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u306b\u8ffd\u52a0"

    goto :goto_0

    .line 174
    :cond_1
    const-string v3, "zh"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "\u52a0\u5165\u64ad\u653e\u6e05\u55ae"

    goto :goto_0

    :cond_2
    const-string v3, "Add to playlist"

    :goto_0
    nop

    .line 175
    .local v3, "label":Ljava/lang/String;
    invoke-static {p1}, Le/e/a/Dev113;->watchLaterItem(Landroid/view/Menu;)Landroid/view/MenuItem;

    move-result-object v4

    .line 176
    .local v4, "after":Landroid/view/MenuItem;
    nop

    .line 177
    const/4 v5, 0x0

    if-nez v4, :cond_3

    const/4 v6, 0x0

    goto :goto_1

    :cond_3
    invoke-interface {v4}, Landroid/view/MenuItem;->getOrder()I

    move-result v6

    .line 176
    :goto_1
    invoke-interface {p1, v5, v0, v6, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    .line 178
    invoke-interface {v1, v5}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 179
    new-instance v0, Le/e/a/Dev113$3;

    invoke-direct {v0, p0}, Le/e/a/Dev113$3;-><init>(Landroid/app/Activity;)V

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 181
    .end local v2    # "language":Ljava/lang/String;
    .end local v3    # "label":Ljava/lang/String;
    .end local v4    # "after":Landroid/view/MenuItem;
    :cond_4
    invoke-static {p1}, Le/e/a/Dev113;->watchLaterItem(Landroid/view/Menu;)Landroid/view/MenuItem;

    move-result-object v0

    invoke-static {p1, v0, v1}, Le/e/a/Dev113;->placeAfter(Landroid/view/Menu;Landroid/view/MenuItem;Landroid/view/MenuItem;)V

    .line 182
    return-void

    .line 169
    .end local v1    # "current":Landroid/view/MenuItem;
    :cond_5
    :goto_2
    return-void
.end method

.method public static infoSelected(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 16
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 278
    const-class v0, Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const/16 v3, 0x46f0

    if-eq v2, v3, :cond_0

    goto/16 :goto_3

    .line 279
    :cond_0
    const/4 v2, 0x1

    if-eqz p0, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v3

    if-eqz v3, :cond_1

    goto/16 :goto_2

    .line 281
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v4, "E"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 282
    .local v3, "videoField":Ljava/lang/reflect/Field;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "F"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 283
    .local v4, "titleField":Ljava/lang/reflect/Field;
    invoke-virtual {v3, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 284
    invoke-virtual {v4, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 285
    invoke-virtual {v3, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 286
    .local v5, "id":Ljava/lang/String;
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 287
    .local v6, "title":Ljava/lang/String;
    if-eqz v5, :cond_3

    const-string v7, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {v5, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 289
    const-string v7, "e.e.a.LocalPlaylists"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    const-string v8, "add"

    const/4 v9, 0x5

    new-array v10, v9, [Ljava/lang/Class;

    const-class v11, Landroid/content/Context;

    aput-object v11, v10, v1

    aput-object v0, v10, v2

    const/4 v11, 0x2

    aput-object v0, v10, v11

    const/4 v12, 0x3

    aput-object v0, v10, v12

    const/4 v13, 0x4

    aput-object v0, v10, v13

    invoke-virtual {v7, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 291
    .local v0, "add":Ljava/lang/reflect/Method;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "https://www.nicovideo.jp/watch/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 292
    const-string v8, ""

    if-nez v6, :cond_2

    move-object v10, v8

    goto :goto_0

    :cond_2
    move-object v10, v6

    :goto_0
    :try_start_1
    new-array v9, v9, [Ljava/lang/Object;

    aput-object p0, v9, v1

    aput-object v7, v9, v2

    aput-object v10, v9, v11

    aput-object v8, v9, v12

    aput-object v8, v9, v13

    .line 291
    const/4 v7, 0x0

    invoke-virtual {v0, v7, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    nop

    .end local v0    # "add":Ljava/lang/reflect/Method;
    .end local v3    # "videoField":Ljava/lang/reflect/Field;
    .end local v4    # "titleField":Ljava/lang/reflect/Field;
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "title":Ljava/lang/String;
    goto :goto_1

    .line 288
    .restart local v3    # "videoField":Ljava/lang/reflect/Field;
    .restart local v4    # "titleField":Ljava/lang/reflect/Field;
    .restart local v5    # "id":Ljava/lang/String;
    .restart local v6    # "title":Ljava/lang/String;
    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v7, "Invalid video identifier"

    invoke-direct {v0, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "item":Landroid/view/MenuItem;
    throw v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 293
    .end local v3    # "videoField":Ljava/lang/reflect/Field;
    .end local v4    # "titleField":Ljava/lang/reflect/Field;
    .end local v5    # "id":Ljava/lang/String;
    .end local v6    # "title":Ljava/lang/String;
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "item":Landroid/view/MenuItem;
    :catch_0
    move-exception v0

    .line 294
    .local v0, "error":Ljava/lang/Exception;
    const-string v3, "nicoid-playlist"

    const-string v4, "Unable to open device playlist registration"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 295
    const-string v3, "\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u767b\u9332\u3092\u958b\u59cb\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const-string v4, "Unable to open playlist registration"

    invoke-static {p0, v3, v4}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 296
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 298
    .end local v0    # "error":Ljava/lang/Exception;
    :goto_1
    return v2

    .line 279
    :cond_4
    :goto_2
    return v2

    .line 278
    :cond_5
    :goto_3
    return v1
.end method

.method private static isAfter(Landroid/view/Menu;Landroid/view/MenuItem;Landroid/view/MenuItem;)Z
    .registers 6
    .param p0, "menu"    # Landroid/view/Menu;
    .param p1, "reference"    # Landroid/view/MenuItem;
    .param p2, "added"    # Landroid/view/MenuItem;

    .line 270
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    add-int/lit8 v1, v0, 0x1

    invoke-interface {p0}, Landroid/view/Menu;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 271
    invoke-interface {p0, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-ne v1, p1, :cond_0

    add-int/lit8 v1, v0, 0x1

    invoke-interface {p0, v1}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-ne v1, p2, :cond_0

    const/4 v1, 0x1

    return v1

    .line 270
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 273
    .end local v0    # "i":I
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private static itemIndex(Ljava/util/List;Landroid/view/MenuItem;)I
    .registers 7
    .param p1, "expected"    # Landroid/view/MenuItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Landroid/view/MenuItem;",
            ")I"
        }
    .end annotation

    .line 257
    .local p0, "items":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_4

    .line 258
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 259
    .local v1, "value":Ljava/lang/Object;
    if-ne v1, p1, :cond_0

    return v0

    .line 260
    :cond_0
    instance-of v2, v1, Landroid/view/MenuItem;

    if-nez v2, :cond_1

    goto :goto_1

    .line 261
    :cond_1
    move-object v2, v1

    check-cast v2, Landroid/view/MenuItem;

    .line 262
    .local v2, "item":Landroid/view/MenuItem;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Landroid/view/MenuItem;->getItemId()I

    move-result v3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v4

    if-ne v3, v4, :cond_2

    return v0

    .line 263
    :cond_2
    invoke-interface {v2}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 264
    invoke-interface {v2}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_3

    return v0

    .line 257
    .end local v1    # "value":Ljava/lang/Object;
    .end local v2    # "item":Landroid/view/MenuItem;
    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 266
    .end local v0    # "i":I
    :cond_4
    const/4 v0, -0x1

    return v0
.end method

.method static synthetic lambda$enqueueVideo$3(Ljava/lang/String;Ljava/lang/String;Le/e/a/Dev120$Metadata;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 27
    .param p0, "folder"    # Ljava/lang/String;
    .param p1, "videoId"    # Ljava/lang/String;
    .param p2, "meta"    # Le/e/a/Dev120$Metadata;
    .param p3, "duplicate"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p4, "proxy"    # Ljava/lang/Object;
    .param p5, "method"    # Ljava/lang/reflect/Method;
    .param p6, "arguments"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 99
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    const-string v3, "apply"

    invoke-virtual/range {p5 .. p5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-nez v3, :cond_0

    return-object v4

    .line 100
    :cond_0
    const/4 v3, 0x0

    aget-object v5, p6, v3

    .line 101
    .local v5, "data":Ljava/lang/Object;
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-string v7, "videos"

    invoke-virtual {v6, v7}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONArray;

    .line 102
    .local v6, "videos":Lorg/json/JSONArray;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v8

    const-string v9, "videoId"

    const-string v10, "folder"

    const/4 v11, 0x1

    if-ge v7, v8, :cond_3

    .line 103
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    .line 104
    .local v8, "old":Lorg/json/JSONObject;
    if-eqz v8, :cond_2

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 105
    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 106
    invoke-virtual {v2, v8}, Le/e/a/Dev120$Metadata;->merge(Lorg/json/JSONObject;)V

    .line 107
    move-object/from16 v12, p3

    invoke-virtual {v12, v11}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 108
    return-object v4

    .line 105
    :cond_1
    move-object/from16 v12, p3

    goto :goto_1

    .line 104
    :cond_2
    move-object/from16 v12, p3

    .line 102
    .end local v8    # "old":Lorg/json/JSONObject;
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_3
    move-object/from16 v12, p3

    .line 111
    .end local v7    # "i":I
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const/4 v8, 0x5

    new-array v13, v8, [Ljava/lang/Class;

    const-class v14, Ljava/lang/String;

    aput-object v14, v13, v3

    aput-object v14, v13, v11

    const/4 v15, 0x2

    aput-object v14, v13, v15

    const/16 v16, 0x3

    aput-object v14, v13, v16

    const/16 v17, 0x4

    aput-object v14, v13, v17

    const-string v14, "add"

    invoke-virtual {v7, v14, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 113
    .local v7, "add":Ljava/lang/reflect/Method;
    invoke-static {v1}, Le/e/a/PlaylistUrlParser;->canonicalUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v2, Le/e/a/Dev120$Metadata;->title:Ljava/lang/String;

    const/16 v18, 0x0

    iget-object v3, v2, Le/e/a/Dev120$Metadata;->owner:Ljava/lang/String;

    move-object/from16 v19, v4

    iget-object v4, v2, Le/e/a/Dev120$Metadata;->image:Ljava/lang/String;

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v0, v8, v18

    aput-object v13, v8, v11

    aput-object v14, v8, v15

    aput-object v3, v8, v16

    aput-object v4, v8, v17

    invoke-virtual {v7, v5, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v3

    sub-int/2addr v3, v11

    .local v3, "j":I
    :goto_2
    if-ltz v3, :cond_5

    .line 117
    invoke-virtual {v6, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 118
    .local v4, "saved":Lorg/json/JSONObject;
    if-eqz v4, :cond_4

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 119
    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 120
    invoke-virtual {v2, v4}, Le/e/a/Dev120$Metadata;->merge(Lorg/json/JSONObject;)V

    .line 121
    goto :goto_3

    .line 116
    .end local v4    # "saved":Lorg/json/JSONObject;
    :cond_4
    add-int/lit8 v3, v3, -0x1

    goto :goto_2

    .line 124
    .end local v3    # "j":I
    :cond_5
    :goto_3
    return-object v19
.end method

.method static synthetic lambda$enqueueVideo$4(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .registers 9
    .param p0, "success"    # Ljava/lang/Boolean;
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "page"    # Ljava/lang/Object;
    .param p3, "current"    # Landroid/app/Activity;
    .param p4, "duplicate"    # Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 130
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 132
    :try_start_0
    invoke-static {p2}, Le/e/a/Dev113;->pageFolder(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v2, "render"

    new-array v3, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 134
    .local v0, "render":Ljava/lang/reflect/Method;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 135
    new-array v2, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p2, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 139
    .end local v0    # "render":Ljava/lang/reflect/Method;
    :cond_0
    goto :goto_0

    .line 137
    :catch_0
    move-exception v0

    .line 138
    .local v0, "error":Ljava/lang/Exception;
    const-string v2, "nicoid-playlist"

    const-string v3, "Unable to refresh playlist after URL add"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 141
    .end local v0    # "error":Ljava/lang/Exception;
    :cond_1
    :goto_0
    nop

    .line 142
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 143
    const-string/jumbo v0, "\u8ffd\u52a0\u6e08\u307f\u306e\u52d5\u753b\u3067\u3059"

    const-string v2, "Video already added"

    invoke-static {p3, v0, v2}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 144
    :cond_2
    const-string v0, "\u52d5\u753b\u3092\u8ffd\u52a0\u3057\u307e\u3057\u305f"

    const-string v2, "Video added"

    invoke-static {p3, v0, v2}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 145
    :cond_3
    const-string v0, "\u52d5\u753b\u3092\u8ffd\u52a0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const-string v2, "Unable to add video"

    invoke-static {p3, v0, v2}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    nop

    .line 141
    invoke-static {p3, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 146
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 147
    return-void
.end method

.method static synthetic lambda$enqueueVideo$5(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/lang/Boolean;)V
    .registers 12
    .param p0, "weak"    # Ljava/lang/ref/WeakReference;
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "page"    # Ljava/lang/Object;
    .param p3, "duplicate"    # Ljava/util/concurrent/atomic/AtomicBoolean;
    .param p4, "success"    # Ljava/lang/Boolean;

    .line 127
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/app/Activity;

    .line 128
    .local v5, "current":Landroid/app/Activity;
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v5}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v2, p4

    goto :goto_0

    .line 129
    :cond_0
    new-instance v1, Le/e/a/Dev113$4;

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v2, p4

    .end local p1    # "folder":Ljava/lang/String;
    .end local p2    # "page":Ljava/lang/Object;
    .end local p3    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local p4    # "success":Ljava/lang/Boolean;
    .local v2, "success":Ljava/lang/Boolean;
    .local v3, "folder":Ljava/lang/String;
    .local v4, "page":Ljava/lang/Object;
    .local v6, "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-direct/range {v1 .. v6}, Le/e/a/Dev113$4;-><init>(Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/Object;Landroid/app/Activity;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-virtual {v5, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 148
    return-void

    .line 128
    .end local v2    # "success":Ljava/lang/Boolean;
    .end local v3    # "folder":Ljava/lang/String;
    .end local v4    # "page":Ljava/lang/Object;
    .end local v6    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local p1    # "folder":Ljava/lang/String;
    .restart local p2    # "page":Ljava/lang/Object;
    .restart local p3    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    .restart local p4    # "success":Ljava/lang/Boolean;
    :cond_1
    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    move-object v2, p4

    .end local p1    # "folder":Ljava/lang/String;
    .end local p2    # "page":Ljava/lang/Object;
    .end local p3    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local p4    # "success":Ljava/lang/Boolean;
    .restart local v2    # "success":Ljava/lang/Boolean;
    .restart local v3    # "folder":Ljava/lang/String;
    .restart local v4    # "page":Ljava/lang/Object;
    .restart local v6    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    :goto_0
    return-void
.end method

.method static synthetic lambda$enqueueVideo$6(Landroid/app/Activity;)V
    .registers 3
    .param p0, "current"    # Landroid/app/Activity;

    .line 156
    nop

    .line 157
    const-string v0, "\u52d5\u753b\u3092\u8ffd\u52a0\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const-string v1, "Unable to add video"

    invoke-static {p0, v0, v1}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 156
    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 158
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 156
    return-void
.end method

.method static synthetic lambda$enqueueVideo$7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/ref/WeakReference;Ljava/lang/Object;Landroid/content/Context;)V
    .registers 22
    .param p0, "videoId"    # Ljava/lang/String;
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "weak"    # Ljava/lang/ref/WeakReference;
    .param p3, "page"    # Ljava/lang/Object;
    .param p4, "app"    # Landroid/content/Context;

    .line 92
    move-object/from16 v1, p1

    invoke-static/range {p0 .. p0}, Le/e/a/Dev120;->fetch(Ljava/lang/String;)Le/e/a/Dev120$Metadata;

    move-result-object v2

    .line 94
    .local v2, "meta":Le/e/a/Dev120$Metadata;
    :try_start_0
    const-string v0, "e.e.a.LocalPlaylists"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 95
    .local v0, "playlists":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v3, "e.e.a.LocalPlaylists$Edit"

    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 96
    .local v3, "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 97
    .local v4, "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    const/4 v7, 0x1

    new-array v8, v7, [Ljava/lang/Class;

    aput-object v3, v8, v5

    new-instance v9, Le/e/a/Dev113$0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    move-object/from16 v10, p0

    :try_start_1
    invoke-direct {v9, v1, v10, v2, v4}, Le/e/a/Dev113$0;-><init>(Ljava/lang/String;Ljava/lang/String;Le/e/a/Dev120$Metadata;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    invoke-static {v6, v8, v9}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object v6

    .line 126
    .local v6, "edit":Ljava/lang/Object;
    new-instance v8, Le/e/a/Dev113$1;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v9, p2

    move-object/from16 v11, p3

    :try_start_2
    invoke-direct {v8, v9, v1, v11, v4}, Le/e/a/Dev113$1;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/String;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 149
    .local v8, "callback":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    const-string v12, "change"

    const/4 v13, 0x3

    new-array v14, v13, [Ljava/lang/Class;

    const-class v15, Landroid/content/Context;

    aput-object v15, v14, v5

    aput-object v3, v14, v7

    const-class v15, Ljava/util/function/Consumer;

    const/16 v16, 0x2

    aput-object v15, v14, v16

    invoke-virtual {v0, v12, v14}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    .line 150
    .local v12, "change":Ljava/lang/reflect/Method;
    invoke-virtual {v12, v7}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 151
    new-array v13, v13, [Ljava/lang/Object;

    aput-object p4, v13, v5

    aput-object v6, v13, v7

    aput-object v8, v13, v16

    const/4 v5, 0x0

    invoke-virtual {v12, v5, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 160
    nop

    .end local v0    # "playlists":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v3    # "editType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "duplicate":Ljava/util/concurrent/atomic/AtomicBoolean;
    .end local v6    # "edit":Ljava/lang/Object;
    .end local v8    # "callback":Ljava/util/function/Consumer;, "Ljava/util/function/Consumer<Ljava/lang/Boolean;>;"
    .end local v12    # "change":Ljava/lang/reflect/Method;
    goto :goto_2

    .line 152
    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    move-object/from16 v10, p0

    :goto_0
    move-object/from16 v9, p2

    move-object/from16 v11, p3

    .line 153
    .local v0, "error":Ljava/lang/Exception;
    :goto_1
    const-string v3, "nicoid-playlist"

    const-string v4, "Unable to add video from URL"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 154
    invoke-virtual {v9}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 155
    .local v3, "current":Landroid/app/Activity;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isFinishing()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Landroid/app/Activity;->isDestroyed()Z

    move-result v4

    if-nez v4, :cond_0

    .line 156
    new-instance v4, Le/e/a/Dev113$2;

    invoke-direct {v4, v3}, Le/e/a/Dev113$2;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v3, v4}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 161
    .end local v0    # "error":Ljava/lang/Exception;
    .end local v3    # "current":Landroid/app/Activity;
    :cond_0
    :goto_2
    return-void
.end method

.method static synthetic lambda$infoMenu$8(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "item"    # Landroid/view/MenuItem;

    .line 179
    invoke-static {p0, p1}, Le/e/a/Dev113;->infoSelected(Landroid/app/Activity;Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$playlistUrlMenu$0(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Landroid/view/MenuItem;)Z
    .registers 5
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "page"    # Ljava/lang/Object;
    .param p2, "folder"    # Ljava/lang/String;
    .param p3, "item"    # Landroid/view/MenuItem;

    .line 50
    invoke-static {p0, p1, p2}, Le/e/a/Dev113;->showUrlDialog(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V

    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method static synthetic lambda$showUrlDialog$1(Landroid/widget/EditText;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Object;Ljava/lang/String;Landroid/view/View;)V
    .registers 10
    .param p0, "input"    # Landroid/widget/EditText;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "dialog"    # Landroid/app/AlertDialog;
    .param p3, "page"    # Ljava/lang/Object;
    .param p4, "folder"    # Ljava/lang/String;
    .param p5, "v"    # Landroid/view/View;

    .line 74
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "original":Ljava/lang/String;
    invoke-static {v0}, Le/e/a/PlaylistUrlParser;->videoId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 76
    .local v1, "video":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 77
    const-string v2, "\u30cb\u30b3\u30cb\u30b3\u52d5\u753b\u306eURL\u307e\u305f\u306f\u52d5\u753bID\u3092\u5165\u529b\u3057\u3066\u304f\u3060\u3055\u3044"

    const-string v3, "Enter a NicoNico video URL or video ID"

    invoke-static {p1, v2, v3}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 79
    return-void

    .line 81
    :cond_0
    const/4 v2, -0x1

    invoke-virtual {p2, v2}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 82
    invoke-virtual {p2}, Landroid/app/AlertDialog;->dismiss()V

    .line 83
    invoke-static {p1, p3, p4, v1}, Le/e/a/Dev113;->enqueueVideo(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method static synthetic lambda$showUrlDialog$2(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;Landroid/content/DialogInterface;)V
    .registers 13
    .param p0, "dialog"    # Landroid/app/AlertDialog;
    .param p1, "input"    # Landroid/widget/EditText;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "page"    # Ljava/lang/Object;
    .param p4, "folder"    # Ljava/lang/String;
    .param p5, "d"    # Landroid/content/DialogInterface;

    .line 73
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    new-instance v1, Le/e/a/Dev113$7;

    move-object v4, p0

    move-object v2, p1

    move-object v3, p2

    move-object v5, p3

    move-object v6, p4

    .end local p0    # "dialog":Landroid/app/AlertDialog;
    .end local p1    # "input":Landroid/widget/EditText;
    .end local p2    # "activity":Landroid/app/Activity;
    .end local p3    # "page":Ljava/lang/Object;
    .end local p4    # "folder":Ljava/lang/String;
    .local v2, "input":Landroid/widget/EditText;
    .local v3, "activity":Landroid/app/Activity;
    .local v4, "dialog":Landroid/app/AlertDialog;
    .local v5, "page":Ljava/lang/Object;
    .local v6, "folder":Ljava/lang/String;
    invoke-direct/range {v1 .. v6}, Le/e/a/Dev113$7;-><init>(Landroid/widget/EditText;Landroid/app/Activity;Landroid/app/AlertDialog;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private static language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ja"    # Ljava/lang/String;
    .param p2, "en"    # Ljava/lang/String;

    .line 27
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ja"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    return-object v0
.end method

.method private static moveItem(Ljava/util/List;Landroid/view/MenuItem;Landroid/view/MenuItem;)Z
    .registers 8
    .param p1, "reference"    # Landroid/view/MenuItem;
    .param p2, "added"    # Landroid/view/MenuItem;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "*>;",
            "Landroid/view/MenuItem;",
            "Landroid/view/MenuItem;",
            ")Z"
        }
    .end annotation

    .line 245
    .local p0, "raw":Ljava/util/List;, "Ljava/util/List<*>;"
    invoke-static {p0, p1}, Le/e/a/Dev113;->itemIndex(Ljava/util/List;Landroid/view/MenuItem;)I

    move-result v0

    .line 246
    .local v0, "before":I
    invoke-static {p0, p2}, Le/e/a/Dev113;->itemIndex(Ljava/util/List;Landroid/view/MenuItem;)I

    move-result v1

    .line 247
    .local v1, "after":I
    const/4 v2, 0x0

    if-ltz v0, :cond_2

    if-ltz v1, :cond_2

    add-int/lit8 v3, v0, 0x1

    if-ne v1, v3, :cond_0

    goto :goto_0

    .line 248
    :cond_0
    move-object v3, p0

    .line 249
    .local v3, "items":Ljava/util/List;
    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v4

    .line 250
    .local v4, "item":Ljava/lang/Object;
    invoke-static {v3, p1}, Le/e/a/Dev113;->itemIndex(Ljava/util/List;Landroid/view/MenuItem;)I

    move-result v0

    .line 251
    if-gez v0, :cond_1

    return v2

    .line 252
    :cond_1
    add-int/lit8 v2, v0, 0x1

    invoke-interface {v3, v2, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 253
    const/4 v2, 0x1

    return v2

    .line 247
    .end local v3    # "items":Ljava/util/List;
    .end local v4    # "item":Ljava/lang/Object;
    :cond_2
    :goto_0
    return v2
.end method

.method private static pageFolder(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p0, "page"    # Ljava/lang/Object;

    .line 33
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 35
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "folder"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 36
    .local v1, "folder":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 38
    .end local v1    # "folder":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 39
    .local v1, "error":Ljava/lang/Exception;
    const-string v2, "nicoid-playlist"

    const-string v3, "Cannot identify active playlist folder"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    return-object v0
.end method

.method private static placeAfter(Landroid/view/Menu;Landroid/view/MenuItem;Landroid/view/MenuItem;)V
    .registers 19
    .param p0, "menu"    # Landroid/view/Menu;
    .param p1, "reference"    # Landroid/view/MenuItem;
    .param p2, "added"    # Landroid/view/MenuItem;

    .line 202
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    if-eqz v1, :cond_a

    if-eqz v2, :cond_a

    if-ne v1, v2, :cond_0

    move-object/from16 v5, p0

    goto/16 :goto_6

    .line 203
    :cond_0
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v3

    .line 205
    .local v3, "visited":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    move-object v4, v0

    .line 206
    .local v4, "pending":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Ljava/lang/Object;>;"
    move-object/from16 v5, p0

    invoke-virtual {v4, v5}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 207
    const/4 v0, 0x0

    .line 208
    .local v0, "moved":Z
    const/4 v6, 0x0

    move v7, v6

    move v6, v0

    .end local v0    # "moved":Z
    .local v6, "moved":Z
    .local v7, "depth":I
    :goto_0
    const/16 v0, 0x18

    if-ge v7, v0, :cond_8

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_8

    .line 209
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    move-result-object v8

    .line 210
    .local v8, "backend":Ljava/lang/Object;
    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    goto/16 :goto_5

    .line 211
    :cond_1
    const/4 v0, 0x0

    .line 212
    .local v0, "adjusted":Z
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    move-object v10, v9

    move v9, v0

    .end local v0    # "adjusted":Z
    .local v9, "adjusted":Z
    .local v10, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_1
    const/4 v0, 0x0

    const/4 v11, 0x1

    if-eqz v10, :cond_6

    .line 213
    invoke-virtual {v10}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v12

    array-length v13, v12

    move v14, v9

    const/4 v9, 0x0

    .end local v9    # "adjusted":Z
    .local v14, "adjusted":Z
    :goto_2
    if-ge v9, v13, :cond_5

    aget-object v15, v12, v9

    .line 214
    .local v15, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v15}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_4

    .line 216
    :cond_2
    :try_start_0
    invoke-virtual {v15, v11}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 217
    invoke-virtual {v15, v8}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 218
    .local v0, "data":Ljava/lang/Object;
    instance-of v11, v0, Ljava/util/List;

    if-eqz v11, :cond_3

    .line 219
    move-object v11, v0

    check-cast v11, Ljava/util/List;

    invoke-static {v11, v1, v2}, Le/e/a/Dev113;->moveItem(Ljava/util/List;Landroid/view/MenuItem;Landroid/view/MenuItem;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 220
    const/4 v11, 0x1

    move v14, v11

    .end local v14    # "adjusted":Z
    .local v11, "adjusted":Z
    goto :goto_3

    .line 221
    .end local v11    # "adjusted":Z
    .restart local v14    # "adjusted":Z
    :cond_3
    instance-of v11, v0, Landroid/view/Menu;

    if-eqz v11, :cond_4

    if-eq v0, v8, :cond_4

    invoke-interface {v3, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_4

    .line 222
    invoke-virtual {v4, v0}, Ljava/util/ArrayDeque;->addLast(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 226
    .end local v0    # "data":Ljava/lang/Object;
    :cond_4
    :goto_3
    goto :goto_4

    .line 224
    :catch_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    .line 213
    .end local v15    # "field":Ljava/lang/reflect/Field;
    :goto_4
    add-int/lit8 v9, v9, 0x1

    const/4 v11, 0x1

    goto :goto_2

    .line 212
    :cond_5
    invoke-virtual {v10}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v10

    move v9, v14

    goto :goto_1

    .line 229
    .end local v10    # "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v14    # "adjusted":Z
    .restart local v9    # "adjusted":Z
    :cond_6
    if-eqz v9, :cond_7

    .line 230
    const/4 v6, 0x1

    .line 232
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "onItemsChanged"

    const/4 v12, 0x1

    new-array v13, v12, [Ljava/lang/Class;

    sget-object v12, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v12, v13, v0

    invoke-virtual {v10, v11, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 233
    .local v10, "refreshed":Ljava/lang/reflect/Method;
    const/4 v12, 0x1

    invoke-static {v12}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    new-array v12, v12, [Ljava/lang/Object;

    aput-object v11, v12, v0

    invoke-virtual {v10, v8, v12}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2

    .line 236
    nop

    .end local v10    # "refreshed":Ljava/lang/reflect/Method;
    goto :goto_5

    .line 234
    :catch_2
    move-exception v0

    goto :goto_5

    :catch_3
    move-exception v0

    .line 208
    .end local v8    # "backend":Ljava/lang/Object;
    .end local v9    # "adjusted":Z
    :cond_7
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_0

    .line 239
    .end local v7    # "depth":I
    :cond_8
    if-nez v6, :cond_9

    invoke-static/range {p0 .. p2}, Le/e/a/Dev113;->isAfter(Landroid/view/Menu;Landroid/view/MenuItem;Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 240
    const-string v0, "nicoid-menu"

    const-string v7, "Unable to move local playlist item after watch later"

    invoke-static {v0, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    :cond_9
    return-void

    .line 202
    .end local v3    # "visited":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Object;>;"
    .end local v4    # "pending":Ljava/util/ArrayDeque;, "Ljava/util/ArrayDeque<Ljava/lang/Object;>;"
    .end local v6    # "moved":Z
    :cond_a
    move-object/from16 v5, p0

    :goto_6
    return-void
.end method

.method public static playlistUrlMenu(Landroid/app/Activity;Landroid/view/Menu;Ljava/lang/Object;)V
    .registers 6
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "page"    # Ljava/lang/Object;

    .line 45
    invoke-static {p2}, Le/e/a/Dev113;->pageFolder(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "folder":Ljava/lang/String;
    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 47
    :cond_0
    const-string v1, "\u52d5\u753bURL\u304b\u3089\u8ffd\u52a0"

    const-string v2, "Add video from URL"

    invoke-static {p0, v1, v2}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v1

    .line 48
    .local v1, "add":Landroid/view/MenuItem;
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 49
    new-instance v2, Le/e/a/Dev113$6;

    invoke-direct {v2, p0, p2, v0}, Le/e/a/Dev113$6;-><init>(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    .line 53
    return-void

    .line 46
    .end local v1    # "add":Landroid/view/MenuItem;
    :cond_1
    :goto_0
    return-void
.end method

.method private static showUrlDialog(Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 12
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "page"    # Ljava/lang/Object;
    .param p2, "folder"    # Ljava/lang/String;

    .line 56
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v6, p0

    move-object v7, p1

    move-object v8, p2

    goto/16 :goto_0

    .line 57
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 58
    .local v0, "container":Landroid/widget/LinearLayout;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 59
    const/16 v2, 0x18

    invoke-static {p0, v2}, Le/e/a/Dev113;->dp(Landroid/content/Context;I)I

    move-result v3

    const/16 v4, 0xe

    invoke-static {p0, v4}, Le/e/a/Dev113;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-static {p0, v2}, Le/e/a/Dev113;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v5, 0x0

    invoke-virtual {v0, v3, v4, v2, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 60
    new-instance v2, Landroid/widget/EditText;

    invoke-direct {v2, p0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    move-object v5, v2

    .line 61
    .local v5, "input":Landroid/widget/EditText;
    const-string v2, "nicoid-managed-input"

    invoke-virtual {v5, v2}, Landroid/widget/EditText;->setTag(Ljava/lang/Object;)V

    .line 62
    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setSingleLine(Z)V

    .line 63
    const/high16 v1, 0x41700000    # 15.0f

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setTextSize(F)V

    .line 64
    const/16 v1, 0x11

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setInputType(I)V

    .line 65
    const-string v1, "https://sp.nicovideo.jp/watch/sm..."

    invoke-virtual {v5, v1}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 66
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v5, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    invoke-static {p0}, Le/e/a/Dev112;->builder(Landroid/app/Activity;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 68
    const-string v2, "\u52d5\u753bURL\u3092\u8ffd\u52a0"

    const-string v3, "Add video URL"

    invoke-static {p0, v2, v3}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 69
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 70
    const-string/jumbo v2, "\u8ffd\u52a0"

    const-string v3, "Add"

    invoke-static {p0, v2, v3}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 71
    const-string v2, "\u30ad\u30e3\u30f3\u30bb\u30eb"

    const-string v4, "Cancel"

    invoke-static {p0, v2, v4}, Le/e/a/Dev113;->language(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 72
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v4

    .line 73
    .local v4, "dialog":Landroid/app/AlertDialog;
    new-instance v3, Le/e/a/Dev113$8;

    move-object v6, p0

    move-object v7, p1

    move-object v8, p2

    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "page":Ljava/lang/Object;
    .end local p2    # "folder":Ljava/lang/String;
    .local v6, "activity":Landroid/app/Activity;
    .local v7, "page":Ljava/lang/Object;
    .local v8, "folder":Ljava/lang/String;
    invoke-direct/range {v3 .. v8}, Le/e/a/Dev113$8;-><init>(Landroid/app/AlertDialog;Landroid/widget/EditText;Landroid/app/Activity;Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 85
    invoke-static {v4}, Le/e/a/Dev112;->show(Landroid/app/AlertDialog;)V

    .line 86
    return-void

    .line 56
    .end local v0    # "container":Landroid/widget/LinearLayout;
    .end local v4    # "dialog":Landroid/app/AlertDialog;
    .end local v5    # "input":Landroid/widget/EditText;
    .end local v6    # "activity":Landroid/app/Activity;
    .end local v7    # "page":Ljava/lang/Object;
    .end local v8    # "folder":Ljava/lang/String;
    .restart local p0    # "activity":Landroid/app/Activity;
    .restart local p1    # "page":Ljava/lang/Object;
    .restart local p2    # "folder":Ljava/lang/String;
    :cond_1
    move-object v6, p0

    move-object v7, p1

    move-object v8, p2

    .end local p0    # "activity":Landroid/app/Activity;
    .end local p1    # "page":Ljava/lang/Object;
    .end local p2    # "folder":Ljava/lang/String;
    .restart local v6    # "activity":Landroid/app/Activity;
    .restart local v7    # "page":Ljava/lang/Object;
    .restart local v8    # "folder":Ljava/lang/String;
    :goto_0
    return-void
.end method

.method private static watchLaterItem(Landroid/view/Menu;)Landroid/view/MenuItem;
    .registers 6
    .param p0, "menu"    # Landroid/view/Menu;

    .line 185
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-interface {p0}, Landroid/view/Menu;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 186
    invoke-interface {p0, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    .line 187
    .local v1, "item":Landroid/view/MenuItem;
    if-eqz v1, :cond_2

    invoke-interface {v1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_1

    .line 188
    :cond_0
    invoke-interface {v1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 189
    .local v2, "value":Ljava/lang/String;
    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    .line 190
    .local v3, "normalized":Ljava/lang/String;
    const-string v4, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 191
    const-string v4, "watch later"

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 192
    const-string/jumbo v4, "\u7a0d\u5f8c\u89c0\u770b"

    invoke-virtual {v2, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    :cond_1
    return-object v1

    .line 185
    .end local v1    # "item":Landroid/view/MenuItem;
    .end local v2    # "value":Ljava/lang/String;
    .end local v3    # "normalized":Ljava/lang/String;
    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    .end local v0    # "index":I
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method
