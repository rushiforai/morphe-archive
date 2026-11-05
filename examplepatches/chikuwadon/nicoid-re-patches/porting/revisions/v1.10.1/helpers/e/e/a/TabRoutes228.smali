.class public final Le/e/a/TabRoutes228;
.super Ljava/lang/Object;
.source "TabRoutes228.java"


# static fields
.field static final ID:Ljava/lang/String; = "nicoid_saved_tab_id"

.field static final ROOTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Activity;",
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field static foreground:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 6
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    .line 23
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    sput-object v0, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static addLabels(Landroid/app/Activity;)[Ljava/lang/String;
    .registers 13

    .line 13
    const-string v0, "Search tab"

    const-string v1, "\u641c\u5c0b\u5206\u9801"

    const-string v2, "\u691c\u7d22\u30bf\u30d6"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "Watch history"

    const-string v1, "\u89c0\u770b\u7d00\u9304"

    const-string v2, "\u8996\u8074\u5c65\u6b74"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v0, "Device playlists"

    const-string v1, "\u672c\u6a5f\u64ad\u653e\u6e05\u55ae"

    const-string v2, "\u672c\u4f53\u30d7\u30ec\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v0, "My lists"

    const-string v1, "\u6211\u7684\u64ad\u653e\u6e05\u55ae"

    const-string v2, "\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v0, "Watch later"

    const-string v1, "\u7a0d\u5f8c\u89c0\u770b"

    const-string v2, "\u3068\u308a\u3042\u3048\u305a\u30de\u30a4\u30ea\u30b9\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v0, "Nico Reports"

    const-string v1, "Nico \u52d5\u614b"

    const-string v2, "\u30cb\u30b3\u30ec\u30dd"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v0, "Cached videos"

    const-string v1, "\u5feb\u53d6\u5f71\u7247"

    const-string v2, "\u30ad\u30e3\u30c3\u30b7\u30e5\u30ea\u30b9\u30c8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "My page"

    const-string v1, "\u6211\u7684\u9801\u9762"

    const-string v2, "\u30de\u30a4\u30da\u30fc\u30b8"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "Following"

    const-string v1, "\u8ffd\u8e64\u4e2d"

    const-string v2, "\u30d5\u30a9\u30ed\u30fc\u4e2d"

    invoke-static {p0, v2, v0, v1}, Le/e/a/TabRoutes228;->tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static attached(Le/e/a/MultiTabs227$Host;)V
    .registers 4

    .line 24
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/TabRoutes228;->isPage(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    sget-object v0, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/LinkedHashMap;

    if-nez v0, :cond_2a

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v1, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2a
    :try_start_2a
    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const-string v2, "y"

    invoke-static {p0, v2}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-virtual {v0, v1, p0}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_3d} :catch_3e

    goto :goto_3f

    :catch_3e
    move-exception p0

    :cond_3f
    :goto_3f
    return-void
.end method

.method static choice(Landroid/app/Activity;ILjava/lang/String;)Le/e/a/SavedTabs227$Tab;
    .registers 3

    .line 14
    new-instance p0, Le/e/a/SavedTabs227$Tab;

    invoke-direct {p0}, Le/e/a/SavedTabs227$Tab;-><init>()V

    iput-object p2, p0, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    const/4 p2, 0x3

    iput p2, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    packed-switch p1, :pswitch_data_3c

    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0

    :pswitch_13
    const-string p1, "following"

    goto :goto_2a

    :pswitch_16
    const-string p1, "mypage"

    goto :goto_2a

    :pswitch_19
    const-string p1, "cache"

    goto :goto_2a

    :pswitch_1c
    const-string p1, "nicorepo"

    goto :goto_2a

    :pswitch_1f
    const/16 p1, 0x9

    iput p1, p0, Le/e/a/SavedTabs227$Tab;->type:I

    const-string p1, "deflist"

    iput-object p1, p0, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    goto :goto_3a

    :pswitch_28
    const-string p1, "mylist"

    :goto_2a
    iput-object p1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    goto :goto_3a

    :pswitch_2d
    const-string p1, "playlist"

    iput-object p1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const/4 p1, 0x2

    goto :goto_38

    :pswitch_33
    const/16 p1, 0x8

    iput p1, p0, Le/e/a/SavedTabs227$Tab;->type:I

    const/4 p1, 0x1

    :goto_38
    iput p1, p0, Le/e/a/SavedTabs227$Tab;->kind:I

    :goto_3a
    return-object p0

    nop

    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_33
        :pswitch_2d
        :pswitch_28
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
    .end packed-switch
.end method

.method static component(Le/e/a/SavedTabs227$Tab;)Ljava/lang/String;
    .registers 4

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "com.sauzask.nicoid."

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v2, "list"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    const-string p0, "NicoidVideoListActivity"

    goto :goto_3d

    :cond_14
    iget-object v1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v2, "mylist"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_21

    const-string p0, "NicoidMylistGroupActivity"

    goto :goto_3d

    :cond_21
    iget-object v1, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v2, "following"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    const-string p0, "NicoidFavUserActivity"

    goto :goto_3d

    :cond_2e
    iget-object p0, p0, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "cache"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3b

    const-string p0, "NicoidCacheManagerActivity"

    goto :goto_3d

    :cond_3b
    const-string p0, "NicoidNicorepoActivity"

    :goto_3d
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static content(Landroid/app/Activity;Landroid/view/View;)Z
    .registers 7

    .line 9
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7d

    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/TabRoutes228;->isPage(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    goto :goto_7d

    :cond_12
    sget-object v0, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/MultiTabs227$Host;

    sget-object v2, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    invoke-interface {v2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/LinkedHashMap;

    if-eqz v0, :cond_7d

    if-nez v2, :cond_27

    goto :goto_7d

    :cond_27
    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_7d

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_7d

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    const-string v4, "nicoid-tab-native-pages"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4e

    goto :goto_7d

    :cond_4e
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    const/4 v3, 0x1

    if-ne p1, v0, :cond_58

    return v3

    :cond_58
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup;

    if-eqz v4, :cond_69

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    invoke-virtual {v4, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_69
    invoke-virtual {v1, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v0, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0, p1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return v3

    :cond_7d
    :goto_7d
    return v1
.end method

.method static destroy(Landroid/app/Activity;)V
    .registers 2

    .line 34
    sget-object v0, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static drawer(Landroid/app/Activity;Landroid/view/MenuItem;)Z
    .registers 5

    .line 33
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_30

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x102002c

    if-eq p1, v0, :cond_11

    goto :goto_30

    :cond_11
    :try_start_11
    const-string p1, "u"

    invoke-static {p0, p1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    const-string p1, "g"

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    const v2, 0x800003

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {p0, p1, v0, v2}, Le/e/a/MultiTabs227;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_2d} :catch_2f

    const/4 p0, 0x1

    return p0

    :catch_2f
    move-exception p0

    :cond_30
    :goto_30
    return v1
.end method

.method static intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;
    .registers 5

    .line 17
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    const/4 v1, 0x0

    goto :goto_12

    :cond_c
    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    :goto_12
    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-static {p1}, Le/e/a/TabRoutes228;->component(Le/e/a/SavedTabs227$Tab;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClassName(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "type"

    iget v1, p1, Le/e/a/SavedTabs227$Tab;->type:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "name"

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "item"

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->item:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "subtitle"

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->subtitle:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "folderid"

    iget v1, p1, Le/e/a/SavedTabs227$Tab;->folder:I

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_saved_tab_id"

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p0

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "playlist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_5f

    const-string v0, "nicoid_local_playlists"

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_5f
    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v0, "mypage"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6e

    const-string p1, "nicoid_my_page"

    invoke-virtual {p0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_6e
    return-object p0
.end method

.method static isPage(Ljava/lang/String;)Z
    .registers 2

    .line 22
    const-string v0, "playlist"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "mypage"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1a

    const-string v0, "nicorepo"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1a

    const/4 p0, 0x0

    return p0

    :cond_1a
    const/4 p0, 0x1

    return p0
.end method

.method static label(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)V
    .registers 4

    .line 15
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "list"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "playlist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    const/4 v0, 0x2

    goto :goto_55

    :cond_17
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "mylist"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_23

    const/4 v0, 0x3

    goto :goto_55

    :cond_23
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "nicorepo"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    const/4 v0, 0x5

    goto :goto_55

    :cond_2f
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "cache"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    const/4 v0, 0x6

    goto :goto_55

    :cond_3b
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "mypage"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_47

    const/4 v0, 0x7

    goto :goto_55

    :cond_47
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v1, "following"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    const/16 v0, 0x8

    goto :goto_55

    :cond_54
    const/4 v0, -0x1

    :goto_55
    if-ltz v0, :cond_5f

    invoke-static {p0}, Le/e/a/TabRoutes228;->addLabels(Landroid/app/Activity;)[Ljava/lang/String;

    move-result-object p0

    aget-object p0, p0, v0

    iput-object p0, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    :cond_5f
    return-void
.end method

.method public static localPage(Landroid/app/Activity;)Z
    .registers 3

    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_local_playlists"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static newIntent(Landroid/app/Activity;Landroid/content/Intent;)V
    .registers 5

    .line 32
    invoke-static {}, Le/e/a/MultiTabs227;->enabled()Z

    move-result v0

    if-eqz v0, :cond_46

    if-eqz p1, :cond_46

    const-string v0, "nicoid_saved_tab_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_11

    goto :goto_46

    :cond_11
    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Le/e/a/SavedTabs227;->find(Ljava/lang/String;)Le/e/a/SavedTabs227$Tab;

    move-result-object v0

    if-nez v0, :cond_20

    return-void

    :cond_20
    sget-object v1, Le/e/a/MultiTabs227;->HOSTS:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/MultiTabs227$Host;

    if-eqz v1, :cond_3a

    :try_start_2a
    invoke-static {p0}, Le/e/a/MultiTabs227;->lists(Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_36

    iget-object v0, v0, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Le/e/a/MultiTabs227$Host;->activate(Ljava/lang/String;)V

    goto :goto_3a

    :cond_36
    invoke-static {v1, v0}, Le/e/a/TabRoutes228;->open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    goto :goto_46

    :cond_3a
    :goto_3a
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_3d} :catch_3e

    goto :goto_46

    :catch_3e
    move-exception p0

    const-string p1, "nicoid-tabs"

    const-string v0, "Cannot restore native page route"

    invoke-static {p1, v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_46
    :goto_46
    return-void
.end method

.method static open(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 19
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Le/e/a/TabRoutes228;->component(Le/e/a/SavedTabs227$Tab;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/TabRoutes228;->isPage(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-static {p0, p1}, Le/e/a/TabRoutes228;->switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V

    return-void

    :cond_20
    iget-object v0, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v0

    iget-object p1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object p1, v0, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V

    return-void

    .line 20
    :cond_3b
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-static {v1, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v1, 0x20070000

    invoke-virtual {p1, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    iget-object p0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 21
    return-void
.end method

.method static screen(Landroid/app/Activity;)Ljava/lang/String;
    .registers 4

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NicoidVideoListActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13

    const-string p0, "list"

    return-object p0

    :cond_13
    const-string v1, "NicoidMylistGroupActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1e

    const-string p0, "mylist"

    return-object p0

    :cond_1e
    const-string v1, "NicoidFavUserActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_29

    const-string p0, "following"

    return-object p0

    :cond_29
    const-string v1, "NicoidCacheManagerActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_34

    const-string p0, "cache"

    return-object p0

    :cond_34
    const-string v1, "NicoidNicorepoActivity"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_7d

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v0, "nicoid_local_playlists"

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4e

    const-string p0, "playlist"

    return-object p0

    :cond_4e
    const-string v0, "nicoid_my_page"

    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_59

    const-string p0, "mypage"

    return-object p0

    :cond_59
    const-string v0, "nicoid_followed_mylists"

    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_7d

    const-string v0, "nicoid_creator_page"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7d

    const-string v0, "nicoid_channel_page"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_7d

    const-string v0, "nicoid_custom_rankings"

    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_7a

    goto :goto_7d

    :cond_7a
    const-string p0, "nicorepo"

    return-object p0

    :cond_7d
    :goto_7d
    return-object v1
.end method

.method public static settingsForeground()Z
    .registers 1

    .line 7
    sget-object v0, Le/e/a/TabRoutes228;->foreground:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_12

    invoke-static {v0}, Le/e/a/MiniSession225;->settings(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x1

    return v0

    :cond_12
    const/4 v0, 0x0

    return v0
.end method

.method static supported(Landroid/app/Activity;)Z
    .registers 2

    .line 11
    invoke-static {p0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-static {p0}, Le/e/a/TabRecovery244;->related(Landroid/content/Intent;)Z

    move-result p0

    if-nez p0, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_16
    const/4 p0, 0x0

    return p0
.end method

.method static switchPage(Le/e/a/MultiTabs227$Host;Le/e/a/SavedTabs227$Tab;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 26
    iget-object v0, p0, Le/e/a/MultiTabs227$Host;->a:Landroid/app/Activity;

    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->removeBar()V

    sget-object v1, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedHashMap;

    if-nez v1, :cond_19

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    sget-object v2, Le/e/a/TabRoutes228;->ROOTS:Ljava/util/Map;

    invoke-interface {v2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_19
    invoke-static {v0}, Le/e/a/TabRoutes228;->screen(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "y"

    invoke-static {v0, v3}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    invoke-virtual {v1, v2, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v2, 0x7f0800dd

    invoke-virtual {v0, v2}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_17a

    .line 27
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/FrameLayout;

    const-string v5, "nicoid-tab-native-pages"

    const/4 v6, -0x1

    if-eqz v2, :cond_55

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_55

    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    goto :goto_7c

    :cond_55
    invoke-virtual {v4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_172

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v7

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    invoke-virtual {v2, v4}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    new-instance v9, Landroid/widget/FrameLayout;

    invoke-direct {v9, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v5}, Landroid/widget/FrameLayout;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v2, v9, v7, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v9, v4, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v2, v9

    .line 28
    :goto_7c
    invoke-static {v0, p1}, Le/e/a/TabRoutes228;->intent(Landroid/app/Activity;Le/e/a/SavedTabs227$Tab;)Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    iget-object v5, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/view/View;

    if-nez v5, :cond_11d

    iget-object v5, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v7, "playlist"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v7, 0x0

    if-eqz v5, :cond_b2

    const-string v5, "e.e.a.LocalPlaylists"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-class v8, Landroid/app/Activity;

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    const-string v9, "open"

    invoke-virtual {v5, v9, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ed

    :cond_b2
    iget-object v5, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    const-string v8, "mypage"

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const-string v8, "load"

    if-eqz v5, :cond_d6

    const-string v5, "e.e.a.AccountPage"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-class v9, Landroid/app/Activity;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ed

    :cond_d6
    const-string v5, "e.e.a.FollowFeed"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-class v9, Landroid/app/Activity;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v5, v7, v8}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :goto_ed
    invoke-static {v0, v3}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Landroid/view/View;

    if-eq v5, v4, :cond_115

    iget-object v3, p1, Le/e/a/SavedTabs227$Tab;->screen:Ljava/lang/String;

    invoke-virtual {v1, v3, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_10c

    invoke-virtual {v5}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_10c
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v5, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_120

    :cond_115
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Native page did not change"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_11d
    invoke-static {v0, v3, v5}, Le/e/a/MultiTabs227;->set(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    :goto_120
    const/4 v1, 0x0

    move v3, v1

    :goto_122
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getChildCount()I

    move-result v4

    if-lt v3, v4, :cond_15e

    .line 30
    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object v1, p0, Le/e/a/MultiTabs227$Host;->currentId:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->data()Le/e/a/SavedTabs227;

    move-result-object v1

    iget-object v2, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    iput-object v2, v1, Le/e/a/SavedTabs227;->selected:Ljava/lang/String;

    invoke-static {}, Le/e/a/MultiTabs227;->save()V

    iget-object v1, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    :try_start_13c
    const-string v1, "O"

    invoke-static {v0, v1}, Le/e/a/MultiTabs227;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const-string v2, "b"

    iget-object v3, p1, Le/e/a/SavedTabs227$Tab;->label:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V

    const-string v2, "a"

    const-string v3, ""

    invoke-static {v1, v2, v3}, Le/e/a/TabChrome228;->bar(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/CharSequence;)V
    :try_end_150
    .catch Ljava/lang/Exception; {:try_start_13c .. :try_end_150} :catch_151

    goto :goto_152

    :catch_151
    move-exception v1

    :goto_152
    invoke-virtual {v0}, Landroid/app/Activity;->invalidateOptionsMenu()V

    invoke-virtual {p0}, Le/e/a/MultiTabs227$Host;->bar()V

    iget-object p0, p1, Le/e/a/SavedTabs227$Tab;->id:Ljava/lang/String;

    invoke-static {v0, p0}, Le/e/a/PlaybackNavigation114;->browsed(Landroid/app/Activity;Ljava/lang/String;)V

    .line 31
    return-void

    .line 29
    :cond_15e
    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {v2, v3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    if-ne v6, v5, :cond_16a

    move v6, v1

    goto :goto_16c

    :cond_16a
    const/16 v6, 0x8

    :goto_16c
    invoke-virtual {v4, v6}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_122

    .line 27
    :cond_172
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Missing native page parent"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 26
    :cond_17a
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Missing native drawer shell"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static tr(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 12
    invoke-static {p0, p1, p2, p3}, Le/e/a/PanelUi;->tr(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
