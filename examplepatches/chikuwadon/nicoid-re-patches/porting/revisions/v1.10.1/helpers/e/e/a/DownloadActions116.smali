.class public final Le/e/a/DownloadActions116;
.super Ljava/lang/Object;
.source "DownloadActions116.java"


# static fields
.field static final CACHE:I = 0xa

.field static final MP4:I = 0x46d2


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static cache(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 14
    invoke-static {p1, p2}, Le/e/a/CacheTitles117;->remember(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->acquisitionIntent(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-lt p2, v0, :cond_11

    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startForegroundService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_14

    :cond_11
    invoke-static {p0, p1}, Le/e/a/CacheFolders;->startService(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/ComponentName;

    :goto_14
    return-void
.end method

.method public static complete(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6

    .line 7
    :try_start_0
    sget-object v0, Le/e/a/ListActions;->ACTIONS:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_b

    return-void

    :cond_b
    const-string v1, "e"

    invoke-static {p0, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "d"

    invoke-static {v1, v2}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    const-string v3, "b"

    invoke-static {v1, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v3, "c"

    invoke-static {p0, v3}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Number;

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    instance-of v3, v1, Ljava/util/List;

    if-eqz v3, :cond_4d

    if-ltz p0, :cond_4d

    move-object v3, v1

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt p0, v3, :cond_3b

    goto :goto_4d

    :cond_3b
    check-cast v1, Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    const-string v1, "a"

    invoke-static {p1, v1}, Le/e/a/ListActions;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/Menu;

    invoke-static {p1, v0, v2, p0}, Le/e/a/DownloadActions116;->normalize(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_4c} :catch_4e

    goto :goto_56

    :cond_4d
    :goto_4d
    return-void

    :catch_4e
    move-exception p0

    const-string p1, "nicoid-download"

    const-string v0, "Cannot attach video download actions"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_56
    return-void
.end method

.method static synthetic lambda$0(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 9
    invoke-static {p0, p1, p2}, Le/e/a/DownloadUi115;->choose(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 10
    invoke-static {p0, p1, p2}, Le/e/a/DownloadActions116;->cache(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic lambda$2(Le/e/a/ListActions$Action;Landroid/view/MenuItem;)Z
    .registers 2

    .line 11
    iget-object p0, p0, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    const/4 p0, 0x1

    return p0
.end method

.method static normalize(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Menu;",
            "Ljava/util/List<",
            "Le/e/a/ListActions$Action;",
            ">;",
            "Landroid/app/Activity;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 8
    invoke-static {p3}, Le/e/a/DownloadActions116;->videoId(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    return-void

    :cond_b
    const-string v1, "title"

    invoke-static {p3, v1}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/CacheTitles117;->remember(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0, p1}, Le/e/a/MenuOptions119;->canonical(Landroid/view/Menu;Ljava/util/List;)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    move-object v5, v4

    :cond_22
    :goto_22
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    const/16 v7, 0xa

    const/16 v8, 0x46d2

    if-nez v6, :cond_b0

    .line 9
    const/4 v6, 0x0

    if-nez v4, :cond_47

    const-string v3, "Save as MP4"

    const-string v4, "\u53e6\u5b58\u70baMP4"

    const-string v9, "MP4\u3067\u4fdd\u5b58"

    invoke-static {p2, v9, v3, v4}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v6, v8, v6, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v4, Le/e/a/ListActions$Action;

    new-instance v8, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;

    invoke-direct {v8, p2, v0, v1}, Le/e/a/DownloadActions116$$ExternalSyntheticLambda3;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v4, v3, v8}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 10
    :cond_47
    if-nez v5, :cond_63

    invoke-static {p2}, Le/e/a/ListActions;->cacheList(Landroid/app/Activity;)Z

    move-result v3

    if-nez v3, :cond_63

    const-string v3, "\u30ad\u30e3\u30c3\u30b7\u30e5\u53d6\u5f97"

    invoke-static {v3}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v6, v7, v6, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v5, Le/e/a/ListActions$Action;

    new-instance v7, Le/e/a/DownloadActions116$$ExternalSyntheticLambda4;

    invoke-direct {v7, p2, v0, v1}, Le/e/a/DownloadActions116$$ExternalSyntheticLambda4;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v5, v3, v7}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    .line 11
    :cond_63
    const/4 v0, 0x4

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-virtual {v2, v0, v4}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    if-eqz v5, :cond_76

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_76
    invoke-interface {p0}, Landroid/view/Menu;->clear()V

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    :goto_7d
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt v0, v1, :cond_87

    .line 12
    invoke-static {p0, p1, p2, p3}, Le/e/a/MenuOptions119;->finish(Landroid/view/Menu;Ljava/util/List;Landroid/app/Activity;Ljava/lang/Object;)V

    .line 13
    return-void

    .line 11
    :cond_87
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/ListActions$Action;

    iget v3, v1, Le/e/a/ListActions$Action;->id:I

    iget-object v4, v1, Le/e/a/ListActions$Action;->title:Ljava/lang/String;

    invoke-interface {p0, v6, v3, v0, v4}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v3

    iget-boolean v4, v1, Le/e/a/ListActions$Action;->enabled:Z

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    move-result-object v3

    new-instance v4, Le/e/a/DownloadActions116$$ExternalSyntheticLambda5;

    invoke-direct {v4, v1}, Le/e/a/DownloadActions116$$ExternalSyntheticLambda5;-><init>(Le/e/a/ListActions$Action;)V

    invoke-interface {v3, v4}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    new-instance v4, Le/e/a/ListActions$Action;

    iget-object v1, v1, Le/e/a/ListActions$Action;->run:Ljava/lang/Runnable;

    invoke-direct {v4, v3, v1}, Le/e/a/ListActions$Action;-><init>(Landroid/view/MenuItem;Ljava/lang/Runnable;)V

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_7d

    .line 8
    :cond_b0
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le/e/a/ListActions$Action;

    iget v9, v6, Le/e/a/ListActions$Action;->id:I

    if-ne v9, v8, :cond_bf

    if-nez v4, :cond_22

    move-object v4, v6

    goto/16 :goto_22

    :cond_bf
    iget v8, v6, Le/e/a/ListActions$Action;->id:I

    if-ne v8, v7, :cond_c8

    if-nez v5, :cond_22

    move-object v5, v6

    goto/16 :goto_22

    :cond_c8
    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_22
.end method

.method static videoId(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    .line 6
    const-string v0, "videoId"

    const-string v1, "video_id"

    const-string v2, "videourl"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_b
    const/4 v2, 0x3

    if-lt v1, v2, :cond_11

    const-string p0, ""

    return-object p0

    :cond_11
    aget-object v2, v0, v1

    invoke-static {p0, v2}, Le/e/a/ListActions;->value(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/HistoryRules;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_26

    const-string v3, "(?:sm|so|nm|ss)?[0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_26

    return-object v2

    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_b
.end method
