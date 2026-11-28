.class public final Le/e/a/Dev138;
.super Ljava/lang/Object;
.source "Dev138.java"


# static fields
.field private static final EN:[Ljava/lang/String;

.field private static final JA:[Ljava/lang/String;

.field private static final KEYS:[Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "nicoid-gesture-menu"

.field private static final ZH:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 15

    .line 20
    const-string v12, "menu_settings"

    const-string v13, "menu_restart"

    const-string v0, "menu_ranking"

    const-string v1, "menu_shorts"

    const-string v2, "menu_video_id"

    const-string v3, "menu_local_history"

    const-string v4, "menu_local_playlists"

    const-string v5, "menu_cache"

    const-string v6, "menu_mypage"

    const-string v7, "menu_account_history"

    const-string v8, "menu_mylists"

    const-string v9, "menu_watch_later"

    const-string v10, "menu_following"

    const-string v11, "menu_nicorepo"

    filled-new-array/range {v0 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    .line 26
    const-string v13, "\u30a2\u30d7\u30ea\u8a2d\u5b9a\u3092\u958b\u304f"

    const-string v14, "\u30a2\u30d7\u30ea\u3092\u518d\u8d77\u52d5"

    const-string v1, "\u30e9\u30f3\u30ad\u30f3\u30b0\u3092\u958b\u304f"

    const-string v2, "\u30b7\u30e7\u30fc\u30c8\u3092\u958b\u304f"

    const-string v3, "\u52d5\u753bID\u5165\u529b"

    const-string/jumbo v4, "\u672c\u4f53\u306e\u8996\u8074\u5c65\u6b74\u3092\u958b\u304f"

    const-string/jumbo v5, "\u672c\u4f53\u306e\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8\u3092\u958b\u304f"

    const-string v6, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8\u3092\u958b\u304f"

    const-string v7, "\u30de\u30a4\u30da\u30fc\u30b8\u3092\u958b\u304f"

    const-string v8, "\u30a2\u30ab\u30a6\u30f3\u30c8\u306e\u8996\u8074\u5c65\u6b74\u3092\u958b\u304f"

    const-string v9, "\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u958b\u304f"

    const-string v10, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8\u3092\u958b\u304f"

    const-string v11, "\u30d5\u30a9\u30ed\u30fc\u4e2d\u3092\u958b\u304f"

    const-string v12, "\u30cb\u30b3\u30ec\u30dd\u3092\u958b\u304f"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/Dev138;->JA:[Ljava/lang/String;

    .line 33
    const-string v13, "Open app settings"

    const-string v14, "Restart app"

    const-string v1, "Open rankings"

    const-string v2, "Open Shorts"

    const-string v3, "Enter video ID"

    const-string v4, "Open device watch history"

    const-string v5, "Open device playlists"

    const-string v6, "Open cached videos"

    const-string v7, "Open My Page"

    const-string v8, "Open account watch history"

    const-string v9, "Open mylists"

    const-string v10, "Open Watch Later"

    const-string v11, "Open following"

    const-string v12, "Open Nico Reports"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/Dev138;->EN:[Ljava/lang/String;

    .line 39
    const-string/jumbo v13, "\u958b\u555f\u61c9\u7528\u7a0b\u5f0f\u8a2d\u5b9a"

    const-string/jumbo v14, "\u91cd\u65b0\u555f\u52d5\u61c9\u7528\u7a0b\u5f0f"

    const-string/jumbo v1, "\u958b\u555f\u6392\u884c\u699c"

    const-string/jumbo v2, "\u958b\u555f\u77ed\u7247"

    const-string/jumbo v3, "\u8f38\u5165\u5f71\u7247 ID"

    const-string/jumbo v4, "\u958b\u555f\u88dd\u7f6e\u89c0\u770b\u7d00\u9304"

    const-string/jumbo v5, "\u958b\u555f\u672c\u6a5f\u64ad\u653e\u6e05\u55ae"

    const-string/jumbo v6, "\u958b\u555f\u5feb\u53d6\u6e05\u55ae"

    const-string/jumbo v7, "\u958b\u555f\u6211\u7684\u9801\u9762"

    const-string/jumbo v8, "\u958b\u555f\u5e33\u6236\u89c0\u770b\u7d00\u9304"

    const-string/jumbo v9, "\u958b\u555f\u6211\u7684\u64ad\u653e\u6e05\u55ae"

    const-string/jumbo v10, "\u958b\u555f\u7a0d\u5f8c\u89c0\u770b"

    const-string/jumbo v11, "\u958b\u555f\u8ffd\u8e64\u4e2d"

    const-string/jumbo v12, "\u958b\u555f Nico \u52d5\u614b"

    filled-new-array/range {v1 .. v14}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/Dev138;->ZH:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static actionName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "key"    # Ljava/lang/String;

    .line 60
    invoke-static {p1}, Le/e/a/Dev138;->index(Ljava/lang/String;)I

    move-result v0

    .line 61
    .local v0, "index":I
    if-gez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    sget-object v1, Le/e/a/Dev138;->JA:[Ljava/lang/String;

    aget-object v1, v1, v0

    sget-object v2, Le/e/a/Dev138;->EN:[Ljava/lang/String;

    aget-object v2, v2, v0

    sget-object v3, Le/e/a/Dev138;->ZH:[Ljava/lang/String;

    aget-object v3, v3, v0

    invoke-static {p0, v1, v2, v3}, Le/e/a/Dev112;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1
.end method

.method private static dispatchKnownRoute(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 10
    .param p0, "a"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;

    .line 147
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 148
    .local v0, "i":Landroid/content/Intent;
    const/4 v1, 0x0

    .line 149
    .local v1, "target":Ljava/lang/String;
    const-string v2, "menu_ranking"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    .line 150
    const-string v1, "NicoidRankingActivity"

    .line 151
    const-string v2, "https://www.nicovideo.jp/ranking/fav/daily/all?rss=2.0"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto/16 :goto_0

    .line 152
    :cond_0
    const-string v2, "menu_shorts"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 153
    const-string v1, "NicoidVideoActivity"

    const-string v2, "nicoid-re://shorts"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto/16 :goto_0

    .line 154
    :cond_1
    const-string v2, "menu_local_history"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const-string v5, "type"

    if-eqz v2, :cond_2

    .line 155
    const-string v1, "NicoidVideoListActivity"

    const/16 v2, 0x8

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto/16 :goto_0

    .line 156
    :cond_2
    const-string v2, "menu_account_history"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 157
    const-string v1, "NicoidVideoListActivity"

    const/4 v2, 0x4

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    goto/16 :goto_0

    .line 158
    :cond_3
    const-string v2, "menu_local_playlists"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 159
    const-string v1, "NicoidNicorepoActivity"

    const-string v2, "nicoid_local_playlists"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 160
    :cond_4
    const-string v2, "menu_cache"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 161
    const-string v1, "NicoidCacheManagerActivity"

    goto :goto_0

    .line 162
    :cond_5
    const-string v2, "menu_mypage"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 163
    const-string v1, "NicoidNicorepoActivity"

    const-string v2, "nicoid_my_page"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    goto :goto_0

    .line 164
    :cond_6
    const-string v2, "menu_mylists"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 165
    const-string v1, "NicoidMylistGroupActivity"

    goto :goto_0

    .line 166
    :cond_7
    const-string v2, "menu_watch_later"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 167
    const-string v1, "NicoidVideoListActivity"

    const/16 v2, 0x9

    invoke-virtual {v0, v5, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 168
    const-string v2, "deflist"

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_0

    .line 169
    :cond_8
    const-string v2, "menu_following"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 170
    const-string v1, "NicoidFavUserActivity"

    goto :goto_0

    .line 171
    :cond_9
    const-string v2, "menu_nicorepo"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 172
    const-string v1, "NicoidNicorepoActivity"

    goto :goto_0

    .line 173
    :cond_a
    const-string v2, "menu_settings"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 174
    const-string v1, "NicoidSetting"

    .line 179
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.sauzask.nicoid."

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, p0, v2}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 180
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 181
    invoke-virtual {p0, v4, v4}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 182
    return v3

    .line 175
    :cond_b
    const-string v2, "menu_restart"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 176
    :try_start_0
    const-string v2, "e.e.a.ModernDebug"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v5, "restart"

    new-array v6, v3, [Ljava/lang/Class;

    const-class v7, Landroid/content/Context;

    aput-object v7, v6, v4

    invoke-virtual {v2, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    new-array v5, v3, [Ljava/lang/Object;

    aput-object p0, v5, v4

    const/4 v6, 0x0

    invoke-virtual {v2, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v3

    .line 177
    :catch_0
    move-exception v2

    .local v2, "err":Ljava/lang/Exception;
    const-string v3, "nicoid-gesture-menu"

    const-string v5, "Restart command unavailable"

    invoke-static {v3, v5, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v4

    .line 178
    .end local v2    # "err":Ljava/lang/Exception;
    :cond_c
    return v4
.end method

.method private static dispatchNativeMenu(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 16
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 81
    const-string v0, "com.sauzask.nicoid.NicoidTopActivity"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 82
    .local v0, "owner":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Landroid/content/Context;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Landroid/widget/ListView;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-string v3, "a"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 83
    .local v2, "build":Ljava/lang/reflect/Method;
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    const/4 v8, 0x0

    aput-object v8, v1, v5

    aput-object v7, v1, v6

    invoke-virtual {v2, v8, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/ListView;

    .line 84
    .local v7, "list":Landroid/widget/ListView;
    if-eqz v7, :cond_5

    invoke-virtual {v7}, Landroid/widget/ListView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_2

    .line 85
    :cond_0
    invoke-virtual {v7}, Landroid/widget/ListView;->getOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v6

    .line 86
    .local v6, "listener":Landroid/widget/AdapterView$OnItemClickListener;
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 87
    .local v1, "rowsField":Ljava/lang/reflect/Field;
    invoke-virtual {v1, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 88
    invoke-virtual {v1, v6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 89
    .local v3, "raw":Ljava/lang/Object;
    instance-of v8, v3, Ljava/util/List;

    if-nez v8, :cond_1

    return v4

    .line 90
    :cond_1
    move-object v12, v3

    check-cast v12, Ljava/util/List;

    .line 91
    .local v12, "rows":Ljava/util/List;, "Ljava/util/List<*>;"
    const/4 v8, 0x0

    move v9, v8

    .local v9, "i":I
    :goto_0
    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result v8

    if-ge v9, v8, :cond_4

    .line 92
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    instance-of v8, v8, Ljava/util/Map;

    if-nez v8, :cond_2

    goto :goto_1

    .line 93
    :cond_2
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Ljava/util/Map;

    .line 94
    .local v13, "row":Ljava/util/Map;, "Ljava/util/Map<**>;"
    invoke-static {p1, v13}, Le/e/a/Dev138;->matches(Ljava/lang/String;Ljava/util/Map;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 95
    const/4 v8, 0x0

    move-object v4, v8

    check-cast v4, Landroid/view/View;

    int-to-long v10, v9

    invoke-interface/range {v6 .. v11}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    .line 96
    return v5

    .line 91
    .end local v13    # "row":Ljava/util/Map;, "Ljava/util/Map<**>;"
    :cond_3
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 99
    .end local v9    # "i":I
    :cond_4
    return v4

    .line 84
    .end local v1    # "rowsField":Ljava/lang/reflect/Field;
    .end local v3    # "raw":Ljava/lang/Object;
    .end local v6    # "listener":Landroid/widget/AdapterView$OnItemClickListener;
    .end local v12    # "rows":Ljava/util/List;, "Ljava/util/List<*>;"
    :cond_5
    :goto_2
    return v4
.end method

.method public static extend([Ljava/lang/String;)[Ljava/lang/String;
    .registers 7
    .param p0, "existing"    # [Ljava/lang/String;

    .line 53
    if-nez p0, :cond_0

    sget-object v0, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0

    .line 54
    :cond_0
    sget-object v0, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v4, v0, v3

    .local v4, "key":Ljava/lang/String;
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    return-object p0

    .end local v4    # "key":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 55
    :cond_2
    array-length v0, p0

    sget-object v1, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    array-length v1, v1

    add-int/2addr v0, v1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    .line 56
    .local v0, "out":[Ljava/lang/String;
    sget-object v1, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    array-length v3, p0

    sget-object v4, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    array-length v4, v4

    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 57
    return-object v0
.end method

.method private static index(Ljava/lang/String;)I
    .registers 4
    .param p0, "key"    # Ljava/lang/String;

    .line 47
    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    .line 48
    :cond_0
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    sget-object v2, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    sget-object v2, Le/e/a/Dev138;->KEYS:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return v1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 49
    .end local v1    # "i":I
    :cond_2
    return v0
.end method

.method static synthetic lambda$perform$0(Landroid/app/Activity;Ljava/lang/String;)V
    .registers 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;

    .line 67
    invoke-static {p0, p1}, Le/e/a/Dev138;->perform(Landroid/app/Activity;Ljava/lang/String;)Z

    return-void
.end method

.method private static matches(Ljava/lang/String;Ljava/util/Map;)Z
    .registers 16
    .param p0, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "**>;)Z"
        }
    .end annotation

    .line 102
    .local p1, "row":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const-string v0, "title"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 103
    .local v0, "title":Ljava/lang/Object;
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    const-string v2, "islabel"

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    .line 104
    :cond_0
    const-string v1, "intent"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 105
    .local v1, "raw":Ljava/lang/Object;
    instance-of v3, v1, Landroid/content/Intent;

    if-eqz v3, :cond_1

    move-object v3, v1

    check-cast v3, Landroid/content/Intent;

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 106
    .local v3, "intent":Landroid/content/Intent;
    :goto_0
    if-eqz v3, :cond_3

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    if-nez v4, :cond_2

    goto :goto_1

    .line 107
    :cond_2
    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_3
    :goto_1
    const-string v4, ""

    .line 108
    .local v4, "cls":Ljava/lang/String;
    :goto_2
    const/4 v5, -0x1

    const-string v6, "type"

    if-nez v3, :cond_4

    goto :goto_3

    :cond_4
    invoke-virtual {v3, v6, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 109
    .local v5, "type":I
    :goto_3
    const-string v7, "menu_ranking"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    const-string v2, ".NicoidRankingActivity"

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    return v2

    .line 110
    :cond_5
    const-string v7, "menu_shorts"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_7

    if-eqz v3, :cond_6

    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    if-eqz v6, :cond_6

    .line 111
    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v6

    const-string v7, "nicoid-re"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 112
    invoke-virtual {v3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v6

    const-string v7, "shorts"

    invoke-virtual {v7, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    const/4 v2, 0x1

    goto :goto_4

    :cond_6
    nop

    .line 110
    :goto_4
    return v2

    .line 113
    :cond_7
    const-string v7, "menu_video_id"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 114
    if-nez v3, :cond_8

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Le/e/a/Dev138;->number(Ljava/lang/Object;)I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_8

    const/4 v2, 0x1

    :cond_8
    return v2

    .line 115
    :cond_9
    const-string v7, "menu_local_history"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v9, ".NicoidVideoListActivity"

    if-eqz v7, :cond_b

    .line 116
    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a

    const/16 v6, 0x8

    if-ne v5, v6, :cond_a

    const/4 v2, 0x1

    :cond_a
    return v2

    .line 117
    :cond_b
    const-string v7, "menu_account_history"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const/4 v10, 0x4

    if-eqz v7, :cond_d

    .line 118
    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_c

    if-ne v5, v10, :cond_c

    const/4 v2, 0x1

    :cond_c
    return v2

    .line 119
    :cond_d
    const-string v7, "menu_local_playlists"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v11, "nicoid_local_playlists"

    const-string v12, ".NicoidNicorepoActivity"

    if-eqz v7, :cond_f

    .line 120
    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e

    .line 121
    invoke-virtual {v3, v11, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_e

    const/4 v2, 0x1

    goto :goto_5

    :cond_e
    nop

    .line 120
    :goto_5
    return v2

    .line 122
    :cond_f
    const-string v7, "menu_cache"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_10

    .line 123
    const-string v2, ".NicoidCacheManagerActivity"

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    return v2

    .line 124
    :cond_10
    const-string v7, "menu_mypage"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    const-string v13, "nicoid_my_page"

    if-eqz v7, :cond_12

    .line 125
    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_11

    .line 126
    invoke-virtual {v3, v13, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_11

    const/4 v2, 0x1

    goto :goto_6

    :cond_11
    nop

    .line 125
    :goto_6
    return v2

    .line 127
    :cond_12
    const-string v7, "menu_mylists"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13

    .line 128
    const-string v2, ".NicoidMylistGroupActivity"

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    return v2

    .line 129
    :cond_13
    const-string v7, "menu_watch_later"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_15

    .line 130
    invoke-virtual {v4, v9}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14

    const/16 v6, 0x9

    if-ne v5, v6, :cond_14

    const/4 v2, 0x1

    :cond_14
    return v2

    .line 131
    :cond_15
    const-string v7, "menu_following"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_16

    .line 132
    const-string v2, ".NicoidFavUserActivity"

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    return v2

    .line 133
    :cond_16
    const-string v7, "menu_nicorepo"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_18

    .line 134
    invoke-virtual {v4, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_17

    .line 135
    invoke-virtual {v3, v13, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_17

    .line 136
    invoke-virtual {v3, v11, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_17

    const/4 v2, 0x1

    goto :goto_7

    :cond_17
    nop

    .line 134
    :goto_7
    return v2

    .line 137
    :cond_18
    const-string v7, "menu_settings"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1a

    .line 138
    const-string v6, ".NicoidSetting"

    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 139
    const-string v6, "login"

    invoke-virtual {v3, v6, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-nez v6, :cond_19

    const/4 v2, 0x1

    goto :goto_8

    :cond_19
    nop

    .line 138
    :goto_8
    return v2

    .line 140
    :cond_1a
    const-string v7, "menu_restart"

    invoke-virtual {v7, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 141
    if-nez v3, :cond_1b

    invoke-interface {p1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Le/e/a/Dev138;->number(Ljava/lang/Object;)I

    move-result v6

    if-ne v6, v10, :cond_1b

    const/4 v2, 0x1

    :cond_1b
    return v2

    .line 142
    :cond_1c
    return v2
.end method

.method private static number(Ljava/lang/Object;)I
    .registers 2
    .param p0, "value"    # Ljava/lang/Object;

    .line 144
    instance-of v0, p0, Ljava/lang/Number;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public static perform(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 7
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "key"    # Ljava/lang/String;

    .line 64
    const-string v0, "nicoid-gesture-menu"

    invoke-static {p1}, Le/e/a/Dev138;->index(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    const/4 v0, 0x0

    return v0

    .line 65
    :cond_0
    const/4 v1, 0x1

    if-eqz p0, :cond_5

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 66
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    if-eq v2, v3, :cond_2

    .line 67
    new-instance v0, Le/e/a/Dev138$0;

    invoke-direct {v0, p0, p1}, Le/e/a/Dev138$0;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 68
    return v1

    .line 71
    :cond_2
    :try_start_0
    invoke-static {p0, p1}, Le/e/a/Dev138;->dispatchNativeMenu(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    return v1

    .line 72
    :cond_3
    invoke-static {p0, p1}, Le/e/a/Dev138;->dispatchKnownRoute(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    return v1

    .line 73
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Gesture menu destination is not available: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    goto :goto_0

    .line 74
    :catch_0
    move-exception v2

    .line 75
    .local v2, "error":Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not open gesture menu destination: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 77
    .end local v2    # "error":Ljava/lang/Exception;
    :goto_0
    return v1

    .line 65
    :cond_5
    :goto_1
    return v1
.end method
